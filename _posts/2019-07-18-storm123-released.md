---
layout: post
title: Storm 1.2.3 Released
author: Stig Rohde Døssing
---

The Apache Storm community is pleased to announce that version 1.2.3 has been released and is available from [the downloads page](/downloads.html).

This is a maintenance release that includes a number of important bug fixes that improve Storm's performance, stability and fault tolerance. We encourage users of previous versions to upgrade to this latest release.


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether through direct code contributions, documentation, bug reports, or helping other users on the mailing lists. Your efforts are much appreciated.


Changes in this Release
---------
<h2>New Feature</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3233">STORM-3233</a>] - Upgrade zookeeper client to newest version (3.4.13)</li>
</ul>
<h2>Improvement</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3077">STORM-3077</a>] - Upgrade Disruptor version to 3.3.11</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3083">STORM-3083</a>] - Upgrade HikariCP version to 2.4.7</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3094">STORM-3094</a>] - Topology name needs to be validated at storm-client</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3222">STORM-3222</a>] - Fix KafkaSpout internals to use LinkedList instead of ArrayList</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3292">STORM-3292</a>] - Trident HiveState must flush writers when the batch commits</li>
</ul>
<h2>Bug</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3013">STORM-3013</a>] - Deactivated topology restarts if data flows into Kafka</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3028">STORM-3028</a>] - HdfsSpout does not handle empty files in case of ack enabled</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3046">STORM-3046</a>] - Getting a NPE leading worker to die when starting a topology.</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3047">STORM-3047</a>] - Ensure Trident emitter refreshPartitions is only called with partitions assigned to the emitter</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3055">STORM-3055</a>] - never refresh connection</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3068">STORM-3068</a>] - STORM_JAR_JVM_OPTS are not passed to storm-kafka-monitor  properly</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3082">STORM-3082</a>] - NamedTopicFilter can't handle topics that don't exist yet</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3087">STORM-3087</a>] - FluxBuilder.canInvokeWithArgs is too permissive when the method parameter type is a primitive</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3090">STORM-3090</a>] - The same offset value is used by the same partition number of different topics.</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3097">STORM-3097</a>] - Remove storm-druid in 2.x and deprecate support for it in 1.x</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3102">STORM-3102</a>] - Storm Kafka Client performance issues with Kafka Client v1.0.0</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3109">STORM-3109</a>] - Wrong canonical path set to STORM_LOCAL_DIR in storm kill_workers</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3110">STORM-3110</a>] - Supervisor does not kill all worker processes in secure mode in case of user mismatch</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3121">STORM-3121</a>] - Fix flaky metrics tests in storm-core</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3122">STORM-3122</a>] - FNFE due to race condition between "async localizer" and "update blob" timer thread</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3123">STORM-3123</a>] - Storm Kafka Monitor does not work with Kafka over two-way SSL</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3161">STORM-3161</a>] - Local mode should force setting min replication count to 1</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3164">STORM-3164</a>] - Multilang storm.py uses traceback.format_exc incorrectly</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3184">STORM-3184</a>] - Storm supervisor log showing keystore and truststore password in plaintext</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3201">STORM-3201</a>] - kafka spout lag on UI needs some cleanup</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3301">STORM-3301</a>] - The KafkaSpout can in some cases still replay tuples that were already committed</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3381">STORM-3381</a>] - Upgrading to Zookeeper 3.4.14 added an LGPL dependency</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3384">STORM-3384</a>] - storm set-log-level command throws wrong exception when the topology is not running</li>
</ul>
<h2>Task</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3086">STORM-3086</a>] - Update Flux documentation to demonstrate static factory methods (STORM-2796)</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3089">STORM-3089</a>] - Document worker hooks on the hooks page</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3199">STORM-3199</a>] - Metrics-ganglia depends on an LGPL library, so we shouldn't depend on it</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3289">STORM-3289</a>] - Add note about KAFKA-7044 to storm-kafka-client compatibility docs</li>
</ul>
<h2>Sub-task</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3330">STORM-3330</a>] - Migrate parts of storm-webapp, and reduce use of mocks for files</li>
</ul>