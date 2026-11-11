---
layout: post
title: Apache Storm 3.2.0 Released
author: Rui Abreu
---

The Apache Storm community is pleased to announce that version 3.2.0 has been
released and is available from [the downloads page](/downloads.html).

This release adds a Prometheus reporter for the V2 topology metrics, pluggable
tuple tracing with an OpenTelemetry tracer, and an opt-in virtual threads flag
for the Thrift server handler pools on Java 25. It also resolves three security
issues (see the Security Fixes below), adds a strict deserialization mode with a
typed exception for tuples with unknown task or stream ids, and removes several
long-deprecated APIs and settings (see the Upgrade Notes below).
**All users of earlier 3.x releases are strongly encouraged to
upgrade.** As with 3.0.0, Java 25 is required to run Apache Storm
3.x, and the Java API remains backwards-compatible with Storm 2.x, apart from the
removals listed in the Upgrade Notes.

The Storm 2.x line has reached end of life and no longer receives security fixes.
Users still on 2.x should treat the issues below as unpatched there and migrate
to 3.x, where they are fixed in 3.2.0.

Two of the security fixes change behaviour that users may rely on (the Logviewer
no longer follows symbolic links, and DRPC and the UI deny a `doAsUser` request
that has no authenticated user); please read the mitigations below before
upgrading.

## 🙏 Thanks

Special thanks are due to all those who have contributed to Apache Storm --
whether through direct code contributions, documentation, bug reports, security
reports, or helping other users on the mailing lists. Your efforts are much
appreciated.

## 📋 Changes in this Release - Storm 3.2.0

<p>Issues and pull requests addressed in the 3.2.0 release of Storm. Documentation for this release is available at the <a href="https://storm.apache.org/">Apache Storm project site</a>.</p>

<style>
.cve-credit {
	margin: 0.4em 0 1.8em;
	padding: 0.55em 0.9em;
	border-left: 4px solid #0066cc;
	background: #eef4ff;
	border-radius: 4px;
}
.cve-credit strong { color: #0066cc; }
.upgrade-notes > ul > li { margin-bottom: 1.4em; }
.upgrade-notes > ul > li > p:first-of-type { margin-top: 0.5em; }
.upgrade-notes > ul > li > p:last-child { margin-bottom: 0; }
</style>

<h2>🔒 Security Fixes</h2>

<h3><a href="https://www.cve.org/CVERecord?id=CVE-2026-94125">CVE-2026-94125</a> - Apache Storm Nimbus: Supervisor Page Discloses Worker Placement of Other Users' Topologies</h3>
<p><strong>Versions Affected:</strong> 2.0.0 before 3.2.0.</p>
<p><strong>Description:</strong> Nimbus returns the worker placement of every topology running on a supervisor, including the host, port, owner and resource assignment of topologies the caller is not authorized to read. In a multi-tenant cluster, an authenticated user who is allowed to access Nimbus can learn where the workers of other users' topologies run.</p>
<p><strong>Mitigation:</strong> Upgrade to 3.2.0, where the supervisor page omits the workers of topologies the caller is not allowed to read. Admins and users with read access see the same page as before.</p>
<p class="cve-credit">🏅 <strong>Credit:</strong> kta1kri, independent researcher, reported this issue.</p>

<h3><a href="https://www.cve.org/CVERecord?id=CVE-2026-124495">CVE-2026-124495</a> - Apache Storm Logviewer: Logviewer Follows Worker Symlinks Across Topology ACLs</h3>
<p><strong>Versions Affected:</strong> 3.0.0 before 3.2.0.</p>
<p><strong>Description:</strong> When workers run as the topology owner, the Logviewer serves files that a worker has placed in its own log directory as links to other files. A user who is allowed to submit topologies can read the worker logs of other users' topologies, and other files the Logviewer process can read.</p>
<p><strong>Mitigation:</strong> Upgrade to 3.2.0, where the Logviewer no longer follows symbolic links below the worker log root, and worker files must be direct children of a port directory (<code>topologyId/port/file</code>). Deeper paths, which the old download code still served, now answer 404.</p>
<p class="cve-credit">🏅 <strong>Credit:</strong> Javier García Herrera reported this issue.</p>

<h3><a href="https://www.cve.org/CVERecord?id=CVE-2026-124496">CVE-2026-124496</a> - Apache Storm DRPC: DRPC HTTP doAsUser Bypasses the Impersonation Authorizer</h3>
<p><strong>Versions Affected:</strong> 3.0.0 before 3.2.0.</p>
<p><strong>Description:</strong> The DRPC HTTP endpoint lets an authenticated client act as another user without applying the configured impersonation authorizer. An authenticated user can execute DRPC functions that are restricted to another user.</p>
<p><strong>Mitigation:</strong> Upgrade to 3.2.0, where DRPC checks the impersonation authorizer for these requests, and the host lists in <code>nimbus.impersonation.acl</code> apply to HTTP requests as well. A request with <code>doAsUser</code> but no authenticated user is now denied with 401 by DRPC and the UI. Behind a reverse proxy, host lists match the proxy's address; see <a href="/releases/3.2.0/SECURITY.html"><code>docs/SECURITY.md</code></a>.</p>
<p class="cve-credit">🏅 <strong>Credit:</strong> Javier García Herrera reported this issue.</p>

<h2>⚠️ Upgrade Notes</h2>
<div class="upgrade-notes">
<ul><li>[<a href="https://github.com/apache/storm/pull/9171">#9171</a>] - Formally mark Pacemaker subsystem and configs for removal (#8994)
<p><strong>Pacemaker is now formally marked for removal.</strong> The Pacemaker classes in <code>storm-client</code> and <code>storm-server</code> (for example <code>Pacemaker</code>, <code>PacemakerServer</code>, <code>PacemakerClient</code>) and the constants <code>Config.PACEMAKER_SERVERS</code>, <code>Config.PACEMAKER_PORT</code>, <code>Config.PACEMAKER_CLIENT_MAX_THREADS</code>, <code>Config.PACEMAKER_AUTH_METHOD</code>, <code>Config.PACEMAKER_THRIFT_MESSAGE_SIZE_MAX</code>, <code>DaemonConfig.PACEMAKER_MAX_THREADS</code> and <code>DaemonConfig.PACEMAKER_CHILDOPTS</code> are now deprecated for removal (<code>@Deprecated(forRemoval = true)</code>). Behavior is unchanged. Code that references them gets compiler removal warnings. Plan to stop using Pacemaker before a future release removes it.</p></li>
		<li>[<a href="https://github.com/apache/storm/pull/9170">#9170</a>] - Remove deprecated NIMBUS_SUPERVISOR_TIMEOUT_SECS and defaults entry (#8994)
<p><strong><code>nimbus.supervisor.timeout.secs</code> removed.</strong> The constant <code>DaemonConfig.NIMBUS_SUPERVISOR_TIMEOUT_SECS</code> (<code>"nimbus.supervisor.timeout.secs"</code>), deprecated since 3.1.0, and its entry in <code>conf/defaults.yaml</code> are gone. Nothing read this value: Nimbus detects a dead supervisor through its ephemeral ZooKeeper node. Remove the setting from <code>storm.yaml</code>, and change any code that references the constant.</p></li>
		<li>[<a href="https://github.com/apache/storm/pull/9169">#9169</a>] - Remove obsolete deprecated client Config keys (#8994)
<ul>
<li><strong>Removed Configuration Keys</strong>:
<ul>
<li><code>storm.metrics.reporters</code>: Deprecated in 2.3.0 and has now been removed. Topologies must configure worker metrics reporters using <code>topology.metrics.reporters</code>. Nimbus logs a warning if <code>storm.metrics.reporters</code> is still passed.</li>
<li><code>blobstore.hdfs.principal</code> and <code>blobstore.hdfs.keytab</code>: Deprecated in 2.2.0 and have now been removed.<ul>
<li><strong>Action Required</strong>: Cluster operators and topology authors who previously relied on <code>blobstore.hdfs.principal</code> or <code>blobstore.hdfs.keytab</code> for HDFS Kerberos authentication must migrate their configuration to <code>storm.hdfs.login.principal</code> and <code>storm.hdfs.login.keytab</code>. Setting only the legacy <code>blobstore.hdfs.*</code> keys will log a warning and will no longer perform the Kerberos login.</li>
</ul>
</li>
</ul></li>
</ul></li>
		<li>[<a href="https://github.com/apache/storm/pull/9168">#9168</a>] - Remove legacy ZooKeeper backpressure cluster state methods and config (#8994)
<p><strong><code>Config.TOPOLOGY_BACKPRESSURE_ENABLE</code> removed.</strong> The public constant <code>Config.TOPOLOGY_BACKPRESSURE_ENABLE</code> (<code>"topology.backpressure.enable"</code>), marked for removal since 2.0.0, is gone. The key is now ignored, and Nimbus logs a warning when a submitted topology sets it. Worker backpressure is handled automatically, in-process.</p>
<p><strong>Cluster state methods removed.</strong> <code>IStormClusterState</code> and <code>StormClusterStateImpl</code> no longer have <code>backpressureTopologies</code>, <code>topologyBackpressure</code>, <code>setupBackpressure</code>, <code>removeBackpressure</code> and <code>removeWorkerBackpressure</code>. Code that calls them must be changed.</p>
<p><strong><code>&lt;storm.zookeeper.root&gt;/backpressure</code> znodes.</strong> Nimbus no longer creates these znodes, and no longer removes them when it cleans up a topology, so leftovers from older versions stay in ZooKeeper. One exception: when <code>storm.nimbus.zookeeper.acls.check</code> or <code>storm.nimbus.zookeeper.acls.fixup</code> is true and ZooKeeper authentication is configured, Nimbus still deletes the entries of topologies that no longer exist under that path at startup. Otherwise operators can delete the subtree in zkCli with <code>deleteall &lt;storm.zookeeper.root&gt;/backpressure</code> (default <code>/storm/backpressure</code>).</p></li>
		<li>[<a href="https://github.com/apache/storm/pull/9167">#9167</a>] - Remove deprecated BlowfishTupleSerializer (#8994)
<p><strong><code>BlowfishTupleSerializer</code> removed.</strong> The class <code>org.apache.storm.security.serialization.BlowfishTupleSerializer</code>, deprecated since 2.8.6, is gone, along with its constant <code>SECRET_KEY</code> (<code>topology.tuple.serializer.blowfish.key</code>). Blowfish has a 64-bit block size that is vulnerable to birthday attacks (Sweet32). Topologies and code that register or reference it must stop doing so. To encrypt tuples between workers, use TLS transport encryption (<code>storm.messaging.netty.tls.enable</code>, see <a href="/releases/3.2.0/SECURITY.html"><code>docs/SECURITY.md</code></a>). Nimbus still masks <code>topology.tuple.serializer.blowfish.key</code> if an old stored config contains it.</p></li>
	</ul>
</div>

<h2>✨ Enhancements</h2>
<ul><li>[<a href="https://github.com/apache/storm/pull/9251">#9251</a>] - Call getLogHandler in ShellUtilsTest failure tests</li>
		<li>[<a href="https://github.com/apache/storm/pull/9194">#9194</a>] - Run the Zstd compression level round-trip test</li>
		<li>[<a href="https://github.com/apache/storm/pull/9189">#9189</a>] - Print PR upgrade notes in the generated release notes</li>
		<li>[<a href="https://github.com/apache/storm/pull/9186">#9186</a>] - Restore two test annotations lost in the JUnit 5 migration</li>
		<li>[<a href="https://github.com/apache/storm/pull/9178">#9178</a>] - Fix the indentation the checkstyle auto-fix gets wrong</li>
		<li>[<a href="https://github.com/apache/storm/pull/9173">#9173</a>] - Classify surviving deprecated APIs in storm-server, external modules, and utilities (#8994)</li>
		<li>[<a href="https://github.com/apache/storm/pull/9172">#9172</a>] - Classify surviving deprecated storm-client APIs with forRemoval decisions (#8994)</li>
		<li>[<a href="https://github.com/apache/storm/pull/9171">#9171</a>] - Formally mark Pacemaker subsystem and configs for removal (#8994)</li>
		<li>[<a href="https://github.com/apache/storm/pull/9170">#9170</a>] - Remove deprecated NIMBUS_SUPERVISOR_TIMEOUT_SECS and defaults entry (#8994)</li>
		<li>[<a href="https://github.com/apache/storm/pull/9169">#9169</a>] - Remove obsolete deprecated client Config keys (#8994)</li>
		<li>[<a href="https://github.com/apache/storm/pull/9168">#9168</a>] - Remove legacy ZooKeeper backpressure cluster state methods and config (#8994)</li>
		<li>[<a href="https://github.com/apache/storm/pull/9167">#9167</a>] - Remove deprecated BlowfishTupleSerializer (#8994)</li>
		<li>[<a href="https://github.com/apache/storm/pull/9158">#9158</a>] - Add a Prometheus reporter for the V2 topology metrics</li>
		<li>[<a href="https://github.com/apache/storm/pull/9154">#9154</a>] - Add pluggable tuple tracing with an OpenTelemetry tracer</li>
		<li>[<a href="https://github.com/apache/storm/pull/9152">#9152</a>] - Fix the integration test cluster and window test expectations</li>
		<li>[<a href="https://github.com/apache/storm/pull/9097">#9097</a>] - Add an opt-in virtual threads flag for the Thrift server handler pools on Java 25</li>
		<li>[<a href="https://github.com/apache/storm/pull/9094">#9094</a>] - Throw a typed exception for tuples with unknown task or stream ids and add a deserialization strict mode</li>
		<li>[<a href="https://github.com/apache/storm/pull/9093">#9093</a>] - Log at error level when the kafka spout gives up on a tuple; document max-retry give-up semantics</li>
		<li>[<a href="https://github.com/apache/storm/pull/9017">#9017</a>] - Add checkstyle auto-fix tooling</li>
	</ul>

<h2>📖 Documentation</h2>
<ul><li>[<a href="https://github.com/apache/storm/pull/9156">#9156</a>] - Fix class names in the codebase, cgroup, metrics and Kafka docs</li>
	</ul>

<h2>🐛 Bug fixing</h2>
<ul><li>[<a href="https://github.com/apache/storm/pull/9187">#9187</a>] - Fix the worker-launcher build with gcc 15 and glibc 2.43</li>
		<li>[<a href="https://github.com/apache/storm/pull/9183">#9183</a>] - Apply the impersonation authorizer to DRPC requests</li>
		<li>[<a href="https://github.com/apache/storm/pull/9182">#9182</a>] - Serve only worker files that resolve inside the log root</li>
		<li>[<a href="https://github.com/apache/storm/pull/9175">#9175</a>] - Deliver upstream feedback to remote tasks and stop spurious "No remote destination available" warnings</li>
		<li>[<a href="https://github.com/apache/storm/pull/9159">#9159</a>] - Make strict deserialization mode fatal for IOException-wrapped failures</li>
		<li>[<a href="https://github.com/apache/storm/pull/9153">#9153</a>] - Fix supervisor crash on transient ZK connection loss</li>
		<li>[<a href="https://github.com/apache/storm/pull/9095">#9095</a>] - Only list workers of readable topologies on the supervisor page</li>
		<li>[<a href="https://github.com/apache/storm/pull/9084">#9084</a>] - Drop unexpected Pacemaker frames instead of terminating the daemon; mark Pacemaker as deprecated</li>
	</ul>

<h2>📦 Dependency upgrades</h2>
<ul><li>[<a href="https://github.com/apache/storm/pull/9258">#9258</a>] - Bump com.google.errorprone:error_prone_annotations from 2.50.0 to 2.52.0</li>
		<li>[<a href="https://github.com/apache/storm/pull/9257">#9257</a>] - Bump org.jacoco:jacoco-maven-plugin from 0.8.15 to 0.8.16</li>
		<li>[<a href="https://github.com/apache/storm/pull/9256">#9256</a>] - Bump org.apache.thrift:libthrift from 0.24.0 to 0.25.0</li>
		<li>[<a href="https://github.com/apache/storm/pull/9255">#9255</a>] - Bump org.ow2.asm:asm from 9.10.1 to 9.11.1</li>
		<li>[<a href="https://github.com/apache/storm/pull/9254">#9254</a>] - Bump com.fasterxml.jackson.core:jackson-databind from 2.22.2 to 2.22.4</li>
		<li>[<a href="https://github.com/apache/storm/pull/9253">#9253</a>] - Bump com.google.code.gson:gson from 2.14.0 to 2.15.0</li>
		<li>[<a href="https://github.com/apache/storm/pull/9248">#9248</a>] - Bump systeminformation from 5.31.17 to 5.33.19</li>
		<li>[<a href="https://github.com/apache/storm/pull/9247">#9247</a>] - Bump qs from 6.15.2 to 6.17.1</li>
		<li>[<a href="https://github.com/apache/storm/pull/9245">#9245</a>] - Bump express from 5.2.1 to 5.3.0</li>
		<li>[<a href="https://github.com/apache/storm/pull/9244">#9244</a>] - Bump start-server-and-test from 3.0.12 to 3.0.13</li>
		<li>[<a href="https://github.com/apache/storm/pull/9243">#9243</a>] - Bump datatables.net from 3.1.2 to 3.1.4</li>
		<li>[<a href="https://github.com/apache/storm/pull/9242">#9242</a>] - Bump vis-data from 8.0.5 to 8.0.6</li>
		<li>[<a href="https://github.com/apache/storm/pull/9241">#9241</a>] - Bump webpack from 5.111.1 to 5.112.2</li>
		<li>[<a href="https://github.com/apache/storm/pull/9240">#9240</a>] - Bump datatables.net-bs5 from 3.1.2 to 3.1.4</li>
		<li>[<a href="https://github.com/apache/storm/pull/9239">#9239</a>] - Bump cytoscape from 3.34.3 to 3.34.4</li>
		<li>[<a href="https://github.com/apache/storm/pull/9238">#9238</a>] - Bump cypress from 16.1.1 to 16.2.1</li>
		<li>[<a href="https://github.com/apache/storm/pull/9237">#9237</a>] - Bump datatables.net-dt from 3.1.2 to 3.1.4</li>
		<li>[<a href="https://github.com/apache/storm/pull/9236">#9236</a>] - Bump js-yaml from 5.4.2 to 5.5.0</li>
		<li>[<a href="https://github.com/apache/storm/pull/9235">#9235</a>] - Bump io.netty:netty-bom from 4.2.17.Final to 4.2.19.Final</li>
		<li>[<a href="https://github.com/apache/storm/pull/9234">#9234</a>] - Bump vis-network from 10.1.2 to 10.1.4</li>
		<li>[<a href="https://github.com/apache/storm/pull/9232">#9232</a>] - Bump groovy.version from 4.0.33 to 6.0.0</li>
		<li>[<a href="https://github.com/apache/storm/pull/9230">#9230</a>] - Bump com.fasterxml.woodstox:woodstox-core from 7.2.2 to 7.3.0</li>
		<li>[<a href="https://github.com/apache/storm/pull/9228">#9228</a>] - Bump jetty.version from 12.1.12 to 12.1.14</li>
		<li>[<a href="https://github.com/apache/storm/pull/9226">#9226</a>] - Bump com.google.guava:guava from 33.7.1-jre to 33.7.2-jre</li>
		<li>[<a href="https://github.com/apache/storm/pull/9225">#9225</a>] - Bump com.fasterxml.jackson:jackson-bom from 2.22.2 to 2.22.4</li>
		<li>[<a href="https://github.com/apache/storm/pull/9223">#9223</a>] - Bump com.esotericsoftware:kryo from 5.6.2 to 5.7.1</li>
		<li>[<a href="https://github.com/apache/storm/pull/9222">#9222</a>] - Bump byte-buddy.version from 1.18.12 to 1.18.16</li>
		<li>[<a href="https://github.com/apache/storm/pull/9221">#9221</a>] - Bump io.opentelemetry:opentelemetry-bom from 1.66.0 to 1.67.0</li>
		<li>[<a href="https://github.com/apache/storm/pull/9219">#9219</a>] - Bump spring.version from 7.0.9 to 7.0.10</li>
		<li>[<a href="https://github.com/apache/storm/pull/9218">#9218</a>] - Bump surefire.version from 3.6.0 to 3.6.1</li>
		<li>[<a href="https://github.com/apache/storm/pull/9213">#9213</a>] - Bump com.github.luben:zstd-jni from 1.5.7-15 to 1.5.7-25</li>
		<li>[<a href="https://github.com/apache/storm/pull/9212">#9212</a>] - Bump org.apache.hbase:hbase-client from 2.6.6-hadoop3 to 2.6.7-hadoop3</li>
		<li>[<a href="https://github.com/apache/storm/pull/9211">#9211</a>] - Bump org.apache.maven:maven-resolver-provider from 3.9.16 to 3.10.0</li>
		<li>[<a href="https://github.com/apache/storm/pull/9209">#9209</a>] - Bump redis.clients:jedis from 8.0.1 to 8.0.2</li>
		<li>[<a href="https://github.com/apache/storm/pull/9208">#9208</a>] - Bump storm.kafka.client.version from 4.3.1 to 4.4.0</li>
		<li>[<a href="https://github.com/apache/storm/pull/9204">#9204</a>] - Bump com.github.ben-manes.caffeine:caffeine from 3.2.4 to 3.3.1</li>
		<li>[<a href="https://github.com/apache/storm/pull/9202">#9202</a>] - Bump org.xerial.snappy:snappy-java from 1.1.10.8 to 1.1.10.12</li>
		<li>[<a href="https://github.com/apache/storm/pull/9200">#9200</a>] - Bump org.rocksdb:rocksdbjni from 10.10.1.1 to 11.8.1</li>
		<li>[<a href="https://github.com/apache/storm/pull/9199">#9199</a>] - Bump zookeeper.version from 3.9.5 to 3.9.7</li>
		<li>[<a href="https://github.com/apache/storm/pull/9198">#9198</a>] - Bump activemq.version from 6.3.1 to 6.4.0</li>
		<li>[<a href="https://github.com/apache/storm/pull/9197">#9197</a>] - Bump prometheus.client.version from 1.8.0 to 1.10.0</li>
		<li>[<a href="https://github.com/apache/storm/pull/9196">#9196</a>] - Bump commons-codec:commons-codec from 1.22.1 to 1.23.0</li>
		<li>[<a href="https://github.com/apache/storm/pull/9195">#9195</a>] - Bump org.apache.maven.plugins:maven-surefire-report-plugin from 3.5.6 to 3.6.1</li>
		<li>[<a href="https://github.com/apache/storm/pull/9193">#9193</a>] - Bump serialize-javascript from 7.0.5 to 7.1.4</li>
		<li>[<a href="https://github.com/apache/storm/pull/9192">#9192</a>] - Bump fast-uri from 3.1.7 to 3.1.9</li>
		<li>[<a href="https://github.com/apache/storm/pull/9185">#9185</a>] - Bump follow-redirects from 1.16.0 to 1.16.1</li>
		<li>[<a href="https://github.com/apache/storm/pull/9166">#9166</a>] - Bump joi from 18.2.5 to 18.2.9</li>
		<li>[<a href="https://github.com/apache/storm/pull/9165">#9165</a>] - Bump proxy-addr from 2.0.7 to 2.0.8</li>
		<li>[<a href="https://github.com/apache/storm/pull/9164">#9164</a>] - Bump postcss-selector-parser from 7.1.5 to 7.1.6</li>
		<li>[<a href="https://github.com/apache/storm/pull/9163">#9163</a>] - Bump source-map-js from 1.2.1 to 1.2.2</li>
		<li>[<a href="https://github.com/apache/storm/pull/9151">#9151</a>] - Bump surefire from 3.5.6 to 3.6.0</li>
		<li>[<a href="https://github.com/apache/storm/pull/9150">#9150</a>] - Bump iceberg from 1.11.0 to 1.12.0</li>
		<li>[<a href="https://github.com/apache/storm/pull/9149">#9149</a>] - Bump org.apache:apache parent from 39 to 40</li>
		<li>[<a href="https://github.com/apache/storm/pull/9148">#9148</a>] - Bump storm-webapp npm dependencies</li>
		<li>[<a href="https://github.com/apache/storm/pull/9139">#9139</a>] - Bump com.puppycrawl.tools:checkstyle from 14.0.0 to 14.3.0</li>
		<li>[<a href="https://github.com/apache/storm/pull/9138">#9138</a>] - Bump org.yaml:snakeyaml from 2.6 to 2.7</li>
		<li>[<a href="https://github.com/apache/storm/pull/9132">#9132</a>] - Bump mockito.version from 5.23.0 to 5.24.0</li>
		<li>[<a href="https://github.com/apache/storm/pull/9119">#9119</a>] - Bump io.github.git-commit-id:git-commit-id-maven-plugin from 10.0.0 to 10.0.1</li>
		<li>[<a href="https://github.com/apache/storm/pull/9116">#9116</a>] - Bump org.codehaus.mojo:exec-maven-plugin from 3.6.3 to 3.6.4</li>
		<li>[<a href="https://github.com/apache/storm/pull/9114">#9114</a>] - Bump org.codehaus.mojo:taglist-maven-plugin from 3.2.2 to 3.2.3</li>
		<li>[<a href="https://github.com/apache/storm/pull/9112">#9112</a>] - Bump org.apache.maven.plugins:maven-compiler-plugin from 3.15.0 to 3.16.0</li>
		<li>[<a href="https://github.com/apache/storm/pull/9111">#9111</a>] - Bump org.apache.commons:commons-lang3 from 3.20.0 to 3.21.0</li>
		<li>[<a href="https://github.com/apache/storm/pull/9108">#9108</a>] - Bump slf4j.version from 2.0.18 to 2.0.20</li>
		<li>[<a href="https://github.com/apache/storm/pull/9107">#9107</a>] - Bump bouncycastle.version from 1.85 to 1.86</li>
		<li>[<a href="https://github.com/apache/storm/pull/9106">#9106</a>] - Bump org.codehaus.mojo:build-helper-maven-plugin from 3.6.1 to 3.6.2</li>
		<li>[<a href="https://github.com/apache/storm/pull/9100">#9100</a>] - Bump netty-tcnative.version from 2.0.82.Final to 2.0.84.Final</li>
		<li>[<a href="https://github.com/apache/storm/pull/9083">#9083</a>] - Bump uuid to 13.0.1</li>
	</ul>
