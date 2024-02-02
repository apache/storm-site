---
layout: post
title: Apache Storm 2.6.1 Released
author: Richard Zowalla
---

The Apache Storm community is pleased to announce that version 2.6.1 has been
released and is available from [the downloads page](/downloads.html).

This release includes a number of code improvements, library updates and important bug fixes.
We also took over the stewardship over the official Storm docker image located <a href="https://hub.docker.com/_/storm">
here</a>.

We encourage users of previous versions to upgrade to this latest release.

Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether
through direct code contributions, documentation, bug reports, or helping other
users on the mailing lists. Your efforts are much appreciated.


Changes in this Release - Storm 2.6.1
---------
<p>JIRA issues addressed in the 2.6.1 release of Storm. Documentation for this release is available at the <a href="https://storm.apache.org/">Apache Storm project site</a>.</p>

<h2>New Feature</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-1836">STORM-1836</a>] - An official Docker image</li>
</ul>

<h2>Improvement</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-3186">STORM-3186</a>] - Customizable configuration for metric reporting interval</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3565">STORM-3565</a>] - Allow users to add dimensionsfor storm metrics</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3639">STORM-3639</a>] - Remove asserts from Storm daemon code</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3680">STORM-3680</a>] - Upgrade Jedis library in storm-jedis module to 3.2.x</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4007">STORM-4007</a>] - Add the getName() method in order to obtain the applied label to the Trident stream.</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4008">STORM-4008</a>] - Implement timed GH actions to publish SNAPSHOTS</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4009">STORM-4009</a>] - Regenerate Thrift Code with current Thrift version used in Storm</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4016">STORM-4016</a>] - Kafka spout: start using poll(Duration)</li>
</ul>

<h2>Bug</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-3132">STORM-3132</a>] - NPE in Values Constructor</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3713">STORM-3713</a>] - Possible race condition between zookeeper sync-up and killing topology</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4017">STORM-4017</a>] - isAnyWindowsProcessAlive does not work with multiple pids</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4018">STORM-4018</a>] - Wrong order of the params in Storm API resource</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4023">STORM-4023</a>] - Background periodic Kerberos re-login should use same JAAS configuration as initial login</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4024">STORM-4024</a>] - Bolt Input Stats are blank if topology.acker.executors is null or 0</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4025">STORM-4025</a>] - ClassCastException when changing log level in Storm UI</li>
</ul>

<h2>Task</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-4022">STORM-4022</a>] - Avoid flooding nimbus logs with dead topology heatbeat timeout error messages</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4026">STORM-4026</a>] - Thrift 0.19.0</li>
</ul>

<h2>Dependency upgrade</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-4004">STORM-4004</a>] - Upgrade Kafka Clients to 3.6.0</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4005">STORM-4005</a>] - ElasticSearch 7.17.13</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4011">STORM-4011</a>] - Migrate Storm itself to use Commons Collections 4</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4027">STORM-4027</a>] - Kyro 5.6.0</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4028">STORM-4028</a>] - Curator 5.6.0</li>
</ul>

<h2>Project</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-4006">STORM-4006</a>] - Implement timed GH actions to publish to nightlies.a.o</li>
</ul>
