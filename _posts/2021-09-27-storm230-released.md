---
layout: post
title: Apache Storm 2.3.0 Released
author: Ethan Li
---

The Apache Storm community is pleased to announce that version 2.3.0 has been released and is available from [the downloads page](/downloads.html).

This release includes a number of code improvements and important bug fixes that improve Apache Storm's performance, stability and fault tolerance. We encourage users of previous versions to upgrade to this latest release.


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether through direct code contributions, documentation, bug reports, or helping other users on the mailing lists. Your efforts are much appreciated.


Changes in this Release
---------
<h2>New Feature</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3271">STORM-3271</a>] - Launch storm workers in docker containers</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3388">STORM-3388</a>] - Launch workers inside container using runc runtime</li>
</ul>
<h2>Improvement</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3638">STORM-3638</a>] - Add fast and more reliable process liveness check</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3641">STORM-3641</a>] - switch JCQueue metrics to new metrics API</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3642">STORM-3642</a>] - update AutoTGT metric to new API</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3644">STORM-3644</a>] - improve PacemakerClient error messaging</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3647">STORM-3647</a>] - Add OFF-HEAP macro for worker childopts similar to LIMIT-MEM</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3648">STORM-3648</a>] - Add meter to track worker heartbeat rate</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3650">STORM-3650</a>] - Ackers and metricComponents are not distributed evenly</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3653">STORM-3653</a>] - Document treatment of common nodes in favored/unfavored nodes in scheduling</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3654">STORM-3654</a>] - JCQueue shouldn't include executor string in the metric name</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3656">STORM-3656</a>] - Change handling of Hadoop TGT renewal exception</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3657">STORM-3657</a>] - storm.messaging.netty.authentication should be true if it is true in either the topology conf or cluster conf</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3659">STORM-3659</a>] - User page should show storm Version in the Owner topologies table</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3660">STORM-3660</a>] - Remove messaging queue for updating Executor credentials</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3661">STORM-3661</a>] - Netty server should handle incoming messages better</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3662">STORM-3662</a>] - Continue to support Pacemaker for 2.x topologies</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3667">STORM-3667</a>] - Exception message on submitting topology due to incorrect worker max heap size should be more straightforward </li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3670">STORM-3670</a>] - Separate configurations for daemon metric reporters and topology metrics reporters</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3671">STORM-3671</a>] - Add TopologySummary method to NImbus for optimal UI queries</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3673">STORM-3673</a>] - update BuiltinMetrics to use v2 Metrics API</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3675">STORM-3675</a>] - Eliminate ps command and use /proc/<pid> status in ServerUtils</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3676">STORM-3676</a>] - Reduce debug spew to scheduler log</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3682">STORM-3682</a>] - Upgrade netty client metrics to use V2 API</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3685">STORM-3685</a>] - Detect Loops in Topology at Submit</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3691">STORM-3691</a>] - Refactor Resource Aware Strategies (Base, Generic, Default)</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3692">STORM-3692</a>] - Handle UID return from Files.getOwner() at process liveness check</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3694">STORM-3694</a>] - all V2 metric reporters to report metric short names with dimensions</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3697">STORM-3697</a>] - Add metric for capacity</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3706">STORM-3706</a>] - Cluster.needsSchedulingRas always succeeds</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3707">STORM-3707</a>] - Add meter to track update blob failures</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3708">STORM-3708</a>] - ConstraintSolverConfig LOG messages should include topology id</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3709">STORM-3709</a>] - Reject topology submission if missing spout</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3714">STORM-3714</a>] - Add rate information for TaskMetrics</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3715">STORM-3715</a>] - Add Caching to HDFS BlobStore</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3719">STORM-3719</a>] - Add configuration for AsyncLocalizer updateBlobs frequency</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3721">STORM-3721</a>] - Change child pom.xml reference to parent pom.xml</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3724">STORM-3724</a>] - Use blobstore dir modtime to avoid update lookups by HDFSBlobstore</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3737">STORM-3737</a>] - Share Worker Metric Registry For Guice AOP Based Metrics Integeration</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3739">STORM-3739</a>] - Scheduling should sort numa zones by host groups</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3744">STORM-3744</a>] - IntelliJ does not find shaded classes</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3749">STORM-3749</a>] - improve logging on server error in StormServerHandler</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3755">STORM-3755</a>] - While scheduling multiple ackers with executor use best effort basis</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3758">STORM-3758</a>] - Zookeeper reconnect events sometime cause workers to restart</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3774">STORM-3774</a>] - Migrate Cgroup metrics to V2 </li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3778">STORM-3778</a>] - convert SpoutThrottlingMetrics to V2 API</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3780">STORM-3780</a>] - switch ErrorReportingMetrics to V2 API</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3786">STORM-3786</a>] - V2 metrics tick may overreport or not report at all</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3790">STORM-3790</a>] - Add meter to track failures WorkerTokenAuthorizer getPassword</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3791">STORM-3791</a>] - update metric documentation</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3793">STORM-3793</a>] - Add metric to track backpressure status for a task</li>
</ul>
<h2>Bug</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3553">STORM-3553</a>] - Upgrade JQuery to 3.5.1</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3624">STORM-3624</a>] - Race condition on ArtifactoryConfigLoader.load</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3649">STORM-3649</a>] - Logic error regarding storm.supervisor.medium.memory.grace.period.ms</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3652">STORM-3652</a>] -  Last error not displayed  in Topology summary storm ui</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3655">STORM-3655</a>] - Worker should commit suicide On Change in its assignment.</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3658">STORM-3658</a>] - Problematic worker stays alive because of a deadlock and race condition caused by ShutdownHooks</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3663">STORM-3663</a>] - Topology with Mockito 1.x fails to run unit tests </li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3666">STORM-3666</a>] - Validate component name in rebalance command and fix --executor option</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3677">STORM-3677</a>] - Fix Worker Suicide Function if assignment is null</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3679">STORM-3679</a>] - misuse of nodeId as hostname in LoadAwareShuffleGrouping</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3684">STORM-3684</a>] - receive-queue V2 metrics shouldn't have "_system" as componentId if it is from a system task</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3690">STORM-3690</a>] - UI has NullPointerException when the scheduler is not ResourceAwareScheduler</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3695">STORM-3695</a>] - Add Timer rates to datapoints for V2 metrics tick</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3696">STORM-3696</a>] - ClientSupervisorUtils.processLauncherAndWait ignores InterruptedException</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3699">STORM-3699</a>] - fix flight.bash to support flight recording on openJDK8u262 or newer</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3701">STORM-3701</a>] - Race Condition between cleanup thread and download tasks</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3704">STORM-3704</a>] - Cosmetic: columns shifted in "Topology summary" table</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3712">STORM-3712</a>] - Check-Updated-License-Files CI job has been broken</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3720">STORM-3720</a>] - BlobStoreFile getModTime() never updates after first call</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3723">STORM-3723</a>] - ServerUtils.isAnyPosixProcessPidDirAlive might return wrong result</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3725">STORM-3725</a>] - DRPC spout will crash when any one of DRPC server is down</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3727">STORM-3727</a>] - SUPERVISOR_SLOTS_PORTS could be list of Longs</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3728">STORM-3728</a>] - Workers are not able to connect to Pacemaker if pacemaker.auth.method is KERBEROS</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3729">STORM-3729</a>] - Assigning memory greater and equal than 2048m will make assgin memory for slot values to 1m</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3731">STORM-3731</a>] - Remove unused nashorn import in storm-loadgen:OutputStream.java</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3733">STORM-3733</a>] - AsyncLocalizer stuck looking for missing topology</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3735">STORM-3735</a>] - Kyro serialization fails on some metric tuples when topology.fall.back.on.java.serialization is false</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3740">STORM-3740</a>] - Asynchronous background blob download can cause orphaned blob references</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3741">STORM-3741</a>] - Maven Surefire plugin corrupts output and creates an excessive log file</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3748">STORM-3748</a>] - prevent concurrent modification when fetching v2 metrics</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3763">STORM-3763</a>] - Backpressure message ignored by the receiver caused the topology to not progress</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3765">STORM-3765</a>] - NPE in DRPCSimpleACLAuthorizer.readAclFromConfig when drpc.authorizer.acl has no values</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3767">STORM-3767</a>] - NPE on getComponentPendingProfileActions </li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3769">STORM-3769</a>] - Failed adding references to blobs: FileNotFoundException</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3775">STORM-3775</a>] - topology.blobstore.map can cause supervisor restarts</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3785">STORM-3785</a>] - Rate metrics are wrongly divided by 1000000</li>
</ul>
<h2>Comment</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3687">STORM-3687</a>] - Add a warning about possible issues on a mixed cluster if the StormCommon.systemTopology implementation is changed</li>
</ul>
<h2>Dependency upgrade</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3718">STORM-3718</a>] - Updating the dropwizard dependency</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3757">STORM-3757</a>] - Update jackson version to 2.10.0</li>
</ul>
<h2>Documentation</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3635">STORM-3635</a>] - Add LocalityAwareness documentation</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3722">STORM-3722</a>] - Update committer list</li>
</ul>
<h2>Test</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3743">STORM-3743</a>] - Add new topologies for TestLargeCluster</li>
</ul>
<h2>Sub-task</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3674">STORM-3674</a>] - explicitly specify pip2 and pip3 in travis-install.sh</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3681">STORM-3681</a>] - Enable basic Travis ARM CI job</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3711">STORM-3711</a>] - Enable all the modules in ARM CI</li>
</ul>
