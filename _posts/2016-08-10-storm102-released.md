---
layout: post
title: Storm 1.0.2 Released
author: P. Taylor Goetz
---

The Apache Storm community is pleased to announce that version 1.0.2 has been released and is available from [the downloads page](/downloads.html).

This is a maintenance release that includes a number of important bug fixes that improve Storm's performance, stability and fault tolerance. We encourage users of previous versions to upgrade to this latest release.


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether through direct code contributions, documentation, bug reports, or helping other users on the mailing lists. Your efforts are much appreciated.


Full Changelog
---------

 * STORM-1939: Frequent InterruptedException raised by ShellBoltMessageQueue.poll
 * STORM-1968: Storm logviewer does not work for nimbus.log in secure cluster
 * STORM-1928: ShellSpout should check heartbeat while ShellSpout is waiting for subprocess to sync
 * STORM-1922: Supervisor summary default order by host
 * STORM-1956: Disabling Backpressure by default
 * STORM-1934: Fix race condition between sync-supervisor and sync-processes
 * STORM-1895: blobstore replication-factor argument
 * STORM-118: Docs: typo in transactional-commit-flow.png
 * STORM-1633: Document blobstore to command-line-client.md
 * STORM-1899: Release HBase connection when topology shutdown
 * STORM-1844: Some tests are flaky due to low timeout
 * STORM-1946: initialize lastHeartbeatTimestamp before starting heartbeat task
 * STORM-1941 Nimbus discovery can fail when zookeeper reconnect happens
 * STORM-1937 Fix WindowTridentProcessor cause NullPointerException
 * STORM-1924: Add a config file parameter to HDFS test topologies
 * STORM-1705: Cap number of retries for a failed message
 * STORM-1884: Prioritize pendingPrepare over pendingCommit
 * STORM-1575: fix TwitterSampleSpout NPE on close
 * STORM-1874: Update logger private permissions
 * STORM-1865: update command line client document
 * STORM-1771: HiveState should flushAndClose before closing old or idle Hive connections
 * STORM-1882: Expose TextFileReader public
 * STORM-1864 : StormSubmitter should throw respective exceptions and log respective errors for registered submitter hook invocation
 * STORM-1887: Fixed help message for set_log_level command
 * STORM-1878: Flux can now handle IStatefulBolts
 * STORM-1861: Storm submit command returns exit code of 0 even when it fails.
 * STORM-1755: Revert the kafka client version upgrade in storm-kafka module
 * STORM-1853: Replace ClassLoaderObjectInputStream with ObjectInputStream
 * STORM-1868: Modify TridentKafkaWordCount to run in distributed mode
 * STORM-1859: Ack late tuples in windowed mode
 * STORM-1851: Fix default nimbus impersonation authorizer config
 * STORM-1848: Make KafkaMessageId and Partition serializable to support event logging
 * STORM-1862: Flux ShellSpout and ShellBolt can't emit to named streams
 * Storm-1728: TransactionalTridentKafkaSpout error
 * STORM-1850: State Checkpointing Documentation update
 * STORM-1674: Idle KafkaSpout consumes more bandwidth than needed
 * STORM-1842: Forward references in storm.thrift cause tooling issues
 * STORM-1745: Add partition to log output in PartitionManager
 * STORM-1735: Nimbus should log that replication succeeded when min replicas was reached exactly
 * STORM-1835: add lock info in thread dump
 * STORM-1749: Fix storm-starter github links
 * STORM-1764: Pacemaker is throwing some stack traces
 * STORM-1761: Storm-Solr Example Throws ArrayIndexOutOfBoundsException in Remote Cluster Mode
 * STORM-1756: Explicitly null KafkaServer reference in KafkaTestBroker to prevent out of memory on large test classes.
 * STORM-1750: Ensure worker dies when report-error-and-die is called.
 * STORM-1715: using Jedis Protocol.DEFAULT_HOST to replace DEFAULT_HOST
 * STORM-1713: Replace NotImplementedException with UnsupportedOperationException
 * STORM-1678: abstract batch processing to common api `BatchHelper`
 * STORM-1773: Utils.javaDeserialize() doesn't work with primitive types
 * STORM-1661: Introduce a config to turn off blobstore acl validation in insecure mode

