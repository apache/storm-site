---
layout: about
---

Apache Storm integrates with many queueing and database systems. Apache Storm's [spout](https://javadoc.io/doc/org.apache.storm/storm-client/latest/org/apache/storm/spout/ISpout.html) abstraction makes it easy to integrate a new queuing system.

Out of the box, Apache Storm ships with integrations for:

- [Apache Kafka](/releases/current/storm-kafka-client.html) (via storm-kafka-client)
- [HDFS](/releases/current/storm-hdfs.html) (via storm-hdfs)
- [JDBC databases](/releases/current/storm-jdbc.html) (via storm-jdbc)
- [JMS](/releases/current/storm-jms.html) (via storm-jms)
- [Redis](/releases/current/storm-redis.html) (via storm-redis)

Integrating Apache Storm with other systems is straightforward. Simply open a connection to your database or service and read/write like you normally would. Apache Storm will handle the parallelization, partitioning, and retrying on failures when necessary.