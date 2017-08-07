---
layout: post
title: Storm 1.1.0 released
author: P. Taylor Goetz
---

The Apache Storm community is pleased to announce that version 1.1.0 has been released and is available from [the downloads page](/downloads.html).

This release represents a major milestone in the evolution of Apache Storm, and includes a large number of new features, usability and performance improvements, some of which are highlighted below.

Streaming SQL
-------------
Storm 1.1.0 supports native Streaming SQL, powered by [Apache Calcite](http://calcite.apache.org), that allows users to run SQL queries over streaming data as well update external systems and data stores such as [Apache Hive](http://hive.apache.org). To deploy an SQL-based topology users define the SQL query in a text file and use the `storm sql` command to submit the resulting topology to a Storm cluster. Behind the scenes Storm will compile the SQL into a Trident topology and run it on the cluster.

Storm's SQL support includes the following features:

 * Streaming from/to external sources including Apache Kafka, HDFS, MongoDB, and Redis
 * Tuple filtering
 * Projections
 * User-defined paralallism of generated components
 * User Defined Functions (UDFs)
 * CSV, TSV, and Avro input/output formats
 * Extensibility to additional data sources via the `ISqlTridentDataSource` interface

For more information about Storm's SQL support including examples, refer to the following resources:

 * [Storm SQL Overview](/releases/1.1.0/storm-sql.html)
 * [Storm SQL Examples](/releases/1.1.0/storm-sql-example.html)
 * [Storm SQL Reference](/releases/1.1.0/storm-sql-reference.html)

Apache Kafka Integration Improvements
-------------------------------------
In addition to the traditional support for Kafka version 0.8/0.9 based on the Kafka simple consumer, Storm includes support for Kafka 0.10 and later based on the new Kafka consumer API. Storm's integration with Kafka 0.10 and later version is highly flexible and extensible, some of the features include:

 * Enhanced configuration API
 * Fine-grained offset control (at start and after failure)
 * Consumer group support
 * Plugable record translators
 * Wildcard topics
 * Multiple stream support
 * Manual partition control
 * Kafka security support

For more information on Storm's Kafka integration please refer to the following documentation:

 * [Kafka Integration (0.10 and later)](/releases/1.1.0/storm-kafka-client.html)
 * [Kafka Integration (0.8/0.9)](/releases/1.1.0/storm-kafka.html)
 

PMML (Predictive Model Markup Language) Support
------------
In order to better support machine learning use cases, Storm now includes support for executing PMML models in topoliges via a generic PMML bolt. The `PMMLPredictorBolt` allows users to specify a model, the raw input, and the resulting streams and output fields. At runtime the bolt will process incoming raw data, execute the model with the given input, and output tuples with scores for predicted fields and output fields.

More information on Storm's PMML support can be found [here](https://github.com/apache/storm/blob/v1.1.0/external/storm-pmml/README.md).


Druid Integration
-----------------
[Druid](http://druid.io) is a scalable, high-performance, column oriented, distributed data store popular for real time analytics use cases. Storm 1.1.0 introduces a Storm bolt and Trident state implementations for streaming data into a Druid data store.

Documentation for Storm's Druid integration can be found [here](https://github.com/apache/storm/blob/v1.1.0/external/storm-druid/README.md).


OpenTSDB Integration
--------------------
[OpenTSDB](http://opentsdb.net) is a highly scalable time series database based on Apache HBase. Storm 1.1.0 adds a Storm bolt and Trident state implementations for writing data to OpenTSDB. Storm's OpenTSDB integration gives users fine-grained control over how Storm tuples map to OpenTSDB data structure by providing a simple interface (`ITupleOpenTsdbDatapointMapper`) that performs the translation.

Move information about Storm's OpenTSDB integration can be found [here](https://github.com/apache/storm/blob/v1.1.0/external/storm-opentsdb/README.md).

AWS Kinesis Support
-------------------
For users looking to integrate with Amazon's Kinesis service, Storm 1.1.0 now includes a spout for consuming message streams from Kinesis. Like most of Storm's external system integration components, the Kinesis spout provides a simple interface (`RecordToTupleMapper`)for controlling how Kinesis messages are translated to Storm tuples. The Kinesis spout provides an additional interface (`FailedMessageRetryHandler`) that allows users to customize the Spout's failure handling logic.

Documentation for the Kinesis spout can be found [here](https://github.com/apache/storm/blob/v1.1.0/external/storm-kinesis/README.md).


HDFS Spout
----------
Storm's HDFS integration now includes a spout that continuously streams data from the HDFS filesystem. Storm's HDFS spout monitors a configurable directory for new files and feeds that data into a topology. When the spout has completed processing a file, it will be moved to the configured archive directory. In the event a file is corrupt or is otherwise not processable, the corresponding file will be moved to a specific directory. Parallelism of the spout is made possible through a locking mechanism that ensures each file is "owned" by a single spout instance. The HDFS spout supports connecting to HDFS instances that are secured with Kerberos authentication.

More information on using the HDFS spout can be found in the [Storm HDFS Documentation](https://github.com/apache/storm/blob/v1.1.0/external/storm-hdfs/README.md)


Flux Improvements
-----------------
Flux is a framework and set of utilities that allow users to declaratively define Storm topologies and avoid hard-coding configuration values in topology components. Storm 1.1.0 introduces the following enhancements to the Flux framework:

 * Flux topology visualization in Storm UI
 * Support for Stateful bolts and windowing
 * Support for named streams
 * Support for lists of references

More information about Flux can be found in the [Flux documentation](/releases/1.1.0/flux.html).


Topology Deployment Enhancements
--------------------------------
In previous versions of Storm it was typically necessary to include all topology dependences in a shaded "uber jar," or by making them available on Storm's classpath. In Storm 1.1.0 the `storm jar` command now includes options to upload additional dependency jars during topology submission. The `--jars` command line option allows users to specify local jar files to upload. Alternatively, the `storm jar` command offers the `--artifacts` option for specifying additional jar file dependencies by their Maven coordinates. Finally, for Maven artifacts outside the Maven Central, the `--artifactRepository` option allows users to specify additional repositories for dependency resolution.

More informaton about available options of the `storm jar` command can be found by runnng the `storm help jar` command.


Resource Aware Scheduler (RAS) Improvements
-------------------------------------------
The Resource Aware Scheduler introduced in Storm 1.0 added a scheduler implementation that takes into account both the memory (on-heap and off-heap) and CPU resources available in a cluster. In Storm 1.1.0 the RAS algorithm has been overhauled to dramatically improve cluster resource utilization and introduces rack awareness into the scheduling strategy.

More information on the new RAS capabilities can be found in the [RAS documentation](/releases/1.1.0/Resource_Aware_Scheduler_overview.html) and the [JIRA ticket](https://issues.apache.org/jira/browse/STORM-1766) introducing the new rack awareness algorithm.


Important Changes in the Binary Distribution
---------------------------------------------
In order to minimize the file size of the binary distribution, external component (i.e. "connector") binaries and compiled examples are no longer included. Examples are included in source form only, but can easily compiled with the Maven `mvn install` command.

### External Components Moved to Maven Central
Most external components are now hosted exclusively in Maven Central. External component directories will contain a README.md file, but no jar files. We encourage users to leverage a build system with Maven style dependency resolution (Maven, Gradle, etc.) to build topology jars and avoid building topology jars manually.

Maven coordinates for these components can be determined as follows:

Group ID: org.apache.storm
Artifact ID: [component directory name] (e.g. "storm-kafka-client", "storm-hdfs")
Version: 1.1.0

For users who cannot use Maven for building, external component jar files can be downloaded from Maven Central with the following URL pattern:

```
http://repo1.maven.org/maven2/org/apache/storm/${artifactID}/${version}/${artifactId}-${version}.jar
```

For example, to download the storm-kafka-client jar file the URL would be:

```
http://repo1.maven.org/maven2/org/apache/storm/storm-kafka-client/1.1.0/storm-kafka-client-1.1.0.jar
```


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether through direct code contributions, documentation, bug reports, or helping other users on the mailing lists. Your efforts are much appreciated.

The full changelog for this release is listed below.

Full Changelog
--------------

 * STORM-2425: Storm Hive Bolt not closing open transactions
 * STORM-2409: Storm-Kafka-Client KafkaSpout Support for Failed and NullTuples
 * STORM-2423: Join Bolt should use explicit instead of default window anchoring for emitted tuples
 * STORM-2416: Improve Release Packaging to Reduce File Size
 * STORM-2414: Skip checking meta's ACL when subject has write privileges for any blobs
 * STORM-2038: Disable symlinks with a config option
 * STORM-2240: STORM PMML Bolt - Add Support to Load Models from Blob Store
 * STORM-2412: Nimbus isLeader check while waiting for max replication
 * STORM-2408: build failed if storm.kafka.client.version = 0.10.2.0
 * STORM-2403: Fix KafkaBolt test failure: tick tuple should not be acked
 * STORM-2361: Kafka spout - after leader change, it stops committing offsets to ZK
 * STORM-2353: Replace kafka-unit by kafka_2.11 and kafka-clients to test kafka-clients:0.10.1.1
 * STORM-2387: Handle tick tuples properly for Bolts in external modules
 * STORM-2345: Type mismatch in ReadClusterState's ProfileAction processing Map
 * STORM-2400: Upgraded Curator to 2.12.0 and made respective API changes
 * STORM-2396: setting interrupted status back before throwing a RuntimeException
 * STORM-1772: Adding Perf module with topologies for measuring performance
 * STORM-2395: storm.cmd supervisor calls the wrong class name
 * STORM-2391: Move HdfsSpoutTopology from storm-starter to storm-hdfs-examples
 * STORM-2389: Avoid instantiating Event Logger when topology.eventlogger.executors=0
 * STORM-2386: Fail-back Blob deletion also fails in BlobSynchronizer.syncBlobs.
 * STORM-2388: JoinBolt breaks compilation against JDK 7
 * STORM-2374: Storm Kafka Client Test Topologies Must be Serializable
 * STORM-2372: Pacemaker client doesn't clean up heartbeats properly
 * STORM-2326: Upgrade log4j and slf4j
 * STORM-2334: Join Bolt implementation
 * STORM-1363: TridentKafkaState should handle null values from TridentTupleToKafkaMapper.getMessageFromTuple()
 * STORM-2365: Support for specifying output stream in event hubs spout 
 * STORM-2250: Kafka spout refactoring to increase modularity and testability
 * STORM-2340: fix AutoCommitMode issue in KafkaSpout
 * STORM-2344: Flux YAML File Viewer for Nimbus UI
 * STORM-2350: Storm-HDFS's listFilesByModificationTime is broken
 * STORM-2270 Kafka spout should consume from latest when ZK partition commit offset bigger than the latest offset
 * STORM-1464: storm-hdfs support for multiple output files and partitioning
 * STORM-2320: DRPC client printer class reusable for local and remote DRPC
 * STORM-2281: Running Multiple Kafka Spouts (Trident) Throws Illegal State Exception
 * STORM-2296: Kafka spout no dup on leader changes
 * STORM-2244: Some shaded jars doesn't exclude dependency signature files
 * STORM-2014: New Kafka spout duplicates checking if failed messages have reached max retries
 * STORM-1443: [Storm SQL] Support customizing parallelism in StormSQL
 * STORM-2148: [Storm SQL] Trident mode: back to code generate and compile Trident topology
 * STORM-2331: Emitting from JavaScript should work when not anchoring.
 * STORM-2225: change spout config to be simpler.
 * STORM-2323: Precondition for Leader Nimbus should check all topology blobs and also corresponding dependencies
 * STORM-2330: Fix storm sql code generation for UDAF with non standard sql types
 * STORM-2298: Don't kill Nimbus when ClusterMetricsConsumer is failed to initialize
 * STORM-2301: [storm-cassandra] upgrade cassandra driver to 3.1.2
 * STORM-1446: Compile the Calcite logical plan to Storm Trident logical plan
 * STORM-2303: [storm-opentsdb] Fix list invariant issue for JDK 7
 * STORM-2236: storm kafka client should support manual partition management
 * STORM-2295: KafkaSpoutStreamsNamedTopics should return output fields with predictable ordering
 * STORM-2300: [Flux] support list of references
 * STORM-2297: [storm-opentsdb] Support Flux for OpenTSDBBolt
 * STORM-2294: Send activate and deactivate command to ShellSpout
 * STORM-2280: Upgrade Calcite version to 1.11.0
 * STORM-2278: Allow max number of disruptor queue flusher threads to be configurable
 * STORM-2277: Add shaded jar for Druid connector
 * STORM-2274: Support named output streams in Hdfs Spout
 * STORM-2204: Adding caching capabilities in HBaseLookupBolt
 * STORM-2267: Use user's local maven repo. directory to local repo.
 * STORM-2254: Provide Socket time out for nimbus thrift client
 * STORM-2200: [Storm SQL] Drop Aggregate & Join support on Trident mode
 * STORM-2266: Close NimbusClient instances appropriately
 * STORM-2203: Add a getAll method to KeyValueState interface
 * STORM-1886: Extend KeyValueState iface with delete
 * STORM-2022: update Fields test to match new behavior
 * STORM-2020: Stop using sun internal classes
 * STORM-1228: port fields_test to java
 * STORM-2104: New Kafka spout crashes if partitions are reassigned while tuples are in-flight
 * STORM-2257: Add built in support for sum function with different types.
 * STORM-2082: add sql external module storm-sql-hdfs
 * STORM-2256: storm-pmml breaks on java 1.7
 * STORM-2223: PMML Bolt.
 * STORM-2222: Repeated NPEs thrown in nimbus if rebalance fails
 * STORM-2190: reduce contention between submission and scheduling
 * STORM-2239: Handle InterruptException in new Kafka spout
 * STORM-2087: Storm-kafka-client: Failed tuples are not always replayed
 * STORM-2238: Add Timestamp extractor for windowed bolt
 * STORM-2235: Introduce new option: 'add remote repositories' for dependency resolver
 * STORM-2215: validate blobs are present before submitting
 * STORM-2170: [Storm SQL] Add built-in socket datasource to runtime
 * STORM-2226: Fix kafka spout offset lag ui for kerberized kafka
 * STORM-2224: Exposed a method to override in computing the field from given tuple in FieldSelector
 * STORM-2220: Added config support for each bolt in Cassandra bolts, fixed the bolts to be used also as sinks.
 * STORM-2205: Racecondition in getting nimbus summaries while ZK connectionions are reconnected
 * STORM-2182: Refactor Storm Kafka Examples Into Own Modules.
 * STORM-1694: Kafka Spout Trident Implementation Using New Kafka Consumer API
 * STORM-2173: [SQL] Support CSV as input / output format
 * STORM-2177: [SQL] Support TSV as input / output format
 * STORM-2172: [SQL] Support Avro as input / output format
 * STORM-2185: Storm Supervisor doesn't delete directories properly sometimes
 * STORM-2103: [SQL] Introduce new sql external module: storm-sql-mongodb
 * STORM-2175: fix double close of workers
 * STORM-2109: Under supervisor V2 SUPERVISOR_MEMORY_CAPACITY_MB and SUPERVISOR_CPU_CAPACITY must be Doubles
 * STORM-2110: in supervisor v2 filter out empty command line args
 * STORM-2117: Supervisor V2 with local mode extracts resources directory to topology root directory instead of temporary directory
 * STORM-2131: Add blob command to worker-launcher, make stormdist directory not writeable by topo owner
 * STORM-2018: Supervisor V2
 * STORM-2139: Let ShellBolts and ShellSpouts run with scripts from blobs
 * STORM-2072: Add map, flatMap with different outputs (T->V) in Trident
 * STORM-2134: improving the current scheduling strategy for RAS
 * STORM-2125: Use Calcite's implementation of Rex Compiler
 * STORM-1546: Adding Read and Write Aggregations for Pacemaker to make it HA compatible
 * STORM-1444: Support EXPLAIN statement in StormSQL
 * STORM-2099: Introduce new sql external module: storm-sql-redis
 * STORM-2097: Improve logging in trident core and examples
 * STORM-2144: Fix Storm-sql group-by behavior in standalone mode
 * STORM-2066: make error message in IsolatedPool.java more descriptive
 * STORM-1870: Allow FluxShellBolt/Spout set custom "componentConfig" via yaml
 * STORM-2126: fix NPE due to race condition in compute-new-sched-assign…
 * STORM-2124: show requested cpu mem for each component
 * STORM-2089: Replace Consumer of ISqlTridentDataSource with SqlTridentConsumer
 * STORM-2118: A few fixes for storm-sql standalone mode
 * STORM-2105: Cluster/Supervisor total and available resources displayed in the UI
 * STORM-2078: enable paging in worker datatable
 * STORM-1664: Allow Java users to start a local cluster with a Nimbus Thrift server.
 * STORM-1872: Release Jedis connection when topology shutdown
 * STORM-2100: Fix Trident SQL join tests to not rely on ordering
 * STORM-1837: Fix complete-topology and prevent message loss
 * STORM-2098: DruidBeamBolt: Pass DruidConfig.Builder as constructor argument
 * STORM-2092: optimize TridentKafkaState batch sending
 * STORM-1979: Storm Druid Connector implementation.
 * STORM-2057: Support JOIN statement in Storm SQL
 * STORM-1970: external project examples refator
 * STORM-2074: fix storm-kafka-monitor NPE bug
 * STORM-1459: Allow not specifying producer properties in read-only Kafka table in StormSQL
 * STORM-2052: Kafka Spout New Client API - Log Improvements and Parameter Tuning for Better Performance.
 * STORM-2050: [storm-sql] Support User Defined Aggregate Function for Trident mode
 * STORM-1434: Support the GROUP BY clause in StormSQL
 * STORM-2016: Topology submission improvement: support adding local jars and maven artifacts on submission
 * STORM-1994: Add table with per-topology & worker resource usage and components in (new) supervisor and topology pages
 * STORM-2042: Nimbus client connections not closed properly causing connection leaks
 * STORM-1766: A better algorithm server rack selection for RAS
 * STORM-1913: Additions and Improvements for Trident RAS API
 * STORM-2037: debug operation should be whitelisted in SimpleAclAuthorizer.
 * STORM-2023: Add calcite-core to dependency of storm-sql-runtime
 * STORM-2036: Fix minor bug in RAS Tests
 * STORM-1979: Storm Druid Connector implementation.
 * STORM-1839: Storm spout implementation for Amazon Kinesis Streams.
 * STORM-1876: Option to build storm-kafka and storm-kafka-client with different kafka client version
 * STORM-2000: Package storm-opentsdb as part of external dir in installation
 * STORM-1989: X-Frame-Options support for Storm UI
 * STORM-1962: support python 3 and 2 in multilang
 * STORM-1964: Unexpected behavior when using count window together with timestamp extraction
 * STORM-1890: ensure we refetch static resources after package build
 * STORM-1988: Kafka Offset not showing due to bad classpath.
 * STORM-1966: Expand metric having Map type as value into multiple metrics based on entries
 * STORM-1737: storm-kafka-client has compilation errors with Apache Kafka 0.10
 * STORM-1968: Storm logviewer does not work for nimbus.log in secure cluster
 * STORM-1910: One topology cannot use hdfs spout to read from two locations
 * STORM-1960: Add CORS support to STORM UI Rest api
 * STORM-1959: Add missing license header to KafkaPartitionOffsetLag
 * STORM-1950: Change response json of "Topology Lag" REST API to keyed by spoutId, topic, partition.
 * STORM-1833: Simple equi-join in storm-sql standalone mode
 * STORM-1866: Update Resource Aware Scheduler Documentation
 * STORM-1930: Kafka New Client API - Support for Topic Wildcards
 * STORM-1924: Adding conf options for Persistent Word Count Topology
 * STORM-1956: Disabling Backpressure by default
 * STORM-1934: Fix race condition between sync-supervisor and sync-processes
 * STORM-1919: Introduce FilterBolt on storm-redis
 * STORM-1945: Fix NPE bugs on topology spout lag for storm-kafka-monitor
 * STORM-1888: add description for shell command
 * STORM-1902: add a simple & flexible FileNameFormat for storm-hdfs
 * STORM-1914: Storm Kafka Field Topic Selector
 * STORM-1907: PartitionedTridentSpoutExecutor has incompatible types that cause ClassCastException
 * STORM-1925: Remove Nimbus thrift call from Nimbus itself
 * STORM-1909: Update HDFS spout documentation
 * STORM-1136: Command line module to return kafka spout offsets lag and display in storm ui
 * STORM-1911: IClusterMetricsConsumer should use seconds to timestamp unit
 * STORM-1893: Support OpenTSDB for storing timeseries data.
 * STORM-1723: Introduce ClusterMetricsConsumer
 * STORM-1700: Introduce 'whitelist' / 'blacklist' option to MetricsConsumer
 * STORM-1698: Asynchronous MetricsConsumerBolt
 * STORM-1705: Cap number of retries for a failed message
 * STORM-1884: Prioritize pendingPrepare over pendingCommit
 * STORM-1575: fix TwitterSampleSpout NPE on close
 * STORM-1874: Update logger private permissions
 * STORM-1865: update command line client document
 * STORM-1771: HiveState should flushAndClose before closing old or idle Hive connections
 * STORM-1882: Expose TextFileReader public
 * STORM-1873: Implement alternative behaviour for late tuples
 * STORM-1719: Introduce REST API: Topology metric stats for stream
 * STORM-1887: Fixed help message for set_log_level command
 * STORM-1878: Flux can now handle IStatefulBolts
 * STORM-1864: StormSubmitter should throw respective exceptions and log respective errors forregistered submitter hook invocation
 * STORM-1868: Modify TridentKafkaWordCount to run in distributed mode
 * STORM-1859: Ack late tuples in windowed mode
 * STORM-1851: Fix default nimbus impersonation authorizer config
 * STORM-1848: Make KafkaMessageId and Partition serializable to support
 * STORM-1862: Flux ShellSpout and ShellBolt can't emit to named streams
 * Storm-1728: TransactionalTridentKafkaSpout error
 * STORM-1850: State Checkpointing Documentation update
 * STORM-1674: Idle KafkaSpout consumes more bandwidth than needed
 * STORM-1842: Forward references in storm.thrift cause tooling issues
 * STORM-1730: LocalCluster#shutdown() does not terminate all storm threads/thread pools.
 * STORM-1709: Added group by support in storm sql standalone mode
 * STORM-1720: Support GEO in storm-redis
