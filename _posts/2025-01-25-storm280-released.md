---
layout: post
title: Apache Storm 2.8.0 Released
author: Rui Abreu
---

The Apache Storm community is pleased to announce that version 2.8.0 has been
released and is available from [the downloads page](/downloads.html).

This release includes new features as well as a number of code improvements, bug fixes and library updates.
We encourage users of previous versions to upgrade to this latest release.

<p><strong><u><font size="3"> Please note that starting with this release, the minimum JRE version to run Apache Storm is 17.</font></u></strong></p>

Thanks
------
Special thanks are due to all those who have contributed to Apache Storm -- whether
through direct code contributions, documentation, bug reports, or helping other
users on the mailing lists. Your efforts are much appreciated.


Changes in this Release - Storm 2.8.0
---------
<p>JIRA issues addressed in the 2.8.0 release of Storm. Documentation for this release is available at the <a href="https://storm.apache.org/">Apache Storm project site</a>.</p>

<h2>Bug</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-3693">STORM-3693</a>] - TimeOut ticks should be addressed to Executor instead of being addressed to a task or broadcasted. </li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4148">STORM-4148</a>] - Storm UI throwing error on Component page</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4149">STORM-4149</a>] - Decode ComponentId to avoid UI throwing errors</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4154">STORM-4154</a>] - Nimbus down following topology deployment</li>
</ul>

<h2>Task</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4131">STORM-4131</a>] - Update log4j2 to a non-borked version</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4132">STORM-4132</a>] - Remove "storm-hive"</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4133">STORM-4133</a>] - Raise Minimum JRE Level to 17</li>
</ul>

<h2>Dependency upgrade</h2>
<ul>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4134">STORM-4134</a>] - log4j2 2.24.3</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4135">STORM-4135</a>] - Commons IO 2.18.0</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4136">STORM-4136</a>] - Dropwizard 4.0.11</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4137">STORM-4137</a>] - Metrics 4.2.29</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4138">STORM-4138</a>] - Jackson 2.18.2</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4139">STORM-4139</a>] - Prometheus 1.3.5</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4141">STORM-4141</a>] - ByteBuddy 1.15.11 </li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4144">STORM-4144</a>] - slf4j2 2.0.16</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4145">STORM-4145</a>] - netty 4.1.116</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4146">STORM-4146</a>] - guava 33.4.0-jre</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4147">STORM-4147</a>] - checker-qual  3.48.4 </li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4150">STORM-4150</a>] - commons codec 1.17.2</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4151">STORM-4151</a>] - Jersey 3.1.10</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4152">STORM-4152</a>] - commons-csv 1.13.0</li>
<li>[<a href="https://issues.apache.org/jira/browse/STORM-4153">STORM-4153</a>] - rocksdb jni 9.8.4</li>
   </ul>
