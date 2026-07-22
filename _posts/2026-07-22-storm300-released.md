---
layout: post
title: Apache Storm 3.0.0 Released
author: Rui Abreu
---

The Apache Storm community is pleased to announce that version 3.0.0 has been
released and is available from [the downloads page](/downloads.html).

<div style="border: 3px solid #0066cc; background-color: #f0f7ff; padding: 16px 20px; margin: 20px 0; border-radius: 4px;">
<h2 style="color: #0066cc; margin-top: 0;">🚀 Apache Storm 3.0.0 — The New Major Release</h2>
<p>Storm 3.0.0 is a major milestone for the project, packed with new features: complete
removal of the Clojure dependency, Zstd compression for inter-worker communication and
cluster state, AIMD-based dynamic batch sizing, a new jitter-aware stream grouping,
significant scheduler improvements, a leaner binary distribution, and much more.</p>
<p style="background-color: #fff3cd; border-left: 4px solid #e6a800; padding: 10px 14px; font-size: 1.05em;">
⚠️ <strong>Java 25 is required</strong> to run Apache Storm 3.0.0. Please ensure your environment
is upgraded before migrating.
</p>
<p><strong>The API is fully backwards-compatible with Storm 2.x.</strong> Existing topologies and
client code should migrate seamlessly — no API changes are required.</p>
<p>Simultaneously with this release, <strong>Apache Storm 2.8.9</strong> has been published as the
<strong>final release of the 2.x line</strong>. The Storm 2.x branch will no longer be maintained.
All community efforts will be focused on the Storm 3.x release stream.</p>
<p>See the <a href="/2026/07/22/storm289-released.html">Storm 2.8.9 release announcement</a> for
details on the end-of-life of the 2.x series.</p>
</div>

## Thanks

Special thanks are due to all those who have contributed to Apache Storm -- whether
through direct code contributions, documentation, bug reports, or helping other
users on the mailing lists. Your efforts are much appreciated.

## Getting Started

We encourage all users to read the [release notes](/2026/07/22/storm300-released.html)
and the [Apache Storm documentation](https://storm.apache.org/documentation.html)
to learn about the new features and changes in this release.

If you have questions, run into issues, or want to share feedback, please reach out
to the community via the [Apache Storm mailing lists](https://storm.apache.org/contribute/Contributing-to-Storm.html).
The community is happy to help!

## Changes in this Release - Storm 3.0.0

<p>Issues addressed in the 3.0.0 release of Storm. Documentation for this release is available at the <a href="https://storm.apache.org/">Apache Storm project site</a>.</p>

<h2>Bug fixes</h2>

<h3>Workers &amp; Heartbeats</h3>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8905">#8905</a>] - Fix worker launch: add lib-common to the supervisor's worker classpath and restore the lib-worker drop-in directory</li>
	<li>[<a href="https://github.com/apache/storm/pull/8896">#8896</a>] - Fix NPE in WorkerState.transferLocalBatch causing worker crashes</li>
	<li>[<a href="https://github.com/apache/storm/pull/8800">#8800</a>] - Filter worker heartbeats by per-topology timeout</li>
	<li>[<a href="https://github.com/apache/storm/pull/8788">#8788</a>] - Fix Y2038 worker heartbeat overflow by migrating timestamps to i64</li>
	<li>[<a href="https://github.com/apache/storm/issues/7897">#7897</a>] - [STORM-4116] Heartbeats mechanism is affected by Y2038 bug</li>
</ul>

<h3>Scheduler</h3>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8798">#8798</a>] - Fix double max.free.per.topology cap in EvenScheduler idle rebalance</li>
	<li>[<a href="https://github.com/apache/storm/pull/8705">#8705</a>] - Remove shuffle post sorting assignable hosts in Isolation Scheduler</li>
	<li>[<a href="https://github.com/apache/storm/issues/8708">#8708</a>] - Isolation Scheduler Can Have Free Slots Check as a Secondary Sorting Check</li>
	<li>[<a href="https://github.com/apache/storm/issues/8704">#8704</a>] - Isolation Scheduler Does Shuffle After Sort so sorting does not makes sense</li>
</ul>

<h3>Web UI</h3>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8889">#8889</a>] - fix(webapp): guard Flux viewer against js-yaml 5.x empty-input throw</li>
</ul>

<h3>Windowing</h3>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8790">#8790</a>] - Fix late tuple stream serialization in windowed bolts</li>
</ul>

<h3>Kafka</h3>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8589">#8589</a>] - fix(topology_lag): Kafka Topology Lag breaking when no offsets are commited for topic/partition</li>
</ul>

<h2>Enhancements</h2>

<h3>Clojure Removal</h3>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8537">#8537</a>] - Removed all uses of Clojure, version 3.0.0-SNAPSHOT</li>
	<li>[<a href="https://github.com/apache/storm/pull/8455">#8455</a>] - Replace Thread.sleep and Testing.whileTimeout with Awaitility in tests</li>
	<li>[<a href="https://github.com/apache/storm/pull/8446">#8446</a>] - Port Clojure tests to Java: cluster_test (Phase 3)</li>
	<li>[<a href="https://github.com/apache/storm/issues/8445">#8445</a>] - Port Clojure tests to Java and remove Clojure dependency</li>
	<li>[<a href="https://github.com/apache/storm/pull/8444">#8444</a>] - Port Clojure tests to Java: scheduler_test and multitenant_scheduler_…</li>
	<li>[<a href="https://github.com/apache/storm/pull/8443">#8443</a>] - Port Clojure tests to Java: versioned_store_test and tuple_test</li>
</ul>

<h3>Messaging &amp; Performance</h3>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8892">#8892</a>] - Decouple the control plane from the data plane on receive queues</li>
	<li>[<a href="https://github.com/apache/storm/pull/8796">#8796</a>] - Add AIMD based dynamic producer batch sizing to `JCQueue`</li>
	<li>[<a href="https://github.com/apache/storm/pull/8707">#8707</a>] - Add tuple compression for inter-worker communication</li>
	<li>[<a href="https://github.com/apache/storm/issues/8701">#8701</a>] - Introduce component-level compression configuration for remote worker traffic</li>
	<li>[<a href="https://github.com/apache/storm/pull/8593">#8593</a>] - Add jitter control loop and `JitterAwareStreamGrouping`</li>
	<li>[<a href="https://github.com/apache/storm/pull/8586">#8586</a>] - Introduce jitter metric based on RFC 1889 Appendix A</li>
</ul>

<h3>Compression</h3>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8653">#8653</a>] - Zstd compression for thrift serialization (storm cluster state)</li>
	<li>[<a href="https://github.com/apache/storm/issues/8652">#8652</a>] - Add zstd compression support as an alternative to GZIP in serialization</li>
</ul>

<h3>Scheduler</h3>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8778">#8778</a>] - EvenScheduler: opt-in round-robin rebalance onto returning idle supervisors</li>
	<li>[<a href="https://github.com/apache/storm/pull/8789">#8789</a>] - Skip stale worker heartbeats from orphaned worker directories</li>
	<li>[<a href="https://github.com/apache/storm/pull/8714">#8714</a>] - Optimize ZooKeeper read requests and remove redundant checks</li>
	<li>[<a href="https://github.com/apache/storm/pull/8709">#8709</a>] - Isolation Scheduler Hosts Sorting | Add secondary sort (No of free slots) and tertiary sort (Hostname)</li>
	<li>[<a href="https://github.com/apache/storm/pull/8811">#8811</a>] - scheduler: replace reflection with @VisibleForTesting in IsolationSchedulerTest</li>
</ul>

<h3>Distribution &amp; Build</h3>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8819">#8819</a>] - Reduce binary distribution size: unbundle optional Hadoop/Kafka deps + de-duplicate shared jars</li>
	<li>[<a href="https://github.com/apache/storm/pull/8541">#8541</a>] - build: introduce aggregator modules and unify pom display names</li>
	<li>[<a href="https://github.com/apache/storm/pull/8582">#8582</a>] - storm-submit-tools: modernize Java code, no API surface changes</li>
	<li>[<a href="https://github.com/apache/storm/pull/8813">#8813</a>] - Improve RELEASING.md accuracy and completeness</li>
</ul>

<h3>Java &amp; Platform</h3>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8893">#8893</a>] - Bump Java baseline to 25 on master</li>
	<li>[<a href="https://github.com/apache/storm/pull/8594">#8594</a>] - Bump Java to 21, update docs for Storm 3.x and javadoc.io migration</li>
	<li>[<a href="https://github.com/apache/storm/pull/8699">#8699</a>] - Make storm more windows friendly</li>
</ul>

<h3>CI</h3>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8887">#8887</a>] - build: run ASF allowlist check on every PR so the required check reports</li>
	<li>[<a href="https://github.com/apache/storm/pull/8817">#8817</a>] - ci: add ASF allowlist check for GitHub Actions (Dependabot guard)</li>
</ul>

<h3>Other</h3>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8706">#8706</a>] - Docker compose local (dev) distributed Storm cluster with full observability and network simulation</li>
	<li>[<a href="https://github.com/apache/storm/pull/8702">#8702</a>] - Fix checkstyle violations (#8585 - Phase 3 - Part 1)</li>
</ul>

<h2>Documentation</h2>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8700">#8700</a>] - Update checkstyle and Modernize config (#8585 - Phase 1, Phase 2)</li>
	<li>[<a href="https://github.com/apache/storm/pull/8587">#8587</a>] - [STORM-3962] Update integration page for Kafka links</li>
	<li>[<a href="https://github.com/apache/storm/pull/8584">#8584</a>] - Fix outdated code references in message passing documentation</li>
	<li>[<a href="https://github.com/apache/storm/pull/8539">#8539</a>] - docs: drop stale Clojure references after Clojure removal</li>
	<li>[<a href="https://github.com/apache/storm/issues/7744">#7744</a>] - [STORM-3962] Update integration page for Kafka links</li>
</ul>

<h2>Dependency upgrades</h2>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8901">#8901</a>] - build(deps): bump actions/setup-java from 5.5.0 to 5.6.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8858">#8858</a>] - build(deps): bump cytoscape-dagre from 3.0.0 to 4.0.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8857">#8857</a>] - build(deps-dev): bump start-server-and-test from 3.0.5 to 3.0.11 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8856">#8856</a>] - build(deps): bump cytoscape from 3.33.4 to 3.34.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8855">#8855</a>] - build(deps): bump js-yaml from 4.2.0 to 5.2.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8854">#8854</a>] - build(deps-dev): bump webpack from 5.107.2 to 5.108.3 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8853">#8853</a>] - build(deps-dev): bump cypress from 15.16.0 to 15.18.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8852">#8852</a>] - build(deps-dev): bump webpack-cli from 7.0.3 to 7.1.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8851">#8851</a>] - build(deps): bump com.puppycrawl.tools:checkstyle from 13.5.0 to 13.7.0 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8850">#8850</a>] - build(deps): bump com.github.luben:zstd-jni from 1.5.7-9 to 1.5.7-11 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8849">#8849</a>] - build(deps): bump org.apache:apache from 38 to 39 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8848">#8848</a>] - build(deps): bump org.apache.kafka:kafka-clients from 4.3.0 to 4.3.1 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8847">#8847</a>] - build(deps): bump org.junit:junit-bom from 6.1.0 to 6.1.1 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8846">#8846</a>] - build(deps): bump com.fasterxml.woodstox:woodstox-core from 7.2.0 to 7.2.1 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8845">#8845</a>] - build(deps): bump jetty.version from 12.1.9 to 12.1.10 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8844">#8844</a>] - build(deps): bump com.google.errorprone:error_prone_annotations from 2.49.0 to 2.50.0 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8843">#8843</a>] - build(deps): bump activemq.version from 6.2.6 to 6.2.7 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8842">#8842</a>] - build(deps): bump byte-buddy.version from 1.18.8 to 1.18.10 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8841">#8841</a>] - build(deps-dev): bump org.jacoco:jacoco-maven-plugin from 0.8.14 to 0.8.15</li>
	<li>[<a href="https://github.com/apache/storm/pull/8840">#8840</a>] - build(deps): bump io.netty:netty-bom from 4.2.14.Final to 4.2.15.Final in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8839">#8839</a>] - build(deps): bump io.netty:netty-bom from 4.2.14.Final to 4.2.15.Final</li>
	<li>[<a href="https://github.com/apache/storm/pull/8838">#8838</a>] - build(deps): bump com.fasterxml.woodstox:woodstox-core from 7.2.0 to 7.2.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8837">#8837</a>] - build(deps): bump spring.version from 7.0.7 to 7.0.8 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8836">#8836</a>] - build(deps): bump com.zaxxer:HikariCP from 7.0.2 to 7.1.0 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8835">#8835</a>] - build(deps): bump com.github.luben:zstd-jni from 1.5.7-9 to 1.5.7-11</li>
	<li>[<a href="https://github.com/apache/storm/pull/8834">#8834</a>] - build(deps): bump commons-logging:commons-logging from 1.3.6 to 1.4.0 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8833">#8833</a>] - build(deps): bump storm.kafka.client.version from 4.3.0 to 4.3.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8832">#8832</a>] - build(deps): bump com.zaxxer:HikariCP from 7.0.2 to 7.1.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8831">#8831</a>] - build(deps): bump com.google.errorprone:error_prone_annotations from 2.49.0 to 2.50.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8830">#8830</a>] - build(deps-dev): bump com.github.eirslett:frontend-maven-plugin from 2.0.0 to 2.0.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8829">#8829</a>] - build(deps): bump byte-buddy.version from 1.18.8 to 1.18.10</li>
	<li>[<a href="https://github.com/apache/storm/pull/8828">#8828</a>] - build(deps): bump org.apache.hbase:hbase-client from 2.6.5-hadoop3 to 2.6.6-hadoop3</li>
	<li>[<a href="https://github.com/apache/storm/pull/8827">#8827</a>] - build(deps): bump activemq.version from 6.2.6 to 6.2.7</li>
	<li>[<a href="https://github.com/apache/storm/pull/8826">#8826</a>] - build(deps): bump org.junit:junit-bom from 6.1.0 to 6.1.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8825">#8825</a>] - build(deps): bump commons-logging:commons-logging from 1.3.6 to 1.4.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8824">#8824</a>] - build(deps): bump spring.version from 7.0.7 to 7.0.8</li>
	<li>[<a href="https://github.com/apache/storm/pull/8823">#8823</a>] - build(deps): bump org.apache:apache from 38 to 39</li>
	<li>[<a href="https://github.com/apache/storm/pull/8822">#8822</a>] - build(deps): bump jetty.version from 12.1.9 to 12.1.10</li>
	<li>[<a href="https://github.com/apache/storm/pull/8821">#8821</a>] - build(deps): bump netty-tcnative.version from 2.0.77.Final to 2.0.80.Final</li>
	<li>[<a href="https://github.com/apache/storm/pull/8820">#8820</a>] - build(deps): bump prometheus.client.version from 1.6.1 to 1.8.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8751">#8751</a>] - Bump webpack-cli from 7.0.2 to 7.0.3 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8750">#8750</a>] - Bump terser-webpack-plugin from 5.6.0 to 5.6.1 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8749">#8749</a>] - Bump cypress from 15.15.0 to 15.16.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8748">#8748</a>] - Bump js-yaml from 4.1.1 to 4.2.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8747">#8747</a>] - Bump js-cookie from 3.0.7 to 3.0.8 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8746">#8746</a>] - Bump cytoscape from 3.33.3 to 3.33.4 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8745">#8745</a>] - Bump webpack from 5.106.2 to 5.107.2 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8743">#8743</a>] - Bump com.fasterxml.jackson:jackson-bom from 2.21.3 to 2.22.0 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8742">#8742</a>] - Bump io.netty:netty-bom from 4.2.13.Final to 4.2.14.Final in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8741">#8741</a>] - Bump com.puppycrawl.tools:checkstyle from 13.4.2 to 13.5.0 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8740">#8740</a>] - Bump org.apache.kafka:kafka-clients from 4.2.0 to 4.3.0 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8739">#8739</a>] - Bump com.github.luben:zstd-jni from 1.5.7-8 to 1.5.7-9 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8738">#8738</a>] - Bump org.apache.commons:commons-configuration2 from 2.15.0 to 2.15.1 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8737">#8737</a>] - Bump org.junit:junit-bom from 6.0.3 to 6.1.0 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8736">#8736</a>] - Bump org.ow2.asm:asm from 9.10 to 9.10.1 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8735">#8735</a>] - Bump surefire.version from 3.5.5 to 3.5.6 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8734">#8734</a>] - Bump org.apache.maven.plugins:maven-surefire-report-plugin from 3.5.5 to 3.5.6 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8733">#8733</a>] - Bump activemq.version from 6.2.5 to 6.2.6 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8732">#8732</a>] - Bump metrics.version from 4.2.38 to 4.2.39 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8731">#8731</a>] - Bump com.fasterxml.woodstox:woodstox-core from 7.1.1 to 7.2.0 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8730">#8730</a>] - Bump com.fasterxml.woodstox:woodstox-core from 7.1.1 to 7.2.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8729">#8729</a>] - Bump org.ow2.asm:asm from 9.10 to 9.10.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8728">#8728</a>] - Bump io.netty:netty-bom from 4.2.13.Final to 4.2.14.Final</li>
	<li>[<a href="https://github.com/apache/storm/pull/8727">#8727</a>] - Bump com.fasterxml.jackson:jackson-bom from 2.21.3 to 2.22.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8726">#8726</a>] - Bump storm.kafka.client.version from 4.2.0 to 4.3.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8725">#8725</a>] - Bump org.apache.commons:commons-configuration2 from 2.15.0 to 2.15.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8724">#8724</a>] - Bump org.apache.maven.plugins:maven-dependency-plugin from 3.10.0 to 3.11.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8723">#8723</a>] - Bump com.fasterxml.jackson.core:jackson-databind from 2.21.3 to 2.22.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8722">#8722</a>] - Bump surefire.version from 3.5.5 to 3.5.6</li>
	<li>[<a href="https://github.com/apache/storm/pull/8721">#8721</a>] - Bump org.junit:junit-bom from 6.0.3 to 6.1.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8720">#8720</a>] - Bump com.github.luben:zstd-jni from 1.5.7-8 to 1.5.7-9</li>
	<li>[<a href="https://github.com/apache/storm/pull/8719">#8719</a>] - Bump redis.clients:jedis from 7.5.0 to 7.5.2</li>
	<li>[<a href="https://github.com/apache/storm/pull/8718">#8718</a>] - Bump metrics.version from 4.2.38 to 4.2.39</li>
	<li>[<a href="https://github.com/apache/storm/pull/8717">#8717</a>] - Bump dropwizard.version from 5.0.1 to 5.0.2</li>
	<li>[<a href="https://github.com/apache/storm/pull/8716">#8716</a>] - Bump org.apache.maven.plugins:maven-surefire-report-plugin from 3.5.5 to 3.5.6</li>
	<li>[<a href="https://github.com/apache/storm/pull/8715">#8715</a>] - Bump activemq.version from 6.2.5 to 6.2.6</li>
	<li>[<a href="https://github.com/apache/storm/pull/8713">#8713</a>] - Bump qs and @cypress/request in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8676">#8676</a>] - Bump org.ow2.asm:asm from 9.9.1 to 9.10</li>
	<li>[<a href="https://github.com/apache/storm/pull/8674">#8674</a>] - Bump org.ow2.asm:asm from 9.9.1 to 9.10 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8672">#8672</a>] - Bump com.puppycrawl.tools:checkstyle from 8.2 to 13.4.2 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8671">#8671</a>] - Bump org.apache.commons:commons-configuration2 from 2.14.0 to 2.15.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8669">#8669</a>] - Bump slf4j.version from 2.0.17 to 2.0.18 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8668">#8668</a>] - Bump org.apache.commons:commons-configuration2 from 2.14.0 to 2.15.0 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8667">#8667</a>] - Bump slf4j.version from 2.0.17 to 2.0.18</li>
	<li>[<a href="https://github.com/apache/storm/pull/8664">#8664</a>] - Bump org.apache.maven:maven-resolver-provider from 3.9.15 to 3.9.16</li>
	<li>[<a href="https://github.com/apache/storm/pull/8661">#8661</a>] - Bump js-cookie from 3.0.5 to 3.0.7 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8659">#8659</a>] - Bump cypress from 15.14.2 to 15.15.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8658">#8658</a>] - Bump start-server-and-test from 3.0.4 to 3.0.5 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8657">#8657</a>] - Bump cytoscape-dagre from 2.5.0 to 3.0.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8656">#8656</a>] - Bump vis-network from 10.0.3 to 10.1.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8638">#8638</a>] - Bump org.apache.thrift:libthrift from 0.22.0 to 0.23.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8634">#8634</a>] - Bump org.apache.logging.log4j:log4j-bom from 2.25.4 to 2.26.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8633">#8633</a>] - Bump io.netty:netty-bom from 4.2.12.Final to 4.2.13.Final in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8629">#8629</a>] - Bump com.github.ben-manes.caffeine:caffeine from 3.2.3 to 3.2.4</li>
	<li>[<a href="https://github.com/apache/storm/pull/8625">#8625</a>] - Bump org.apache:apache from 37 to 38</li>
	<li>[<a href="https://github.com/apache/storm/pull/8623">#8623</a>] - Bump com.github.ben-manes.caffeine:caffeine from 3.2.3 to 3.2.4 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8618">#8618</a>] - Bump org.apache:apache from 37 to 38 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8616">#8616</a>] - Bump io.netty:netty-bom from 4.2.12.Final to 4.2.13.Final</li>
	<li>[<a href="https://github.com/apache/storm/pull/8615">#8615</a>] - Bump com.puppycrawl.tools:checkstyle from 8.2 to 13.4.2 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8612">#8612</a>] - Bump terser-webpack-plugin from 5.5.0 to 5.6.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8611">#8611</a>] - Bump jetty.version from 12.1.8 to 12.1.9 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8608">#8608</a>] - Bump vis-data from 8.0.3 to 8.0.4 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8605">#8605</a>] - Bump start-server-and-test from 3.0.2 to 3.0.4 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8603">#8603</a>] - Bump jetty.version from 12.1.8 to 12.1.9</li>
	<li>[<a href="https://github.com/apache/storm/pull/8600">#8600</a>] - Bump vis-network from 10.0.2 to 10.0.3 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8598">#8598</a>] - Bump org.apache.logging.log4j:log4j-bom from 2.25.4 to 2.26.0 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8597">#8597</a>] - Bump org.apache.thrift:libthrift from 0.22.0 to 0.23.0 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8580">#8580</a>] - Remove dead dependencyManagement entries and unused version properties</li>
	<li>[<a href="https://github.com/apache/storm/pull/8578">#8578</a>] - Bump cytoscape from 3.33.2 to 3.33.3 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8577">#8577</a>] - Bump terser-webpack-plugin from 5.4.0 to 5.5.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8576">#8576</a>] - Bump cypress from 15.13.0 to 15.14.2 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8575">#8575</a>] - Bump datatables.net from 2.3.7 to 2.3.8 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8574">#8574</a>] - Bump datatables.net-bs5 from 2.3.7 to 2.3.8 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8573">#8573</a>] - Bump webpack from 5.105.4 to 5.106.2 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8572">#8572</a>] - Bump datatables.net-dt from 2.3.7 to 2.3.8 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8571">#8571</a>] - Bump start-server-and-test from 3.0.0 to 3.0.2 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8569">#8569</a>] - Bump mockito.version from 5.14.2 to 5.23.0 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8567">#8567</a>] - Bump io.github.git-commit-id:git-commit-id-maven-plugin from 9.0.1 to 10.0.0 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8566">#8566</a>] - Bump com.google.code.gson:gson from 2.13.2 to 2.14.0 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8564">#8564</a>] - Bump commons-io:commons-io from 2.21.0 to 2.22.0 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8560">#8560</a>] - Bump org.yaml:snakeyaml from 2.2 to 2.6 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8559">#8559</a>] - Bump com.fasterxml.jackson:jackson-bom from 2.21.2 to 2.21.3 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8558">#8558</a>] - Bump spring.version from 7.0.6 to 7.0.7 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8557">#8557</a>] - Bump activemq.version from 6.2.4 to 6.2.5 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8556">#8556</a>] - Bump commons-codec:commons-codec from 1.21.0 to 1.22.0 in /examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8555">#8555</a>] - Bump io.github.git-commit-id:git-commit-id-maven-plugin from 9.0.1 to 10.0.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8554">#8554</a>] - Bump netty-tcnative.version from 2.0.75.Final to 2.0.77.Final</li>
	<li>[<a href="https://github.com/apache/storm/pull/8553">#8553</a>] - Bump redis.clients:jedis from 7.4.1 to 7.5.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8552">#8552</a>] - Bump com.fasterxml.jackson.core:jackson-databind from 2.21.2 to 2.21.3</li>
	<li>[<a href="https://github.com/apache/storm/pull/8551">#8551</a>] - Bump org.apache.maven:maven-resolver-provider from 3.9.14 to 3.9.15</li>
	<li>[<a href="https://github.com/apache/storm/pull/8550">#8550</a>] - Bump spring.version from 7.0.6 to 7.0.7</li>
	<li>[<a href="https://github.com/apache/storm/pull/8549">#8549</a>] - Bump commons-codec:commons-codec from 1.21.0 to 1.22.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8548">#8548</a>] - Bump com.fasterxml.jackson:jackson-bom from 2.21.2 to 2.21.3</li>
	<li>[<a href="https://github.com/apache/storm/pull/8547">#8547</a>] - Bump com.google.code.gson:gson from 2.13.2 to 2.14.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8546">#8546</a>] - Bump joda-time:joda-time from 2.14.1 to 2.14.2</li>
	<li>[<a href="https://github.com/apache/storm/pull/8545">#8545</a>] - Bump commons-io:commons-io from 2.21.0 to 2.22.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8544">#8544</a>] - Bump prometheus.client.version from 1.5.1 to 1.6.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8543">#8543</a>] - Bump activemq.version from 6.2.4 to 6.2.5</li>
	<li>[<a href="https://github.com/apache/storm/pull/8540">#8540</a>] - build: replace storm-maven-plugins with git-commit-id-maven-plugin</li>
	<li>[<a href="https://github.com/apache/storm/pull/8538">#8538</a>] - [Automated] Update license files after dependency changes</li>
</ul>
