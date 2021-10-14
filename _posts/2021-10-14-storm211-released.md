---
layout: post
title: Apache Storm 2.1.1 Released
author: Ethan Li
---

The Apache Storm community is pleased to announce that version 2.1.1 has been released and is available from [the downloads page](/downloads.html).

This is a maintenance release that includes a number of important bug fixes that improve Apache Storm's performance, stability and fault tolerance. We encourage users of previous versions to upgrade to this latest release.


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether through direct code contributions, documentation, bug reports, or helping other users on the mailing lists. Your efforts are much appreciated.


Changes in this Release
---------
<h2>Improvement</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3581">STORM-3581</a>] - Change log level to info to show the config classes being used for validation</li>
</ul>
<h2>Bug</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2483">STORM-2483</a>] - wrong parameters order</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3511">STORM-3511</a>] - Nimbus logs got flood with TTransportException Error messages (because of thrift 0.12.0)</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3552">STORM-3552</a>] - Storm CLI set_log_level no longer updates the log level</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3567">STORM-3567</a>] - Topology UI page is showing total resources for each component if not scheduled</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3568">STORM-3568</a>] - Topology UI page "Change Log Level" should not allow empty logger name</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3577">STORM-3577</a>] - upload-credentials Breaks Topology in secure cluster</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3580">STORM-3580</a>] - Config overrides supplied using -c in storm.py not passed to all commands</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3598">STORM-3598</a>] - Storm UI visualization throws NullPointerException</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3602">STORM-3602</a>] - loadaware shuffle can overload local worker</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3606">STORM-3606</a>] - AutoTGT shouldn't invoke TGT renewal thread (from UserGroupInformation.loginUserFromSubject)</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3609">STORM-3609</a>] - ClassCastException when credentials are updated for ICredentialsListener spout/bolt instances</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3613">STORM-3613</a>] - storm.py should include lib-worker instead of lib directory in the classpath while submitting a topology</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3626">STORM-3626</a>] - storm-kafka-migration should pull in storm-client as "provided" dependency</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3629">STORM-3629</a>] -  Logviewer should always allow admins to access logs</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3767">STORM-3767</a>] - NPE on getComponentPendingProfileActions </li>
</ul>
<h2>Sub-task</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3578">STORM-3578</a>] - ClientAuthUtils.insertWorkerTokens removes exiting and new WorkerToken altogether if they are equal</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3579">STORM-3579</a>] - Fix Kerberos connection from Worker to Nimbus/Supervisor</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3607">STORM-3607</a>] - Document the exceptions topologies will see from TGT renewal thread</li>
</ul>