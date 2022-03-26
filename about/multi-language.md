---
layout: about
---

Apache Storm was designed from the ground up to be usable with any programming language. At the core of Apache Storm is a [Thrift](https://thrift.apache.org/) [definition](https://github.com/apache/storm/blob/master/storm-core/src/storm.thrift) for defining and submitting topologies. Since Thrift can be used in any language, topologies can be defined and submitted from any language.

Similarly, spouts and bolts can be defined in any language. Non-JVM spouts and bolts communicate to Apache Storm over a [JSON-based protocol](/documentation/Multilang-protocol.html) over stdin/stdout. Adapters that implement this protocol exist for [Ruby](https://github.com/apache/storm/blob/master/storm-multilang/ruby/src/main/resources/resources/storm.rb), [Python](https://github.com/apache/storm/blob/master/storm-multilang/python/src/main/resources/resources/storm.py), [Javascript](https://github.com/apache/storm/blob/master/storm-multilang/javascript/src/main/resources/resources/storm.js), [Perl](https://github.com/dan-blanchard/io-storm).

*storm-starter* has an [example topology](https://github.com/apache/storm/blob/master/examples/storm-starter/src/jvm/storm/starter/WordCountTopology.java) that implements one of the bolts in Python.
