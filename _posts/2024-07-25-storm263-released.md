---
layout: post
title: Apache Storm 2.6.3 Released
author: Rui Abreu
---

The Apache Storm community is pleased to announce that version 2.6.3 has been
released and is available from [the downloads page](/downloads.html).

This release includes new features as well as a number of code improvements, bug fixes and library updates.
We encourage users of previous versions to upgrade to this latest release.

Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether
through direct code contributions, documentation, bug reports, or helping other
users on the mailing lists. Your efforts are much appreciated.


Changes in this Release - Storm 2.6.3
---------
<p>JIRA issues addressed in the 2.6.3 release of Storm. Documentation for this release is available at the <a href="https://storm.apache.org/">Apache Storm project site</a>.</p>

<h2>New Feature</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-4058">STORM-4058</a>] - Provide ClusterMetrics via a Prometheus Preparable Reporter</li>
</ul>

<h2>Improvement</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-4054">STORM-4054</a>] - Add Worker CPU Metric</li>
</ul>

<h2>Bug</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-4051">STORM-4051</a>] - Scheduler needs to include acker memory for topology resources</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4052">STORM-4052</a>] - Simplify/Remove double delete/lookup in heartbeat cleanup code</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4057">STORM-4057</a>] - Fix Worker Termination in K8S with Security Context</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4060">STORM-4060</a>] - Netty client will wait up to 10 minutes to send messages to unreachable worker on close()</li>
</ul>

<h2>Task</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-4053">STORM-4053</a>] - Add Hadoop client API dependency back to storm-hdfs</li>
</ul>

<h2>Dependency upgrade</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-3985">STORM-3985</a>] - Upgrade dependencies to ones based on Jakarta EE APIs</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4061">STORM-4061</a>] - Hadoop 3.4.0</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4062">STORM-4062</a>] - JSON Mini Dev 2.5.1</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4063">STORM-4063</a>] - Curator 5.7.0</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4065">STORM-4065</a>] - Dropwizard Metric 4.2.26</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4066">STORM-4066</a>] - Jetty 11.0.21</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4067">STORM-4067</a>] - Jersey 3.1.7</li>
</ul>

</body>
</html>