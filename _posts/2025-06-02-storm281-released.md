---
layout: post
title: Apache Storm 2.8.1 Released
author: Rui Abreu
---

The Apache Storm community is pleased to announce that version 2.8.1 has been
released and is available from [the downloads page](/downloads.html).

This release includes new features as well as a number of code improvements, bug fixes and library updates.
We encourage users of previous versions to upgrade to this latest release.


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether
through direct code contributions, documentation, bug reports, or helping other
users on the mailing lists. Your efforts are much appreciated.


Changes in this Release - Storm 2.8.1
---------
<p>JIRA issues addressed in the 2.8.1 release of Storm. Documentation for this release is available at the <a href="https://storm.apache.org/">Apache Storm project site</a>.</p>

<h2>Dependency upgrade</h2>
<ul><li>[<a href="https://github.com/apache/storm/issues/8070">#8070</a>] - Update to Rocksdbjni 10.1.3</li>
		<li>[<a href="https://github.com/apache/storm/issues/8069">#8069</a>] - Update Netty Bom to 4.2.1.Final</li>
		<li>[<a href="https://github.com/apache/storm/issues/8068">#8068</a>] - Update to commons-configuration 2.12.0</li>
		<li>[<a href="https://github.com/apache/storm/issues/8067">#8067</a>] - Update Netty to 2.0.71</li>
		<li>[<a href="https://github.com/apache/storm/issues/8066">#8066</a>] - Update to Jackson 2.19.0</li>
		<li>[<a href="https://github.com/apache/storm/issues/8065">#8065</a>] - Update to commons-collection 4.5.0</li>
		<li>[<a href="https://github.com/apache/storm/issues/8064">#8064</a>] - Update to gson 2.13.1</li>
		<li>[<a href="https://github.com/apache/storm/issues/8063">#8063</a>] - Update to guava 33.4.8</li>
		<li>[<a href="https://github.com/apache/storm/issues/8062">#8062</a>] - Update to commons-io 2.19.0</li>
		<li>[<a href="https://github.com/apache/storm/issues/8045">#8045</a>] - Upgrade to Spring 6 and JMS 3.1 (Jakarta)</li>
		<li>[<a href="https://github.com/apache/storm/issues/8036">#8036</a>] - commons-text 1.13.1</li>
		<li>[<a href="https://github.com/apache/storm/issues/8034">#8034</a>] - Hikari CP 6.3.0</li>
		<li>[<a href="https://github.com/apache/storm/issues/8033">#8033</a>] - dropwizard metrics 4.0.13</li>
		<li>[<a href="https://github.com/apache/storm/issues/8032">#8032</a>] - guava 33.4.7-jre</li>
		<li>[<a href="https://github.com/apache/storm/issues/8031">#8031</a>] - ASM 9.8</li>
		<li>[<a href="https://github.com/apache/storm/issues/8010">#8010</a>] - hbase  2.6.2-hadoop3</li>
		<li>[<a href="https://github.com/apache/storm/issues/8009">#8009</a>] - netty 4.1.119.Final</li>
		<li>[<a href="https://github.com/apache/storm/issues/8008">#8008</a>] - curator 5.8.0</li>
		<li>[<a href="https://github.com/apache/storm/issues/8007">#8007</a>] - guava 33.4.5-jre</li>
		<li>[<a href="https://github.com/apache/storm/issues/8006">#8006</a>] - commons-csv 1.14.0</li>
		<li>[<a href="https://github.com/apache/storm/issues/8005">#8005</a>] - jetty 11.0.25</li>
		<li>[<a href="https://github.com/apache/storm/issues/8004">#8004</a>] - slf4j2 2.0.17</li>
		<li>[<a href="https://github.com/apache/storm/issues/8003">#8003</a>] - Jackson 2.18.3</li>
		<li>[<a href="https://github.com/apache/storm/issues/7970">#7970</a>] - Bump io.netty:netty-bom from 4.1.117.Final to 4.1.118.Final</li>
		<li>[<a href="https://github.com/apache/storm/issues/7969">#7969</a>] - Bump net.minidev:json-smart from 2.5.1 to 2.5.2</li>
		<li>[<a href="https://github.com/apache/storm/issues/7968">#7968</a>] - Bump org.checkerframework:checker-qual from 3.48.4 to 3.49.0</li>
		<li>[<a href="https://github.com/apache/storm/issues/7967">#7967</a>] - Bump prometheus.client.version from 1.3.5 to 1.3.6</li>
		<li>[<a href="https://github.com/apache/storm/issues/7953">#7953</a>] - Bump byte-buddy.version from 1.16.1 to 1.17.0</li>
		<li>[<a href="https://github.com/apache/storm/issues/7952">#7952</a>] - Bump com.google.code.gson:gson from 2.11.0 to 2.12.1</li>
		<li>[<a href="https://github.com/apache/storm/issues/7951">#7951</a>] - Bump commons-codec:commons-codec from 1.17.2 to 1.18.0</li>
		<li>[<a href="https://github.com/apache/storm/issues/7945">#7945</a>] - Bump metrics.version from 4.2.29 to 4.2.30</li>
		<li>[<a href="https://github.com/apache/storm/issues/7944">#7944</a>] - Bump dropwizard.version from 4.0.11 to 4.0.12</li>
		<li>[<a href="https://github.com/apache/storm/issues/7943">#7943</a>] - Bump com.github.ben-manes.caffeine:caffeine from 3.1.8 to 3.2.0</li>
		<li>[<a href="https://github.com/apache/storm/issues/7942">#7942</a>] - Bump io.netty:netty-bom from 4.1.116.Final to 4.1.117.Final</li>
		<li>[<a href="https://github.com/apache/storm/issues/7941">#7941</a>] - Bump bouncycastle.version from 1.79 to 1.80</li>
		<li>[<a href="https://github.com/apache/storm/issues/7940">#7940</a>] - Bump org.rocksdb:rocksdbjni from 9.8.4 to 9.10.0</li>
		<li>[<a href="https://github.com/apache/storm/issues/7939">#7939</a>] - Bump byte-buddy.version from 1.15.11 to 1.16.1</li>
		<li>[<a href="https://github.com/apache/storm/issues/8082">#8082</a>] - Prometheus Client 1.3.7</li>
		<li>[<a href="https://github.com/apache/storm/issues/8081">#8081</a>] - RocksDB 10.2.1</li>
		<li>[<a href="https://github.com/apache/storm/issues/8080">#8080</a>] - spring 6.2.7</li>
		<li>[<a href="https://github.com/apache/storm/issues/8030">#8030</a>] - Netty 4.2.0</li>
		<li>[<a href="https://github.com/apache/storm/issues/8079">#8079</a>] - netty-tcnative 2.0.72.Final</li>
</ul>
<h2>Bug</h2>
<ul><li>[<a href="https://github.com/apache/storm/pull/7955">#7955</a>] - Fix ShellBolt log level</li>
	<li>[<a href="https://github.com/apache/storm/issues/7954">#7954</a>] - o.a.s.t.ShellBolt log level is always INFO</li>
	<li>[<a href="https://github.com/apache/storm/issues/7935">#7935</a>] - [STORM-4155] SecurityManager Issue with JDK 23 in Apache Storm</li>
</ul>
<h2>Enhancement</h2>
<ul><li>[<a href="https://github.com/apache/storm/issues/7947">#7947</a>] - IWorkerHook default start method calls its self</li>
</ul>
<h2>Uncategorized</h2>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/7936">#7936</a>] - Update Release Note Generation and Docs</li>
</ul>