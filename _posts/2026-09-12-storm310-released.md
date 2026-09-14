---
layout: post
title: Apache Storm 3.1.0 Released
author: Rui Abreu
---

The Apache Storm community is pleased to announce that version 3.1.0 has been
released and is available from [the downloads page](/downloads.html).

This is primarily a security and hardening release. It resolves a coordinated set
of security issues (see the Security Fixes below), along with bug fixes,
dependency upgrades, documentation improvements and a new Apache Iceberg sink.
**All users of Apache Storm 3.0.0 are strongly encouraged to upgrade.** As with
3.0.0, Java 25 is required to run Apache Storm 3.x, and the Java API remains
backwards-compatible with Storm 2.x.

The Storm 2.x line, including 2.8.9, has reached end of life and no longer
receives security fixes. Users still on 2.x should treat the issues below as
unpatched there and migrate to 3.x, where they are fixed in 3.1.0.

Several of the security fixes change default behaviour (for example, the
scheduler-strategy allowlist, JSONP wrapping, the state serializer and
`nimbus.groups` evaluation); please read the mitigations below before upgrading.

## 🙏 Thanks

Special thanks are due to all those who have contributed to Apache Storm --
whether through direct code contributions, documentation, bug reports, security
reports, or helping other users on the mailing lists. Your efforts are much
appreciated.

## 📋 Changes in this Release - Storm 3.1.0

<p>Issues and pull requests addressed in the 3.1.0 release of Storm. Documentation for this release is available at the <a href="https://storm.apache.org/">Apache Storm project site</a>.</p>

<style>
.cve-credit {
	margin: 0.4em 0 1.8em;
	padding: 0.55em 0.9em;
	border-left: 4px solid #0066cc;
	background: #eef4ff;
	border-radius: 4px;
}
.cve-credit strong { color: #0066cc; }
</style>

<h2>🔒 Security Fixes</h2>

<h3><a href="https://www.cve.org/CVERecord?id=CVE-2026-82426">CVE-2026-82426</a> - Apache Storm Nimbus: Arbitrary File Read on Nimbus via Unvalidated Uploaded Jar Location</h3>
<p><strong>Versions Affected:</strong> 3.0.0.</p>
<p><strong>Description:</strong> Nimbus accepted the <code>uploadedJarLocation</code> argument of <code>submitTopology</code> / <code>submitTopologyWithOpts</code> as a server-side path and opened it directly, without checking that it referred to a file the caller had actually uploaded via <code>beginFileUpload</code>. An authenticated user with submission rights could therefore submit any path readable by the Nimbus daemon user as their topology jar; Nimbus copied it into the topology's jar blob, whose ACL grants the submitter read access, so the contents could be retrieved with the ordinary blob download RPCs. Candidate targets include the Nimbus Kerberos keytab, Thrift/UI TLS private keys and <code>storm.yaml</code> with the ZooKeeper authentication payload. Where <code>nimbus.users</code> is unset, submission is available to every authenticated principal, so no elevated privilege is required.</p>
<p><strong>Mitigation:</strong> Upgrade to 3.1.0, where the submitted location is canonicalised and must resolve inside the Nimbus inbox. Users who cannot upgrade immediately should restrict submission via <code>nimbus.users</code>/<code>nimbus.groups</code> and rotate the Nimbus keytab and any TLS private keys or ZooKeeper credentials readable by the Nimbus daemon user. Local mode is unaffected.</p>
<p class="cve-credit">🏅 <strong>Credit:</strong> Independently reported to the Apache Storm PMC by n0mi1k, with a proof of concept. Also found by the ASF using Claude agents to study the security of open-source projects, validated and reported by Apache Storm.</p>

<h3><a href="https://www.cve.org/CVERecord?id=CVE-2026-82427">CVE-2026-82427</a> - Apache Storm Nimbus: Path Traversal as the Supervisor User via Unsanitised Blobstore Map Local Name</h3>
<p><strong>Versions Affected:</strong> 3.0.0.</p>
<p><strong>Description:</strong> A topology's <code>topology.blobstore.map</code> lets the submitter choose a local name for each localised blob. That name was used to build a path under the topology's working directory without normalisation, in both <code>AsyncLocalizer</code> and <code>Container.createBlobstoreLinks</code>, and the symlink helper force-deletes whatever already exists at the target before creating the link. A submitter could use <code>../</code> segments to direct that delete-and-symlink at an arbitrary path, as the supervisor user, on every node the topology is scheduled onto -- enabling recursive deletion of supervisor-owned content and planting a symlink that causes a later worker launch to execute attacker-chosen code as another tenant's OS user, defeating <code>supervisor.run.worker.as.user</code> isolation.</p>
<p><strong>Mitigation:</strong> Upgrade to 3.1.0, where the resolved target must lie inside the expected root at both call sites. Users who cannot upgrade immediately should restrict submission to trusted principals and may reject <code>topology.blobstore.map</code> entries containing path separators or <code>..</code> before they reach Nimbus.</p>
<p class="cve-credit">🏅 <strong>Credit:</strong> The ASF -- found using Claude agents to study the security of open-source projects, validated and reported by Apache Storm.</p>

<h3><a href="https://www.cve.org/CVERecord?id=CVE-2026-82428">CVE-2026-82428</a> - Apache Storm Client: Cross-Tenant Dependency Jar Substitution via Predictable Blob Keys</h3>
<p><strong>Versions Affected:</strong> 3.0.0.</p>
<p><strong>Description:</strong> Dependency artifacts uploaded with <code>storm jar --artifacts</code> were stored under a blob key derived only from the Maven coordinate, identical for every user and predictable in advance. When the blob already existed the uploader caught <code>KeyAlreadyExistsException</code> and silently reused it, with no check that the existing blob's content or owner matched. A user who uploaded a blob under such a key first therefore controlled the bytes every later submitter of the same coordinate received on the worker classpath, resulting in code execution inside another tenant's topology. Affects multi-tenant clusters that use the <code>--artifacts</code> feature.</p>
<p><strong>Mitigation:</strong> Upgrade to 3.1.0, where each uploaded artifact receives a key carrying a freshly generated UUID and a pre-existing blob is no longer silently reused. The corrected key generation is on the submitting client, so every client running <code>storm jar --artifacts</code> must also be upgraded; upgrading the cluster alone does not close it. Operators should audit existing <code>dep-</code> blobs for unexpected owners.</p>
<p class="cve-credit">🏅 <strong>Credit:</strong> The ASF -- found using Claude agents to study the security of open-source projects, validated and reported by Apache Storm.</p>

<h3><a href="https://www.cve.org/CVERecord?id=CVE-2026-82429">CVE-2026-82429</a> - Apache Storm Worker Launcher: Local Privilege Escalation to Root via a Time-of-Check Race in the Worker Launcher</h3>
<p><strong>Versions Affected:</strong> 3.0.0.</p>
<p><strong>Description:</strong> The setuid-root <code>worker-launcher</code> adjusts ownership and permissions of worker directories by walking the tree with FTS and calling <code>lchown</code> and <code>chmod</code> on each entry's full pathname while effective uid 0. Both syscalls re-resolve the path at call time, after FTS has classified the entry, and the trees are owned and writable by the untrusted topology user. A tenant could replace an intermediate directory component with a symlink between classification and the privileged operation, redirecting the root-owned <code>lchown</code>/<code>chmod</code> at an arbitrary host file. The operation is repeatable at will. This is the same defect class as the Hadoop container-executor issues from which the code derives.</p>
<p><strong>Mitigation:</strong> Upgrade to 3.1.0, where the privileged walk operates on file descriptors it has already stat'd rather than on pathnames re-resolved at call time. The launcher must be rebuilt and reinstalled after upgrading; replacing the Java artifacts alone is not sufficient. Users who cannot upgrade should not run untrusted topology code on supervisors configured with <code>supervisor.run.worker.as.user</code>.</p>
<p class="cve-credit">🏅 <strong>Credit:</strong> The ASF -- found using Claude agents to study the security of open-source projects, validated and reported by Apache Storm.</p>

<h3><a href="https://www.cve.org/CVERecord?id=CVE-2026-82430">CVE-2026-82430</a> - Apache Storm Worker Launcher: Local Privilege Escalation to Root via Container Command Files Chowned to the Tenant</h3>
<p><strong>Versions Affected:</strong> 3.0.0.</p>
<p><strong>Description:</strong> When launching a Docker or OCI worker, the setuid-root <code>worker-launcher</code> first changes ownership of the entire worker directory to the untrusted topology user, and only afterwards reads and acts on the command file the supervisor wrote there. The file is opened without <code>O_NOFOLLOW</code> and without re-verifying its owner, so the tenant can replace its contents in the window between. On the Docker path the parsed command runs with real uid 0 and the sanitiser is not a privilege boundary (it admits <code>-v</code> with an arbitrary source, <code>--device</code>, <code>--cap-add</code>, <code>--security-opt</code>, <code>--user</code>, <code>--net</code>), yielding an attacker-authored root-equivalent container with the host filesystem available. On the OCI path the same window applies, mount validation is structural only (no source/destination allow-list), and the attacker-settable <code>username</code> field permits running as another tenant's uid.</p>
<p><strong>Mitigation:</strong> Upgrade to 3.1.0, where the command file is validated before the ownership change and re-verified on open, and mount sources and destinations are constrained by configuration. The launcher must be rebuilt and reinstalled after upgrading. Users who cannot upgrade should disable Docker/OCI worker isolation or restrict submission on affected supervisors to trusted principals.</p>
<p class="cve-credit">🏅 <strong>Credit:</strong> The ASF -- found using Claude agents to study the security of open-source projects, validated and reported by Apache Storm.</p>

<h3><a href="https://www.cve.org/CVERecord?id=CVE-2026-82431">CVE-2026-82431</a> - Apache Storm Client: Authorization Bypass When nimbus.groups Is Configured Without nimbus.users</h3>
<p><strong>Versions Affected:</strong> 3.0.0.</p>
<p><strong>Description:</strong> <code>SimpleACLAuthorizer</code> evaluated the user-level command set by returning early when <code>nimbus.users</code> was empty, before <code>nimbus.groups</code> was considered. An operator who restricted access by group alone, leaving <code>nimbus.users</code> unset, therefore received no restriction at all: every authenticated principal was permitted every user-level operation, including <code>submitTopology</code>, <code>beginFileUpload</code> and <code>getNimbusConf</code>. <code>docs/SECURITY.md</code> presents <code>nimbus.groups</code> as a supported lock-down mechanism, so a deployment following the documentation could believe it was restricted while it was not. The failure was silent.</p>
<p><strong>Mitigation:</strong> Upgrade to 3.1.0, where <code>nimbus.groups</code> is evaluated whether or not <code>nimbus.users</code> is set. Users who cannot upgrade should also populate <code>nimbus.users</code>, since a non-empty user list causes the group list to be evaluated on affected versions, and review Nimbus access logs. Note: after upgrading, a cluster configured with <code>nimbus.groups</code> alone becomes restrictive for the first time -- clients outside the configured groups (including <code>NimbusClient</code>, which calls <code>getLeader</code> on every connection) will begin to be refused.</p>
<p class="cve-credit">🏅 <strong>Credit:</strong> The ASF -- found using Claude agents to study the security of open-source projects, validated and reported by Apache Storm.</p>

<h3><a href="https://www.cve.org/CVERecord?id=CVE-2026-82432">CVE-2026-82432</a> - Apache Storm Nimbus: Blobstore Authorization Bypass via Rebalance Configuration Overrides</h3>
<p><strong>Versions Affected:</strong> 3.0.0.</p>
<p><strong>Description:</strong> Nimbus validated <code>topology.blobstore.map</code> against the calling subject at submission time only. The rebalance operation accepts configuration overrides but never re-ran that validation, so a caller authorised to rebalance a topology could introduce a blobstore-map entry naming a blob whose ACL does not grant them access; supervisors localise whatever key the map names. The same advisory covers <code>listBlobs</code>, which performed no authorization check and returned every key in the blobstore to any caller able to reach the Nimbus Thrift port -- the key names that make the above practical. On its own the disclosure is metadata only.</p>
<p><strong>Mitigation:</strong> Upgrade to 3.1.0, where rebalance overrides are validated exactly as submission-time configuration is, against the rebalancing caller, and <code>listBlobs</code> applies the configured authorization. Users who cannot upgrade should restrict rebalance rights to trusted principals, noting that membership of a topology's <code>topology.users</code>/<code>topology.groups</code> confers them.</p>
<p class="cve-credit">🏅 <strong>Credit:</strong> The ASF -- found using Claude agents to study the security of open-source projects, validated and reported by Apache Storm.</p>

<h3><a href="https://www.cve.org/CVERecord?id=CVE-2026-82433">CVE-2026-82433</a> - Apache Storm Nimbus, Apache Storm UI: Disclosure of Unredacted Daemon Configuration via Nimbus and the UI</h3>
<p><strong>Versions Affected:</strong> 3.0.0.</p>
<p><strong>Description:</strong> <code>getNimbusConf</code> returned the complete daemon configuration without redaction after only a user-level authorization check; where configured, that includes <code>storm.zookeeper.auth.payload</code> and the Thrift/Netty/ZooKeeper TLS keystore and truststore passwords. The UI endpoint <code>/api/v1/cluster/configuration</code> compounded this: it carried no <code>@AuthNimbusOp</code> annotation, the authorization filter treated a missing annotation as "no gate required", and it proxied the request under the UI daemon's own principal, so any user able to pass <code>ui.filter</code> received the full configuration.</p>
<p><strong>Mitigation:</strong> Upgrade to 3.1.0, where credential-bearing values are masked before the configuration is served and every UI API endpoint must declare its authorization explicitly. Users who cannot upgrade should place the UI behind an authenticating reverse proxy restricting <code>/api/v1/cluster/configuration</code>, and rotate the ZooKeeper authentication payload and any TLS keystore/truststore passwords reachable through it.</p>
<p class="cve-credit">🏅 <strong>Credit:</strong> The ASF -- found using Claude agents to study the security of open-source projects, validated and reported by Apache Storm.</p>

<h3><a href="https://www.cve.org/CVERecord?id=CVE-2026-82434">CVE-2026-82434</a> - Apache Storm Nimbus, Apache Storm Client: Disclosure of the Topology ZooKeeper Credential to Read-Only Users and to Logs</h3>
<p><strong>Versions Affected:</strong> 3.0.0.</p>
<p><strong>Description:</strong> When ZooKeeper authentication is configured, Storm deliberately retains <code>storm.zookeeper.topology.auth.payload</code> in the topology configuration because workers need it. Nimbus then served that configuration verbatim to any caller holding read-only topology permissions, so a user whose only grant was the ability to view a topology received its ZooKeeper credential. That credential is not read-only: the cluster-state implementation uses write-capable ACLs for worker heartbeats, backpressure and error state, so a recipient can forge or remove that state for the topology. The same advisory covers the submission client, which logged the generated payload at INFO on every submission, and the SASL handlers, which logged it at DEBUG, so the credential also reached log aggregation and support bundles.</p>
<p><strong>Mitigation:</strong> Upgrade to 3.1.0, where the payload is removed from the configuration served to read-only callers and is no longer written to logs. Users who cannot upgrade immediately should rotate <code>storm.zookeeper.topology.auth.payload</code> for existing topologies, review retained logs and support bundles for the value, and restrict read-only topology permissions to trusted principals.</p>
<p class="cve-credit">🏅 <strong>Credit:</strong> The ASF -- found using Claude agents to study the security of open-source projects, validated and reported by Apache Storm.</p>

<h3><a href="https://www.cve.org/CVERecord?id=CVE-2026-82435">CVE-2026-82435</a> - Apache Storm Worker: Unauthenticated Remote Memory Exhaustion in the Worker Messaging Decoder</h3>
<p><strong>Versions Affected:</strong> 3.0.0.</p>
<p><strong>Description:</strong> The worker's Netty message decoder is installed ahead of the SASL authentication handlers and acts on frames before authentication. It allocated buffers sized from a length field carried in the frame, so a single frame from an unauthenticated peer able to reach a worker slot port could drive a large allocation. <code>storm.messaging.netty.authentication</code> defaults to false and the decoder runs before the handler that enforces it in any case, so the attacker needs only TCP reachability to a worker port. The precise effect at the default 768 MB worker heap was not measured; the assigned severity reflects the conservative reading.</p>
<p><strong>Mitigation:</strong> Upgrade to 3.1.0, where frames are decoded only after the handshake completes. Users who cannot upgrade should ensure worker slot ports are reachable only from within the cluster and enable <code>storm.messaging.netty.authentication</code> where the deployment permits.</p>
<p class="cve-credit">🏅 <strong>Credit:</strong> The ASF -- found using Claude agents to study the security of open-source projects, validated and reported by Apache Storm.</p>

<h3><a href="https://www.cve.org/CVERecord?id=CVE-2026-82436">CVE-2026-82436</a> - Apache Storm Client: Deserialization of Untrusted Data from the State Store</h3>
<p><strong>Versions Affected:</strong> 3.0.0.</p>
<p><strong>Description:</strong> <code>DefaultStateSerializer</code>, used to persist and restore stateful bolt checkpoints, configured Kryo with class registration disabled and an instantiation strategy that constructs objects without invoking their constructors, then deserialized whatever bytes the state store returned. A party able to write to the topology's keyspace in the state store -- for example a co-tenant of a shared Redis instance, or anyone with network access to it -- could place a serialized object graph that executes code inside the worker JVM when state is restored. This requires the Redis-backed state provider, which is not the default. Write access to a state-store key is a data-plane privilege; code execution in the worker JVM is not, so the two are not equivalent.</p>
<p><strong>Mitigation:</strong> Upgrade to 3.1.0, where the state serializer requires registered classes. Note this is a behaviour change for existing state: checkpoints written by an affected version may fail to restore and a migration step may be required. Users who cannot upgrade should restrict network and credential access to the state store to the cluster itself.</p>
<p class="cve-credit">🏅 <strong>Credit:</strong> The ASF -- found using Claude agents to study the security of open-source projects, validated and reported by Apache Storm.</p>

<h3><a href="https://www.cve.org/CVERecord?id=CVE-2026-82437">CVE-2026-82437</a> - Apache Storm Logviewer: Log Access Controls Not Enforced by Logviewer</h3>
<p><strong>Versions Affected:</strong> 3.0.0.</p>
<p><strong>Description:</strong> The Logviewer offers <code>logs.users</code> and <code>logs.groups</code> to control who may read log content, but for daemon logs those settings were not applied: the access decision discarded the authorizer's answer whenever the "daemon log" flag was set, and the daemon log page and download endpoints reached the handler without consulting an authorizer at all. Any user able to pass the configured servlet filter could read <code>nimbus.log</code>, <code>supervisor.log</code> and other daemon logs on every reachable node, which contain other tenants' topology names, owners and configuration fragments. The same advisory covers <code>/listLogs</code> and <code>/searchLogs</code>, which accepted a user argument and never applied it, returning every tenant's log file names (metadata only). No configuration closed either behaviour.</p>
<p><strong>Mitigation:</strong> Upgrade to 3.1.0, where the daemon log paths evaluate the same configured user/group lists the worker log paths already used, and the listing endpoints filter by the requesting user. Users who cannot upgrade should place the Logviewer behind a reverse proxy that restricts the daemon log endpoints.</p>
<p class="cve-credit">🏅 <strong>Credit:</strong> The ASF -- found using Claude agents to study the security of open-source projects, validated and reported by Apache Storm.</p>

<h3><a href="https://www.cve.org/CVERecord?id=CVE-2026-82438">CVE-2026-82438</a> - Apache Storm Webapp: Authenticated API Responses Exposed to Arbitrary Web Origins</h3>
<p><strong>Versions Affected:</strong> 3.0.0.</p>
<p><strong>Description:</strong> Three mechanisms allowed a web page on an unrelated origin to read responses served to an authenticated user. The Logviewer reflected the request's <code>Origin</code> back in <code>Access-Control-Allow-Origin</code> while also sending <code>Access-Control-Allow-Credentials: true</code>, removing the protection that makes the documented <code>*</code> posture safe. The shared CORS filter used by the UI, Logviewer and DRPC was configured with a response header name where an init parameter name was expected, so the container applied its own credential-allowing defaults. And the UI and Logviewer wrapped every GET response in a caller-supplied JSONP callback, which any origin's script element can load, bypassing the same-origin policy entirely, with no way to turn it off.</p>
<p><strong>Mitigation:</strong> Upgrade to 3.1.0, where the Logviewer no longer reflects the request origin in a credentialed response, the CORS filter is configured explicitly, and JSONP wrapping is governed by <code>ui.enable.jsonp</code> (default false). Disabling JSONP is a behaviour change for tooling that passes a <code>callback</code> parameter. Users who cannot upgrade should front these endpoints with a reverse proxy that strips the CORS headers and rejects <code>callback</code>.</p>
<p class="cve-credit">🏅 <strong>Credit:</strong> The ASF -- found using Claude agents to study the security of open-source projects, validated and reported by Apache Storm.</p>

<h3><a href="https://www.cve.org/CVERecord?id=CVE-2026-82439">CVE-2026-82439</a> - Apache Storm DRPC: Unauthenticated Unbounded Memory Growth in DRPC</h3>
<p><strong>Versions Affected:</strong> 3.0.0.</p>
<p><strong>Description:</strong> The DRPC server kept a map from function name to request queue and created an entry the first time a function name was seen; no code path ever removed an entry. Function names come from the client and are not constrained to registered functions, so the number of retained entries is bounded only by the distinct names an attacker sends. <code>drpc.authorizer</code> is unset by default, so no credentials are required. The retained state is permanent rather than a transient load spike, so it accumulates until the DRPC server exhausts its heap.</p>
<p><strong>Mitigation:</strong> Upgrade to 3.1.0, where a function's queue is removed once nothing is waiting in it. Users who cannot upgrade should configure <code>drpc.authorizer</code> so only trusted principals can reach the DRPC endpoints and ensure the DRPC ports are not reachable from untrusted networks.</p>
<p class="cve-credit">🏅 <strong>Credit:</strong> The ASF -- found using Claude agents to study the security of open-source projects, validated and reported by Apache Storm.</p>

<h3><a href="https://www.cve.org/CVERecord?id=CVE-2026-82440">CVE-2026-82440</a> - Apache Storm Nimbus: Submitter-Controlled Class Instantiation in Nimbus via a Fail-Open Scheduler Strategy Allowlist</h3>
<p><strong>Versions Affected:</strong> 3.0.0.</p>
<p><strong>Description:</strong> Nimbus instantiates the class named by a topology's <code>topology.scheduler.strategy</code>. The allowlist meant to constrain that choice, <code>nimbus.scheduler.strategy.class.whitelist</code>, was treated as "allow any class" when unset and had no entry in the shipped <code>defaults.yaml</code>, so unset was the shipped state. An authenticated submitter could cause Nimbus to instantiate any class on its classpath with a no-argument constructor; Storm's own artifacts contain classes with side effects (e.g. <code>org.apache.storm.testing.InProcessZookeeper</code>, <code>org.apache.storm.LocalCluster</code>), so repeated submissions consume threads, sockets and memory in the most privileged daemon.</p>
<p><strong>Mitigation:</strong> Upgrade to 3.1.0, where an unset allowlist means the strategies shipped with Storm rather than any class. This is a behaviour change: a cluster running an out-of-tree strategy without an explicit allowlist will have those topologies refused until the class is added to <code>nimbus.scheduler.strategy.class.whitelist</code>. Users who cannot upgrade should set that key explicitly.</p>
<p class="cve-credit">🏅 <strong>Credit:</strong> The ASF -- found using Claude agents to study the security of open-source projects, validated and reported by Apache Storm.</p>

<h3><a href="https://www.cve.org/CVERecord?id=CVE-2026-82441">CVE-2026-82441</a> - Apache Storm Nimbus: Cross-Tenant Blob Deletion and Cluster Denial of Service via Unvalidated Topology Dependency Keys</h3>
<p><strong>Versions Affected:</strong> 3.0.0.</p>
<p><strong>Description:</strong> A submitted topology carries <code>dependency_jars</code> and <code>dependency_artifacts</code> lists of blobstore keys, which Nimbus did not validate on submission yet acted on in two places. During cleanup Nimbus deletes the keys named in those lists as the Nimbus subject, for which the blobstore short-circuits its ACL check, so a submitter who listed another topology's key (such as its <code>-stormjar.jar</code>) could cause that blob to be deleted. Separately, on acquiring leadership a Nimbus surrenders leadership if any listed dependency key is missing, so a single non-existent key on one active topology makes every Nimbus acquire, surrender and requeue leadership indefinitely, leaving the cluster without a leader.</p>
<p><strong>Mitigation:</strong> Upgrade to 3.1.0, where a submission is refused unless every entry in both lists is a dependency blob key that exists in the blobstore. This validates new submissions only; an operator whose cluster is failing to retain a leader should inspect the Nimbus log for the missing dependency keys and remove or resubmit the topology naming them. Users who cannot upgrade should restrict topology submission to trusted principals.</p>
<p class="cve-credit">🏅 <strong>Credit:</strong> This issue was discovered by rzo1 while investigating an unrelated blobstore defect.</p>

<h3><a href="https://www.cve.org/CVERecord?id=CVE-2026-84179">CVE-2026-84179</a> - Apache Storm Nimbus, Apache Storm UI: Disclosure of Unredacted Merged Daemon Configuration via the Topology Page</h3>
<p><strong>Versions Affected:</strong> 3.0.0.</p>
<p><strong>Description:</strong> <code>getTopologyPageInfo</code> merged the Nimbus daemon configuration with the topology's own configuration and returned the result without redaction in the <code>topology_conf</code> field of <code>TopologyPageInfo</code>; the UI copied it verbatim into the <code>configuration</code> field of <code>GET /api/v1/topology/{id}</code> and the corresponding metrics endpoint. Where configured, the merged map includes <code>storm.zookeeper.auth.payload</code> and the Thrift/Netty/ZooKeeper TLS keystore and truststore passwords. Because this is a topology read-only operation, under <code>SimpleACLAuthorizer</code> a principal in <code>topology.readonly.users</code>/<code>topology.readonly.groups</code> could read daemon credentials that the dedicated <code>getNimbusConf</code> API redacts and gates on <code>nimbus.users</code>.</p>
<p><strong>Mitigation:</strong> Upgrade to 3.1.0, where credential-bearing values are masked before any configuration is served over the Nimbus API. Users who cannot upgrade should remove any principal not trusted with cluster credentials from <code>topology.readonly.users</code>, <code>topology.readonly.groups</code>, <code>topology.users</code> and <code>topology.groups</code>, and rotate the ZooKeeper authentication payload and any TLS keystore/truststore passwords reachable through the topology page.</p>
<p class="cve-credit">🏅 <strong>Credit:</strong> Wanxin Yin (yaklang.io) reported this issue to the Apache Security Team.</p>

<h3>Additional acknowledgements</h3>
<p>We also thank n0mi1k for reporting the <code>getTopologyHistory</code> authorization gap addressed in this release by <a href="https://github.com/apache/storm/pull/9003">#9003</a>. It is handled as a hardening improvement and is not covered by a separate advisory.</p>

<h2>✨ Enhancements</h2>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8977">#8977</a>] - Add ui.enable.jsonp to control JSONP callback wrapping in UI and Logviewer API responses</li>
	<li>[<a href="https://github.com/apache/storm/pull/8969">#8969</a>] - Sync checkstyle config with upstream google_checks.xml</li>
	<li>[<a href="https://github.com/apache/storm/pull/8950">#8950</a>] - Add storm-iceberg module: an Apache Iceberg sink bolt</li>
	<li>[<a href="https://github.com/apache/storm/issues/7569">#7569</a>] - [STORM-3787] Add error messages in worker-launcher code where it is missing</li>
</ul>

<h2>📖 Documentation</h2>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8995">#8995</a>] - Document that an unset scheduler strategy whitelist no longer allows every strategy class</li>
	<li>[<a href="https://github.com/apache/storm/pull/8984">#8984</a>] - Clarify worker/supervisor heartbeat docs and deprecate unused nimbus.supervisor.timeout.secs</li>
	<li>[<a href="https://github.com/apache/storm/pull/8949">#8949</a>] - docs: add missing 3.0.0 feature documentation</li>
</ul>

<h2>🐛 Bug fixing</h2>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/9082">#9082</a>] - STORM-3871: sweep dependency blobs that outlive their topology's cleanup</li>
	<li>[<a href="https://github.com/apache/storm/pull/9076">#9076</a>] - Drop malformed tuple payloads instead of killing the receiving worker</li>
	<li>[<a href="https://github.com/apache/storm/pull/9075">#9075</a>] - Harden the java serialization fallback bridge with a JEP-290 serial filter</li>
	<li>[<a href="https://github.com/apache/storm/pull/9069">#9069</a>] - Apply one redaction rule to configuration served and logged by Storm</li>
	<li>[<a href="https://github.com/apache/storm/pull/9014">#9014</a>] - Test the OCI launch-command username and mount-source enforcement</li>
	<li>[<a href="https://github.com/apache/storm/pull/9013">#9013</a>] - Return independently owned value arrays from get_values</li>
	<li>[<a href="https://github.com/apache/storm/pull/9012">#9012</a>] - Reject a topology submission that lists a blob key which is not a dependency blob key</li>
	<li>[<a href="https://github.com/apache/storm/pull/9011">#9011</a>] - STORM-3871: remove a topology's dependency artifact blobs when it is cleaned up</li>
	<li>[<a href="https://github.com/apache/storm/pull/9010">#9010</a>] - Restrict OCI bind-mount sources to configured directories and check the launch command username</li>
	<li>[<a href="https://github.com/apache/storm/pull/9009">#9009</a>] - Validate the worker id in profile-docker-container</li>
	<li>[<a href="https://github.com/apache/storm/pull/9008">#9008</a>] - Validate the container id and invoke runc without a shell in reap-oci-container</li>
	<li>[<a href="https://github.com/apache/storm/pull/9007">#9007</a>] - Read and check the docker command file before changing worker directory ownership</li>
	<li>[<a href="https://github.com/apache/storm/pull/9006">#9006</a>] - Apply worker file ownership and mode via an open descriptor</li>
	<li>[<a href="https://github.com/apache/storm/pull/9005">#9005</a>] - Evaluate authorization for requests that carry no principal</li>
	<li>[<a href="https://github.com/apache/storm/pull/9004">#9004</a>] - Require every UI API endpoint to declare its authorization</li>
	<li>[<a href="https://github.com/apache/storm/pull/9003">#9003</a>] - Filter the topology history by the authenticated caller rather than the requested user name</li>
	<li>[<a href="https://github.com/apache/storm/pull/9002">#9002</a>] - Authorize createStateInZookeeper requests like the other blob operations</li>
	<li>[<a href="https://github.com/apache/storm/pull/9001">#9001</a>] - Check the calling principal against the topology owner in uploadNewCredentials</li>
	<li>[<a href="https://github.com/apache/storm/pull/9000">#9000</a>] - Apply the nimbus ACLs to listBlobs so callers only see blobs they may read</li>
	<li>[<a href="https://github.com/apache/storm/pull/8999">#8999</a>] - Validate topology.blobstore.map in rebalance conf overrides against the calling user</li>
	<li>[<a href="https://github.com/apache/storm/pull/8998">#8998</a>] - Evaluate nimbus.groups when nimbus.users is empty</li>
	<li>[<a href="https://github.com/apache/storm/pull/8993">#8993</a>] - Decode netty server frames only after the handshake completes</li>
	<li>[<a href="https://github.com/apache/storm/pull/8992">#8992</a>] - Update StormSubmitter logging behavior</li>
	<li>[<a href="https://github.com/apache/storm/pull/8991">#8991</a>] - Return a normalized copy of the topology conf from Nimbus</li>
	<li>[<a href="https://github.com/apache/storm/pull/8990">#8990</a>] - Require Kryo class registration in the state serializer</li>
	<li>[<a href="https://github.com/apache/storm/pull/8989">#8989</a>] - Generate tuple tree ids from a key stream instead of a recoverable linear congruential generator</li>
	<li>[<a href="https://github.com/apache/storm/pull/8988">#8988</a>] - Pass only the required Kafka consumer properties to the spout lag monitor</li>
	<li>[<a href="https://github.com/apache/storm/pull/8987">#8987</a>] - Verify the peer identity of the Netty TLS server the worker client connects to</li>
	<li>[<a href="https://github.com/apache/storm/pull/8986">#8986</a>] - Restrict topology scheduler strategies to the shipped strategies when no allowlist is configured</li>
	<li>[<a href="https://github.com/apache/storm/pull/8985">#8985</a>] - Remove DRPC per-function request queues once they are empty</li>
	<li>[<a href="https://github.com/apache/storm/pull/8983">#8983</a>] - Reject image tags that are neither mapped nor valid image hashes before building the manifest path</li>
	<li>[<a href="https://github.com/apache/storm/pull/8982">#8982</a>] - Give each uploaded dependency artifact its own blob key instead of reusing a pre-existing blob</li>
	<li>[<a href="https://github.com/apache/storm/pull/8981">#8981</a>] - Reject blobstore map local names that resolve outside the topology and worker directories</li>
	<li>[<a href="https://github.com/apache/storm/pull/8980">#8980</a>] - Reject submitted jar locations that are not inside the Nimbus inbox</li>
	<li>[<a href="https://github.com/apache/storm/pull/8979">#8979</a>] - Add to instead of replace Jetty's default TLS exclusions on HTTPS connectors</li>
	<li>[<a href="https://github.com/apache/storm/pull/8978">#8978</a>] - Change the worker log file permission only for download requests that are served</li>
	<li>[<a href="https://github.com/apache/storm/pull/8976">#8976</a>] - Set the CORS filter credentials parameter explicitly instead of a header name the filter ignores</li>
	<li>[<a href="https://github.com/apache/storm/pull/8975">#8975</a>] - Stop echoing the request Origin with allow-credentials in logviewer JSON responses</li>
	<li>[<a href="https://github.com/apache/storm/pull/8974">#8974</a>] - Return only the log files the requesting user may access from the log file listing</li>
	<li>[<a href="https://github.com/apache/storm/pull/8973">#8973</a>] - Apply the configured log user and group lists to daemon log requests</li>
	<li>[<a href="https://github.com/apache/storm/pull/8972">#8972</a>] - BugFix Utils.java</li>
	<li>[<a href="https://github.com/apache/storm/issues/7653">#7653</a>] - [STORM-3871] Storm blobstore leak space</li>
</ul>

<h2>📦 Dependency upgrades</h2>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/9080">#9080</a>] - build(deps-dev): bump svgo from 4.0.2 to 4.1.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/9072">#9072</a>] - build(deps-dev): bump fast-uri from 3.1.5 to 3.1.7 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/9071">#9071</a>] - build(deps-dev): bump browserslist from 4.28.1 to 4.28.8 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/9070">#9070</a>] - build(deps): bump postcss-selector-parser from 7.1.1 to 7.1.5 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/9067">#9067</a>] - build(deps): batch open Dependabot version updates</li>
	<li>[<a href="https://github.com/apache/storm/pull/9066">#9066</a>] - build(deps-dev): bump start-server-and-test from 3.0.11 to 3.0.12 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/9065">#9065</a>] - build(deps-dev): bump css-loader from 7.1.4 to 7.1.5 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/9064">#9064</a>] - build(deps-dev): bump webpack-cli from 7.2.2 to 7.2.3 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/9063">#9063</a>] - build(deps): bump cytoscape from 3.34.0 to 3.34.2 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/9062">#9062</a>] - build(deps-dev): bump webpack from 5.109.2 to 5.110.1 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/9061">#9061</a>] - build(deps): bump vis-data from 8.0.4 to 8.0.5 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/9060">#9060</a>] - build(deps): bump datatables.net from 3.0.0 to 3.0.2 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/9059">#9059</a>] - build(deps): bump js-yaml from 5.2.2 to 5.4.1 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/9058">#9058</a>] - build(deps): bump cytoscape-dagre from 4.0.0 to 4.0.1 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/9057">#9057</a>] - build(deps): bump datatables.net-bs5 from 3.0.0 to 3.0.2 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/9056">#9056</a>] - build(deps): bump vis-network from 10.1.0 to 10.1.2 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/9055">#9055</a>] - build(deps): bump datatables.net-dt from 3.0.0 to 3.0.2 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/9054">#9054</a>] - build(deps-dev): bump cypress from 15.19.0 to 15.21.1 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/9053">#9053</a>] - build(deps): bump org.apache.xbean:xbean-spring from 4.31 to 5.0.0 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/9052">#9052</a>] - build(deps): bump com.google.guava:guava from 33.6.0-jre to 33.7.1-jre in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/9051">#9051</a>] - build(deps): bump org.junit:junit-bom from 6.1.2 to 6.1.3 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/9050">#9050</a>] - build(deps): bump com.fasterxml.woodstox:woodstox-core from 7.2.1 to 7.2.2 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/9049">#9049</a>] - build(deps): bump org.objenesis:objenesis from 3.5 to 3.6 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/9048">#9048</a>] - build(deps): bump com.github.luben:zstd-jni from 1.5.7-12 to 1.5.7-15 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/9047">#9047</a>] - build(deps): bump io.netty:netty-bom from 4.2.16.Final to 4.2.17.Final in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/9046">#9046</a>] - build(deps): bump com.fasterxml.jackson:jackson-bom from 2.22.1 to 2.22.2 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/9045">#9045</a>] - build(deps): bump activemq.version from 6.3.0 to 6.3.1 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/9044">#9044</a>] - build(deps): bump org.apache.avro:avro from 1.12.1 to 1.12.2 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/9043">#9043</a>] - build(deps): bump spring.version from 7.0.8 to 7.0.9 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/9042">#9042</a>] - build(deps): bump org.apache.commons:commons-collections4 from 4.5.0 to 4.6.0 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/9041">#9041</a>] - build(deps): bump byte-buddy.version from 1.18.11 to 1.18.12 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/9040">#9040</a>] - build(deps): bump metrics.version from 4.2.39 to 4.2.40 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/9039">#9039</a>] - build(deps): bump com.puppycrawl.tools:checkstyle from 13.9.0 to 14.0.0 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/9038">#9038</a>] - build(deps): bump org.apache.xbean:xbean-spring from 4.31 to 5.0.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/9037">#9037</a>] - build(deps): bump org.jctools:jctools-core from 4.0.6 to 4.0.7 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/9036">#9036</a>] - build(deps): bump com.google.guava:guava from 33.6.0-jre to 33.7.1-jre</li>
	<li>[<a href="https://github.com/apache/storm/pull/9035">#9035</a>] - build(deps): bump jetty.version from 12.1.11 to 12.1.12 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/9034">#9034</a>] - build(deps): bump com.github.luben:zstd-jni from 1.5.7-12 to 1.5.7-15</li>
	<li>[<a href="https://github.com/apache/storm/pull/9033">#9033</a>] - build(deps): bump redis.clients:jedis from 7.5.3 to 8.0.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/9032">#9032</a>] - build(deps): bump com.fasterxml.jackson:jackson-bom from 2.22.1 to 2.22.2</li>
	<li>[<a href="https://github.com/apache/storm/pull/9031">#9031</a>] - build(deps): bump org.junit:junit-bom from 6.1.2 to 6.1.3</li>
	<li>[<a href="https://github.com/apache/storm/pull/9030">#9030</a>] - build(deps): bump org.apache.commons:commons-collections4 from 4.5.0 to 4.6.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/9029">#9029</a>] - build(deps): bump spring.version from 7.0.8 to 7.0.9</li>
	<li>[<a href="https://github.com/apache/storm/pull/9028">#9028</a>] - build(deps): bump com.fasterxml.woodstox:woodstox-core from 7.2.1 to 7.2.2</li>
	<li>[<a href="https://github.com/apache/storm/pull/9027">#9027</a>] - build(deps): bump netty-tcnative.version from 2.0.81.Final to 2.0.82.Final</li>
	<li>[<a href="https://github.com/apache/storm/pull/9026">#9026</a>] - build(deps): bump com.fasterxml.jackson.core:jackson-databind from 2.22.1 to 2.22.2</li>
	<li>[<a href="https://github.com/apache/storm/pull/9025">#9025</a>] - build(deps): bump org.objenesis:objenesis from 3.5 to 3.6</li>
	<li>[<a href="https://github.com/apache/storm/pull/9024">#9024</a>] - build(deps): bump activemq.version from 6.3.0 to 6.3.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/9023">#9023</a>] - build(deps): bump org.jctools:jctools-core from 4.0.6 to 4.0.7</li>
	<li>[<a href="https://github.com/apache/storm/pull/9022">#9022</a>] - build(deps): bump io.netty:netty-bom from 4.2.16.Final to 4.2.17.Final</li>
	<li>[<a href="https://github.com/apache/storm/pull/9021">#9021</a>] - build(deps): bump metrics.version from 4.2.39 to 4.2.40</li>
	<li>[<a href="https://github.com/apache/storm/pull/9020">#9020</a>] - build(deps): bump org.apache.avro:avro from 1.12.1 to 1.12.2</li>
	<li>[<a href="https://github.com/apache/storm/pull/9019">#9019</a>] - build(deps): bump jetty.version from 12.1.11 to 12.1.12</li>
	<li>[<a href="https://github.com/apache/storm/pull/9018">#9018</a>] - build(deps): bump byte-buddy.version from 1.18.11 to 1.18.12</li>
	<li>[<a href="https://github.com/apache/storm/pull/8970">#8970</a>] - build(deps-dev): bump fast-uri from 3.1.4 to 3.1.5 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8965">#8965</a>] - build(deps): bump datatables.net-dt from 2.3.8 to 3.0.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8964">#8964</a>] - build(deps): bump datatables.net-bs5 from 2.3.8 to 3.0.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8963">#8963</a>] - build(deps): bump datatables.net from 2.3.8 to 3.0.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8962">#8962</a>] - build(deps-dev): bump webpack from 5.108.4 to 5.109.2 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8961">#8961</a>] - build(deps-dev): bump webpack-cli from 7.2.1 to 7.2.2 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8960">#8960</a>] - build(deps): bump com.github.luben:zstd-jni from 1.5.7-11 to 1.5.7-12 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8959">#8959</a>] - build(deps): bump commons-codec:commons-codec from 1.22.0 to 1.22.1 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8958">#8958</a>] - build(deps): bump com.puppycrawl.tools:checkstyle from 13.8.0 to 13.9.0 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8957">#8957</a>] - build(deps): bump com.github.luben:zstd-jni from 1.5.7-11 to 1.5.7-12</li>
	<li>[<a href="https://github.com/apache/storm/pull/8956">#8956</a>] - build(deps): bump activemq.version from 6.2.7 to 6.3.0 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8955">#8955</a>] - build(deps): bump activemq.version from 6.2.7 to 6.3.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8954">#8954</a>] - build(deps-dev): bump com.github.eirslett:frontend-maven-plugin from 2.0.1 to 2.0.2</li>
	<li>[<a href="https://github.com/apache/storm/pull/8953">#8953</a>] - build(deps): bump commons-codec:commons-codec from 1.22.0 to 1.22.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8952">#8952</a>] - build(deps): bump postcss from 8.5.10 to 8.5.24 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8951">#8951</a>] - build(deps): bump js-yaml from 5.2.1 to 5.2.2 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8945">#8945</a>] - build(deps-dev): bump svgo from 4.0.1 to 4.0.2 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8944">#8944</a>] - build(deps-dev): bump fast-uri from 3.1.2 to 3.1.4 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8943">#8943</a>] - build(deps): bump org.apache.xbean:xbean-spring from 4.30 to 4.31</li>
	<li>[<a href="https://github.com/apache/storm/pull/8942">#8942</a>] - build(deps): bump org.apache.logging.log4j:log4j-bom from 2.26.0 to 2.26.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8941">#8941</a>] - build(deps): bump com.fasterxml.jackson:jackson-bom from 2.21.3 to 2.22.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8940">#8940</a>] - build(deps): bump bouncycastle.version from 1.84 to 1.85</li>
	<li>[<a href="https://github.com/apache/storm/pull/8939">#8939</a>] - build(deps): bump org.apache.thrift:libthrift from 0.23.0 to 0.24.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8938">#8938</a>] - build(deps): bump org.junit:junit-bom from 6.1.1 to 6.1.2</li>
	<li>[<a href="https://github.com/apache/storm/pull/8937">#8937</a>] - build(deps): bump redis.clients:jedis from 7.5.2 to 7.5.3</li>
	<li>[<a href="https://github.com/apache/storm/pull/8936">#8936</a>] - build(deps): bump byte-buddy.version from 1.18.10 to 1.18.11</li>
	<li>[<a href="https://github.com/apache/storm/pull/8935">#8935</a>] - build(deps): bump com.fasterxml.jackson:jackson-bom from 2.21.3 to 2.22.1 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8934">#8934</a>] - build(deps): bump netty-tcnative.version from 2.0.80.Final to 2.0.81.Final</li>
	<li>[<a href="https://github.com/apache/storm/pull/8933">#8933</a>] - build(deps): bump io.netty:netty-bom from 4.2.15.Final to 4.2.16.Final</li>
	<li>[<a href="https://github.com/apache/storm/pull/8932">#8932</a>] - build(deps): bump byte-buddy.version from 1.18.10 to 1.18.11 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8931">#8931</a>] - build(deps): bump org.apache.thrift:libthrift from 0.23.0 to 0.24.0 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8930">#8930</a>] - build(deps): bump com.fasterxml.jackson.core:jackson-databind from 2.22.0 to 2.22.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8929">#8929</a>] - build(deps): bump org.apache.logging.log4j:log4j-bom from 2.26.0 to 2.26.1 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8928">#8928</a>] - build(deps): bump jakarta-activation-version from 1.2.1 to 2.0.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8927">#8927</a>] - build(deps): bump io.netty:netty-bom from 4.2.15.Final to 4.2.16.Final in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8926">#8926</a>] - build(deps): bump jakarta.ws.rs:jakarta.ws.rs-api from 3.1.0 to 4.0.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8925">#8925</a>] - build(deps): bump org.apache.xbean:xbean-spring from 4.30 to 4.31 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8924">#8924</a>] - build(deps): bump com.puppycrawl.tools:checkstyle from 13.7.0 to 13.8.0 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8923">#8923</a>] - build(deps-dev): bump webpack from 5.108.3 to 5.108.4 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8922">#8922</a>] - build(deps): bump jetty.version from 12.1.10 to 12.1.11 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8921">#8921</a>] - build(deps-dev): bump cypress from 15.18.0 to 15.19.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8920">#8920</a>] - build(deps): bump jetty.version from 12.1.10 to 12.1.11</li>
	<li>[<a href="https://github.com/apache/storm/pull/8919">#8919</a>] - build(deps-dev): bump webpack-cli from 7.1.0 to 7.2.1 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8918">#8918</a>] - build(deps): bump org.junit:junit-bom from 6.1.1 to 6.1.2 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8917">#8917</a>] - build(deps): bump bouncycastle.version from 1.84 to 1.85 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8910">#8910</a>] - build(deps): bump js-yaml from 5.2.0 to 5.2.1 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8909">#8909</a>] - build(deps-dev): bump axios from 1.16.1 to 1.18.1 in /storm-webapp</li>
</ul>
