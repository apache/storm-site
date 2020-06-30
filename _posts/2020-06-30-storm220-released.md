---
layout: post
title: Apache Storm 2.2.0 Released
author: Govind Menon
---

The Apache Storm community is pleased to announce that version 2.2.0 has been released and is available from [the downloads page](/downloads.html).

This release includes a number of code improvements and important bug fixes that improve Apache Storm's performance, stability and fault tolerance. We encourage users of previous versions to upgrade to this latest release.


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether through direct code contributions, documentation, bug reports, or helping other users on the mailing lists. Your efforts are much appreciated.


Changes in this Release
---------
<h2>New Feature</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-1293">STORM-1293</a>] - port  backtype.storm.messaging.netty-integration-test to java</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-1304">STORM-1304</a>] - port  backtype.storm.submitter-test to java</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3259">STORM-3259</a>] - NUMA support for Storm</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3479">STORM-3479</a>] - HB timeout configurable on a topology level</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3480">STORM-3480</a>] - Implement One Executor Per Worker RAS Option</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3482">STORM-3482</a>] - Implement One Worker Per Component Option</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3492">STORM-3492</a>] - Adding configuration for blacklisting scheduler behavior</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3585">STORM-3585</a>] - Change ConstraintSolverStrategy to allow max co-Location Count for spreading components</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3627">STORM-3627</a>] - Allow use of shortNames for Metrics for worker in Metrics-V2</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3636">STORM-3636</a>] - Enable SSL credentials auto reload for storm UI, LogViewer and DRPC server</li>
</ul>
<h2>Improvement</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2749">STORM-2749</a>] - Remove state spout since it's never supported by storm</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3066">STORM-3066</a>] - Storm Flux variable substitution</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3071">STORM-3071</a>] - change checkstyle plugin setting logViolationsToConsole to true</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3257">STORM-3257</a>] - 'storm kill' command line should be able to continue on error</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3434">STORM-3434</a>] - server: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3484">STORM-3484</a>] - Add Blacklisted Supervisors Info To UI</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3490">STORM-3490</a>] - Add checkstyle rule RedundantModifier</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3493">STORM-3493</a>] - Allow overriding python interpreter by environment variable</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3494">STORM-3494</a>] - Use UserGroupInformation to login to HDFS only once per process</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3507">STORM-3507</a>] - Need feedback from blacklisting to scheduling</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3509">STORM-3509</a>] - Improved RAS scheduling</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3529">STORM-3529</a>] - Catch and log RetriableException in KafkaOffsetMetric</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3530">STORM-3530</a>] - Improve Scheduling Failure Message</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3534">STORM-3534</a>] - Add generic resources to UI</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3536">STORM-3536</a>] - Add Generic-resources.md</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3538">STORM-3538</a>] - Add Meter for sendSupervisorAssignments exception</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3539">STORM-3539</a>] - Add metric for worker start time out</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3541">STORM-3541</a>] - allow reporting of v2 metrics api using metrics tick</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3543">STORM-3543</a>] - Avoid iterators for task hook info objects</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3545">STORM-3545</a>] - blob update spews errors until cleanup occurs after topology killed</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3548">STORM-3548</a>] - Remove iterator from Task.sendUnanchored</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3555">STORM-3555</a>] - Add meter for tracking errors killing workers</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3557">STORM-3557</a>] - allow health checks to pass on timeout</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3570">STORM-3570</a>] - add config name when validation fails with ClassNotFoundException</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3571">STORM-3571</a>] - Add topology info to slot warning messages</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3575">STORM-3575</a>] - Fix Scheduler Status on failure after multiple attempts</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3581">STORM-3581</a>] - Change log level to info to show the config classes being used for validation</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3584">STORM-3584</a>] -  Support getting version info from a wildcard classpath entry</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3587">STORM-3587</a>] - Allow Scheduler futureTask to gracefully exit and register message on timeout</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3588">STORM-3588</a>] - RAS scheduler should not pre-empt and evict topologies due to generic resource</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3589">STORM-3589</a>] - Iterator in BaseResourceStrategy is potentially buggy</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3591">STORM-3591</a>] - Improve GRAS Strategy Log</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3594">STORM-3594</a>] - Add checkstyle rule WhitespaceAfter</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3596">STORM-3596</a>] - Feed send assignment status into blacklist scheduler</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3600">STORM-3600</a>] - ResourceAwareScheduler taking too long to schedule</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3604">STORM-3604</a>] - HealthChecker should print out error message when it fails</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3605">STORM-3605</a>] - add meter to track scheduling timeouts</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3614">STORM-3614</a>] - update SystemBolt metrics to use v2 API</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3616">STORM-3616</a>] - If running upload credentials and no autocreds are found, we should have an option to fail</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3618">STORM-3618</a>] - add meter for tracking internal scheduling errors</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3619">STORM-3619</a>] - Add null check for the topology name</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3625">STORM-3625</a>] - Storm CLI should validate topology name on client side</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3632">STORM-3632</a>] - Reduce SimpleSaslServerCallbackHandler supervisor logging</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3633">STORM-3633</a>] - Add message that supervisor is killing detached workers</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3634">STORM-3634</a>] - validate numa ports are contained in supervisor.slots.ports</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3640">STORM-3640</a>] - timed out health check processes should be killed</li>
</ul>
<h2>Bug</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2483">STORM-2483</a>] - wrong parameters order</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3498">STORM-3498</a>] - Fix missing cases of invoking bash directly without /bin/env</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3504">STORM-3504</a>] - AsyncLocalizerTest is stubbing file system operations</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3510">STORM-3510</a>] - WorkerState.transferLocalBatch backpressure resend logic fix</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3511">STORM-3511</a>] - Nimbus logs got flood with TTransportException Error messages (because of thrift 0.12.0)</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3512">STORM-3512</a>] - Nimbus failing on startup with `GLIBC_2.12' not found</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3519">STORM-3519</a>] - Change ConstraintSolverStrategy::backtrackSearch to avoid StackOverflowException</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3523">STORM-3523</a>] - supervisor restarts when releasing slot with missing file</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3527">STORM-3527</a>] - Container.getWorkerUser() should check if the user name is empty</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3540">STORM-3540</a>] - Pacemaker race condition can cause continual reconnection</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3549">STORM-3549</a>] - use of topology specific jaas conf doesn't work with kafka</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3551">STORM-3551</a>] - Fix LocalAssignment Equivalency in Slot for Generice Resource Aware Scheduler</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3552">STORM-3552</a>] - Storm CLI set_log_level no longer updates the log level</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3567">STORM-3567</a>] - Topology UI page is showing total resources for each component if not scheduled</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3568">STORM-3568</a>] - Topology UI page "Change Log Level" should not allow empty logger name</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3572">STORM-3572</a>] - Topology visualization can fail if executor is not up</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3577">STORM-3577</a>] - upload-credentials Breaks Topology in secure cluster</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3580">STORM-3580</a>] - Config overrides supplied using -c in storm.py not passed to all commands</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3583">STORM-3583</a>] - Handle exceptions when AsyncLocalizer tries to get local resources</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3598">STORM-3598</a>] - Storm UI visualization throws NullPointerException</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3602">STORM-3602</a>] - loadaware shuffle can overload local worker</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3606">STORM-3606</a>] - AutoTGT shouldn't invoke TGT renewal thread (from UserGroupInformation.loginUserFromSubject)</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3609">STORM-3609</a>] - ClassCastException when credentials are updated for ICredentialsListener spout/bolt instances</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3613">STORM-3613</a>] - storm.py should include lib-worker instead of lib directory in the classpath while submitting a topology</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3620">STORM-3620</a>] - Data corruption can happen when components are multi-threaded because of non thread-safe serializer</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3622">STORM-3622</a>] - Race Condition in CachedThreadStatesGaugeSet registered at SystemBolt</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3623">STORM-3623</a>] - v2 metrics tick reports all worker metrics within each executor</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3626">STORM-3626</a>] - storm-kafka-migration should pull in storm-client as "provided" dependency</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3629">STORM-3629</a>] -  Logviewer should always allow admins to access logs</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3631">STORM-3631</a>] - Wrong format of logs.users/groups in topology conf can cause supervisor/logviewer to terminate</li>
</ul>
<h2>Comment</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3231">STORM-3231</a>] - TopologyBySubmissionTimeComparator does not consider priority</li>
</ul>
<h2>Dependency upgrade</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3608">STORM-3608</a>] - Upgrade snakeyaml from 1.11 to 1.26 (latest)</li>
</ul>
<h2>Documentation</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3508">STORM-3508</a>] - The links to download in setting up environmtn page are broken</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3615">STORM-3615</a>] - Add documentation for Storm NUMA support</li>
</ul>
<h2>Task</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3211">STORM-3211</a>] - WindowedBoltExecutor NPE if wrapped bolt returns null from getComponentConfiguration</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3306">STORM-3306</a>] - Some tests in storm-core/test/jvm/org/apache/storm/integration/TopologyIntegrationTest.java are using Thrift to build topologies. They should use TopologyBuilder instead. </li>
</ul>
<h2>Test</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3475">STORM-3475</a>] - Add ConstraintSolverStrategy Unit Test</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3495">STORM-3495</a>] - TestConstraintSolverStrategy is not stable on travis</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3503">STORM-3503</a>] - Create unit tests for blacklistOnBadSlot option</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3525">STORM-3525</a>] - Large Contraint Solver test fails on some VM</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3651">STORM-3651</a>] - Give producerTasks in ExecutorTransferMultiThreadingTest.testExecutorTransfer more time to finish</li>
</ul>
<h2>Sub-task</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2687">STORM-2687</a>] - Group Topology executors by network proximity needs and schedule them on "network wise" close slots</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3486">STORM-3486</a>] - Upgrade to Jersey 2.29</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3578">STORM-3578</a>] - ClientAuthUtils.insertWorkerTokens removes exiting and new WorkerToken altogether if they are equal</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3579">STORM-3579</a>] - Fix Kerberos connection from Worker to Nimbus/Supervisor</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3599">STORM-3599</a>] - Bump the rocksdbjni to 5.18.4</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3607">STORM-3607</a>] - Document the exceptions topologies will see from TGT renewal thread</li>
</ul>
