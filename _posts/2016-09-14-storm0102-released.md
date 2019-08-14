---
layout: post
title: Apache Storm 0.10.2 Released
author: P. Taylor Goetz
---

The Apache Storm community is pleased to announce that version 0.10.2 has been released and is available from [the downloads page](/downloads.html).

This is a maintenance release that includes a number of important bug fixes that improve Apache Storm's performance, stability and fault tolerance. We encourage users of previous versions to upgrade to this latest release.


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether through direct code contributions, documentation, bug reports, or helping other users on the mailing lists. Your efforts are much appreciated.


Full Changelog
---------

 * STORM-2042: Nimbus client connections not closed properly causing connection leaks
 * STORM-1609: Netty Client is not best effort delivery on failed Connection
 * STORM-1928: ShellSpout should check heartbeat while ShellSpout is waiting for subprocess to sync
 * STORM-1989: X-Frame-Options support for Storm UI
 * STORM-1834: Documentation How to Generate Certificates For Local Testing SSL Setup
 * STORM-1754: Correct java version in 0.10.x storm-starter
 * STORM-1750: Ensure worker dies when report-error-and-die is called.
 * STORM-1739: update the minor JAVA version dependency in 0.10.0 and above
 * STORM-1733: Flush stdout and stderr before calling "os.execvp" to prevent log loss
