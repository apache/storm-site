---
layout: post
title: Apache Storm 0.10.1 Released
author: P. Taylor Goetz
---

The Apache Storm community is pleased to announce that version 0.10.1 has been released and is available from [the downloads page](/downloads.html).

This is a maintenance release that includes a number of important bug fixes that improve Apache Storm's performance, stability and fault tolerance. We encourage users of previous versions to upgrade to this latest release.


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether through direct code contributions, documentation, bug reports, or helping other users on the mailing lists. Your efforts are much appreciated.


Full Changelog
---------

 * STORM-1731: Avoid looking up debug enable flags within critical path
 * STORM-1645: convert nimbus.thrift.port to int to avoid ClassCastException
 * STORM-1535: Make sure hdfs key tab login happens only once for multiple bolts/executors
 * STORM-584: Fix logging for LoggingMetricsConsumer metrics.log file
 * STORM-1603: Storm UT fails on supervisor test in Windows (0.10.x)
 * STORM-1596: Do not use single Kerberos TGT instance between multiple threads
 * STORM-1482: add missing 'break' for RedisStoreBolt
 * STORM-1481: avoid Math.abs(Integer) get a negative value
 * STORM-1121: Deprecate test only configuraton nimbus.reassign
 * STORM-1180: FLUX logo wasn't appearing quite right
