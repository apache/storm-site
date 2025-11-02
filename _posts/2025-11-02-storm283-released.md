---
layout: post
title: Apache Storm 2.8.3 Released
author: Rui Abreu
---

The Apache Storm community is pleased to announce that version 2.8.3 has been
released and is available from [the downloads page](/downloads.html).

This release includes new features as well as a number of code improvements, bug fixes and library updates.
We encourage users of previous versions to upgrade to this latest release.

## Thanks

Special thanks are due to all those who have contributed to Apache Storm -- whether
through direct code contributions, documentation, bug reports, or helping other
users on the mailing lists. Your efforts are much appreciated.

## Note

This release upgrades Apache Kafka client to the major version 4. Users should be aware of:


<blockquote cite="https://cwiki.apache.org/confluence/display/KAFKA/KIP-896%3A+Remove+old+client+protocol+API+versions+in+Kafka+4.0">
(...) users should ensure their brokers are running at least Apache Kafka 2.1 before upgrading their Java clients to Apache Kafka 4.0.
</blockquote>

Please refer to <a href="https://cwiki.apache.org/confluence/display/KAFKA/KIP-896%3A+Remove+old+client+protocol+API+versions+in+Kafka+4.0">Apache Kafka's documentation</a> for more information.

## Changes in this Release - Storm 2.8.3

<p>JIRA issues addressed in the 2.8.3 release of Storm. Documentation for this release is available at the <a href="https://storm.apache.org/">Apache Storm project site</a>.</p>

<h2>Dependency upgrade</h2>
<h3>dependencies</h3>
<ul>
	<li>[<a href="https://github.com/apache/storm/pull/8290">#8290</a>] - Bump org.codehaus.mojo:exec-maven-plugin from 3.6.1 to 3.6.2</li>
	<li>[<a href="https://github.com/apache/storm/pull/8289">#8289</a>] - Bump io.netty:netty-bom from 4.2.6.Final to 4.2.7.Final and netty-tcnative.version from 2.0.73.Final to 2.0.74.Final</li>
	<li>[<a href="https://github.com/apache/storm/pull/8288">#8288</a>] - Bump org.apache.avro:avro from 1.12.0 to 1.12.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8287">#8287</a>] - Bump spring.version from 6.2.11 to 6.2.12</li>
	<li>[<a href="https://github.com/apache/storm/pull/8284">#8284</a>] - Bump org.apache.maven.plugins:maven-pmd-plugin from 3.27.0 to 3.28.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8283">#8283</a>] - Bump org.jacoco:jacoco-maven-plugin from 0.8.13 to 0.8.14</li>
	<li>[<a href="https://github.com/apache/storm/pull/8282">#8282</a>] - Bump redis.clients:jedis from 5.2.0 to 7.0.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8281">#8281</a>] - Bump byte-buddy.version from 1.17.7 to 1.17.8</li>
	<li>[<a href="https://github.com/apache/storm/pull/8278">#8278</a>] - Bump org.codehaus.mojo:exec-maven-plugin from 3.5.1 to 3.6.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8277">#8277</a>] - Bump org.apache.maven.plugins:maven-dependency-plugin from 3.8.1 to 3.9.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8276">#8276</a>] - Bump org.junit:junit-bom from 5.13.4 to 6.0.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8275">#8275</a>] - Bump org.checkerframework:checker-qual from 3.51.0 to 3.51.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8274">#8274</a>] - Bump asm.version from 9.8 to 9.9</li>
	<li>[<a href="https://github.com/apache/storm/pull/8272">#8272</a>] - Bump org.apache.commons:commons-lang3 from 3.18.0 to 3.19.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8270">#8270</a>] - Bump org.clojure:clojure from 1.12.2 to 1.12.3</li>
	<li>[<a href="https://github.com/apache/storm/pull/8269">#8269</a>] - Bump org.codehaus.mojo:license-maven-plugin from 2.6.0 to 2.7.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8268">#8268</a>] - Bump org.apache.logging.log4j:log4j-bom from 2.25.1 to 2.25.2</li>
	<li>[<a href="https://github.com/apache/storm/pull/8264">#8264</a>] - Update Dependencies (Jetty 12.1.1)</li>
	<li>[<a href="https://github.com/apache/storm/pull/8262">#8262</a>] - Bump com.google.guava:guava from 33.4.8-jre to 33.5.0-jre</li>
	<li>[<a href="https://github.com/apache/storm/pull/8261">#8261</a>] - Bump com.google.errorprone:error_prone_annotations from 2.41.0 to 2.42.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8260">#8260</a>] - Bump jakarta.xml.bind:jakarta.xml.bind-api from 2.3.2 to 4.0.4</li>
	<li>[<a href="https://github.com/apache/storm/pull/8259">#8259</a>] - Bump org.apache.maven.plugins:maven-javadoc-plugin from 3.11.3 to 3.12.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8258">#8258</a>] - Bump org.apache.maven.plugins:maven-compiler-plugin from 3.14.0 to 3.14.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8257">#8257</a>] - Bump dropwizard.version from 4.0.16 to 5.0.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8256">#8256</a>] - Bump bouncycastle.version from 1.81 to 1.82</li>
	<li>[<a href="https://github.com/apache/storm/pull/8255">#8255</a>] - Bump metrics.version from 4.2.36 to 4.2.37</li>
	<li>[<a href="https://github.com/apache/storm/pull/8252">#8252</a>] - Bump org.springframework:spring-core from 6.2.10 to 6.2.11 in /examples/storm-jms-examples</li>
	<li>[<a href="https://github.com/apache/storm/pull/8250">#8250</a>] - Bump io.netty:netty-bom from 4.2.5.Final to 4.2.6.Final</li>
	<li>[<a href="https://github.com/apache/storm/pull/8249">#8249</a>] - Bump com.google.code.gson:gson from 2.13.1 to 2.13.2</li>
	<li>[<a href="https://github.com/apache/storm/pull/8248">#8248</a>] - Bump org.checkerframework:checker-qual from 3.50.0 to 3.51.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8247">#8247</a>] - Bump org.apache.maven.plugins:maven-shade-plugin from 3.6.0 to 3.6.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8246">#8246</a>] - Bump spring.version from 6.2.10 to 6.2.11</li>
	<li>[<a href="https://github.com/apache/storm/pull/8245">#8245</a>] - Bump surefire.version from 3.5.3 to 3.5.4</li>
	<li>[<a href="https://github.com/apache/storm/pull/8244">#8244</a>] - Bump io.netty:netty-bom from 4.2.4.Final to 4.2.5.Final</li>
	<li>[<a href="https://github.com/apache/storm/pull/8243">#8243</a>] - Bump storm.kafka.client.version from 3.9.0 to 4.1.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8239">#8239</a>] - Bump dropwizard.version from 4.0.15 to 4.0.16</li>
	<li>[<a href="https://github.com/apache/storm/pull/8238">#8238</a>] - Bump netty-tcnative.version from 2.0.72.Final to 2.0.73.Final</li>
	<li>[<a href="https://github.com/apache/storm/pull/8236">#8236</a>] - Bump hadoop.version from 3.4.1 to 3.4.2</li>
	<li>[<a href="https://github.com/apache/storm/pull/8235">#8235</a>] - Bump metrics.version from 4.2.34 to 4.2.36</li>
	<li>[<a href="https://github.com/apache/storm/pull/8234">#8234</a>] - Bump org.clojure:clojure from 1.12.1 to 1.12.2</li>
	<li>[<a href="https://github.com/apache/storm/pull/8233">#8233</a>] - Bump com.fasterxml.jackson:jackson-bom from 2.19.2 to 2.20.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8232">#8232</a>] - Bump zookeeper.version from 3.9.3 to 3.9.4</li>
	<li>[<a href="https://github.com/apache/storm/pull/8231">#8231</a>] - Bump org.checkerframework:checker-qual from 3.49.5 to 3.50.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8230">#8230</a>] - Bump com.zaxxer:HikariCP from 7.0.1 to 7.0.2</li>
	<li>[<a href="https://github.com/apache/storm/pull/8229">#8229</a>] - Bump prometheus.client.version from 1.3.10 to 1.4.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8228">#8228</a>] - Bump metrics.version from 4.2.33 to 4.2.34</li>
	<li>[<a href="https://github.com/apache/storm/pull/8224">#8224</a>] - Update Jetty (11.0.26), Netty (4.2.4.Final), Spring (6.2.10)</li>
	<li>[<a href="https://github.com/apache/storm/pull/8223">#8223</a>] - Bump org.apache.maven.plugins:maven-javadoc-plugin from 3.11.2 to 3.11.3</li>
	<li>[<a href="https://github.com/apache/storm/pull/8222">#8222</a>] - Bump spring.version from 6.2.9 to 6.2.10</li>
	<li>[<a href="https://github.com/apache/storm/pull/8221">#8221</a>] - Bump io.netty:netty-bom from 4.2.3.Final to 4.2.4.Final</li>
	<li>[<a href="https://github.com/apache/storm/pull/8220">#8220</a>] - Bump byte-buddy.version from 1.17.6 to 1.17.7</li>
	<li>[<a href="https://github.com/apache/storm/pull/8219">#8219</a>] - Bump jetty.version from 11.0.25 to 11.0.26</li>
	<li>[<a href="https://github.com/apache/storm/pull/8215">#8215</a>] -  Update Java dependencies to latest versions</li>
	<li>[<a href="https://github.com/apache/storm/pull/8213">#8213</a>] - Bump org.glassfish.jersey:jersey-bom from 3.1.10 to 3.1.11</li>
	<li>[<a href="https://github.com/apache/storm/pull/8212">#8212</a>] - Bump com.zaxxer:HikariCP from 6.3.1 to 7.0.1</li>
	<li>[<a href="https://github.com/apache/storm/pull/8209">#8209</a>] - Bump commons-cli:commons-cli from 1.9.0 to 1.10.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8208">#8208</a>] - Bump org.apache.commons:commons-compress from 1.27.1 to 1.28.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8207">#8207</a>] - Bump net.minidev:json-smart from 2.5.2 to 2.6.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8203">#8203</a>] - Bump dropwizard.version from 4.0.14 to 4.0.15</li>
	<li>[<a href="https://github.com/apache/storm/pull/8202">#8202</a>] - Bump curator.version from 5.8.0 to 5.9.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8201">#8201</a>] - Bump org.apache.commons:commons-text from 1.13.1 to 1.14.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8200">#8200</a>] - Bump com.google.errorprone:error_prone_annotations from 2.40.0 to 2.41.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8199">#8199</a>] - Bump commons-codec:commons-codec from 1.18.0 to 1.19.0</li>
	<li>[<a href="https://github.com/apache/storm/pull/8137">#8137</a>] - Bump org.apache.maven.plugins:maven-compiler-plugin from 3.11.0 to 3.14.0</li>
</ul>

<h3>Github actions</h3>
<ul>
<li>[<a href="https://github.com/apache/storm/pull/8286">#8286</a>] - Bump actions/setup-node from 5.0.0 to 6.0.0</li>
    <li>[<a href="https://github.com/apache/storm/pull/8285">#8285</a>] - Bump ruby/setup-ruby from 1.264.0 to 1.265.0</li>
    <li>[<a href="https://github.com/apache/storm/pull/8279">#8279</a>] - Bump ruby/setup-ruby from 1.263.0 to 1.264.0</li>
    <li>[<a href="https://github.com/apache/storm/pull/8267">#8267</a>] - Bump actions/cache from 4.2.4 to 4.3.0</li>
    <li>[<a href="https://github.com/apache/storm/pull/8266">#8266</a>] - Bump ruby/setup-ruby from 1.262.0 to 1.263.0</li>
    <li>[<a href="https://github.com/apache/storm/pull/8263">#8263</a>] - Bump ruby/setup-ruby from 1.259.0 to 1.262.0</li>
    <li>[<a href="https://github.com/apache/storm/pull/8254">#8254</a>] - Bump ruby/setup-ruby from 1.258.0 to 1.259.0</li>
    <li>[<a href="https://github.com/apache/storm/pull/8253">#8253</a>] - Bump ruby/setup-ruby from 1.257.0 to 1.258.0</li>
    <li>[<a href="https://github.com/apache/storm/pull/8242">#8242</a>] - Bump actions/setup-python from 5.6.0 to 6.0.0</li>
    <li>[<a href="https://github.com/apache/storm/pull/8241">#8241</a>] - Bump actions/setup-node from 4.4.0 to 5.0.0</li>
    <li>[<a href="https://github.com/apache/storm/pull/8240">#8240</a>] - Bump ruby/setup-ruby from 1.256.0 to 1.257.0</li>
    <li>[<a href="https://github.com/apache/storm/pull/8226">#8226</a>] - Bump ruby/setup-ruby from 1.255.0 to 1.256.0</li>
    <li>[<a href="https://github.com/apache/storm/pull/8225">#8225</a>] - Bump actions/setup-java from 4.7.1 to 5.0.0</li>
    <li>[<a href="https://github.com/apache/storm/pull/8217">#8217</a>] - Bump actions/checkout from 4.2.2 to 5.0.0</li>
    <li>[<a href="https://github.com/apache/storm/pull/8216">#8216</a>] - Bump ruby/setup-ruby from 1.254.0 to 1.255.0</li>
</ul>

<h2>Bug</h2>
<ul>
	<li>[<a href="https://github.com/apache/storm/issues/7978">#7978</a>] - Error on syncing BlobStore: Could not download the blob with key</li>
</ul>

<h2>Uncategorized</h2>
<ul>
	<li>[<a href="https://github.com/apache/storm/issues/8211">#8211</a>] - Drop storm-sql*</li>
    <li>[<a href="https://github.com/apache/storm/pull/8174">#8174</a>] - Drop storm-sql-* modules</li>
</ul>
