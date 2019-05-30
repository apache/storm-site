---
layout: post
title: Storm 2.0.0 Released
author: Apache Storm PMC
---

The Apache Storm community is pleased to announce that version 2.0.0 has been released and is available from [the downloads page](/downloads.html). This release represents a major milestone and accomplishment by the Apache Storm community.

Apache Storm 2.0.0 includes significant improvements in terms of performance, new features, and integration with external systems. In the coming weeks members will post a series of deep dive articles covering new features improvements. In this post we'll highlight some of the key features and changes in this release.

The full list of changes in this release can be found [here](https://www.apache.org/dist/storm/apache-storm-2.0.0/RELEASE_NOTES.html).

## New Architecture Implemented in Java
In previous releases a large part of Storm's core functionality was implemented in Clojure. Storm 2.0.0 has been rearchitected with it's core functionality implemented in pure Java. The new Java-based implementation has improved performance significantly, and made Storm's internal APIs more maintainable and extensible. While Storm's Clojure implementation served it well for many years, it was often cited as a barrier for entry to new contributors. Storm's codebase is now more accessible to developers who don't want to learn Clojure in order to contribute.

## New High Performance Core:
Storm 2.0.0 introduces a new core featuring a leaner threading model, a blazing fast messaging subsystem and a lightweight back pressure model. It is designed to push boundaries on throughput, latency and energy consumption while maintaining backward compatibility. The design was motivated by the observation that existing hardware remains capable of much more than what the best streaming engines can deliver. Storm 2.0 is the first streaming engine to break the 1 microsecond latency barrier.

##New Streams API

Storm 2.0.0 introduces a new typed API for expressing streaming computations more easily using functional style operations. It builds on top of the Storm's core spouts and bolt APIs and automatically fuses multiple operations together to optimize the pipeline.

For more details and examples see the [Stream API documentation](https://github.com/apache/storm/blob/master/docs/Stream-API.md).

## Windowing Enhancements

Storm 2.0.0's Windowing API can save/restore the window state to the configured state backend so that larger continuous windows can be supported. The window boundaries can now be accessed via the APIs.

For more details see [stateful windowing documentation](https://github.com/apache/storm/blob/master/docs/Windowing.md#stateful-windowing).


## Kafka Integration Changes

### Removal of Storm-Kafka
The most significant change to Storm's Kafka integration since 1.x, is that storm-kafka has been removed. The module was deprecated a while back, due to Kafka's deprecation of the underlying client library. Users will have to move to the storm-kafka-client module, which uses Kafka's ´kafka-clients´ library for integration.

For the most part, the migration to storm-kafka-client is straightforward. The documentation for storm-kafka-client contains a helpful mapping between the old and new spout configurations. If you are using any of the storm-kafka spouts, you will need to migrate offset checkpoints to the new spout, to avoid the new spout starting from scratch on your partitions. Storm provides a helper tool to do this which can be found [here](fhttps://github.com/apache/storm/tree/master/external/storm-kafka-migration).

When performing a migration, you should stop your topology, run the migration tool, then redeploy your topology with the storm-kafka-client spout.

### Move to Using the KafkaConsumer.assign API
Storm-kafka-client in Storm 1.x allowed you to use Kafka's own mechanism to manage which spout tasks were responsible for which partitions. This mechanism was a poor fit for Storm, and was deprecated in 1.2.0. It has been [removed entirely in 2.0](https://issues.apache.org/jira/browse/STORM-2542).

The storm-kafka-client Subscription interface has also been removed. It offered too limited control over the subscription behavior. It has been replaced with the TopicFilter and ManualPartitioner interfaces. Unless you were using a custom Subscription implementation, this will likely not
affect you. If you were using a custom Subscription, [the storm-kafka-client documentation describes how to customize assignment](https://github.com/apache/storm/blob/master/docs/storm-kafka-client.md#manual-partition-assigment-advanced).


### Other Kafka Highlights
* The KafkaBolt now allows you to [specify a callback that will be called when a batch is written to Kafka](https://issues.apache.org/jira/browse/STORM-3175).
* The FirstPollOffsetStrategy behavior has been made consistent between the non-Trident and Trident spouts. It is now always the case that EARLIEST/LATEST only take effect on topology redeploy, and not when a worker restarts https://issues.apache.org/jira/browse/STORM-2990.
* Storm-kafka-client now has a transactional non-opaque Trident spout https://issues.apache.org/jira/browse/STORM-2974.
* There are new example modules for storm-kafka-client. You can find them [here](https://github.com/apache/storm/tree/master/examples/storm-kafka-client-examples).
* Deprecated methods in KafkaSpoutConfig have been removed. If you are using one of the deprecated methods, check the Javadoc for the latest 1.2.x release, which describes the replacement for each method.

## EOL for 1.0.x
With the release of 2.0.0 the 1.0.x version line will no longer be maintained. 1.0.x users are strongly encouraged to upgrade to a more recent release.

## Move to Java 8
Java 7 support has been dropped, and Storm 2.0.0 requires Java 8.

## Reorganization of Storm Maven artifacts
The storm-core artifact has [been split](https://issues.apache.org/jira/browse/STORM-2441) into client and server-facing parts. Topology jars should depend on the following artifact as of Storm 2.0.0:

```
<groupId>org.apache.storm</groupId>
<artifactId>storm-client</artifactId>
<version>2.0.0</version>
<scope>provided</scope>
```

Projects using `LocalCluster` for testing will additionally need to depend on the Storm server jar:

```
<groupId>org.apache.storm</groupId>
<artifactId>storm-server</artifactId>
<version>2.0.0</version>
<scope>test</scope>
```

## Stay Tuned
Keep an eye on the Apache Storm blog for additional posts by Storm contributors for more in-depth discussions of new features in Storm 2.0.0 including:

* SQL enhancements
* Metrics improvements
* New security features such as nimbus admin groups, delegation tokens, and optional impersonation
* Module restructuring & dependency resolution improvements
* API improvements
* Lambda support
* Resource Aware Scheduler enhancements
* New admin commands for debugging cluster state


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether through direct code contributions, documentation, bug reports, or helping other users on the mailing lists. Your efforts are much appreciated.


