---
layout: post
title: Apache Storm 2.8.2 Released
author: Rui Abreu
---

The Apache Storm community is pleased to announce that version 2.8.2 has been
released and is available from [the downloads page](/downloads.html).

This release includes new features as well as a number of code improvements, bug fixes and library updates.
We encourage users of previous versions to upgrade to this latest release.

## Thanks

Special thanks are due to all those who have contributed to Apache Storm -- whether
through direct code contributions, documentation, bug reports, or helping other
users on the mailing lists. Your efforts are much appreciated.

## Note

This will be the last release supporting `storm-sql-*` modules, as we currently lack the expertise and active maintainers in this area to continue providing it adequate support.

## Changes in this Release - Storm 2.8.2

<p>JIRA issues addressed in the 2.8.2 release of Storm. Documentation for this release is available at the <a href="https://storm.apache.org/">Apache Storm project site</a>.</p>

<h2>Dependency upgrade</h2>
<ul>
	<li>[<a href="https://github.com/apache/storm/issues/8193">#8193</a>] - Bump com.fasterxml.woodstox:woodstox-core from 7.1.0 to 7.1.1</li>
	<li>[<a href="https://github.com/apache/storm/issues/8190">#8190</a>] - Bump org.junit:junit-bom from 5.13.3 to 5.13.4</li>
	<li>[<a href="https://github.com/apache/storm/issues/8185">#8185</a>] - Updates Dependencies (Jackson 2.19.2, Spring 6.2.9, Resolver 2.19.11, Commons IO 2.20.0, Netty 4.2.3.Final, Hbase 2.6.3, Hikari 6.3.1)</li>
	<li>[<a href="https://github.com/apache/storm/issues/8173">#8173</a>] - Bump org.apache.commons:commons-lang3 from 3.17.0 to 3.18.0</li>
	<li>[<a href="https://github.com/apache/storm/issues/8172">#8172</a>] - Bump prometheus.client.version from 1.3.9 to 1.3.10</li>
	<li>[<a href="https://github.com/apache/storm/issues/8171">#8171</a>] - Bump com.github.ben-manes.caffeine:caffeine from 3.2.1 to 3.2.2</li>
	<li>[<a href="https://github.com/apache/storm/issues/8170">#8170</a>] - Bump org.apache.logging.log4j:log4j-bom from 2.25.0 to 2.25.1</li>
	<li>[<a href="https://github.com/apache/storm/issues/8163">#8163</a>] - Bump org.apache.thrift:libthrift from 0.19.0 to 0.22.0 #</li>
	<li>[<a href="https://github.com/apache/storm/issues/8162">#8162</a>] - Bump prometheus.client.version from 1.3.8 to 1.3.9</li>
	<li>[<a href="https://github.com/apache/storm/issues/8161">#8161</a>] - Bump org.checkerframework:checker-qual from 3.49.4 to 3.49.5</li>
	<li>[<a href="https://github.com/apache/storm/issues/8160">#8160</a>] - Bump com.google.errorprone:error_prone_annotations from 2.38.0 to 2.39.0</li>
	<li>[<a href="https://github.com/apache/storm/issues/8159">#8159</a>] - Bump maven-resolver.version from 1.9.23 to 1.9.24</li>
	<li>[<a href="https://github.com/apache/storm/issues/8158">#8158</a>] - Bump org.apache.maven.plugins:maven-pmd-plugin from 3.26.0 to 3.27.0</li>
	<li>[<a href="https://github.com/apache/storm/issues/8157">#8157</a>] - Bump testcontainers.version from 1.21.2 to 1.21.3</li>
	<li>[<a href="https://github.com/apache/storm/issues/8156">#8156</a>] - Bump org.junit:junit-bom from 5.13.1 to 5.13.3</li>
	<li>[<a href="https://github.com/apache/storm/issues/8145">#8145</a>] - Bump metrics.version from 4.2.32 to 4.2.33</li>
	<li>[<a href="https://github.com/apache/storm/issues/8144">#8144</a>] - Bump activemq.version from 6.1.6 to 6.1.7</li>
	<li>[<a href="https://github.com/apache/storm/issues/8143">#8143</a>] - Bump org.apache.logging.log4j:log4j-bom from 2.24.3 to 2.25.0</li>
	<li>[<a href="https://github.com/apache/storm/issues/8142">#8142</a>] - Bump testcontainers.version from 1.21.1 to 1.21.2</li>
	<li>[<a href="https://github.com/apache/storm/issues/8141">#8141</a>] - Bump org.codehaus.mojo:license-maven-plugin from 2.5.0 to 2.6.0</li>
	<li>[<a href="https://github.com/apache/storm/issues/8140">#8140</a>] - Bump byte-buddy.version from 1.17.5 to 1.17.6</li>
	<li>[<a href="https://github.com/apache/storm/issues/8131">#8131</a>] - Bump org.apache:apache from 30 to 35</li>
	<li>[<a href="https://github.com/apache/storm/issues/8130">#8130</a>] - Bump spring.version from 6.2.7 to 6.2.8</li>
	<li>[<a href="https://github.com/apache/storm/issues/8129">#8129</a>] - Bump com.fasterxml.jackson.core:jackson-databind from 2.19.0 to 2.19.1</li>
	<li>[<a href="https://github.com/apache/storm/issues/8128">#8128</a>] - Bump com.fasterxml.jackson:jackson-bom from 2.19.0 to 2.19.1</li>
	<li>[<a href="https://github.com/apache/storm/issues/8122">#8122</a>] - Bump commons-fileupload:commons-fileupload from 1.5 to 1.6.0</li>
	<li>[<a href="https://github.com/apache/storm/issues/8121">#8121</a>] - Bump io.netty:netty-bom from 4.2.1.Final to 4.2.2.Final</li>
	<li>[<a href="https://github.com/apache/storm/issues/8119">#8119</a>] - Bump org.apache.maven:maven-resolver-provider from 3.9.9 to 3.9.10</li>
	<li>[<a href="https://github.com/apache/storm/issues/8117">#8117</a>] - Bump org.clojure:clojure from 1.12.0 to 1.12.1</li>
	<li>[<a href="https://github.com/apache/storm/issues/8116">#8116</a>] - Bump bouncycastle.version from 1.80 to 1.81</li>
	<li>[<a href="https://github.com/apache/storm/issues/8115">#8115</a>] - Bump org.junit:junit-bom from 5.13.0 to 5.13.1</li>
	<li>[<a href="https://github.com/apache/storm/issues/8114">#8114</a>] - Bump org.codehaus.mojo:build-helper-maven-plugin from 3.6.0 to 3.6.1</li>
	<li>[<a href="https://github.com/apache/storm/issues/8104">#8104</a>] - Bump metrics.version from 4.2.30 to 4.2.32</li>
	<li>[<a href="https://github.com/apache/storm/issues/8103">#8103</a>] - Bump dropwizard.version from 4.0.13 to 4.0.14</li>
	<li>[<a href="https://github.com/apache/storm/issues/8102">#8102</a>] - Bump prometheus.client.version from 1.3.7 to 1.3.8</li>
	<li>[<a href="https://github.com/apache/storm/issues/8100">#8100</a>] - Bump org.apache.commons:commons-exec from 1.4.0 to 1.5.0</li>
	<li>[<a href="https://github.com/apache/storm/issues/8099">#8099</a>] - Bump com.fasterxml.woodstox:woodstox-core from 7.1.0 to 7.1.1</li>
	<li>[<a href="https://github.com/apache/storm/issues/8098">#8098</a>] - Bump org.apache.maven.plugins:maven-clean-plugin from 3.4.1 to 3.5.0</li>
	<li>[<a href="https://github.com/apache/storm/issues/8097">#8097</a>] - Bump org.junit:junit-bom from 5.12.2 to 5.13.0</li>
	<li>[<a href="https://github.com/apache/storm/issues/8096">#8096</a>] - Bump testcontainers.version from 1.21.0 to 1.21.1</li>
	<li>[<a href="https://github.com/apache/storm/issues/8095">#8095</a>] - Bump org.codehaus.mojo:exec-maven-plugin from 3.5.0 to 3.5.1</li>
	</ul>

<h2>Bug fixing</h2>
<ul>
	<li>[<a href="https://github.com/apache/storm/issues/8188">#8188</a>] - [SECURITY] Storm Nimbus exposes Github personal token in Git remote URL</li>
	<li>[<a href="https://github.com/apache/storm/issues/8019">#8019</a>] - Kafka totalSpoutLag does not equal the sum of the partitions</li>
</ul>
