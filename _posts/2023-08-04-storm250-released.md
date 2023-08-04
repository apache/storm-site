---
layout: post
title: Apache Storm 2.5.0 Released
author: Bipin Prasad
---

The Apache Storm community is pleased to announce that  version 2.5.0 has been
released and is available from [the downloads page](/downloads.html).

This release includes a number of code improvements and important bug fixes 
that improve Apache Storm's performance, stability and fault tolerance. 
We encourage users of previous versions to upgrade to this latest release.


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether 
through direct code contributions, documentation, bug reports, or helping other 
users on the mailing lists. Your efforts are much appreciated.


Changes in this Release - Storm 2.5.0
---------
<h1></h1>
<p>JIRA issues addressed in the 2.5.0 release of Storm. Documentation for this
    release is available at the <a href="http://storm.apache.org/">Apache Storm
    project site</a>.</p>
<h2>        Bug
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3822'>STORM-3822</a>] -         Colon in streamId breaks topology visualization
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3838'>STORM-3838</a>] -         prevent topology from overriding STORM_WORKERS_ARTIFACTS_DIR
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3862'>STORM-3862</a>] -         HdfsBlobStoreImpl should check permission after mkdirs
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3875'>STORM-3875</a>] -         ThroughputVsLatency does not run on JDK11 due to specified TOPOLOGY_WORKER_GC_CHILDOPTS
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3917'>STORM-3917</a>] -         Hardcoded worker heapsize in ThroughputVsLatency 
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3923'>STORM-3923</a>] -         Cassandra module fails tests probably OOM
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3940'>STORM-3940</a>] -         Missing dependency prevents Storm from being built
</li>
</ul>

<h2>        New Feature
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3855'>STORM-3855</a>] -         Remove Python2 Support in Travis and storm.py - Breaking Change
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3886'>STORM-3886</a>] -         Adding IgnoreUnrecognizedVMOptions to make worker start with jdk-11
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3897'>STORM-3897</a>] -         Replace Travis with GitHub Actions
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3916'>STORM-3916</a>] -         Create a RoundRobin Scheduler Strategy with node limits
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3922'>STORM-3922</a>] -         Update Acker Related Scheduling Changes
</li>
</ul>

<h2>        Improvement
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3832'>STORM-3832</a>] -         Remove python2 support
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3835'>STORM-3835</a>] -         Log when shell command exceptions occur
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3836'>STORM-3836</a>] -         Update master branch to version 2.5.0-SNAPSHOT
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3841'>STORM-3841</a>] -         Remove dependency on javax.jms which has been removed from maven central repo
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3843'>STORM-3843</a>] -         Update storm dev and user mail archive urls from http to https
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3846'>STORM-3846</a>] -         Print contents of actual and expected dependency license files when different
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3847'>STORM-3847</a>] -         Fix various problems in the python PowerShell execution
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3848'>STORM-3848</a>] -         Specify build.plugins.plugin.version to remove build warning
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3849'>STORM-3849</a>] -         Eliminate build warning for &quot;Unable to locate Source XRef to link to - DISABLED&quot;
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3851'>STORM-3851</a>] -         Fix travis error reporting script print-errors-from-test-reports.py
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3861'>STORM-3861</a>] -         Upgrade clojure-maven-plugin
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3873'>STORM-3873</a>] -         Remove Junit 4 dependencies
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3877'>STORM-3877</a>] -         change test_storm_cli script to use python3
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3891'>STORM-3891</a>] -         Change commons.cli version and python
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3902'>STORM-3902</a>] -         Print summary of difference between expected and actual licenses
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3905'>STORM-3905</a>] -         Replace Anonymous Inner classs with Lambda in storm-core commands
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3906'>STORM-3906</a>] -         Remove use of mockito interal class org.mockito.internal.util.reflection.FieldSetter
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3908'>STORM-3908</a>] -         Increase heap memory for MAVEN_OPTS used in github actions
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3909'>STORM-3909</a>] -         Use python3 in metrics test
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3910'>STORM-3910</a>] -         Enhance LOG when rocksdb is used for metric store
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3911'>STORM-3911</a>] -         Add json-smart dependency to retrieve from maven repo
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3912'>STORM-3912</a>] -         Pull new carbonite code into storm
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3913'>STORM-3913</a>] -         Upgrade version of ROCKSDB for junit tests on MAC OSX
</li>
</ul>

<h2>        Task
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3854'>STORM-3854</a>] -         A very large number of PMD Exceptions are thrown when building storm
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3926'>STORM-3926</a>] -         &quot;bin/storm dev-zookeeper&quot; fails to find python
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3927'>STORM-3927</a>] -         Use python3 in example topologies
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3928'>STORM-3928</a>] -         Use python3 in flux test, examples and wrappers
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3929'>STORM-3929</a>] -         Update documentation to refer to python3
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3930'>STORM-3930</a>] -         Change pom.xml to use ssh connection and fix the url
</li>
</ul>

<h2>        Dependency upgrade
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3837'>STORM-3837</a>] -         upgrade activemq-client due to cve
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3839'>STORM-3839</a>] -         Upgrade org.springframework:spring-core for CVE-2022-22965
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3853'>STORM-3853</a>] -         Upgrade maven-pmd-plugin from 3.12.0 to 3.16.0
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3857'>STORM-3857</a>] -         Bump spring-core from 5.3.18 to 5.3.19 in /examples/storm-jms-examples
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3864'>STORM-3864</a>] -         Bump gson from 2.8.0 to 2.8.9 in /integration-test 
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3865'>STORM-3865</a>] -         Bump hadoop-common from 2.8.5 to 2.10.1
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3866'>STORM-3866</a>] -         Update Rockdb version from 5.18.4 to 6.27.3
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3867'>STORM-3867</a>] -         Update Apache MQ to ActiveMQ 5.16.5 (jdk8)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3868'>STORM-3868</a>] -         Bump spring-core from 5.3.19 to 5.3.20 in /examples/storm-jms-examples
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3889'>STORM-3889</a>] -         Bump snakeyaml from 1.26 to 1.32
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3892'>STORM-3892</a>] -         Bump testng from 6.8.5 to 7.7.0
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3893'>STORM-3893</a>] -         Bump testng from 6.8.5 to 7.7.0 in integration test
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3900'>STORM-3900</a>] -         Upgrade Cassandra version to avoid depedency on snakeyaml 1.3
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3903'>STORM-3903</a>] -         Bump commons-fileupload from 1.3.3 to 1.5
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3904'>STORM-3904</a>] -         Bump spring-core from 5.3.20 to 5.3.26 in /examples/storm-jms-examples
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3907'>STORM-3907</a>] -         Update mockito to version 4.11.0
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3918'>STORM-3918</a>] -         Bump snakeyaml from 1.32 to 2.0
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3921'>STORM-3921</a>] -         Bump spring-core from 5.3.26 to 5.3.27 in /examples/storm-jms-examples
</li>
</ul>

<h2>        Documentation
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3890'>STORM-3890</a>] -         Update readme document to state usage parameters for KafkaLagUtil
</li>
<li>[<a href='https://issues.apache.org/jira/browse/STORM-3920'>STORM-3920</a>] -         Update the Secure Storm documentation
</li>
</ul>
                