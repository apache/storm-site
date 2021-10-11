---
layout: post
title: Apache Storm 2.2.1 Released
author: Ethan Li
---

The Apache Storm community is pleased to announce that version 2.2.1 has been released and is available from [the downloads page](/downloads.html).

This is a maintenance release that includes a number of important bug fixes that improve Apache Storm's performance, stability and fault tolerance. We encourage users of previous versions to upgrade to this latest release.


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether through direct code contributions, documentation, bug reports, or helping other users on the mailing lists. Your efforts are much appreciated.


Changes in this Release
---------
<h2>Bug</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3553">STORM-3553</a>] - Upgrade JQuery to 3.5.1</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3663">STORM-3663</a>] - Topology with Mockito 1.x fails to run unit tests </li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3704">STORM-3704</a>] - Cosmetic: columns shifted in "Topology summary" table</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3763">STORM-3763</a>] - Backpressure message ignored by the receiver caused the topology to not progress</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3767">STORM-3767</a>] - NPE on getComponentPendingProfileActions </li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3785">STORM-3785</a>] - Rate metrics are wrongly divided by 1000000</li>
</ul>