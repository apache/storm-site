---
layout: post
title: Apache Storm 2.8.5 Released
author: Rui Abreu
---

The Apache Storm community is pleased to announce that version 2.8.5 has been
released and is available from [the downloads page](/downloads.html).

This release includes new features as well as a number of code improvements, bug fixes and library updates.
We encourage users of previous versions to upgrade to this latest release.

## Thanks

Special thanks are due to all those who have contributed to Apache Storm -- whether
through direct code contributions, documentation, bug reports, or helping other
users on the mailing lists. Your efforts are much appreciated.


## Changes in this Release - Storm 2.8.5

<p>JIRA issues addressed in the 2.8.5 release of Storm. Documentation for this release is available at the <a href="https://storm.apache.org/">Apache Storm project site</a>.</p>

<h2>Enhancements</h2>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8434">#8434</a>] - Upgrade Bootstrap to 5.3.8, add dark mode toggle</li>
	<li>[<a href="https://github.com/apache/storm/pull/8427">#8427</a>] - Use package manager for 3rd party JS in Storm-UI</li>
	<li>[<a href="https://github.com/apache/storm/pull/8415">#8415</a>] - Implement size-based file rotation for FileBasedEventLogger</li>
	<li>[<a href="https://github.com/apache/storm/pull/8414">#8414</a>] - [storm-client] Add missing logging to TridentBoltExecutor on tuple count mismatch failures</li>
	<li>[<a href="https://github.com/apache/storm/pull/8413">#8413</a>] - [storm-client] Replace e.printStackTrace() with SLF4J logging in ConfigurableTopology</li>
</ul>

<h2>Dependency upgrades</h2>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8424">#8424</a>] - Migrate project from commons-lang to commons-lang3</li>
	<li>[<a href="https://github.com/apache/storm/pull/8422">#8422</a>] - Bump org.apache.zookeeper:zookeeper from 3.9.4 to 3.9.5</li>
	<li>[<a href="https://github.com/apache/storm/pull/8412">#8412</a>] - Bump com.google.errorprone:error_prone_annotations from 2.46.0 to 2.48.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8411">#8411</a>] - Bump maven-resolver.version from 1.9.25 to 1.9.27</li>
	<li>[<a href="https://github.com/apache/storm/pull/8410">#8410</a>] - Bump org.apache.maven.plugins:maven-compiler-plugin from 3.14.1 to 3.15.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8409">#8409</a>] - Bump org.jctools:jctools-core from 4.0.5 to 4.0.6</li>
	<li>[<a href="https://github.com/apache/storm/pull/8408">#8408</a>] - Bump org.apache.maven.plugins:maven-dependency-plugin from 3.9.0 to 3.10.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8407">#8407</a>] - Bump io.netty:netty-bom from 4.2.9.Final to 4.2.10.Final</li>
	<li>[<a href="https://github.com/apache/storm/pull/8406">#8406</a>] - Bump org.checkerframework:checker-qual from 3.53.0 to 3.53.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8405">#8405</a>] - Bump prometheus.client.version from 1.4.3 to 1.5.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8404">#8404</a>] - Bump surefire.version from 3.5.4 to 3.5.5</li>
	<li>[<a href="https://github.com/apache/storm/pull/8403">#8403</a>] - Bump com.fasterxml.jackson.core:jackson-databind from 2.20.1 to 2.21.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8402">#8402</a>] - Bump org.junit:junit-bom from 6.0.2 to 6.0.3</li>
	<li>[<a href="https://github.com/apache/storm/pull/8401">#8401</a>] - Bump redis.clients:jedis from 7.2.1 to 7.3.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8400">#8400</a>] - Bump com.fasterxml.jackson:jackson-bom from 2.21.0 to 2.21.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8399">#8399</a>] - Bump netty-tcnative.version from 2.0.74.Final to 2.0.75.Final</li>
	<li>[<a href="https://github.com/apache/storm/pull/8398">#8398</a>] - Bump jakarta.xml.bind:jakarta.xml.bind-api from 4.0.4 to 4.0.5</li>
	<li>[<a href="https://github.com/apache/storm/pull/8397">#8397</a>] - Bump hadoop.version from 3.4.2 to 3.4.3</li>
	<li>[<a href="https://github.com/apache/storm/pull/8396">#8396</a>] - Bump activemq.version from 6.2.0 to 6.2.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8395">#8395</a>] - Bump byte-buddy.version from 1.18.4 to 1.18.5</li>
	<li>[<a href="https://github.com/apache/storm/pull/8394">#8394</a>] - Bump org.apache.maven.plugins:maven-surefire-report-plugin from 3.5.4 to 3.5.5</li>
	<li>[<a href="https://github.com/apache/storm/pull/8393">#8393</a>] - Bump spring.version from 7.0.3 to 7.0.5</li>
</ul>

<h2>Bug fixing</h2>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8420">#8420</a>] - fix(HeartbeatCache): Falsely timing out alive executors when heartbeat TIME_SECS does not advance</li>
	<li>[<a href="https://github.com/apache/storm/issues/8419">#8419</a>] - Nimbus deployment causing Topologies rebalancing</li>
	<li>[<a href="https://github.com/apache/storm/pull/8416">#8416</a>] - Fix silent exception swallow in LocalFsBlobStore.prepare() leaving stormClusterState null</li>
</ul>
