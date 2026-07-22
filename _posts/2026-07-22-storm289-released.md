---
layout: post
title: Apache Storm 2.8.9 Released
author: Rui Abreu
---

The Apache Storm community is pleased to announce that version 2.8.9 has been
released and is available from [the downloads page](/downloads.html).

<div style="border: 3px solid #cc0000; background-color: #fff5f5; padding: 16px 20px; margin: 20px 0; border-radius: 4px;">
<h2 style="color: #cc0000; margin-top: 0;">⚠️ End of Life for Apache Storm 2.x</h2>
<p><strong>Apache Storm 2.8.9 is the final release of the Storm 2.x line.</strong> The Storm 2.x
branch will no longer be maintained. There will be no further bug fixes, security
patches, or releases in the 2.x series.</p>
<p>Simultaneously with this release, the community is announcing <strong>Apache Storm 3.0.0</strong>,
which represents the future of the project. All development efforts and community
support will be focused on the Storm 3.x release stream going forward.</p>
<p><strong>Users are strongly encouraged to migrate to <a href="/2026/07/22/storm300-released.html">Apache Storm 3.0.0</a>.</strong>
The API is fully backwards-compatible — migration from Storm 2.x to 3.x should be seamless.</p>
</div>

This release includes bug fixes and library updates for users who need a final
stable 2.x baseline before migrating.

## Thanks

Special thanks are due to all those who have contributed to Apache Storm -- whether
through direct code contributions, documentation, bug reports, or helping other
users on the mailing lists. Your efforts are much appreciated.

## Getting Started

We encourage all users to read the [release notes](/2026/07/22/storm289-released.html)
and the [Apache Storm documentation](https://storm.apache.org/documentation.html).

If you have questions or need help with the migration to Storm 3.x, please reach out
to the community via the [Apache Storm mailing lists](https://storm.apache.org/contribute/Contributing-to-Storm.html).
To report bugs or request features, please open an issue on
[GitHub](https://github.com/apache/storm/issues). The community is happy to help!

## Changes in this Release - Storm 2.8.9

<p>Issues addressed in the 2.8.9 release of Storm. Documentation for this release is available at the <a href="https://storm.apache.org/">Apache Storm project site</a>.</p>

<h2>Enhancements</h2>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8890">#8890</a>] - fix(webapp): guard Flux viewer against js-yaml 5.x empty-input throw (2.x)</li>
</ul>

<h2>Dependency upgrades</h2>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8886">#8886</a>] - [Automated] Update license files after dependency changes (2.x)</li>
	<li>[<a href="https://github.com/apache/storm/pull/8884">#8884</a>] - build(deps): bump byte-buddy.version from 1.18.8 to 1.18.10</li>
	<li>[<a href="https://github.com/apache/storm/pull/8883">#8883</a>] - build(deps): bump io.netty:netty-bom from 4.2.13.Final to 4.2.15.Final</li>
	<li>[<a href="https://github.com/apache/storm/pull/8882">#8882</a>] - build(deps-dev): bump org.jacoco:jacoco-maven-plugin from 0.8.14 to 0.8.15</li>
	<li>[<a href="https://github.com/apache/storm/pull/8881">#8881</a>] - build(deps): bump org.junit:junit-bom from 6.1.0 to 6.1.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8880">#8880</a>] - build(deps): bump netty-tcnative.version from 2.0.77.Final to 2.0.80.Final</li>
	<li>[<a href="https://github.com/apache/storm/pull/8879">#8879</a>] - build(deps): bump org.apache:apache from 38 to 39</li>
	<li>[<a href="https://github.com/apache/storm/pull/8878">#8878</a>] - build(deps): bump org.checkerframework:checker-qual from 4.1.0 to 4.2.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8877">#8877</a>] - build(deps): bump prometheus.client.version from 1.6.1 to 1.8.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8876">#8876</a>] - build(deps-dev): bump com.github.eirslett:frontend-maven-plugin from 2.0.0 to 2.0.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8875">#8875</a>] - build(deps): bump org.apache.hbase:hbase-client from 2.6.5-hadoop3 to 2.6.6-hadoop3</li>
	<li>[<a href="https://github.com/apache/storm/pull/8873">#8873</a>] - build(deps): bump com.google.errorprone:error_prone_annotations from 2.49.0 to 2.50.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8872">#8872</a>] - build(deps): bump commons-logging:commons-logging from 1.3.6 to 1.4.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8871">#8871</a>] - build(deps): bump com.zaxxer:HikariCP from 7.0.2 to 7.1.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8870">#8870</a>] - build(deps): bump com.fasterxml.woodstox:woodstox-core from 7.2.0 to 7.2.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8869">#8869</a>] - build(deps): bump spring.version from 7.0.7 to 7.0.8</li>
	<li>[<a href="https://github.com/apache/storm/pull/8868">#8868</a>] - build(deps-dev): bump cypress from 15.16.0 to 15.18.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8867">#8867</a>] - build(deps): bump activemq.version from 6.2.6 to 6.2.7</li>
	<li>[<a href="https://github.com/apache/storm/pull/8866">#8866</a>] - build(deps): bump cytoscape-dagre from 3.0.0 to 4.0.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8865">#8865</a>] - build(deps-dev): bump webpack-cli from 7.0.3 to 7.1.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8864">#8864</a>] - build(deps-dev): bump webpack from 5.107.2 to 5.108.3 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8863">#8863</a>] - build(deps): bump js-yaml from 4.2.0 to 5.2.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8862">#8862</a>] - build(deps): bump jetty.version from 12.1.9 to 12.1.10</li>
	<li>[<a href="https://github.com/apache/storm/pull/8861">#8861</a>] - build(deps-dev): bump start-server-and-test from 3.0.5 to 3.0.11 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8860">#8860</a>] - build(deps): bump cytoscape from 3.33.4 to 3.34.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8859">#8859</a>] - build(deps): bump storm.kafka.client.version from 4.3.0 to 4.3.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8774">#8774</a>] - Bump com.fasterxml.jackson.core:jackson-databind from 2.21.3 to 2.22.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8773">#8773</a>] - Bump com.fasterxml.jackson:jackson-bom from 2.21.3 to 2.22.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8772">#8772</a>] - Bump redis.clients:jedis from 7.5.0 to 7.5.2</li>
	<li>[<a href="https://github.com/apache/storm/pull/8771">#8771</a>] - Bump org.apache.commons:commons-configuration2 from 2.15.0 to 2.15.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8770">#8770</a>] - Bump io.netty:netty-bom from 4.2.13.Final to 4.2.14.Final</li>
	<li>[<a href="https://github.com/apache/storm/pull/8769">#8769</a>] - Bump surefire.version from 3.5.5 to 3.5.6</li>
	<li>[<a href="https://github.com/apache/storm/pull/8768">#8768</a>] - Bump storm.kafka.client.version from 4.2.0 to 4.3.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8767">#8767</a>] - Bump org.apache.maven.plugins:maven-surefire-report-plugin from 3.5.5 to 3.5.6</li>
	<li>[<a href="https://github.com/apache/storm/pull/8766">#8766</a>] - Bump org.junit:junit-bom from 6.0.3 to 6.1.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8765">#8765</a>] - Bump org.apache.maven.plugins:maven-dependency-plugin from 3.10.0 to 3.11.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8764">#8764</a>] - Bump activemq.version from 6.2.5 to 6.2.6</li>
	<li>[<a href="https://github.com/apache/storm/pull/8763">#8763</a>] - Bump asm.version from 9.10 to 9.10.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8762">#8762</a>] - Bump com.puppycrawl.tools:checkstyle from 8.2 to 13.5.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8761">#8761</a>] - Bump metrics.version from 4.2.38 to 4.2.39</li>
	<li>[<a href="https://github.com/apache/storm/pull/8760">#8760</a>] - Bump js-cookie from 3.0.7 to 3.0.8 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8759">#8759</a>] - Bump terser-webpack-plugin from 5.6.0 to 5.6.1 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8758">#8758</a>] - Bump webpack-cli from 7.0.2 to 7.0.3 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8757">#8757</a>] - Bump cytoscape from 3.33.3 to 3.33.4 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8756">#8756</a>] - Bump com.fasterxml.woodstox:woodstox-core from 7.1.1 to 7.2.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8755">#8755</a>] - Bump js-yaml from 4.1.1 to 4.2.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8754">#8754</a>] - Bump webpack from 5.106.2 to 5.107.2 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8753">#8753</a>] - Bump cypress from 15.15.0 to 15.16.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8752">#8752</a>] - Bump dropwizard.version from 5.0.1 to 5.0.2</li>
	<li>[<a href="https://github.com/apache/storm/pull/8686">#8686</a>] - Bump org.apache.thrift:libthrift from 0.22.0 to 0.23.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8685">#8685</a>] - Bump org.apache.logging.log4j:log4j-bom from 2.25.4 to 2.26.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8684">#8684</a>] - Bump org.apache.commons:commons-configuration2 from 2.14.0 to 2.15.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8683">#8683</a>] - Bump org.mockito:mockito-core from 4.11.0 to 5.23.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8682">#8682</a>] - Bump jakarta.ws.rs:jakarta.ws.rs-api from 3.1.0 to 4.0.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8681">#8681</a>] - Bump asm.version from 9.9.1 to 9.10</li>
	<li>[<a href="https://github.com/apache/storm/pull/8680">#8680</a>] - build(deps): bump jakarta-activation-version from 1.2.1 to 2.0.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8679">#8679</a>] - Bump com.fasterxml.jackson:jackson-bom from 2.21.2 to 2.21.3</li>
	<li>[<a href="https://github.com/apache/storm/pull/8678">#8678</a>] - Bump org.glassfish.jersey:jersey-bom from 3.1.11 to 4.0.2</li>
	<li>[<a href="https://github.com/apache/storm/pull/8677">#8677</a>] - Bump org.clojure:clojure from 1.12.4 to 1.12.5</li>
	<li>[<a href="https://github.com/apache/storm/pull/8675">#8675</a>] - Bump io.netty:netty-bom from 4.2.12.Final to 4.2.13.Final</li>
	<li>[<a href="https://github.com/apache/storm/pull/8673">#8673</a>] - build(deps): bump slf4j.version from 2.0.17 to 2.0.18</li>
	<li>[<a href="https://github.com/apache/storm/pull/8670">#8670</a>] - Bump org.apache.maven:maven-resolver-provider from 3.9.15 to 3.9.16</li>
	<li>[<a href="https://github.com/apache/storm/pull/8666">#8666</a>] - Bump cytoscape-dagre from 2.5.0 to 3.0.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8665">#8665</a>] - Bump start-server-and-test from 3.0.4 to 3.0.5 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8663">#8663</a>] - Bump js-cookie from 3.0.5 to 3.0.7 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8662">#8662</a>] - Bump vis-network from 10.0.3 to 10.1.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8660">#8660</a>] - Bump cypress from 15.14.2 to 15.15.0 in /storm-webapp</li>
</ul>

