---
layout: post
title: Apache Storm 2.5.0 Released
author: Bipin Prasad
---

The Apache Storm community is pleased to announce that  version 2.6.0 has been
released and is available from [the downloads page](/downloads.html).

This release includes a number of code improvements and important bug fixes 
that improve Apache Storm's performance, stability and fault tolerance. 

With Storm 2.6.0 we have removed the following external components / modules **without** a replacement:

- storm-cassandra
- storm-eventhubsgi
- storm-hbase
- storm-hive
- storm-kinesis
- storm-mongodb
- storm-mqtt
- storm-openmtsdb
- storm-pmml
- storm-pulsar
- storm-rocketmq
- storm-solr

We might consider re-adding specific components, if there is specific need and 
volunteers to maintain these components. In addition, this release **drops** Java 8 support. 

We encourage users of previous versions to upgrade to this latest release.


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether 
through direct code contributions, documentation, bug reports, or helping other 
users on the mailing lists. Your efforts are much appreciated.


Changes in this Release - Storm 2.6.0
---------
<p>JIRA issues addressed in the 2.6.0 release of Storm. Documentation for this
    release is available at the <a href="http://storm.apache.org/">Apache Storm
    project site</a>.</p>

<h2>New Feature</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-1241">STORM-1241</a>] - port  backtype.storm.security.auth.auto-login-module-test to java</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-1316">STORM-1316</a>] - port storm.trident.state-test to java</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3901">STORM-3901</a>] - Upgrade Kryo from version 4 to version 5.4.0</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3958">STORM-3958</a>] - Capacity to set Storm UI's title in conf/storm.yaml</li>
</ul>

<h2>Improvement</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-3762">STORM-3762</a>] - Set a default character set in InputStreamReader to solve potential garbled problems</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3764">STORM-3764</a>] - Nimbus has internal scheduling errors when backtracking</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3771">STORM-3771</a>] - Execute doCleanup in its own timer thread without lock</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3782">STORM-3782</a>] - Refactor KafkaOffsetMetric to use V2 metrics</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3792">STORM-3792</a>] - Change pom.xml to use more test JVM threads without reuse</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3800">STORM-3800</a>] - Fix Resocue leak due to Files.list and Files.walk</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3825">STORM-3825</a>] - update libthrift due to security vulnerability</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3845">STORM-3845</a>] - Upgrade activemq version from 5.15.3 to 5.18.2</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3888">STORM-3888</a>] - HdfsBlobStoreFile set wrong permission for file</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3914">STORM-3914</a>] - Several External Modules as not being tested for JDK 11</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3919">STORM-3919</a>] - Upgrade Hadoop to version 3 (+ depending frameworks: Hive, HBase)</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3948">STORM-3948</a>] - Hive 2.3.9 declares an offline / unmaintained maven repository</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3980">STORM-3980</a>] - Updates developer docs and removing obsolete content </li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3983">STORM-3983</a>] - Refactor File.createTempFile with Files.create(...)</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4003">STORM-4003</a>] - storm-kafka-monitor fails with Java 17 runtime, missing jakarta.xml.bind dependency</li>
</ul>

<h2>Bug</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-3404">STORM-3404</a>] - storm v1.2.2 KafkaOffsetLagUtil cant pull the offset correctly</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3924">STORM-3924</a>] - Support for declaring WorkerHook in Flux topology definitions</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3944">STORM-3944</a>] - ConcurrentModificationException  in MultiCountMetric</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3954">STORM-3954</a>] - Remove Logback pulled in by Zookeeper</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3956">STORM-3956</a>] - Fix cli monitor component's argument type </li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3984">STORM-3984</a>] - Nimbus failover causes unnecessary reassign if 600s are passed after starting Nimbus</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3994">STORM-3994</a>] - LocalCluster init fails on Windows because of missing librocksdbjni-win64.dll</li>
</ul>

<h2>Task</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-3932">STORM-3932</a>] - Fix errors/warnings found while generating javadoc in storm-client</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3933">STORM-3933</a>] - Fix errors/warnings found while generating javadoc in storm-server</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3935">STORM-3935</a>] - Fix errors/warnings found while generating javadoc in storm-cassandra</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3936">STORM-3936</a>] - Fix errors/warnings found while generating javadoc in storm-kafka-client</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3937">STORM-3937</a>] - Fix errors/warnings found while generating javadoc in storm-starter</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3939">STORM-3939</a>] - Remove JDK 8 support</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3941">STORM-3941</a>] - Add .asf.yaml to GitHub repository</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3945">STORM-3945</a>] - Upgrade Zookeeper to 3.9.0 / Curator 5</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3953">STORM-3953</a>] - Update RELEASING.md</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3955">STORM-3955</a>] - Dependabot recommended update to maven-core</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3963">STORM-3963</a>] - Import and Build Apache Storm in Eclipse</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3965">STORM-3965</a>] - Remove illegal access warning in JDK11 test of storm-sql-core</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3967">STORM-3967</a>] - Set generated sources directory for use by IDE like eclipse</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3968">STORM-3968</a>] - Add missing groupId in storm-core/pom.xml for maven-dependency-plugin</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3970">STORM-3970</a>] - storm-sql-core in fails to build Eclipse for generated java code</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3978">STORM-3978</a>] - Rep,ace json-simple with minidev json</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3988">STORM-3988</a>] - Removal of modules residing in /external</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3999">STORM-3999</a>] - Add Java 21 to Build Matrix</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4001">STORM-4001</a>] - log4j2 2.21.1</li>
</ul>

<h2>Dependency upgrade</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-3884">STORM-3884</a>] - Bump calcite-core from 1.14.0 to 1.32.0</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3885">STORM-3885</a>] - Security fix upgrade com.fasterxml.jackson.core:jackson-databind to 2.15.2</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3946">STORM-3946</a>] - Upgrade Netty BOM</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3947">STORM-3947</a>] - Align Netty with version used in Zookeeper</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3949">STORM-3949</a>] - libthrift 0.18.1</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3950">STORM-3950</a>] - Modernize storm-jdbc</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3961">STORM-3961</a>] - Modernize Storm UI's 3rd party dependencies</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3972">STORM-3972</a>] - commons-lang3 3.13.0</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3973">STORM-3973</a>] - log4j2 2.20.0</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3974">STORM-3974</a>] - Jersey 2.40</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3975">STORM-3975</a>] - Dropwizard 1.3.29</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3976">STORM-3976</a>] - j2html 1.6.0</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3977">STORM-3977</a>] - Minidev JSON 2.5.0</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3979">STORM-3979</a>] - JUnit 5.10.0</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3986">STORM-3986</a>] - Get rid of BlacklistScheduler timer [INFO] logs</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3987">STORM-3987</a>] - Zookeeper 3.9.1</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3989">STORM-3989</a>] - Snappy Java 1.1.10.4</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3990">STORM-3990</a>] - Hadoop 2.10.2</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3991">STORM-3991</a>] - Avro 1.11.3</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3993">STORM-3993</a>] - ActiveMQ 5.18.3</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3995">STORM-3995</a>] - commons-text 1.11.0</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3996">STORM-3996</a>] - Jetty 9.4.53.v20231009</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3997">STORM-3997</a>] - Netty 4.1.100</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3998">STORM-3998</a>] - Guava 32.1.3-jre</li>
</ul>

<h2>Documentation</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-3982">STORM-3982</a>] - Update README.md, DOAP/RDF and Dev section in POM</li>
</ul>

<h2>Requirement</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-3840">STORM-3840</a>] - log4j vulnerability</li>
</ul>