---
layout: about
---

Apache Storm integrates with any queueing system and any database system. Apache Storm's [spout](/apidocs/backtype/storm/spout/ISpout.html) abstraction makes it easy to integrate a new queuing system. 

Likewise, integrating Apache Storm with database systems is easy. Simply open a connection to your database and read/write like you normally would. Apache Storm will handle the parallelization, partitioning, and retrying on failures when necessary.