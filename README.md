# Volatus
LabVIEW application framework based around [Vecto](https://github.com/illuminated-g/lv-vecto/blob/main/README.md) for network comms.

Volatus organizes functionality into *modules* which are communicated with via encapsulated Message queues (*MessageQ*). Modules are implemented with Queued Message Handler (QMH) patterns and several templates are provided for quicker development for common use-cases.

Volatus follows Vecto's organization for distributed applications and data which is:
- System
  - All components for a single test stand.
- Cluster
  - All nodes that directly communicate with each other.
  - Most systems will only utilize a single cluster.
- Node
  - An application running as part of a cluster.
  - Examples are a DAQ node, Sequencing node, Console GUI node, etc.
- Task
  - A top-level module within an application that generally will own or work with Group data.
  - Can organize functionality into nested modules that can be launched nested underneath the task.
  - Tasks have entries within the configuration file whereas other modules are not required to.
- Group
  - A collection of channel data that is updated at the same rate.
  - Currently supports Doubles and Strings; String representations can be used a means for handling heterogeneous data types.
  - All channels in a group are the same type.
- Channel
  - A discrete element of data
