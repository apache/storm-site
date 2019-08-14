---
layout: about
---

Apache Storm is fault-tolerant: when workers die, Apache Storm will automatically restart them. If a node dies, the worker will be restarted on another node.

The Apache Storm daemons, Nimbus and the Supervisors, are designed to be stateless and fail-fast. So if they die, they will restart like nothing happened. This means you can *kill -9* the Apache Storm daemons without affecting the health of the cluster or your topologies.

Read more about Apache Storm's fault-tolerance [on the manual](/documentation/Fault-tolerance.html).