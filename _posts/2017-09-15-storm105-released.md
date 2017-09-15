---
layout: post
title: Storm 1.0.5 Released
author: P. Taylor Goetz
---

The Apache Storm community is pleased to announce that version 1.0.5 has been released and is available from [the downloads page](/downloads.html).

This is a maintenance release that includes a number of important bug fixes that improve Storm's performance, stability and fault tolerance. We encourage users of previous versions to upgrade to this latest release.


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether through direct code contributions, documentation, bug reports, or helping other users on the mailing lists. Your efforts are much appreciated.


Changes in this Release
---------

<h4>Improvement</h4>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2657">STORM-2657</a>] - Update SECURITY.MD </li>
</ul>
<h4>Bug</h4>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2231">STORM-2231</a>] - NULL in DisruptorQueue while multi-threaded ack</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2660">STORM-2660</a>] - The Nimbus storm-local directory is relative to the working directory of the shell executing "storm nimbus"</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2674">STORM-2674</a>] - NoNodeException when ZooKeeper tries to delete nodes</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2677">STORM-2677</a>] - consider all sampled tuples which took greater than 0 ms processing time</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2682">STORM-2682</a>] - Supervisor crashes with NullPointerException</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2695">STORM-2695</a>] - BlobStore uncompress argument should be Boolean</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2705">STORM-2705</a>] - DRPCSpout sleeps twice when idle</li>
</ul>