---
layout: post
title: Storm 1.0.0 released
author: P. Taylor Goetz
---

The Apache Storm community is pleased to announce that version 1.0.0 Stable has been released and is available from [the downloads page](/downloads.html).

This release represents a major milestone in the evolution of Apache Storm, and includes an immense number of new features, usability and performance improvements, some of which are highlighted below.

Improved Performance
--------------------
One of the main highlights in this release is a dramatice performance improvement over previous versions. Apache Storm 1.0 is *up to 16 times faster than previous versions, with latency reduced up to 60%. Obviously topology performance varies widely by use case and external service dependencies, but for most use cases users can expect a 3x performance boost over earlier versions.


Pacemaker - Heartbeat Server
----------------------------

Pacemaker is an optional Storm daemon designed to process heartbeats from workers. As Storm is scaled up, ZooKeeper begins to become a bottleneck due to high volumes of writes from workers doing heartbeats. Lots of writes to disk and large ammounts traffic across the network is generated as ZooKeeper tries to maintain consistency.

Because heartbeats are of an ephemeral nature, they do not need to be persisted to disk or synced across nodes, and an in-memory store will do. This is the role of Pacemaker. Pacemaker functions as a simple in-memory key/value store with ZooKeeper-like, directory-style keys and byte array values.


Distributed Cache API
---------------------
In the past it was common for developers to bundle resources required by a topology (such as lookup data, machine learning models, etc.) within a topology jar file. One problem with this approach is that updating that data required the repackaging and redeployment of the topology. Another problem is that at times that data can be very large (gigabytes or more), which negatively impacts topology startup time. 

Storm version 1.0 introduces a distributed cache API that allows for the sharing of files (BLOBs) among topologies. Files in the distributed cache can be updated at any time from the command line, without the need to redeploy a topology. The distributed cache API allows for files from several KB in size to several GB, and also supports compression formats such as ZIP and GZIP.

Storm 1.0 comes with two implementations of the distributed cache API: One backed by the local file system on Supervisor nodes, and one backed by Apache Hadoop HDFS. Both implementations also support fine-grained access control through ACLs.

HA Nimbus
---------
Experienced Storm users will recognize that the Storm Nimbus service is not a single point of failure in the strictest sense (i.e. loss of the Nimbus node will not affect running topologies). However, the loss of the Nimbus node does degrade functionality for deploying new topologies and reassigning work across a cluster.

In Storm 1.0 this “soft” point of failure has been eliminated by supporting an HA Nimbus. Multiple instances of the Nimbus service run in a cluster and perform leader election when a Nimbus node fails, and Nimbus hosts can join or leave the cluster at any time. HA Nimbus leverages the distributed cache API for replication to guarantee the availability of topology resources in the event of a Nimbus node failure.


Native Streaming Window API
---------------------------

Window based computations are common among use cases in stream processing,  where the unbounded stream of data is split into finite sets based on some criteria (e.g. time) and a computation is applied on each group of events. One example would be to compute the top trending twitter topic in the last hour.

Windowing is primarily used for aggregations, joins, pattern matching and more. Windows can be seen as an in-memory table where events are added and evicted based on some policies.

In past releases Storm relied on developers to build their own windowing logic. There were no recommended or high level abstractions that developers could use to define a Window in a standard way in a Topology.

Apache Storm 1.0 now includes a native windowing API. Windows can be specified with the following two parameters,

1. Window length - the length or duration of the window
2. Sliding interval - the interval at which the window slides

Storm has support for sliding and tumbling windows based on time duration and/or event count.


State Management - Statefule Bolts with Automatic Checkpointing
----------------
Storm 1.0 introduces a new Stateful Bolt API with automatic checkpointing. Stateful Bolts are easy to implement -- simply extend the `BaseStatefulBolt` class -- and can be combined with stateless bolts in a topology. Storm will automatically manage bolt state and recover that state in the event of a failure.

Storm 1.0 comes with a state implementations backed by memory as well as Redis. Future point releases will include additional support for alternative state stores.

Automatic Backpressure
----------------------
In previous Storm versions, the only way to throttle the input to a topology was to enable ACKing and set `topology.max.spout.pending`. For use cases that don't require at-least-once processing guarantees, this requirement imposed a significant performance penalty.

Storm 1.0 includes a new automatic backpressure mechanism based on configurable high/low watermarks expressed as a percentage of a task's buffer size. If the high water mark is reached, Storm will slow down the topology's spouts and stop throttling when the low water mark is reached.

Storm's backpressure mechanism is implemented independently of the Spout API, so all existing Spouts are supported.

Resource Aware Scheduler
------------------------

Based on Storm pluggable topology scheduler API, Storm 1.0 adds a new scheduler implementation that takes into account both the memory (on-heap and off-heap) and CPU resources available in a cluster. The resources aware scheduler (AKA "RAS Scheduler") allows users to specify the memory and CPU requirements for individual topology components (Spouts/Bolts), and Storm will schedule topology tasks among workers to best meet those requirements.

In the future, the Storm community plans to extend the RAS implmentation to support network resources and rack awareness as well.

Dynamic Log Levels
------------------

Storm 1.0 now allows users and administrators to dynamically change the log level settings for a running topology both from the Storm UI as well as the command line. Users can also specify an optional timeout after which those changes will be automatically reverted. The resulting log files are also easily searchable from the Storm UI and logviewer service.


Tuple Sampling and Debugging
----------------------------

In the course of debugging a topology, many Storm users find themselves adding "debug" bolts or Trident functions to log information about the data flowing through the topology, only to remove or disable them for production deployment. Storm 1.0 eliminates this need through the new Topology Debug capability.

Storm UI now includes a function that allow you to sample a percentage tuples flowing through a topology or individual component directly from the Storm UI. The sampled events can then be viewed directly from the Storm UI and are also saved to disk.

Distributed Log Search
----------------------
Another improvement to Storm's UI is the addition of a distributed log search. This search capability allows users to search across all log files of a specific topology, including archived (ZIP'ed) logs. The search results will include matches from all Supervisor nodes.

Dynamic Worker Profiling
------------------------
The last, but certainly not the least, usability improvement in Storm 1.0 is dynamic worker profiling. This new feature allows users to request worker profile data directly from Storm UI, including:

 * Heap Dumps
 * JStack Output
 * JProfile Recordings
 
The generated files are then available for download for off-line analysis with various debugging tools. It is also now possible to restart workers from the Storm UI.


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether through direct code contributions, documentation, bug reports, or helping other users on the mailing lists. Your efforts are much appreciated.


Full Changelog
---------

 * STORM-1670: LocalState#get(String) can throw FileNotFoundException which may result supervisor.clj#sync-processes stop assigning new workers/assignments
 * STORM-1677: Test resource files are excluded from source distribution, which makes logviewer-test failing
 * STORM-676: Storm Trident support for sliding/tumbling windows
 * STORM-1671: Enable logviewer to delete a dir without yaml
 * STORM-822: Kafka Spout New Consumer API
 * STORM-1673: log4j2/worker.xml refers old package of LoggerMetricsConsumer
 * STORM-1632 Disable event logging by default
 * STORM-1667: Log the IO exception when deleting worker pid dir
 * STORM-1669: Fix SolrUpdateBolt flush bug
 * STORM-1668: Flux silently fails while setting a non-existent property.
 * STORM-1573: Add batch support for MongoInsertBolt
 * STORM-1660: remove flux gitignore file and move rules to top level gitignore
 * STORM-1622: Rename classes with older third party shaded packages
 * STORM-1537: Upgrade to kryo 3
 * STORM-1556: nimbus.clj/wait-for-desired-code-replication wrong reset for current-replication-count-jar in local mode
 * STORM-1636: Supervisor shutdown with worker id pass in being nil
 * STORM-1641: make subtree node creation consistent
 * STORM-1604: Delayed transition should handle NotALeaderException
 * STORM-1602: Blobstore UTs are failed on Windows
 * STORM-1629: Files/move doesn't work properly with non-empty directory in Windows
 * STORM-1616: Add RAS API for Trident
 * STORM-1483: add storm-mongodb connector
 * STORM-1614: backpressure init and cleanup changes
 * STORM-1549: Add support for resetting tuple timeout from bolts via the OutputCollector
 * STORM-971: Metric for messages lost due to kafka retention
 * STORM-1608: Fix stateful topology acking behavior
 * STORM-1609: Netty Client is not best effort delivery on failed Connection
 * STORM-1620: Update curator to fix CURATOR-209
 * STORM-1469: Decommission SimpleTransportPlugin and configuration
 * STORM-1469: Adding Plain Sasl Transport Plugin
 * STORM-1588: Do not add event logger details if number of event loggers is zero
 * STORM-1606: print the information of testcase which is on failure
 * STORM-1436: Set Travis Heap size to fit in memory limits in travis builds.
 * STORM-1529: Change default worker temp directory location for workers
 * STORM-1543: DRPCSpout should always try to reconnect disconnected DRPCInvocationsClient
 * STORM-1561: Supervisor should relaunch worker if assignments have changed
 * STORM-1601: Check if /backpressure/storm-id node exists before requesting children
 * STORM-1574: Better handle backpressure exception etc.
 * STORM-1587: Avoid NPE while prining Metrics
 * STORM-1570: Storm SQL support for nested fields and array
 * STORM-1576: fix ConcurrentModificationException in addCheckpointInputs
 * STORM-1521: When using Kerberos login from keytab with multiple bolts/executors ticket is not renewed
 * STORM-1488: UI Topology Page component last error timestamp is from 1970
 * STORM-1542: Remove profile action retry in case of non-zero exit code
 * STORM-1540: Fix Debug/Sampling for Trident
 * STORM-1569: Allowing users to specify the nimbus thrift server queue size.
 * STORM-1552: Fix topology event sampling log dir 
 * STORM-1511: min/max operations support on a trident stream
 * STORM-1522: REST API throws invalid worker log links
 * STORM-1532: Fix readCommandLineOpts to parse JSON correctly
 * STORM-1541: Change scope of 'hadoop-minicluster' to test
 * STORM-1539: Improve Storm ACK-ing performance
 * STORM-1519: Storm syslog logging not confirming to RFC5426 3.1
 * STORM-1533: IntegerValidator for metric consumer parallelism hint
 * STORM-1534: Pick correct version of jackson-annotations jar
 * STORM-1476: Filter -c options from args and add them as part of storm.options
 * STORM-1520: Nimbus Clojure/Zookeeper issue ("stateChanged" method not found)
 * STORM-1531: Junit and mockito dependencies need to have correct scope defined in storm-elasticsearch pom.xml
 * STORM-1526: Improve Storm core performance
 * STORM-1524: Add Pluggable daemon metrics Reporters
 * STORM-1517: Add peek api in trident stream
 * STORM-1455: kafka spout should not reset to the beginning of partition when offsetoutofrange exception occurs
 * STORM-1518: Backport of STORM-1504
 * STORM-1505: Add map, flatMap and filter functions in trident stream
 * STORM-1510: Fix broken nimbus log link
 * STORM-1503: Worker should not crash on failure to send heartbeats to Pacemaker/ZK
 * STORM-1176: Checkpoint window evaluated/expired state
 * STORM-1494: Add link to supervisor log in Storm UI
 * STORM-1496: Nimbus periodically throws blobstore-related exception
 * STORM-1484: ignore subproject .classpath & .project file
 * STORM-1478: make bolts getComponentConfiguration method cleaner/simpler
 * STORM-1499: fix wrong package name for storm trident
 * STORM-1463: added file scehma to log4j config files for windows env
 * STORM-1485: DRPC Connectivity Issues
 * STORM-1486: Fix storm-kafa documentation
 * STORM-1214: add javadoc for Trident Streams and Operations
 * STORM-1450: Fix minor bugs and refactor code in ResourceAwareScheduler
 * STORM-1452: Fixes profiling/debugging out of the box
 * STORM-1406: Add MQTT Support
 * STORM-1473: enable log search for daemon logs
 * STORM-1472: Fix the errorTime bug and show the time to be readable
 * STORM-1466: Move the org.apache.thrift7 namespace to something correct/sensible
 * STORM-1470: Applies shading to hadoop-auth, cleaner exclusions
 * STORM-1467: Switch apache-rat plugin off by default, but enable for Travis-CI
 * STORM-1468: move documentation to asf-site branch
 * STORM-1199: HDFS Spout Implementation.
 * STORM-1453: nimbus.clj/wait-for-desired-code-replication prints wrong log message
 * STORM-1419: Solr bolt should handle tick tuples
 * STORM-1175: State store for windowing operations
 * STORM-1202: Migrate APIs to org.apache.storm, but try to provide some form of backwards compatability
 * STORM-468: java.io.NotSerializableException should be explained
 * STORM-1348: refactor API to remove Insert/Update builder in Cassandra connector
 * STORM-1206: Reduce logviewer memory usage through directory stream
 * STORM-1219: Fix HDFS and Hive bolt flush/acking
 * STORM-1150: Fix the authorization of Logviewer in method authorized-log-user?
 * STORM-1418: improve debug logs for some external modules
 * STORM-1415: Some improvements for trident map StateUpdater
 * STORM-1414: Some improvements for multilang JsonSerializer
 * STORM-1408: clean up the build directory created by tests
 * STORM-1425: Tick tuples should be acked like normal tuples
 * STORM-1432: Spurious failure in storm-kafka test 
 * STORM-1449: Fix Kafka spout to maintain backward compatibility
 * STORM-1458: Add check to see if nimbus is already running.
 * STORM-1462: Upgrade HikariCP to 2.4.3
 * STORM-1457: Avoid collecting pending tuples if topology.debug is off
 * STORM-1430: ui worker checkboxes
 * STORM-1423: storm UI in a secure env shows error even when credentials are present
 * STORM-702: Exhibitor support
 * STORM-1160: Add hadoop-auth dependency needed for storm-core
 * STORM-1404: Fix Mockito test failures in storm-kafka.
 * STORM-1379: Removed Redundant Structure
 * STORM-706: Clarify examples README for IntelliJ.
 * STORM-1396: Added backward compatibility method for File Download
 * STORM-695: storm CLI tool reports zero exit code on error scenario
 * STORM-1416: Documentation for state store
 * STORM-1426: keep backtype.storm.tuple.AddressedTuple and delete duplicated backtype.storm.messaging.AddressedTuple
 * STORM-1417: fixed equals/hashCode contract in CoordType
 * STORM-1422: broken example in storm-starter tutorial
 * STORM-1429: LocalizerTest fix
 * STORM-1401: removes multilang-test
 * STORM-1424: Removed unused topology-path variable
 * STORM-1427: add TupleUtils/listHashCode method and delete tuple.clj
 * STORM-1413: remove unused variables for some tests
 * STORM-1412: null check should be done in the first place
 * STORM-1210: Set Output Stream id in KafkaSpout
 * STORM-1397: Merge conflict from Pacemaker merge
 * STORM-1373: Blobstore API sample example usage
 * STORM-1409: StormClientErrorHandler is not used
 * STORM-1411: Some fixes for storm-windowing
 * STORM-1399: Blobstore tests should write data to `target` so it gets removed when running `mvn clean`
 * STORM-1398: Add back in TopologyDetails.getTopology
 * STORM-898: Add priorities and per user resource guarantees to Resource Aware Scheduler
 * STORM-1187: Support windowing based on tuple ts.
 * STORM-1400: Netty Context removeClient() called after term() causes NullPointerException.
 * STORM-1383: Supervisors should not crash if nimbus is unavailable
 * STORM-1381: Client side topology submission hook.
 * STORM-1376: Performance slowdown due excessive zk connections and log-debugging
 * STORM-1395: Move JUnit dependency to top-level pom
 * STORM-1372: Merging design and usage documents for distcache
 * STORM-1393: Update the storm.log.dir function, add doc for logs
 * STORM-1377: nimbus_auth_test: very short timeouts causing spurious failures
 * STORM-1388: Fix url and email links in README file
 * STORM-1389: Removed creation of projection tuples as they are already available
 * STORM-1179: Create Maven Profiles for Integration Tests.
 * STORM-1387: workers-artifacts directory configurable, and default to be under storm.log.dir.
 * STORM-1211: Add trident state and query support for cassandra connector
 * STORM-1359: Change kryo links from google code to github
 * STORM-1385: Divide by zero exception in stats.clj
 * STORM-1370: Bug fixes for MultitenantScheduler
 * STORM-1374: fix random failure on WindowManagerTest
 * STORM-1040: SQL support for Storm.
 * STORM-1364: Log storm version on daemon start
 * STORM-1375: Blobstore broke Pacemaker
 * STORM-876: Blobstore/DistCache Support
 * STORM-1361: Apache License missing from two Cassandra files
 * STORM-756: Handle taskids response as soon as possible
 * STORM-1218: Use markdown for JavaDoc.
 * STORM-1075: Storm Cassandra connector.
 * STORM-965: excessive logging in storm when non-kerberos client tries to connect
 * STORM-1341: Let topology have own heartbeat timeout for multilang subprocess
 * STORM-1207: Added flux support for IWindowedBolt
 * STORM-1352: Trident should support writing to multiple Kafka clusters.
 * STORM-1220: Avoid double copying in the Kafka spout.
 * STORM-1340: Use Travis-CI build matrix to improve test execution times
 * STORM-1126: Allow a configMethod that takes no arguments (Flux)
 * STORM-1203: worker metadata file creation doesn't use storm.log.dir config
 * STORM-1349: [Flux] Allow constructorArgs to take Maps as arguments
 * STORM-126: Add Lifecycle support API for worker nodes
 * STORM-1213: Remove sigar binaries from source tree
 * STORM-885:  Heartbeat Server (Pacemaker)
 * STORM-1221: Create a common interface for all Trident spout.
 * STORM-1198: Web UI to show resource usages and Total Resources on all supervisors
 * STORM-1167: Add windowing support for storm core.
 * STORM-1215: Use Async Loggers to avoid locking  and logging overhead
 * STORM-1204: Logviewer should graceful report page-not-found instead of 500 for bad topo-id etc
 * STORM-831: Add BugTracker and Central Logging URL to UI
 * STORM-1208: UI: NPE seen when aggregating bolt streams stats
 * STORM-1016: Generate trident bolt ids with sorted group names
 * STORM-1190: System Load too high after recent changes
 * STORM-1098: Nimbus hook for topology actions.
 * STORM-1145: Have IConnection push tuples instead of pull them
 * STORM-1191: bump timeout by 50% due to intermittent travis build failures
 * STORM-794: Modify Spout async loop to treat activate/deactivate ASAP
 * STORM-1196: Upgrade to thrift 0.9.3
 * STORM-1155: Supervisor recurring health checks
 * STORM-1189: Maintain wire compatability with 0.10.x versions of storm.
 * STORM-1185: replace nimbus.host with nimbus.seeds
 * STORM-1164: Code cleanup for typos, warnings and conciseness.
 * STORM-902: Simple Log Search.
 * STORM-1052: TridentKafkaState uses new Kafka Producer API.
 * STORM-1182: Removing and wrapping some exceptions in ConfigValidation to make code cleaner
 * STORM-1134. Windows: Fix log4j config.
 * STORM-1127: allow for boolean arguments (Flux)
 * STORM-1138: Storm-hdfs README should be updated with Avro Bolt information
 * STORM-1154: SequenceFileBolt needs unit tests
 * STORM-162: Load Aware Shuffle Grouping
 * STORM-1158: Storm metrics to profile various storm functions
 * STORM-1161: Add License headers and add rat checks to builds
 * STORM-1165: normalize the scales of CPU/Mem/Net when choosing the best node for Resource Aware Scheduler
 * STORM-1163: use rmr rather than rmpath for remove worker-root
 * STORM-1170: Fix the producer alive issue in DisruptorQueueTest
 * STORM-1168: removes noisy log message & a TODO
 * STORM-1143: Validate topology Configs during topology submission
 * STORM-1157: Adding dynamic profiling for worker, restarting worker, jstack, heap dump, and profiling
 * STORM-1123: TupleImpl - Unnecessary variable initialization.
 * STORM-1153: Use static final instead of just static for class members.
 * STORM-817: Kafka Wildcard Topic Support.
 * STORM-40: Turn worker garbage collection and heapdump on by default.
 * STORM-1152: Change map keySet iteration to entrySet iteration for efficiency.
 * STORM-1147: Storm JDBCBolt should add validation to ensure either insertQuery or table name is specified and not both.
 * STORM-1151: Batching in DisruptorQueue
 * STORM-350: Update disruptor to latest version (3.3.2)
 * STORM-697: Support for Emitting Kafka Message Offset and Partition
 * STORM-1074: Add Avro HDFS bolt
 * STORM-566: Improve documentation including incorrect Kryo ser. framework docs
 * STORM-1073: Refactor AbstractHdfsBolt
 * STORM-1128: Make metrics fast
 * STORM-1122: Fix the format issue in Utils.java
 * STORM-1111: Fix Validation for lots of different configs
 * STORM-1125: Adding separate ZK client for read in Nimbus ZK State
 * STORM-1121: Remove method call to avoid overhead during topology submission time
 * STORM-1120: Fix keyword (schema -> scheme) from main-routes
 * STORM-1115: Stale leader-lock key effectively bans all nodes from becoming leaders
 * STORM-1119: Create access logging for all daemons
 * STORM-1117: Adds visualization-init route previously missing
 * STORM-1118: Added test to compare latency vs. throughput in storm.
 * STORM-1110: Fix Component Page for system components
 * STORM-1093: Launching Workers with resources specified in resource-aware schedulers
 * STORM-1102: Add a default flush interval for HiveBolt
 * STORM-1112: Add executor id to the thread name of the executor thread for debug
 * STORM-1079: Batch Puts to HBase
 * STORM-1084: Improve Storm config validation process to use java annotations instead of *_SCHEMA format
 * STORM-1106: Netty should not limit attempts to reconnect
 * STORM-1103: Changes log message to DEBUG from INFO
 * STORM-1104: Nimbus HA fails to find newly downloaded code files
 * STORM-1087: Avoid issues with transfer-queue backpressure.
 * STORM-893: Resource Aware Scheduling (Experimental)
 * STORM-1095: Tuple.getSourceGlobalStreamid() has wrong camel-case naming
 * STORM-1091: Add unit test for tick tuples to HiveBolt and HdfsBolt
 * STORM-1090: Nimbus HA should support `storm.local.hostname`
 * STORM-820: Aggregate topo stats on nimbus, not ui
 * STORM-412: Allow users to modify logging levels of running topologies
 * STORM-1078: Updated RateTracker to be thread safe
 * STORM-1082: fix nits for properties in kafka tests
 * STORM-993: include uptimeSeconds as JSON integer field
 * STORM-1053: Update storm-kafka README for new producer API confs.
 * STORM-1058: create CLI kill_workers to kill workers on a supervisor node
 * STORM-1063: support relative log4j conf dir for both daemons and workers
 * STORM-1059: Upgrade Storm to use Clojure 1.7.0
 * STORM-1069: add check case for external change of 'now' value.
 * STORM-969: HDFS Bolt can end up in an unrecoverable state.
 * STORM-1068: Configure request.required.acks to be 1 in KafkaUtilsTest for sync
 * STORM-1017: If ignoreZkOffsets set true,KafkaSpout will reset zk offset when recover from failure.
 * STORM-1054: Excessive logging ShellBasedGroupsMapping if the user doesn't have any groups.
 * STORM-954: Toplogy Event Inspector
 * STORM-862: Pluggable System Metrics
 * STORM-1032: Add generics to component configuration methods
 * STORM-886: Automatic Back Pressure
 * STORM-1037: do not remove storm-code in supervisor until kill job
 * STORM-1007: Add more metrics to DisruptorQueue
 * STORM-1011: HBaseBolt default mapper should handle null values
 * STORM-1019: Added missing dependency version to use of org.codehaus.mojo:make-maven-plugin
 * STORM-1020: Document exceptions in ITuple & Fields
 * STORM-1025: Invalid links at https://storm.apache.org/about/multi-language.html
 * STORM-1010: Each KafkaBolt could have a specified properties.
 * STORM-1008: Isolate the code for metric collection and retrieval from DisruptorQueue
 * STORM-991: General cleanup of the generics (storm.trident.spout package)
 * STORM-1000: Use static member classes when permitted 
 * STORM-1003: In cluster.clj replace task-id with component-id in the declaration
 * STORM-1013: [storm-elasticsearch] Expose TransportClient configuration Map to EsConfig
 * STORM-1012: Shading jackson.
 * STORM-974: [storm-elasticsearch] Introduces Tuple -> ES document mapper to get rid of constant field mapping (source, index, type)
 * STORM-978: [storm-elasticsearch] Introduces Lookup(or Query)Bolt which emits matched documents from ES
 * STORM-851: Storm Solr connector
 * STORM-854: [Storm-Kafka] KafkaSpout can set the topic name as the output streamid
 * STORM-990: Refactored TimeCacheMap to extend RotatingMap
 * STORM-829: Hadoop dependency confusion
 * STORM-166: Nimbus HA
 * STORM-976: Config storm.logback.conf.dir is specific to previous logging framework
 * STORM-995: Fix excessive logging
 * STORM-837: HdfsState ignores commits
 * STORM-938: storm-hive add a time interval to flush tuples to hive.
 * STORM-964: Add config (with small default value) for logwriter to restrict its memory usage
 * STORM-980: Re-include storm-kafka tests from Travis CI build
 * STORM-960: HiveBolt should ack tuples only after flushing.
 * STORM-951: Storm Hive connector leaking connections.
 * STORM-806: use storm.zookeeper.connection.timeout in storm-kafka ZkState when newCurator
 * STORM-809: topology.message.timeout.secs should not allow for null or <= 0 values
 * STORM-847: Add cli to get the last storm error from the topology
 * STORM-864: Exclude storm-kafka tests from Travis CI build
 * STORM-477: Add warning for invalid JAVA_HOME
 * STORM-826: Update KafkaBolt to use the new kafka producer API
 * STORM-912: Support SSL on Logviewer
 * STORM-934: The current doc for topology ackers is outdated
 * STORM-160: Allow ShellBolt to set env vars (particularly PATH)
 * STORM-937: Changing noisy log level from info to debug
 * STORM-931: Python Scripts to Produce Formatted JIRA and GitHub Join
 * STORM-924: Set the file mode of the files included when packaging release packages
 * STORM-799: Use IErrorReport interface more broadly
 * STORM-926: change pom to use maven-shade-plugin:2.2
 * STORM-942: Add FluxParser method parseInputStream() to eliminate disk usage
 * STORM-67: Provide API for spouts to know how many pending messages there are
 * STORM-918: Storm CLI could validate arguments/print usage
 * STORM-859: Add regression test of STORM-856
 * STORM-913: Use Curator's delete().deletingChildrenIfNeeded() instead of zk/delete-recursive
 * STORM-968: Adding support to generate the id based on names in Trident
 * STORM-845: Storm ElasticSearch connector
 * STORM-988: supervisor.slots.ports should not allow duplicate element values
 * STORM-975: Storm-Kafka trident topology example
 * STORM-958: Add config for init params of group mapping service
 * STORM-949: On the topology summary UI page, last shown error should have the time and date
 * STORM-1142: Some config validators for positive ints need to allow 0
 * STORM-901: Worker Artifacts Directory
 * STORM-1144: Display requested and assigned cpu/mem resources for schedulers in UI
 * STORM-1217: making small fixes in RAS
