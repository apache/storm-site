---
layout: post
title: Apache Storm 1.2.1 Released
author: P. Taylor Goetz
---

The Apache Storm community is pleased to announce that version 1.2.1 has been released and is available from [the downloads page](/downloads.html).

This is a maintenance release that includes a number of important bug fixes that improve Apache Storm's performance, stability and fault tolerance. We encourage users of previous versions to upgrade to this latest release.

In the 1.2.0 release, an LGPL-licensed binary dependency was inadvertently included. The 1.2.0 has since been removed from distribution.

The dependency in question (Remote Tea Runtime) is required when using the Ganglia reporter for the new metrics system. To enable the Ganglia reporter you will need to download the following [jar](http://central.maven.org/maven2/org/acplt/oncrpc/1.0.7/oncrpc-1.0.7.jar) and place it in the `lib` directory of the Apache Storm installation.


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether through direct code contributions, documentation, bug reports, or helping other users on the mailing lists. Your efforts are much appreciated.


Changes in this Release
---------

<h2>Bug</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2951">STORM-2951</a>] - Storm binaries packages oncrpc jar which is LGPL </li>
</ul>
<h2>Test</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-2841">STORM-2841</a>] - testNoAcksIfFlushFails UT fails with NullPointerException</li>
</ul>

