---
layout: post
title: Storm 1.2.0 Released
author: P. Taylor Goetz
---

The Apache Storm community is pleased to announce that version 1.2.0 has been released and is available from [the downloads page](/downloads.html).

This is a maintenance release that includes a number of important bug fixes that improve Storm's performance, stability and fault tolerance. We encourage users of previous versions to upgrade to this latest release.

Apache Kafka Integration Improvements
------------------------------
This release includes many improvements to Storm's Kafka integration that improve stability, ease configuration, and expose new features. More details can be found in the
[Kafka client documentation](/releases/1.2.0/storm-kafka-client.html)

New Metrics Reporting API
-------------------------
This release introduces a new metrics system for reporting internal statistics (e.g. acked, failed, emitted, transferred, disruptor queue metrics, etc.) as well as a new API for user defined metrics based on the popular [Dropwizard Metrics library](). Storm includes reporters for gathering metrics data with Ganglia, Graphite, JMX, CSV and the console. Additional metrics systems can be integrated by extending the `org.apache.storm.metrics2.reporters.ScheduledStormReporter` class. Additional details can be found in the [metrics documentation](/releases/1.2.0/metrics_v2.html).


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether through direct code contributions, documentation, bug reports, or helping other users on the mailing lists. Your efforts are much appreciated.


Changes in this Release
---------

<h2>New Feature</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2383">STORM-2383</a>] - [storm-hbase] Support HBase as state backend</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2484">STORM-2484</a>] - Flux: support bolt+spout memory configuration</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2648">STORM-2648</a>] - Kafka spout can't show acks/fails and complete latency when auto commit is enabled</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2694">STORM-2694</a>] - Create a listener to handle tuple state changes of the KafkaSpout</li>
</ul>
<h2>Improvement</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2153">STORM-2153</a>] - New Metrics Reporting API</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2160">STORM-2160</a>] - Expose interface to MetricRegistry via TopologyContext</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2164">STORM-2164</a>] - Create simple generic plugin system to register codahale reporters</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2369">STORM-2369</a>] - [storm-redis] Use binary type for State management</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2379">STORM-2379</a>] - [storm-elasticsearch] switch ES client to Java REST API</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2421">STORM-2421</a>] - Support lists of childopts beyond just worker</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2448">STORM-2448</a>] - Support running workers using older JVMs/storm versions</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2481">STORM-2481</a>] - Upgrade Aether version to resolve Aether bug BUG-451566</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2482">STORM-2482</a>] - Refactor the Storm auto credential plugins to be more usable</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2491">STORM-2491</a>] - Missing various configuration parameters to configure the Cassandra client used by the Cassandra Bolts</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2501">STORM-2501</a>] - Implement auto credential plugin for Hive</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2512">STORM-2512</a>] - Change KafkaSpoutConfig in storm-kafka-client to make it work with flux</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2519">STORM-2519</a>] - AbstractAutoCreds should look for configKeys in both nimbus and topology configs</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2524">STORM-2524</a>] - Set Kafka client.id with storm-kafka</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2527">STORM-2527</a>] - Initialize java.sql.DriverManager earlier to avoid deadlock between DriverManager static initializer and driver static initializer</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2528">STORM-2528</a>] - Bump log4j version to 2.8.2</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2548">STORM-2548</a>] - Simplify KafkaSpoutConfig</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2551">STORM-2551</a>] - Thrift client socket timeout</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2553">STORM-2553</a>] - JedisCluster does not support password</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2598">STORM-2598</a>] - Add proxy server option for dependency resolver</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2601">STORM-2601</a>] - the method of getting the nimbus cilent doenot accept timeout parameter</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2616">STORM-2616</a>] - Document the built in metrics (just in time to replace them???)</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2618">STORM-2618</a>] - Add TridentKafkaStateUpdater for storm-kafka-client</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2650">STORM-2650</a>] - Add test for non-string property substitution in Flux tests</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2657">STORM-2657</a>] - Update SECURITY.MD </li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2663">STORM-2663</a>] - Backport STORM-2558 and deprecate storm.cmd on 1.x-branch</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2712">STORM-2712</a>] - accept arbitrary number of rows per tuple in storm-cassandra</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2775">STORM-2775</a>] - Improve KafkaPartition Metric Names</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2781">STORM-2781</a>] - Refactor storm-kafka-client KafkaSpout  Processing Guarantees</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2791">STORM-2791</a>] - Add support for multiple output fields to FixedTupleSpout</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2796">STORM-2796</a>] - Flux: Provide means for invoking static factory methods and improve non-primitive number handling</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2807">STORM-2807</a>] - Integration test should shut down topologies immediately after the test</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2854">STORM-2854</a>] - Expose IEventLogger to make event logging pluggable</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2860">STORM-2860</a>] - Add Kerberos support to Solr bolt</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2862">STORM-2862</a>] - More flexible logging in multilang (Python, Ruby, JS)</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2864">STORM-2864</a>] - Minor optimisation about trident kafka state</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2867">STORM-2867</a>] - Add Consumer lag metrics to Kafka Spout</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2877">STORM-2877</a>] - Introduce an option to configure pagination in Storm UI </li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2901">STORM-2901</a>] - Reuse ZK connection for getKeySequenceNumber</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2914">STORM-2914</a>] - Remove enable.auto.commit support from storm-kafka-client</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2917">STORM-2917</a>] - Check the config(nimbus.host) before using it to connect</li>
</ul>
<h2>Bug</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-1114">STORM-1114</a>] - Racing condition in trident zookeeper zk-node create/delete</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2194">STORM-2194</a>] - ReportErrorAndDie doesn't always die</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2231">STORM-2231</a>] - NULL in DisruptorQueue while multi-threaded ack</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2315">STORM-2315</a>] - New kafka spout can't commit offset when ack is disabled. </li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2343">STORM-2343</a>] - New Kafka spout can stop emitting tuples if more than maxUncommittedOffsets tuples fail at once</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2357">STORM-2357</a>] - add At-Most-Once guarantee in KafkaSpout</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2413">STORM-2413</a>] - New Kafka spout is ignoring retry limit</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2426">STORM-2426</a>] - First tuples fail after worker is respawn</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2429">STORM-2429</a>] - non-string values in supervisor.scheduler.meta cause crash</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2431">STORM-2431</a>] - the default blobstore.dir is storm.local.dir/blobs which is different from distcache-blobstore.md</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2432">STORM-2432</a>] - Storm-Kafka-Client Trident Spout Seeks Incorrect Offset With UNCOMMITTED_LATEST Strategy</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2435">STORM-2435</a>] - Logging in storm.js inconsistent to console.log and does not support log levels</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2440">STORM-2440</a>] - Kafka outage can lead to lockup of topology</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2449">STORM-2449</a>] - Iterator of Redis State may return same key multiple time, with different values</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2450">STORM-2450</a>] - supervisor v2 broke ShellBolt/Spout in local mode from storm jar</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2467">STORM-2467</a>] - Encoding issues in Kafka consumer</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2478">STORM-2478</a>] - BlobStoreTest.testDeleteAfterFailedCreate fails on Windows</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2486">STORM-2486</a>] - bin/storm launcher script can be broken if CDPATH is exported from environment</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2488">STORM-2488</a>] - The UI user Must be HTTP</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2489">STORM-2489</a>] - Overlap and data loss on WindowedBolt based on Duration</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2494">STORM-2494</a>] - KafkaSpout does not handle CommitFailedException</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2496">STORM-2496</a>] - Dependency artifacts should be uploaded to blobstore with READ permission for all</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2498">STORM-2498</a>] - Download Full File link broken in 1.x branch</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2500">STORM-2500</a>] - waitUntilReady in PacemakerClient cannot be invoked</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2503">STORM-2503</a>] - lgtm.com alerts: bugs in equality and comparison operations</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2505">STORM-2505</a>] - Kafka Spout doesn't support voids in the topic (topic compaction not supported)</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2511">STORM-2511</a>] - Submitting a topology with name containing unicode getting failed.</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2516">STORM-2516</a>] - WindowedBoltExecutorTest.testExecuteWithLateTupleStream is flaky</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2517">STORM-2517</a>] - storm-hdfs writers can't be subclassed</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2518">STORM-2518</a>] - NPE during uploading dependency artifacts with secured cluster</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2520">STORM-2520</a>] - AutoHDFS should prefer cluster-wise hdfs kerberos principal to global hdfs kerberos principal</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2521">STORM-2521</a>] - "storm sql" fails since '--jars' can't handle wildcard</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2525">STORM-2525</a>] - Fix flaky integration tests</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2535">STORM-2535</a>] - test-reset-timeout is flaky. Replace with a more reliable test.</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2536">STORM-2536</a>] - storm-autocreds adds jersey 1.x to worker classpath</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2541">STORM-2541</a>] - Manual partition assignment doesn't work</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2544">STORM-2544</a>] - Bugs in the Kafka Spout retry logic when using manual commit</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2546">STORM-2546</a>] - Kafka spout can stall / get stuck due to edge case with failing tuples</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2549">STORM-2549</a>] - The fix for STORM-2343 is incomplete, and the spout can still get stuck on failed tuples</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2552">STORM-2552</a>] - KafkaSpoutMessageId should be serializable</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2555">STORM-2555</a>] - storm-autocreds for HBase doesn't handle impersonation</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2557">STORM-2557</a>] - A bug in DisruptorQueue causing severe underestimation of queue arrival rates</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2562">STORM-2562</a>] - Use stronger key size for blow fish key generator and get rid of stack trace</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2563">STORM-2563</a>] - Remove the workaround to handle missing UGI.loginUserFromSubject</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2564">STORM-2564</a>] - We should provide a template for storm-cluster-auth.yaml</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2568">STORM-2568</a>] - 'api/vi/topology/:id/lag' returns empty json {}</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2597">STORM-2597</a>] - EXT_CLASSPATH strips out directories</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2599">STORM-2599</a>] - BasicContainer.getWildcardDir tries to resolve the wildcard character with Paths.get, which prevents workers from booting on Windows</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2602">STORM-2602</a>] - "storm.zookeeper.topology.auth.payload" doesn't work even you set it</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2607">STORM-2607</a>] - [kafka-client] Consumer group every time with lag 1</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2608">STORM-2608</a>] - Out Of Range Offsets Should Be Removed From Pending Queue</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2621">STORM-2621</a>] - STORM-2557 broke sojourn time estimation</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2627">STORM-2627</a>] - The annotation of "storm.zookeeper.topology.auth.scheme" in Config.java is wrong</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2639">STORM-2639</a>] - Kafka Spout incorrectly computes numCommittedOffsets due to voids in the topic (topic compaction)</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2642">STORM-2642</a>] - Storm-kafka-client spout cannot be serialized when using manual partition assignment</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2645">STORM-2645</a>] - update storm.py to be python3 compatible </li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2652">STORM-2652</a>] - Exception thrown in JmsSpout open method</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2660">STORM-2660</a>] - The Nimbus storm-local directory is relative to the working directory of the shell executing "storm nimbus"</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2666">STORM-2666</a>] - Storm-kafka-client spout can sometimes emit messages that were already committed. </li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2674">STORM-2674</a>] - NoNodeException when ZooKeeper tries to delete nodes</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2675">STORM-2675</a>] - KafkaTridentSpoutOpaque not committing offsets to Kafka</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2677">STORM-2677</a>] - consider all sampled tuples which took greater than 0 ms processing time</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2682">STORM-2682</a>] - Supervisor crashes with NullPointerException</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2690">STORM-2690</a>] - resurrect invocation of ISupervisor.assigned() & make Supervisor.launchDaemon() accessible</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2692">STORM-2692</a>] - Load only configs specific to the topology in populateCredentials</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2695">STORM-2695</a>] - BlobStore uncompress argument should be Boolean</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2705">STORM-2705</a>] - DRPCSpout sleeps twice when idle</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2706">STORM-2706</a>] - Nimbus stuck in exception and does not fail fast</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2722">STORM-2722</a>] - JMSSpout test fails way too often</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2724">STORM-2724</a>] - ExecutorService in WaterMarkEventGenerator never shutdown</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2736">STORM-2736</a>] - o.a.s.b.BlobStoreUtils [ERROR] Could not update the blob with key</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2751">STORM-2751</a>] - Remove AsyncLoggingContext from Supervisor</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2756">STORM-2756</a>] - STORM-2548 on 1.x-branch broke setting key/value deserializers with the now deprecated setKey/setValue methods</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2764">STORM-2764</a>] - HDFSBlobStore leaks file system objects</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2769">STORM-2769</a>] - Fast-fail if output stream Id is null </li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2771">STORM-2771</a>] - Some tests are being run twice</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2779">STORM-2779</a>] - NPE on shutting down WindowedBoltExecutor</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2784">STORM-2784</a>] -  storm-kafka-client KafkaTupleListener method onPartitionsReassigned() should be called after initialization is complete</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2786">STORM-2786</a>] - Ackers leak tracking info on failure and lots of other cases.</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2787">STORM-2787</a>] - storm-kafka-client KafkaSpout should set 'initialized' flag independently of processing guarantees</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2810">STORM-2810</a>] - Storm-hdfs tests are leaking resources</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2811">STORM-2811</a>] - Nimbus may throw NPE if the same topology is killed multiple times, and the integration test kills the same topology multiple times</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2814">STORM-2814</a>] - Logviewer HTTP server should return 403 instead of 200 if the user is unauthorized</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2815">STORM-2815</a>] - UI HTTP server should return 403 if the user is unauthorized</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2825">STORM-2825</a>] - storm-kafka-client configuration fails with a ClassCastException if "enable.auto.commit" is present in the consumer config map, and the value is a string</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2826">STORM-2826</a>] - KafkaSpoutConfig.builder doesn't set key/value deserializer properties in storm-kafka-client</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2833">STORM-2833</a>] - Cached Netty Connections can have different keys for the same thing.</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2835">STORM-2835</a>] - storm-kafka-client KafkaSpout can fail to remove all tuples from waitingToEmit</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2843">STORM-2843</a>] - Flux: properties file not found when loading resources from classpath</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2844">STORM-2844</a>] - KafkaSpout Throws IllegalStateException After Committing to Kafka When First Poll Strategy Set to EARLIEST</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2847">STORM-2847</a>] - Exception thrown after rebalance IllegalArgumentException</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2850">STORM-2850</a>] - ManualPartitionSubscription assigns new partitions before calling onPartitionsRevoked</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2851">STORM-2851</a>] - org.apache.storm.kafka.spout.KafkaSpout.doSeekRetriableTopicPartitions sometimes throws ConcurrentModificationException</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2853">STORM-2853</a>] - Deactivated topologies cause high cpu utilization</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2855">STORM-2855</a>] - Travis build doesn't work after update of Ubuntu image</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2856">STORM-2856</a>] - Make Storm build work on post 2017Q4 Travis Trusty image</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2868">STORM-2868</a>] - Address handling activate/deactivate in multilang module files</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2869">STORM-2869</a>] - KafkaSpout discards all pending records when adjusting the consumer position after a commit</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2870">STORM-2870</a>] - FileBasedEventLogger leaks non-daemon ExecutorService which prevents process to be finished</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2873">STORM-2873</a>] - Backpressure implentation delete ephemeral too frequently</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2876">STORM-2876</a>] - Some storm-hdfs tests fail with out of memory periodically</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2879">STORM-2879</a>] - Supervisor collapse continuously when there is a expired assignment for overdue storm</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2881">STORM-2881</a>] - Storm-druid topologies fail with NoSuchMethodError</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2892">STORM-2892</a>] - Flux test fails to parse valid PATH environment variable</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2894">STORM-2894</a>] - fix some random typos in tests</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2900">STORM-2900</a>] - Subject is not populated and NPE is thrown while populating credentials in nimbus.</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2903">STORM-2903</a>] - Fix possible NullPointerException in AbstractAutoCreds</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2906">STORM-2906</a>] - HDFS and HBase bolt on the same worker fails with GSS no valid credentials exception</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2907">STORM-2907</a>] - In a secure cluster with storm-autocreds enabled storm-druid can fail with NoSuchMethodError</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2912">STORM-2912</a>] - Tick tuple is being shared without resetting start time and incur side-effect to break metrics</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2913">STORM-2913</a>] - STORM-2844 made autocommit and at-most-once storm-kafka-client spouts log warnings on every emit, because those modes don't commit the right metadata to Kafka</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2918">STORM-2918</a>] - Upgrade Netty version</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2942">STORM-2942</a>] - Remove javadoc and source jars from toollib directory in binary distribution</li>
</ul>
<h2>Documentation</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2620">STORM-2620</a>] - Update the docs to better indicate the versions of java tested</li>
</ul>
<h2>Task</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2191">STORM-2191</a>] - shorten classpaths in worker and LogWriter commands</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2506">STORM-2506</a>] - Make Kafka Spout log its assigned partition</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2874">STORM-2874</a>] - Minor style improvements to backpressure code</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2904">STORM-2904</a>] - Document Metrics V2</li>
</ul>
<h2>Sub-task</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2161">STORM-2161</a>] - Stop shading the codahale metrics library so that it is available to users</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2640">STORM-2640</a>] - Deprecate KafkaConsumer.subscribe APIs on 1.x, and make KafkaConsumer.assign the default</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2858">STORM-2858</a>] - Fix worker-launcher build</li>
</ul>


</body>
</html>

