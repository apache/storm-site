---
title: Documentation
layout: documentation
documentation: true
---


> #### NOTE

> In the latest version, the class packages have been changed from "backtype.storm" to "org.apache.storm" so the topology code compiled with older version won't run on the Storm 1.0.0 just like that. Backward compatibility is available through following configuration 

> `client.jartransformer.class: "org.apache.storm.hack.StormShadeTransformer"`

> You need to add the above config in storm installation if you want to run the code compiled with older versions of storm. The config should be added in the machine you use to submit your topologies.

> Refer to https://issues.apache.org/jira/browse/STORM-1202 for more details. 


### Basics of Storm

* [Javadoc](javadocs/index.html)
* [Concepts](Concepts.html)
* [Scheduler](Storm-Scheduler.html)
* [Configuration](Configuration.html)
* [Guaranteeing message processing](Guaranteeing-message-processing.html)
* [Daemon Fault Tolerance](Daemon-Fault-Tolerance.html)
* [Command line client](Command-line-client.html)
* [REST API](STORM-UI-REST-API.html)
* [Understanding the parallelism of a Storm topology](Understanding-the-parallelism-of-a-Storm-topology.html)
* [FAQ](FAQ.html)

### Layers on Top of Storm

#### Trident

Trident is an alternative interface to Storm. It provides exactly-once processing, "transactional" datastore persistence, and a set of common stream analytics operations.

* [Trident Tutorial](Trident-tutorial.html)     -- basic concepts and walkthrough
* [Trident API Overview](Trident-API-Overview.html) -- operations for transforming and orchestrating data
* [Trident State](Trident-state.html)        -- exactly-once processing and fast, persistent aggregation
* [Trident spouts](Trident-spouts.html)       -- transactional and non-transactional data intake
* [Trident RAS API](Trident-RAS-API.html)     -- using the Resource Aware Scheduler with Trident.

#### SQL

The Storm SQL integration allows users to run SQL queries over streaming data in Storm.  

NOTE: Storm SQL is an `experimental` feature, so the internals of Storm SQL and supported features are subject to change. 
But small change will not affect the user experience. We will notify the user when breaking UX change is introduced.

* [Storm SQL overview](storm-sql.html)
* [Storm SQL example](storm-sql-example.html)
* [Storm SQL reference](storm-sql-reference.html)
* [Storm SQL internal](storm-sql-internal.html)

#### Flux

* [Flux Data Driven Topology Builder](flux.html)

### Setup and Deploying

* [Setting up a Storm cluster](Setting-up-a-Storm-cluster.html)
* [Local mode](Local-mode.html)
* [Troubleshooting](Troubleshooting.html)
* [Running topologies on a production cluster](Running-topologies-on-a-production-cluster.html)
* [Building Storm](Maven.html) with Maven
* [Setting up a Secure Cluster](SECURITY.html)
* [Pacemaker reduces load on zookeeper for large clusters](Pacemaker.html)
* [Resource Aware Scheduler](Resource_Aware_Scheduler_overview.html)
* [Daemon Metrics/Monitoring](storm-metrics-profiling-internal-actions.html)
* [Windows users guide](windows-users-guide.html)
* [Classpath handling](Classpath-handling.html)

### Intermediate

* [Serialization](Serialization.html)
* [Common patterns](Common-patterns.html)
* [Clojure DSL](Clojure-DSL.html)
* [Using non-JVM languages with Storm](Using-non-JVM-languages-with-Storm.html)
* [Distributed RPC](Distributed-RPC.html)
* [Transactional topologies](Transactional-topologies.html)
* [Hooks](Hooks.html)
* [Metrics (Deprecated)](Metrics.html)
* [Metrics V2](metrics_v2.html)
* [State Checkpointing](State-checkpointing.html)
* [Windowing](Windowing.html)
* [Joining Streams](Joins.html)
* [Blobstore(Distcahce)](distcache-blobstore.html)

### Debugging
* [Dynamic Log Level Settings](dynamic-log-level-settings.html)
* [Searching Worker Logs](Logs.html)
* [Worker Profiling](dynamic-worker-profiling.html)
* [Event Logging](Eventlogging.html)

### Integration With External Systems, and Other Libraries
* [Apache Kafka Integration](storm-kafka.html), [New Kafka Consumer Integration](storm-kafka-client.html)
* [Apache HBase Integration](storm-hbase.html)
* [Apache HDFS Integration](storm-hdfs.html)
* [Apache Hive Integration](storm-hive.html)
* [Apache Solr Integration](storm-solr.html)
* [Apache Cassandra Integration](storm-cassandra.html)
* [JDBC Integration](storm-jdbc.html)
* [JMS Integration](storm-jms.html)
* [Redis Integration](storm-redis.html)
* [Event Hubs Intergration](storm-eventhubs.html)
* [Elasticsearch Integration](storm-elasticsearch.html)
* [MQTT Integration](storm-mqtt.html)
* [Mongodb Integration](storm-mongodb.html)
* [OpenTSDB Integration](storm-opentsdb.html)
* [Kinesis Integration](storm-kinesis.html)
* [Druid Integration](storm-druid.html)
* [Kestrel Integration](Kestrel-and-Storm.html)

#### Container, Resource Management System Integration

* [YARN Integration](https://github.com/yahoo/storm-yarn), [YARN Integration via Slider](http://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.3.2/bk_yarn_resource_mgt/content/ref-7d103a48-7c2e-4b7b-aab5-62c739a32ee0.1.html)
* [Mesos Integration](https://github.com/mesos/storm)
* [Docker Integration](https://hub.docker.com/_/storm/)
* [Kubernetes Integration](https://github.com/kubernetes/kubernetes/tree/master/examples/storm)

### Advanced

* [Defining a non-JVM language DSL for Storm](Defining-a-non-jvm-language-dsl-for-storm.html)
* [Multilang protocol](Multilang-protocol.html) (how to provide support for another language)
* [Implementation docs](Implementation-docs.html)

