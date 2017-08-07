---
layout: post
title: Storm 1.1.1 Released
author: P. Taylor Goetz
---

The Apache Storm community is pleased to announce that version 1.1.1 has been released and is available from [the downloads page](/downloads.html).

This is a maintenance release that includes a number of important bug fixes that improve Storm's performance, stability and fault tolerance. We encourage users of previous versions to upgrade to this latest release.


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether through direct code contributions, documentation, bug reports, or helping other users on the mailing lists. Your efforts are much appreciated.


Full Changelog
---------

 * STORM-2659: Add daemon.name variable to storm.cmd to fix log4j logging
 * STORM-2652: fix error in open method of JmsSpout
 * STORM-2645: Update storm.py to be python3 compatible
 * STORM-2621: add tuple_population metric
 * STORM-2639: Kafka Spout incorrectly computes numCommittedOffsets due to voids in the topic (topic compaction)
 * STORM-2544: Fixing issue in acking of tuples that hit retry limit under manual commit mode
 * STORM-2618: Add TridentKafkaStateUpdater for storm-kafka-client
 * STORM-2608: Remove any pending offsets that are no longer valid
 * STORM-2503: Fix lgtm.com alerts on equality and comparison operations
 * STORM-2478: Fix BlobStoreTest.testDeleteAfterFailedCreate on Windows
 * STORM-2602: storm.zookeeper.topology.auth.payload doesn't work even you set it
 * STORM-2597: Don't parse passed in class paths
 * STORM-2564: We should provide a template for storm-cluster-auth.yaml
 * STORM-2568: Fix getTopicsString
 * STORM-2563: Remove the workaround to handle missing UGI.loginUserFromSubject
 * STORM-2552: KafkaSpoutMessageId should be serializable
 * STORM-2562: Use stronger key size than default for blow fish key generator and get rid of stack trace
 * STORM-2557: A bug in DisruptorQueue causing severe underestimation of queue arrival rates
 * STORM-2449: Ensure same key appears only once in State iterator
 * STORM-2516: Fix timing issues with testPrepareLateTupleStreamWithoutBuilder
 * STORM-2489: Overlap and data loss on WindowedBolt based on Duration
 * STORM-2528: Bump log4j version to 2.8.2
 * STORM-2527: Initialize java.sql.DriverManager earlier to avoid deadlock
 * STORM-2413: Make new Kafka spout respect tuple retry limits
 * STORM-2518: Handles empty name for "USER type" ACL when normalizing ACLs
 * STORM-2511: Submitting a topology with name containing unicode getting failed
 * STORM-2496: Dependency artifacts should be uploaded to blobstore with READ permission for all
 * STORM-2505: Spout to support topic compaction
 * STORM-2498: Fix Download Full File link
 * STORM-2343: New Kafka spout can stop emitting tuples if more than maxUncommittedOffsets tuples fail at once.
 * STORM-2486: Prevent cd from printing target directory to avoid breaking classpath
 * STORM-2488: The UI user Must be HTTP.
 * STORM-2481: Upgrade Aether version to resolve Aether bug BUG-451566
 * STORM-2435: Logging in storm.js inconsistent to console.log and does not support log levels
 * STORM-2315: New kafka spout can't commit offset when ack is disabled
 * STORM-2467: Use explicit charset when decoding from array backed buffer
 * STORM-1114: Race condition in trident zookeeper zk-node create/delete
 * STORM-2448: Add in Storm and JDK versions when submitting a topology
 * STORM-2343: Fix new Kafka spout stopping processing if more than maxUncommittedOffsets tuples fail at once
 * STORM-2431: the default blobstore.dir is storm.local.dir/blobs which is different from distcache-blobstore.md
 * STORM-2429: Properly validate supervisor.scheduler.meta
 * STORM-2451: windows storm.cmd does not set log4j2 config file correctly by default
 * STORM-2450: Write resources into correct local director
 * STORM-2440: Kill process if executor catches `java.net.SocketTimeoutException`
 * STORM-2432: Storm-Kafka-Client Trident Spout Seeks Incorrect Offset With UNCOMMITTED_LATEST Strategy