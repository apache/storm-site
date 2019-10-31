---
layout: post
title: Apache Storm 2.1.0 Released
author: Ethan Li
---

The Apache Storm community is pleased to announce that version 2.1.0 has been released and is available from [the downloads page](/downloads.html).

This release includes a number of code improvements and important bug fixes that improve Apache Storm's performance, stability and fault tolerance. We encourage users of previous versions to upgrade to this latest release.


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether through direct code contributions, documentation, bug reports, or helping other users on the mailing lists. Your efforts are much appreciated.


Changes in this Release
---------
<h2>Improvement</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2720">STORM-2720</a>] - Add timestamp based FirstPollOffsetStrategy in KafkaTridentSpoutOpaque</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3370">STORM-3370</a>] - Make StormMetricRegistry non-static</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3392">STORM-3392</a>] - Topology page should show components even if workers haven't started</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3394">STORM-3394</a>] - Fix placeholder system bolt filtering for Topology page</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3395">STORM-3395</a>] - Modifiy Topology page placeholder components to show task counts</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3396">STORM-3396</a>] - uploading dependency jars too slow when StormSubmitter and Nimbus located in different IDC</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3402">STORM-3402</a>] - Scan code quality at build time</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3409">STORM-3409</a>] - Wipe Storm artifacts from local Maven repo before building, and fix build order for storm-shaded-deps</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3411">STORM-3411</a>] - Worker Log Download Only Create Generic Name Worker.log</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3412">STORM-3412</a>] - Jira and Central Log Links Disappear In Topo Page</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3413">STORM-3413</a>] - Deduplicate Storm site layout documents from main Storm repository</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3414">STORM-3414</a>] - Remove JavadocMethod checkstyle rule</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3415">STORM-3415</a>] - storm-jms-examples: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3416">STORM-3416</a>] - storm-jdbc-examples: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3417">STORM-3417</a>] - storm-sql-core: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3418">STORM-3418</a>] - storm-hdfs-blobstore: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3419">STORM-3419</a>] - storm-opentsdb: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3420">STORM-3420</a>] - storm-mqtt: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3421">STORM-3421</a>] - storm-kinesis: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3423">STORM-3423</a>] - Logviewer Log Is Ambiguous</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3424">STORM-3424</a>] - storm-submit-tools: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3427">STORM-3427</a>] - integration-test: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3428">STORM-3428</a>] - kafka-monitor: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3429">STORM-3429</a>] - closure: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3430">STORM-3430</a>] - flux-wrappers: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3431">STORM-3431</a>] - rocketmq-examples: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3432">STORM-3432</a>] - solr-examples: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3433">STORM-3433</a>] - pmml: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3435">STORM-3435</a>] - Use the Jetty BOM</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3437">STORM-3437</a>] - More license check automation</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3438">STORM-3438</a>] - webapp: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3440">STORM-3440</a>] - client: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3441">STORM-3441</a>] - hbase: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3442">STORM-3442</a>] - Add owner to supervisor summary</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3443">STORM-3443</a>] - hive: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3444">STORM-3444</a>] - redis: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3445">STORM-3445</a>] - metrics: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3446">STORM-3446</a>] - storm-maven-plugins: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3447">STORM-3447</a>] - jms: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3448">STORM-3448</a>] - core: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3449">STORM-3449</a>] - autocreds: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3450">STORM-3450</a>] - perf: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3451">STORM-3451</a>] - jdbc: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3452">STORM-3452</a>] - blobstore-migration: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3453">STORM-3453</a>] - eventhubs: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3454">STORM-3454</a>] - hbase-examples: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3455">STORM-3455</a>] - solr: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3456">STORM-3456</a>] - cassandra: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3457">STORM-3457</a>] - hdfs: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3458">STORM-3458</a>] - starter: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3460">STORM-3460</a>] - examples-opentsdb: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3461">STORM-3461</a>] - examples-hdfs: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3462">STORM-3462</a>] - examples-hive: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3463">STORM-3463</a>] - examples-pmml: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3464">STORM-3464</a>] - examples-mongodb: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3465">STORM-3465</a>] - examples-redis: fix all checkstyle warnings</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3472">STORM-3472</a>] - STORM-3411 should have tests, and we shouldn't catch NPE for control flow</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3477">STORM-3477</a>] - HDFS blobstore isRemoteBlobExists performs unnecessary file opens</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3506">STORM-3506</a>] - prevent topology from overriding STORM_CGROUP_HIERARCHY_DIR and WORKER_METRICS</li>
</ul>
<h2>Bug</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-1515">STORM-1515</a>] - LocalState corruption after hard reboot on Windows</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3371">STORM-3371</a>] - Metrics v2 is inaccessible in Trident StateFactory. </li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3372">STORM-3372</a>] - HDFS bolt can throw NPE on shutdown if not using a TimedRotationPolicy</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3376">STORM-3376</a>] - Storm drops messages in the interval between server bind and callback registration</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3379">STORM-3379</a>] - Intermittent NPE during worker boot in local mode</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3385">STORM-3385</a>] - ClientSupervisorUtils.processLauncherAndWait might have two threads reading the process' inputStream concurrently</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3390">STORM-3390</a>] - Lock python test dependencies so we don't get accidentally upgraded</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3408">STORM-3408</a>] - Rocks version shipped with Storm2 doesn't work on Windows 10</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3422">STORM-3422</a>] - TupleCaptureBolt is not thread-safe</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3436">STORM-3436</a>] - TupleInfo.id is not set, making debugging more difficult than it should be</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3466">STORM-3466</a>] - storm-kafka-monitor not found jar</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3470">STORM-3470</a>] - Possible Null Dereference in SimpleSaslServer authentication function</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3481">STORM-3481</a>] - IllegalArgumentException in ConstraintSolverStrategy</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3485">STORM-3485</a>] - VersionInfoMojo fails to run when the sources are built outside the Git repo</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3488">STORM-3488</a>] - Scheduling can cause RAS_Node resources to become negative</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3491">STORM-3491</a>] - BoltReaderRunnable shouldn't throw IllegalArgumentException for sync command</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3500">STORM-3500</a>] - Spelling issue in storm.blobstore.dependency.jar.upload.chuck.size.bytes</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3501">STORM-3501</a>] - Local Cluster worker restarts</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3515">STORM-3515</a>] - Storm CLI config options are passed directly to underlying JAVA cli</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3516">STORM-3516</a>] - Delayed Kill or Rebalance Topology not processed on Nimbus restart</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3520">STORM-3520</a>] - Storm CLI drpc-client incorrectly validating function args</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3521">STORM-3521</a>] - Storm CLI jar command doesn't handle topology arguments correctly</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3524">STORM-3524</a>] - worker fails to launch due to missing parent directory for localized resource</li>
</ul>
<h2>Dependency upgrade</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3373">STORM-3373</a>] - Use Log4j BOM, ensure SLF4J dependencies use the same version, upgrade SLF4J to latest</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3478">STORM-3478</a>] - Upgrade to JUnit 5.5.1</li>
</ul>
<h2>Task</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3000">STORM-3000</a>] - Add missing @Override annotations</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3386">STORM-3386</a>] - Set minimum Maven version for build to 3.5.0</li>
</ul>
