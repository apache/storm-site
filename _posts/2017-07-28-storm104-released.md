---
layout: post
title: Storm 1.0.4 Released
author: P. Taylor Goetz
---

The Apache Storm community is pleased to announce that version 1.0.4 has been released and is available from [the downloads page](/downloads.html).

This is a maintenance release that includes a number of important bug fixes that improve Storm's performance, stability and fault tolerance. We encourage users of previous versions to upgrade to this latest release.


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether through direct code contributions, documentation, bug reports, or helping other users on the mailing lists. Your efforts are much appreciated.


Full Changelog
---------

 * STORM-2627: Update docs for storm.zookeeper.topology.auth.scheme
 * STORM-2597: Don't parse passed in class paths
 * STORM-2524: Set Kafka client.id with storm-kafka
 * STORM-2448: Add in Storm and JDK versions when submitting a topology
 * STORM-2511: Submitting a topology with name containing unicode getting failed
 * STORM-2498: Fix Download Full File link
 * STORM-2486: Prevent cd from printing target directory to avoid breaking classpath
 * STORM-1114: Race condition in trident zookeeper zk-node create/delete
 * STORM-2429: Properly validate supervisor.scheduler.meta
 * STORM-2194: Stop ignoring socket timeout error from executor
 * STORM-2450: Write resources into correct local director
 * STORM-2414: Skip checking meta's ACL when subject has write privileges for any blobs
 * STORM-2038: Disable symlinks with a config option
 * STORM-2038: No symlinks for local cluster 
 * STORM-2403: Fix KafkaBolt test failure: tick tuple should not be acked
 * STORM-2361: Kafka spout - after leader change, it stops committing offsets to ZK
 * STORM-2296: Kafka spout - no duplicates on leader changes
 * STORM-2387: Handle tick tuples properly for Bolts in external modules 
 * STORM-2345: Type mismatch in ReadClusterState's ProfileAction processing Map
 * STORM-2104: New Kafka spout crashes if partitions are reassigned while tuples are in-flight
 * STORM-2396: setting interrupted status back before throwing a RuntimeException
 * STORM-2395: storm.cmd supervisor calls the wrong class name
 * STORM-2385: pacemaker_state_factory.clj does not compile on branch-1.0.x
 * STORM-2389: Avoid instantiating Event Logger when topology.eventlogger.executors=0
 * STORM-2386: Fail-back Blob deletion also fails in BlobSynchronizer.syncBlobs
 * STORM-2360: Storm-Hive: Thrift version mismatch with storm-core
 * STORM-2372: Pacemaker client doesn't clean up heartbeats properly
 * STORM-2326: Upgrade log4j and slf4j
 * STORM-2350: Storm-HDFS's listFilesByModificationTime is broken