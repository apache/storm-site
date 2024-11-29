---
layout: post
title: Apache Storm 2.7.0 Released
author: Rui Abreu
---

The Apache Storm community is pleased to announce that version 2.7.0 has been
released and is available from [the downloads page](/downloads.html).

This release includes new features as well as a number of code improvements, bug fixes and library updates.
We encourage users of previous versions to upgrade to this latest release.

Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether
through direct code contributions, documentation, bug reports, or helping other
users on the mailing lists. Your efforts are much appreciated.


Changes in this Release - Storm 2.7.0
---------
<p>JIRA issues addressed in the 2.7.0 release of Storm. Documentation for this release is available at the <a href="https://storm.apache.org/">Apache Storm project site</a>.</p>

<h2>New Feature</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-4075">STORM-4075</a>] - Supprt mTLS between Storm and ZK</li>
</ul>

<h2>Improvement</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-4076">STORM-4076</a>] - KafkaTridentSpoutEmitters can poll all partitions at once instead of one at a time</li>
</ul>

<h2>Bug</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-4055">STORM-4055</a>] - ConcurrentModificationException on KafkaConsumer when running topology with Metrics Reporters</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4077">STORM-4077</a>] - Worker being reassigned when Nimbus leadership changes</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4085">STORM-4085</a>] - Supervisor Threads being Killed</li>
</ul>

<h2>Task</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-4031">STORM-4031</a>] - Fix broken Talks & Video Webpage</li>
</ul>

<h2>Dependency upgrade</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-4081">STORM-4081</a>] - Dropwizard Metrics 4.2.27</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4082">STORM-4082</a>] - Prometheus Client 1.3.1</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4083">STORM-4083</a>] - Jetty 11.0.23</li>
</ul>
