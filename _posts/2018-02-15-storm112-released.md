---
layout: post
title: Storm 1.1.2 Released
author: P. Taylor Goetz
---

The Apache Storm community is pleased to announce that version 1.1.2 has been released and is available from [the downloads page](/downloads.html).

This is a maintenance release that includes a number of important bug fixes that improve Storm's performance, stability and fault tolerance. We encourage users of previous versions to upgrade to this latest release.

Apache Kafka Integration Improvements
------------------------------
This release includes many improvements to Storm's Kafka integration that improve stability, ease configuration, and expose new features. More details can be found in the
[Kafka client documentation](/releases/1.1.2/storm-kafka-client.html)


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether through direct code contributions, documentation, bug reports, or helping other users on the mailing lists. Your efforts are much appreciated.


Changes in this Release
---------

<h2>Improvement</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2512">STORM-2512</a>] - Change KafkaSpoutConfig in storm-kafka-client to make it work with flux</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2616">STORM-2616</a>] - Document the built in metrics (just in time to replace them???)</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2657">STORM-2657</a>] - Update SECURITY.MD </li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2663">STORM-2663</a>] - Backport STORM-2558 and deprecate storm.cmd on 1.x-branch</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2712">STORM-2712</a>] - accept arbitrary number of rows per tuple in storm-cassandra</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2775">STORM-2775</a>] - Improve KafkaPartition Metric Names</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2807">STORM-2807</a>] - Integration test should shut down topologies immediately after the test</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2862">STORM-2862</a>] - More flexible logging in multilang (Python, Ruby, JS)</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2877">STORM-2877</a>] - Introduce an option to configure pagination in Storm UI </li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2917">STORM-2917</a>] - Check the config(nimbus.host) before using it to connect</li>
</ul>
<h2>Bug</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2231">STORM-2231</a>] - NULL in DisruptorQueue while multi-threaded ack</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2426">STORM-2426</a>] - First tuples fail after worker is respawn</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2500">STORM-2500</a>] - waitUntilReady in PacemakerClient cannot be invoked</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2525">STORM-2525</a>] - Fix flaky integration tests</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2535">STORM-2535</a>] - test-reset-timeout is flaky. Replace with a more reliable test.</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2541">STORM-2541</a>] - Manual partition assignment doesn't work</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2607">STORM-2607</a>] - [kafka-client] Consumer group every time with lag 1</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2642">STORM-2642</a>] - Storm-kafka-client spout cannot be serialized when using manual partition assignment</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2660">STORM-2660</a>] - The Nimbus storm-local directory is relative to the working directory of the shell executing "storm nimbus"</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2666">STORM-2666</a>] - Storm-kafka-client spout can sometimes emit messages that were already committed. </li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2674">STORM-2674</a>] - NoNodeException when ZooKeeper tries to delete nodes</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2677">STORM-2677</a>] - consider all sampled tuples which took greater than 0 ms processing time</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2682">STORM-2682</a>] - Supervisor crashes with NullPointerException</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2690">STORM-2690</a>] - resurrect invocation of ISupervisor.assigned() & make Supervisor.launchDaemon() accessible</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2695">STORM-2695</a>] - BlobStore uncompress argument should be Boolean</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2705">STORM-2705</a>] - DRPCSpout sleeps twice when idle</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2706">STORM-2706</a>] - Nimbus stuck in exception and does not fail fast</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2724">STORM-2724</a>] - ExecutorService in WaterMarkEventGenerator never shutdown</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2736">STORM-2736</a>] - o.a.s.b.BlobStoreUtils [ERROR] Could not update the blob with key</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2750">STORM-2750</a>] - fix double_checked locking</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2751">STORM-2751</a>] - Remove AsyncLoggingContext from Supervisor</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2764">STORM-2764</a>] - HDFSBlobStore leaks file system objects</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2769">STORM-2769</a>] - Fast-fail if output stream Id is null </li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2771">STORM-2771</a>] - Some tests are being run twice</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2779">STORM-2779</a>] - NPE on shutting down WindowedBoltExecutor</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2786">STORM-2786</a>] - Ackers leak tracking info on failure and lots of other cases.</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2810">STORM-2810</a>] - Storm-hdfs tests are leaking resources</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2811">STORM-2811</a>] - Nimbus may throw NPE if the same topology is killed multiple times, and the integration test kills the same topology multiple times</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2814">STORM-2814</a>] - Logviewer HTTP server should return 403 instead of 200 if the user is unauthorized</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2815">STORM-2815</a>] - UI HTTP server should return 403 if the user is unauthorized</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2833">STORM-2833</a>] - Cached Netty Connections can have different keys for the same thing.</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2853">STORM-2853</a>] - Deactivated topologies cause high cpu utilization</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2855">STORM-2855</a>] - Travis build doesn't work after update of Ubuntu image</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2856">STORM-2856</a>] - Make Storm build work on post 2017Q4 Travis Trusty image</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2868">STORM-2868</a>] - Address handling activate/deactivate in multilang module files</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2870">STORM-2870</a>] - FileBasedEventLogger leaks non-daemon ExecutorService which prevents process to be finished</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2876">STORM-2876</a>] - Some storm-hdfs tests fail with out of memory periodically</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2879">STORM-2879</a>] - Supervisor collapse continuously when there is a expired assignment for overdue storm</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2892">STORM-2892</a>] - Flux test fails to parse valid PATH environment variable</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2894">STORM-2894</a>] - fix some random typos in tests</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2912">STORM-2912</a>] - Tick tuple is being shared without resetting start time and incur side-effect to break metrics</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2918">STORM-2918</a>] - Upgrade Netty version</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2942">STORM-2942</a>] - Remove javadoc and source jars from toollib directory in binary distribution</li>
</ul>
<h2>Task</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2874">STORM-2874</a>] - Minor style improvements to backpressure code</li>
</ul>
<h2>Sub-task</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2858">STORM-2858</a>] - Fix worker-launcher build</li>
</ul>
</body>
</html>

