---
layout: post
title: Storm 1.1.3 Released
author: P. Taylor Goetz
---

The Apache Storm community is pleased to announce that version 1.1.3 has been released and is available from [the downloads page](/downloads.html).

This is a maintenance release that includes a number of important bug fixes that improve Storm's performance, stability and fault tolerance. We encourage users of previous versions to upgrade to this latest release.


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether through direct code contributions, documentation, bug reports, or helping other users on the mailing lists. Your efforts are much appreciated.


Changes in this Release
---------

<h2>New Feature</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3026">STORM-3026</a>] - Upgrade ZK instance for security</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3027">STORM-3027</a>] - Make Impersonation Optional</li>
</ul>
<h2>Improvement</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3011">STORM-3011</a>] - Use default bin path in flight.bash if $JAVA_HOME is undefined</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3039">STORM-3039</a>] - Ports of killed topologies remain in TIME_WAIT state preventing to start new topology</li>
</ul>
<h2>Bug</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2911">STORM-2911</a>] - SpoutConfig is serializable but does not declare a serialVersionUID field</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2978">STORM-2978</a>] - The fix for STORM-2706 is broken, and adds a transitive dependency on Zookeeper 3.5.3-beta for projects that depend on e.g. storm-kafka</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2979">STORM-2979</a>] - WorkerHooks EOFException during run_worker_shutdown_hooks</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2981">STORM-2981</a>] - Upgrade Curator to lastest patch version</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2985">STORM-2985</a>] - Add jackson-annotations to dependency management</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2989">STORM-2989</a>] - LogCleaner should preserve current worker.log.metrics</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2994">STORM-2994</a>] - KafkaSpout consumes messages but doesn't commit offsets</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3043">STORM-3043</a>] - NullPointerException thrown in SimpleRecordTranslator.apply()</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3052">STORM-3052</a>] - Let blobs un archive</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3059">STORM-3059</a>] - KafkaSpout throws NPE when hitting a null tuple if the processing guarantee is not AT_LEAST_ONCE</li>
</ul>
<h2>Documentation</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2960">STORM-2960</a>] - Better to stress importance of setting up proper OS account for Storm processes</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3060">STORM-3060</a>] - Configuration mapping between storm-kafka & storm-kafka-client</li>
</ul>
<h2>Task</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2952">STORM-2952</a>] - Deprecate storm-kafka in 1.x</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3005">STORM-3005</a>] - [DRPC] LinearDRPCTopologyBuilder shouldn't be deprecated </li>
</ul>
<h2>Test</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2841">STORM-2841</a>] - testNoAcksIfFlushFails UT fails with NullPointerException</li>
</ul>
</body>
</html>

