---
layout: post
title: Apache Storm 2.7.1 Released
author: Rui Abreu
---

The Apache Storm community is pleased to announce that version 2.7.1 has been
released and is available from [the downloads page](/downloads.html).

This release includes new features as well as a number of code improvements, bug fixes and library updates.
We encourage users of previous versions to upgrade to this latest release.

Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether
through direct code contributions, documentation, bug reports, or helping other
users on the mailing lists. Your efforts are much appreciated.


Changes in this Release - Storm 2.7.1
---------
<p>JIRA issues addressed in the 2.7.1 release of Storm. Documentation for this release is available at the <a href="https://storm.apache.org/">Apache Storm project site</a>.</p>

<h2>Improvement</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-4108">STORM-4108</a>] - Remove joda-time </li>
</ul>

<h2>Bug</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-4104">STORM-4104</a>] - Pacemaker server stability issues - e.g. shuts down when topology killed</li>
    <li>[<a href="https://issues.apache.org/jira/browse/STORM-4106">STORM-4106</a>] - Storm.ps1 does not show stdout\stderr output when launched from Powershell ISE</li>
</ul>

<h2>Task</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-4107">STORM-4107</a>] - Remove ElasticSearch Module</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4128">STORM-4128</a>] - Deprecate "storm-hive"</li>
</ul>

<h2>Dependency upgrade</h2>
<ul><li>[<a href="https://issues.apache.org/jira/browse/STORM-4056">STORM-4056</a>] - Build with -Pnative on MacOS</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4081">STORM-4081</a>] - Dropwizard Metrics 4.2.27</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4082">STORM-4082</a>] - Prometheus Client 1.3.1</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4083">STORM-4083</a>] - Jetty 11.0.23</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4084">STORM-4084</a>] - Commons Compress 1.27.1</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4086">STORM-4086</a>] - Bump com.fasterxml.jackson:jackson-bom from 2.17.2 to 2.18.1</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4087">STORM-4087</a>] - ASM 9.7.1</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4088">STORM-4088</a>] - Curator 5.7.1</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4089">STORM-4089</a>] - Jersey 3.1.9</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4090">STORM-4090</a>] - Kafka Client 3.8.1</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4091">STORM-4091</a>] - commons-io 2.17.0</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4092">STORM-4092</a>] - Prometheus Client 1.3.2</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4093">STORM-4093</a>] - log4j2 2.24.1</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4094">STORM-4094</a>] - JUnit 5.11.3</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4095">STORM-4095</a>] - Hadoop 3.4.1</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4096">STORM-4096</a>] - Metrics 4.2.28</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4097">STORM-4097</a>] - Avro 1.12.0</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4098">STORM-4098</a>] - Prometheus Client 1.3.3</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4099">STORM-4099</a>] - Kafka Client 3.9.0</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4100">STORM-4100</a>] - Rocksdb 9.7.3</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4101">STORM-4101</a>] - Dropwizard 4.0.10</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4102">STORM-4102</a>] - hbase 2.6.1-hadoop3</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4103">STORM-4103</a>] - Guava 33.3.1-jre</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4105">STORM-4105</a>] - clojure 1.12.0</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4109">STORM-4109</a>] - Netty TCNative 2.0.69.Final</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4110">STORM-4110</a>] - Jedis 5.2.0</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4111">STORM-4111</a>] - Zookeeper 3.9.3</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4112">STORM-4112</a>] - Jetty 11.0.24</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4113">STORM-4113</a>] - commons-lang3 3.17.0</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4114">STORM-4114</a>] - jline 2.14.6</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4117">STORM-4117</a>] - Snappy 1.1.10.7</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4118">STORM-4118</a>] - commons-text 1.12.0</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4119">STORM-4119</a>] - commons-codec 1.17.1</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4120">STORM-4120</a>] - gson 2.11.0</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4121">STORM-4121</a>] - commons-csv:1.12.0</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4122">STORM-4122</a>] - commons-exec 1.4.0</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4123">STORM-4123</a>] - Hikari 6.1.0</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4124">STORM-4124</a>] - Bouncycastle 1.79</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4125">STORM-4125</a>] - clojure.logging.tools 1.3.0</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4126">STORM-4126</a>] - Kryo 5.6.2</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4127">STORM-4127</a>] - Netty 4.1.115.Final </li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4129">STORM-4129</a>] - Hikari 6.2.0</li>
	<li>[<a href="https://issues.apache.org/jira/browse/STORM-4130">STORM-4130</a>] - commons cli 1.9.0</li>
</ul>   
