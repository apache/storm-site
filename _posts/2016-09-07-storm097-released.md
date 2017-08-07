---
layout: post
title: Storm 0.9.7 Released
author: P. Taylor Goetz
---

The Apache Storm community is pleased to announce that version 0.9.7 has been released and is available from [the downloads page](/downloads.html).

This is a maintenance release that includes a number of important bug fixes that improve Storm's performance, stability and fault tolerance. We encourage users of previous versions to upgrade to this latest release.


Multi-Lang Bug Fix
------------------
This release fixes an issue with Storm's multi-lang feature where a malformed multi-lang message from a ShellSpout would cause the spout to hang indefinitely.


Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether through direct code contributions, documentation, bug reports, or helping other users on the mailing lists. Your efforts are much appreciated.


Full Changelog
---------

 * STORM-442: multilang ShellBolt/ShellSpout die() can be hang when Exception happened
 * STORM-1928: ShellSpout should check heartbeat while ShellSpout is waiting for subprocess to sync
