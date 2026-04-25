---
layout: post
title: Apache Storm 2.8.7 Released
author: Rui Abreu
---

The Apache Storm community is pleased to announce that version 2.8.7 has been
released and is available from [the downloads page](/downloads.html).

This release includes security fixes, new features, bug fixes, and library updates.
We encourage users of previous versions to upgrade to this latest release.

## Thanks

Special thanks are due to all those who have contributed to Apache Storm -- whether
through direct code contributions, documentation, bug reports, or helping other
users on the mailing lists. Your efforts are much appreciated.


## Changes in this Release - Storm 2.8.7

<p>JIRA issues addressed in the 2.8.7 release of Storm. Documentation for this release is available at the <a href="https://storm.apache.org/">Apache Storm project site</a>.</p>

<h2>Security Fixes</h2>

<h3><a href="https://www.cve.org/CVERecord?id=CVE-2026-40557">CVE-2026-40557</a> - Improper Certificate Validation via Global SSL Context Downgrade in Apache Storm Prometheus Reporter</h3>
<p><strong>Versions Affected:</strong> from 2.6.3 to 2.8.6.</p>
<p><strong>Description:</strong> In production deployments where an administrator enables <code>storm.daemon.metrics.reporter.plugin.prometheus.skip_tls_validation</code> (by default it is disabled) intending to affect only the Prometheus reporter, the undocumented global side effect creates an attack surface across every TLS-protected communication channel in the Storm daemon. The PrometheusPreparableReporter class implements an <code>INSECURE_TRUST_MANAGER</code> that accepts all SSL certificates without validation. When this setting is enabled, it calls <code>SSLContext.setDefault()</code>, which globally replaces the JVM's default SSL context, resulting in a JVM-wide TLS security downgrade.</p>
<p><strong>Mitigation:</strong> 2.x users should upgrade to 2.8.7 if the Prometheus Metrics Reporter is used. Users who cannot upgrade immediately should ensure <code>storm.daemon.metrics.reporter.plugin.prometheus.skip_tls_validation</code> is set to <code>false</code> (default) and configure a proper truststore.</p>
<p><strong>Credit:</strong> This issue was discovered by K.</p>

<h3><a href="https://www.cve.org/CVERecord?id=CVE-2026-41081">CVE-2026-41081</a> - Improper Handling of TLS Client Authentication Failure Leading to Anonymous Principal Assignment</h3>
<p><strong>Versions Affected:</strong> before 2.8.7.</p>
<p><strong>Description:</strong> When TLS transport is enabled in Apache Storm without requiring client certificate authentication, the <code>TlsTransportPlugin</code> assigns a fallback principal (<code>CN=ANONYMOUS</code>) if certificate verification fails, rather than rejecting the connection. This enables unauthenticated clients to establish a TLS connection and potentially bypass authorization if the authorizer does not explicitly deny access to <code>CN=ANONYMOUS</code>.</p>
<p><strong>Mitigation:</strong> Users should upgrade to 2.8.7 in which TLS authentication failures are handled in a fail-closed manner. Users who cannot upgrade immediately should enable mandatory client certificate authentication (<code>nimbus.thrift.tls.client.auth.required: true</code>) and ensure authorization rules explicitly deny access to <code>CN=ANONYMOUS</code>.</p>
<p><strong>Credit:</strong> This issue was discovered by K.</p>

<h2>Enhancements</h2>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8533">#8533</a>] - flux: fix 'recieveed' -> 'received' in LogInfoBolt Javadoc</li>
	<li>[<a href="https://github.com/apache/storm/pull/8532">#8532</a>] - storm-client: fix 'accross' -> 'across' in Stream.java Javadoc</li>
	<li>[<a href="https://github.com/apache/storm/pull/8531">#8531</a>] - storm-core: fix 'seperate' -> 'separate' in configuration.h comment</li>
	<li>[<a href="https://github.com/apache/storm/pull/8530">#8530</a>] - docs: fix 'occured' -> 'occurred' in LocallyCachedBlob Javadoc</li>
	<li>[<a href="https://github.com/apache/storm/pull/8529">#8529</a>] - docs: fix 'recieved' -> 'received' typo in IAutoCredentials Javadoc</li>
</ul>

<h2>Dependency upgrades</h2>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8526">#8526</a>] - Bump com.google.guava:guava from 33.5.0-jre to 33.6.0-jre</li>
	<li>[<a href="https://github.com/apache/storm/pull/8525">#8525</a>] - Bump org.apache.commons:commons-configuration2 from 2.13.0 to 2.14.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8524">#8524</a>] - Bump bouncycastle.version from 1.83 to 1.84</li>
	<li>[<a href="https://github.com/apache/storm/pull/8523">#8523</a>] - Bump org.rocksdb:rocksdbjni from 10.10.1 to 10.10.1.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8522">#8522</a>] - Bump org.jgrapht:jgrapht-core from 0.9.0 to 1.5.3</li>
	<li>[<a href="https://github.com/apache/storm/pull/8520">#8520</a>] - Bump org.apache.hbase:hbase-client from 2.6.4-hadoop3 to 2.6.5-hadoop3</li>
	<li>[<a href="https://github.com/apache/storm/pull/8519">#8519</a>] - Bump follow-redirects from 1.15.11 to 1.16.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8511">#8511</a>] - Bump axios from 1.13.6 to 1.15.0 in /storm-webapp</li>
	<li>[<a href="https://github.com/apache/storm/pull/8508">#8508</a>] - Bump org.apache.activemq:activemq-client from 6.2.3 to 6.2.4</li>
	<li>[<a href="https://github.com/apache/storm/pull/8507">#8507</a>] - Bump org.apache.activemq:activemq-broker from 6.2.3 to 6.2.4</li>
	<li>[<a href="https://github.com/apache/storm/pull/8506">#8506</a>] - Bump org.apache.activemq:activemq-all from 6.2.3 to 6.2.4</li>
	<li>[<a href="https://github.com/apache/storm/pull/8505">#8505</a>] - Bump org.apache.activemq:activemq-mqtt from 6.2.3 to 6.2.4</li>
</ul>

<h2>Bug fixing</h2>
<ul>
	<li>[<a href="https://github.com/apache/storm/issues/8518">#8518</a>] - Cache busting is broken - ${packageTimestamp} is never substituted in HTML resources</li>
	<li>[<a href="https://github.com/apache/storm/pull/8516">#8516</a>] - Hardening: clean up TlsTransportPlugin and surface unverified peers</li>
	<li>[<a href="https://github.com/apache/storm/issues/8515">#8515</a>] - Profiling/debugging REST endpoints should use POST instead of GET</li>
</ul>
