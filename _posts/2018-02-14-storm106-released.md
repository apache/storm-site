---
layout: post
title: Storm 1.0.6 Released
author: P. Taylor Goetz
---

The Apache Storm community is pleased to announce that version 1.0.5 has been released and is available from [the downloads page](/downloads.html).

This is a maintenance release that includes a number of important bug fixes that improve Storm's performance, stability and fault tolerance. We encourage users of previous versions to upgrade to this latest release.

Apache Kafka Integration Improvements
------------------------------
This release includes many improvements to Storm's Kafka integration that improve stability, ease configuration, and expose new features. More details can be found in the
[Kafka client documentation](/releases/1.0.6/storm-kafka-client.html)


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether through direct code contributions, documentation, bug reports, or helping other users on the mailing lists. Your efforts are much appreciated.


Changes in this Release
---------

<h2>Improvement</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2877">STORM-2877</a>] - Introduce an option to configure pagination in Storm UI </li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2917">STORM-2917</a>] - Check the config(nimbus.host) before using it to connect</li>
</ul>
<h2>Bug</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2451">STORM-2451</a>] - windows storm.cmd does not set log4j2 config file correctly by default</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2690">STORM-2690</a>] - resurrect invocation of ISupervisor.assigned() & make Supervisor.launchDaemon() accessible</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2751">STORM-2751</a>] - Remove AsyncLoggingContext from Supervisor</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2764">STORM-2764</a>] - HDFSBlobStore leaks file system objects</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2771">STORM-2771</a>] - Some tests are being run twice</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2786">STORM-2786</a>] - Ackers leak tracking info on failure and lots of other cases.</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2853">STORM-2853</a>] - Deactivated topologies cause high cpu utilization</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2856">STORM-2856</a>] - Make Storm build work on post 2017Q4 Travis Trusty image</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2870">STORM-2870</a>] - FileBasedEventLogger leaks non-daemon ExecutorService which prevents process to be finished</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2879">STORM-2879</a>] - Supervisor collapse continuously when there is a expired assignment for overdue storm</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2892">STORM-2892</a>] - Flux test fails to parse valid PATH environment variable</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2894">STORM-2894</a>] - fix some random typos in tests</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2912">STORM-2912</a>] - Tick tuple is being shared without resetting start time and incur side-effect to break metrics</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2918">STORM-2918</a>] - Upgrade Netty version</li>
</ul>
<h2>Task</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2874">STORM-2874</a>] - Minor style improvements to backpressure code</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2937">STORM-2937</a>] - Overwrite storm-kafka-client 1.x-branch into 1.0.x-branch</li>
</ul>
<h2>Sub-task</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2858">STORM-2858</a>] - Fix worker-launcher build</li>
</ul>
</body>
</html>

