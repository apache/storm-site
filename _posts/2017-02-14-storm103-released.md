---
layout: post
title: Apache Storm 1.0.3 Released
author: P. Taylor Goetz
---

The Apache Storm community is pleased to announce that version 1.0.3 has been released and is available from [the downloads page](/downloads.html).

This is a maintenance release that includes a number of important bug fixes that improve Apache Storm's performance, stability and fault tolerance. We encourage users of previous versions to upgrade to this latest release.


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether through direct code contributions, documentation, bug reports, or helping other users on the mailing lists. Your efforts are much appreciated.


Full Changelog
---------

 * STORM-2197: NimbusClient connectins leak due to leakage in ThriftClient
 * STORM-2321: Handle blobstore zk key deletion in KeySequenceNumber.
 * STORM-2324: Fix deployment failure if resources directory is missing in topology jar
 * STORM-2335: Fix broken Topology visualization with empty ':transferred' in executor stats
 * STORM-2336: Close Localizer and AsyncLocalizer when supervisor is shutting down
 * STORM-2338: Subprocess exception handling is broken in storm.py on Windows environment
 * STORM-2337: Broken documentation generation for storm-metrics-profiling-internal-actions.md and windows-users-guide.md
 * STORM-2325: Logviewer doesn't consider 'storm.local.hostname'
 * STORM-1742: More accurate 'complete latency'
 * STORM-2176: Workers do not shutdown cleanly and worker hooks don't run when a topology is killed
 * STORM-2293: hostname should only refer node's 'storm.local.hostname'
 * STORM-2246: Logviewer download link has urlencoding on part of the URL
 * STORM-1906: Window count/length of zero should be disallowed
 * STORM-1841: Address a few minor issues in windowing and doc
 * STORM-2268: Fix integration test for Travis CI build
 * STORM-2283: Fix DefaultStateHandler kryo multithreading issues
 * STORM-2264: OpaqueTridentKafkaSpout failing after STORM-2216
 * STORM-2276: Remove twitter4j usages due to license issue (JSON.org is catalog X)
 * STORM-2095: remove any remaining files when deleting blobstore directory
 * STORM-2222: Repeated NPEs thrown in nimbus if rebalance fails
 * STORM-2251: Integration test refers specific version of Storm which should be project version
 * STORM-2234: heartBeatExecutorService in shellSpout don't work well with deactivate
 * STORM-2216: Favor JSONValue.parseWithException
 * STORM-2208: HDFS State Throws FileNotFoundException in Azure Data Lake Store file system (adl://)
 * STORM-2213: ShellSpout has race condition when ShellSpout is being inactive longer than heartbeat timeout
 * STORM-2210: remove array shuffle from ShuffleGrouping
 * STORM-2052: Kafka Spout - New Client API - Performance Improvements
 * storm-2205: Racecondition in getting nimbus summaries while ZK connections are reconnected
 * STORM-2198: perform RotationAction when stopping HdfsBolt
 * STORM-2196: A typo in RAS_Node::consumeCPU
 * STORM-2189: RAS_Node::freeCPU outputs incorrect info
 * STORM-2184: Don't wakeup KafkaConsumer on shutdown
 * STORM-2185: Storm Supervisor doesn't delete directories properly sometimes
 * STORM-2175: fix double close of workers
 * STORM-2018: Supervisor V2
 * STORM-2145: Leave leader nimbus's hostname to log when trying to connect leader nimbus
 * STORM-2127: Storm-eventhubs should use latest amqp and eventhubs-client versions
 * STORM-2040: Fix bug on assert-can-serialize
 * STORM-2017: ShellBolt stops reporting task ids
 * STORM-2119: bug in log message printing to stdout
 * STORM-2120: Emit to _spoutConfig.outputStreamId
 * STORM-2101: fixes npe in compute-executors in nimbus
 * STORM-2090: Add integration test for storm windowing
 * STORM-2003: Make sure config contains TOPIC before get it
 * STORM-1567: in defaults.yaml 'topology.disable.loadaware' should be 'topology.disable.loadaware.messaging'
 * STORM-1987: Fix TridentKafkaWordCount arg handling in distributed mode.
 * STORM-1969: Modify HiveTopology to show usage of non-partition table.
 * STORM-1849: HDFSFileTopology should use the 3rd argument as topologyName
 * STORM-2086: use DefaultTopicSelector instead of creating a new one
 * STORM-2079: Unneccessary readStormConfig operation
 * STORM-2081: create external directory for storm-sql various data sources and move storm-sql-kafka to it
 * STORM-2070: Fix sigar native binary download link
 * STORM-2056: Bugs in logviewer
 * STORM-1646: Fix ExponentialBackoffMsgRetryManager test
 * STORM-2039: Backpressure refactoring in worker and executor
 * STORM-2064: Add storm name and function, access result and function to log-thrift-access
 * STORM-2063: Add thread name in worker logs
 * STORM-2042: Nimbus client connections not closed properly causing connection leaks
 * STORM-2032: removes warning in case more than one metrics tuple is received
 * STORM-1594: org.apache.storm.tuple.Fields can throw NPE if given invalid field in selector
 * STORM-1995: downloadChunk in nimbus.clj should close the input stream
