---
layout: post
title: Apache Storm 2.8.6 Released
author: Richard Zowalla
---

The Apache Storm community is pleased to announce that version 2.8.6 has been
released and is available from [the downloads page](/downloads.html).

This release includes security fixes, new features, bug fixes, and library updates.
We encourage users of previous versions to upgrade to this latest release.

## Thanks

Special thanks are due to all those who have contributed to Apache Storm -- whether
through direct code contributions, documentation, bug reports, or helping other
users on the mailing lists. Your efforts are much appreciated.


## Changes in this Release - Storm 2.8.6

<p>JIRA issues addressed in the 2.8.6 release of Storm. Documentation for this release is available at the <a href="https://storm.apache.org/">Apache Storm project site</a>.</p>

<h2>Security Fixes</h2>

<h3>CVE-2026-35337 - Deserialization of Untrusted Data vulnerability in Apache Storm</h3>
<p><strong>Versions Affected:</strong> before 2.8.6.</p>
<p><strong>Description:</strong> When processing topology credentials submitted via the Nimbus Thrift API, Storm deserializes the base64-encoded TGT blob using <code>ObjectInputStream.readObject()</code> without any class filtering or validation. An authenticated user with topology submission rights could supply a crafted serialized object in the <code>"TGT"</code> credential field, leading to remote code execution in both the Nimbus and Worker JVMs.</p>
<p><strong>Mitigation:</strong> 2.x users should upgrade to 2.8.6.</p>
<p>Users who cannot upgrade immediately should monkey-patch an <code>ObjectInputFilter</code> allow-list to <code>ClientAuthUtils.deserializeKerberosTicket()</code> restricting deserialized classes to <code>javax.security.auth.kerberos.KerberosTicket</code> and its known dependencies; see <a href="https://dist.apache.org/repos/dist/release/storm/apache-storm-2.8.6/RELEASE_NOTES.html">for details.</a></p>
<p><strong>Credit:</strong> This issue was discovered by K.</p>

<h3>CVE-2026-35565 - Stored Cross-Site Scripting (XSS) via Unsanitized Topology Metadata in Storm UI</h3>
<p><strong>Versions Affected:</strong> before 2.8.6.</p>
<p><strong>Description:</strong> The Storm UI visualization component interpolates topology metadata including component IDs, stream names, and grouping values directly into HTML via <code>innerHTML</code> in <code>parseNode()</code> and <code>parseEdge()</code> without sanitization at any layer. An authenticated user with topology submission rights could craft a topology containing malicious HTML/JavaScript in component identifiers, resulting in stored cross-site scripting. In multi-tenant deployments, this enables privilege escalation through script execution in an admin's browser session.</p>
<p><strong>Mitigation:</strong> 2.x users should upgrade to 2.8.6.</p>
<p>Users wh ocannot upgrade immediately should monkey-patch the related escaping; see <a href="https://dist.apache.org/repos/dist/release/storm/apache-storm-2.8.6/RELEASE_NOTES.html">for details.</a></p>
<p><strong>Credit:</strong> This issue was discovered while investigating another report by K.</p>

<h2>Enhancements</h2>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8483">#8483</a>] - Migrate to Java 24+ compatible security APIs and add Java 25 to CI</li>
	<li>[<a href="https://github.com/apache/storm/pull/8452">#8452</a>] - Passing Conf object to KryoDecorator</li>
	<li>[<a href="https://github.com/apache/storm/issues/8305">#8305</a>] - Improve dev-tools/release_notes.py to deal with multiple tags in an issue</li>
</ul>

<h2>Dependency upgrades</h2>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8502">#8502</a>] - Bump com.google.errorprone:error_prone_annotations from 2.48.0 to 2.49.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8501">#8501</a>] - Bump redis.clients:jedis from 7.4.0 to 7.4.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8500">#8500</a>] - Bump cytoscape from 3.33.1 to 3.33.2 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8499">#8499</a>] - Bump lodash from 4.17.23 to 4.18.1 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8497">#8497</a>] - Bump io.netty:netty-bom from 4.2.10.Final to 4.2.12.Final</li>
	<li>[<a href="https://github.com/apache/storm/pull/8496">#8496</a>] - Bump jetty.version from 12.1.7 to 12.1.8</li>
	<li>[<a href="https://github.com/apache/storm/pull/8495">#8495</a>] - Bump activemq.version from 6.2.1 to 6.2.3</li>
	<li>[<a href="https://github.com/apache/storm/pull/8494">#8494</a>] - Bump hadoop.version from 3.4.3 to 3.5.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8493">#8493</a>] - Bump start-server-and-test from 2.1.5 to 3.0.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8492">#8492</a>] - Bump mini-css-extract-plugin from 2.10.1 to 2.10.2 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8491">#8491</a>] - Bump webpack-cli from 7.0.0 to 7.0.2 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8490">#8490</a>] - Bump cypress from 15.12.0 to 15.13.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8489">#8489</a>] - Bump actions/upload-artifact from 4.6.2 to 7.0.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8488">#8488</a>] - Bump actions/setup-node from 4.4.0 to 6.3.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8487">#8487</a>] - Bump actions/download-artifact from 4.3.0 to 8.0.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8476">#8476</a>] - Bump org.rocksdb:rocksdbjni from 10.2.1 to 10.10.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8475">#8475</a>] - Bump org.apache.maven:maven-resolver-provider from 3.9.12 to 3.9.14</li>
	<li>[<a href="https://github.com/apache/storm/pull/8474">#8474</a>] - Bump org.apache.maven.plugins:maven-shade-plugin from 3.6.1 to 3.6.2</li>
	<li>[<a href="https://github.com/apache/storm/pull/8473">#8473</a>] - Bump netty-tcnative.version from 2.0.74.Final to 2.0.75.Final</li>
	<li>[<a href="https://github.com/apache/storm/pull/8472">#8472</a>] - Bump com.fasterxml.jackson:jackson-bom from 2.21.1 to 2.21.2</li>
	<li>[<a href="https://github.com/apache/storm/pull/8471">#8471</a>] - Bump io.netty:netty-bom from 4.2.10.Final to 4.2.12.Final</li>
	<li>[<a href="https://github.com/apache/storm/pull/8470">#8470</a>] - Bump joda-time:joda-time from 2.14.0 to 2.14.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8469">#8469</a>] - Bump byte-buddy.version from 1.18.5 to 1.18.8</li>
	<li>[<a href="https://github.com/apache/storm/pull/8468">#8468</a>] - Bump storm.kafka.client.version from 4.1.1 to 4.2.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8467">#8467</a>] - Bump activemq.version from 6.2.1 to 6.2.3</li>
	<li>[<a href="https://github.com/apache/storm/pull/8466">#8466</a>] - Bump org.apache.logging.log4j:log4j-bom from 2.25.3 to 2.25.4</li>
	<li>[<a href="https://github.com/apache/storm/pull/8465">#8465</a>] - Bump prometheus.client.version from 1.5.0 to 1.5.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8464">#8464</a>] - Bump org.checkerframework:checker-qual from 3.53.1 to 3.54.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8463">#8463</a>] - Bump com.github.eirslett:frontend-maven-plugin from 1.15.1 to 2.0.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8462">#8462</a>] - Bump redis.clients:jedis from 7.3.0 to 7.4.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8461">#8461</a>] - Bump commons-logging:commons-logging from 1.3.5 to 1.3.6</li>
	<li>[<a href="https://github.com/apache/storm/pull/8460">#8460</a>] - Bump spring.version from 7.0.5 to 7.0.6</li>
	<li>[<a href="https://github.com/apache/storm/pull/8459">#8459</a>] - Bump jetty.version from 12.1.6 to 12.1.7</li>
	<li>[<a href="https://github.com/apache/storm/pull/8458">#8458</a>] - Bump com.fasterxml.jackson.core:jackson-databind from 2.21.1 to 2.21.2</li>
	<li>[<a href="https://github.com/apache/storm/pull/8447">#8447</a>] - Bump serialize-javascript from 7.0.4 to 7.0.5 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8437">#8437</a>] - Bump ruby/setup-ruby from 1.295.0 to 1.298.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8436">#8436</a>] - Bump picomatch from 4.0.3 to 4.0.4 in /storm-webapp</li>
</ul>

<h2>Bug fixing</h2>
<ul>
	<li>[<a href="https://github.com/apache/storm/issues/8456">#8456</a>] - Storm 2.8.5 GUI using scientific notation in columns for large numbers</li>
	<li>[<a href="https://github.com/apache/storm/pull/8442">#8442</a>] - Fix NPE in getSupervisorPageInfo for unknown hostnames</li>
	<li>[<a href="https://github.com/apache/storm/pull/8441">#8441</a>] - Fix NPE in mkAssignments when assignment is deleted during scheduling</li>
	<li>[<a href="https://github.com/apache/storm/pull/8440">#8440</a>] - Fix corrupted record counter in SequenceFileReader.Offset.increment()</li>
	<li>[<a href="https://github.com/apache/storm/pull/8457">#8457</a>] - Fix scientific notation display for large numbers in Storm UI table</li>
</ul>