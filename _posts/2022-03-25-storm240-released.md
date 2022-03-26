---
layout: post
title: Apache Storm 2.4.0 Released
author: Bipin Prasad
---

The Apache Storm community is pleased to announce that  version 2.4.0 has been
released and is available from [the downloads page](/downloads.html).

This release includes a number of code improvements and important bug fixes 
that improve Apache Storm's performance, stability and fault tolerance. 
We encourage users of previous versions to upgrade to this latest release.


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether 
through direct code contributions, documentation, bug reports, or helping other 
users on the mailing lists. Your efforts are much appreciated.


Changes in this Release - Storm 2.4.0
---------
<h1></h1>
<p>JIRA issues addressed in the 2.4.0 release of Storm. Documentation for this
    release is available at the <a href="http://storm.apache.org/">Apache Storm
    project site</a>.</p>
<h2>Improvement</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3799">STORM-3799</a>] - Logging user information for blob delete req</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3801">STORM-3801</a>] - newWorkerEvent doesn't report properly for multiple reporters</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3802">STORM-3802</a>] - Allow adding metrics reporters to all topologies</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3803">STORM-3803</a>] - Format large integers in Storm UI with commas for readability</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3804">STORM-3804</a>] - Don't allow deleting blobs if they are required for an active topology</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3807">STORM-3807</a>] - Topology Stats columns show NaN</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3815">STORM-3815</a>] - allow option to disable sending of __send-iconnection metrics</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3824">STORM-3824</a>] - upgrade httpclient due to security issues</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3828">STORM-3828</a>] - upgrade org/glassfish/javax.el due to build problems</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3829">STORM-3829</a>] - Remove log4j version 1 (1.2.17) from storm-core</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3831">STORM-3831</a>] - exclude all old log4j</li>
</ul>
<h2>Dependency upgrade</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3811">STORM-3811</a>] - Upgrade log4j version to 2.17.1</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3817">STORM-3817</a>] - Upgrading to Zookeeper 3.5.x, 3.6.x or 3.7.x</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3821">STORM-3821</a>] - use commons-compress 1.21 due to security issues</li>
</ul>
