---
layout: post
title: Storm 1.0.1 Released
author: P. Taylor Goetz
---

The Apache Storm community is pleased to announce that version 1.0.1 has been released and is available from [the downloads page](/downloads.html).

This is a maintenance release that includes a number of important bug fixes that improve Storm's performance, stability and fault tolerance. We encourage users of previous versions to upgrade to this latest release.


Performance Improvements
------------------------
This release includes performance improvements to Storm's internal messaging system. The maximum rate at which spouts can emit data has nearly doubled, and performance of inter-task communication has improved.


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether through direct code contributions, documentation, bug reports, or helping other users on the mailing lists. Your efforts are much appreciated.


Full Changelog
---------

 * STORM-1741: remove unconditional setting of JAVA_HOME from storm-env.sh
 * STORM-1739: update the minor JAVA version dependency in 0.10.0 and above
 * STORM-1727: document 1.0 package renaming and how to use the migration tool
 * STORM-1733: Flush stdout and stderr before calling "os.execvp" to prevent log loss.
 * STORM-1729: Get rid of reflections while recording stats
 * STORM-1731: Avoid looking up debug / backpressure enable flags within critical path
 * STORM-1535: Make sure hdfs key tab login happens only once for multiple bolts/executors.
 * STORM-1725: Kafka Spout New Consumer API - KafkaSpoutRetryExponential Backoff method should use HashMap instead of TreeMap not to throw Exception
 * STORM-1544: Document Debug/Sampling of Topologies
 * STORM-1679: add storm Scheduler documents
 * STORM-1704: When logviewer_search.html opens daemon file, next search always show no result
 * STORM-1714: StatefulBolts ends up as normal bolts while using TopologyBuilder.setBolt without parallelism
 * STORM-1683: only check non-system streams by default
 * STORM-1680: Provide configuration to set min fetch size in KafkaSpout
 * STORM-1649: Optimize Kryo instaces creation in HBaseWindowsStore
 * STORM-1696: status not sync if zk fails in backpressure
 * STORM-1693: Move stats cleanup to executor shutdown
 * STORM-1585: Add DDL support for UDFs in storm-sql
 * STORM-1681: Bug in scheduling cyclic topologies when scheduling with RAS
 * STORM-1706: Add RELEASE and storm-env.sh to storm-diet assembly
 * STORM-1613: Upgraded HBase version to 1.1.0
 * STORM-1687: divide by zero in stats
