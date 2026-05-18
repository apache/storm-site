---
layout: post
title: Apache Storm 2.8.8 Released
author: Rui Abreu
---

The Apache Storm community is pleased to announce that version 2.8.8 has been
released and is available from [the downloads page](/downloads.html).

This release includes security fixes, new features, bug fixes, and library updates.
We encourage users of previous versions to upgrade to this latest release.

## Thanks

Special thanks are due to all those who have contributed to Apache Storm -- whether
through direct code contributions, documentation, bug reports, or helping other
users on the mailing lists. Your efforts are much appreciated.


## Changes in this Release - Storm 2.8.8

<p>JIRA issues addressed in the 2.8.8 release of Storm. Documentation for this release is available at the <a href="https://storm.apache.org/">Apache Storm project site</a>.</p>

<h2>Bug fixing</h2>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8591">#8591</a>] - STORM-4041: fix(topology_lag): Kafka Topology Lag breaking when no offsets are committed (Backport #8589)</li>
</ul>

<h2>Dependency upgrades</h2>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8643">#8643</a>] - Bump com.fasterxml.jackson.core:jackson-databind from 2.21.2 to 2.21.3</li>
	<li>[<a href="https://github.com/apache/storm/pull/8642">#8642</a>] - Bump joda-time:joda-time from 2.14.1 to 2.14.2</li>
	<li>[<a href="https://github.com/apache/storm/pull/8641">#8641</a>] - Bump org.checkerframework:checker-qual from 3.55.1 to 4.1.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8640">#8640</a>] - Bump io.netty:netty-bom from 4.2.12.Final to 4.2.13.Final</li>
	<li>[<a href="https://github.com/apache/storm/pull/8639">#8639</a>] - Bump mockito.version from 4.11.0 to 5.23.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8637">#8637</a>] - Bump org.yaml:snakeyaml from 2.2 to 2.6</li>
	<li>[<a href="https://github.com/apache/storm/pull/8636">#8636</a>] - Bump commons-io:commons-io from 2.21.0 to 2.22.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8635">#8635</a>] - Bump activemq.version from 6.2.4 to 6.2.5</li>
	<li>[<a href="https://github.com/apache/storm/pull/8632">#8632</a>] - Bump org.glassfish.jersey:jersey-bom from 3.1.11 to 4.0.2</li>
	<li>[<a href="https://github.com/apache/storm/pull/8631">#8631</a>] - Bump org.apache.maven:maven-resolver-provider from 3.9.14 to 3.9.15</li>
	<li>[<a href="https://github.com/apache/storm/pull/8630">#8630</a>] - Bump com.google.code.gson:gson from 2.13.2 to 2.14.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8628">#8628</a>] - Bump netty-tcnative.version from 2.0.75.Final to 2.0.77.Final</li>
	<li>[<a href="https://github.com/apache/storm/pull/8627">#8627</a>] - Bump com.puppycrawl.tools:checkstyle from 8.2 to 13.4.2</li>
	<li>[<a href="https://github.com/apache/storm/pull/8626">#8626</a>] - Bump redis.clients:jedis from 7.4.1 to 7.5.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8624">#8624</a>] - Bump com.github.ben-manes.caffeine:caffeine from 3.2.3 to 3.2.4</li>
	<li>[<a href="https://github.com/apache/storm/pull/8622">#8622</a>] - Bump jetty.version from 12.1.8 to 12.1.9</li>
	<li>[<a href="https://github.com/apache/storm/pull/8621">#8621</a>] - Bump datatables.net-bs5 from 2.3.7 to 2.3.8 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8620">#8620</a>] - Bump start-server-and-test from 3.0.0 to 3.0.4 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8619">#8619</a>] - Bump cytoscape from 3.33.2 to 3.33.3 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8617">#8617</a>] - Bump datatables.net-dt from 2.3.7 to 2.3.8 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8614">#8614</a>] - Bump prometheus.client.version from 1.5.1 to 1.6.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8613">#8613</a>] - Bump webpack from 5.105.4 to 5.106.2 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8610">#8610</a>] - Bump terser-webpack-plugin from 5.4.0 to 5.6.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8609">#8609</a>] - Bump datatables.net from 2.3.7 to 2.3.8 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8607">#8607</a>] - Bump commons-codec:commons-codec from 1.21.0 to 1.22.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8606">#8606</a>] - Bump vis-network from 10.0.2 to 10.0.3 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8604">#8604</a>] - Bump org.apache:apache from 37 to 38</li>
	<li>[<a href="https://github.com/apache/storm/pull/8602">#8602</a>] - Bump vis-data from 8.0.3 to 8.0.4 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8601">#8601</a>] - Bump spring.version from 7.0.6 to 7.0.7</li>
	<li>[<a href="https://github.com/apache/storm/pull/8599">#8599</a>] - Bump cypress from 15.13.0 to 15.14.2 in /storm-webapp</li>
</ul>

<h2>Enhancements</h2>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8595">#8595</a>] - Update 2.x documentation links to javadoc.io, fix Jekyll rendering, and optimize CI matrix</li>
</ul>
