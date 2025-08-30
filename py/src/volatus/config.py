from pathlib import Path
from enum import Enum

class EndpointConfig:
    def __init__(self, address: str, port: int):
        self._address: str = address
        self._port: int = port

    def __str__(self) -> str:
        return f'{self._address}:{self._port}'
    
    def address(self) -> str:
        return self._address
    
    def port(self) -> int:
        return self._port

class ChannelConfig:
    def __init__(self, name: str, groupName: str, taskName: str, nodeName: str, clusterName: str,
                 defaultValue: str | float = None, resource: str = ''):
        self._name = name
        self._default = defaultValue
        self._resource = resource
        self._group = groupName
        self._task = taskName
        self._node = nodeName
        self._cluster = clusterName

    def name(self) -> str:
        return self._name
    
    def defaultValue(self):
        return self._default
    
    def resource(self) -> str:
        return self._resource
    
    def groupName(self) -> str:
        return self._group
    
    def setGroupName(self, groupName: str):
        self._group = groupName
    
    def taskName(self) -> str:
        return self._task
    
    def setTaskName(self, taskName: str):
        self._task = taskName
    
    def nodeName(self) -> str:
        return self._node
    
    def setNodeName(self, nodeName: str):
        self._node = nodeName
    
    def clusterName(self) -> str:
        return self._cluster
    
    def setClusterName(self, clusterName: str):
        self._cluster = clusterName

class GroupConfig:
    def __init__(self, name: str, taskName: str, nodeName: str, clusterName: str,
                 channels: list[ChannelConfig] = [], publishConfig: EndpointConfig = None):
        self._name = name
        self._publish = publishConfig
        self._channels: dict[str, ChannelConfig] = dict()
        self._task = taskName
        self._node = nodeName
        self._cluster = clusterName

        for channel in channels:
            self._channels[channel.name()] = channel
    
    def isPublished(self) -> bool:
        return self._publish is not None
    
    def publishConfig(self) -> EndpointConfig | None:
        return self._publish
    
    def name(self) -> str:
        return self._name
    
    def taskName(self) -> str:
        return self._task
    
    def setTaskName(self, taskName: str):
        self._task = taskName
    
    def nodeName(self) -> str:
        return self._node
    
    def setNodeName(self, nodeName: str):
        self._node = nodeName
    
    def clusterName(self) -> str:
        return self._cluster
    
    def setClusterName(self, clusterName: str):
        self._cluster = clusterName
    
    def channels(self) -> list[ChannelConfig]:
        return list(self._channels.values())
    
    def lookupChannelByName(self, channelName: str) -> ChannelConfig:
        return self._channels.get(channelName)

class TaskConfig:
    def __init__(self, name: str, type: str, nodeName: str, clusterName: str,
                 groups: list[GroupConfig] = []):
        self._name = name
        self._type = type
        self._groups: dict[str, GroupConfig] = dict()
        self._node = nodeName
        self._cluster = clusterName

        for group in groups:
            self._groups[group.name()] = group

    def groups(self) -> list[GroupConfig]:
        return list(self._groups.values())

    def addGroup(self, group: GroupConfig):
        self._groups[group.name()] = group
    
    def lookupGroupByName(self, groupName: str) -> GroupConfig | None:
        return self._groups.get(groupName)
    
    def type(self) -> str:
        return self._type
    
    def name(self) -> str:
        return self._name
    
    def nodeName(self) -> str:
        return self._node
    
    def setNodeName(self, nodeName: str):
        self._node = nodeName
    
    def clusterName(self) -> str:
        return self._cluster
    
    def setClusterName(self, clusterName: str):
        self._cluster = clusterName

class TCPConfig:
    def __init__(self, address: str, port: int, server: bool):
        self._address = address
        self._port = port
        self._server = server

    def address(self) -> str:
        return self._address
    
    def port(self) -> int:
        return self._port
    
    def isServer(self) -> bool:
        return self._server

class NodeNetworkConfig:
    def __init__(self, tcpConfig: TCPConfig, httpPort: int = None, announceInterval: int = None):
        self._tcp = tcpConfig
        self._httpPort = httpPort
        self._announceInterval = announceInterval
    
    def tcp(self) -> TCPConfig | None:
        return self._tcp
    
    def httpPort(self) -> int | None:
        return self._httpPort
    
    def announceInterval(self) -> int | None:
        return self._announceInterval
        
class NodeConfig:
    def __init__(self, name: str, id: int, clusterName: str,
                 eventLogFolder: Path = None, network: NodeNetworkConfig = None,
                 targetGroups: list[str] = [], tasks: list[TaskConfig] = []):
        self._name = name
        self._id = id
        self._logFolder = eventLogFolder
        self._network = network
        self._targetGroups = targetGroups
        self._tasks: dict[str, TaskConfig] = dict()
        self._cluster = clusterName

        for task in tasks:
            self._tasks[task.name()] = task

    def name(self) -> str:
        return self._name
    
    def id(self) -> int:
        return self._id
    
    def eventLogFolder(self) -> Path | None:
        return self._logFolder
    
    def networkConfig(self) -> NodeNetworkConfig | None:
        return self._network
    
    def tcpConfig(self) -> TCPConfig | None:
        if self._network:
            return self._network.tcp()
        
        return None
    
    def targetGroups(self) -> list[str]:
        return self._targetGroups
    
    def tasks(self) -> list[TaskConfig]:
        return list(self._tasks.values())
    
    def addTask(self, task: TaskConfig):
        self._tasks
    
    def clusterName(self) -> str:
        return self._cluster
    
    def setClusterName(self, clusterName: str):
        self._cluster = clusterName
        for task in self._tasks:
            task.setClusterName(clusterName)
    
    def lookupTaskByName(self, taskName: str) -> TaskConfig | None:
        return self._tasks.get(taskName)

class ClusterConfig:
    def __init__(self, name: str, discoveryEndpoint: EndpointConfig = None, targetGroups: dict[str, int] = None, nodes: list[NodeConfig] = None):
        self._name = name
        self._discovery = discoveryEndpoint
        self._targetGroups = targetGroups
        self._nodes: dict[str, NodeConfig] = dict()

        if nodes:
            for node in nodes:
                self._nodes[node.name()] = node
    
    def name(self) -> str:
        return self._name
    
    def discoveryEndpoint(self) -> EndpointConfig | None:
        return self._discovery
    
    def lookupTargetGroupId(self, targetName: str) -> int | None:
        if self._targetGroups:
            return self._targetGroups.get(targetName)
        
        return None
    
    def nodes(self) -> dict[str, NodeConfig]:
        return self._nodes
    
    def lookupNodeByName(self, nodeName: str) -> NodeConfig | None:
        return self._nodes.get(nodeName)
    
    def addNode(self, node: NodeConfig):
        self._nodes[node.name()] = node

class SystemConfig:
    def __init__(self, name: str, clusters: list[ClusterConfig] = []):
        self._name = name
        self._clusters: dict[str, ClusterConfig] = dict()

        for cluster in clusters:
            self._clusters[cluster.name()] = cluster
    
    def name(self) -> str:
        return self._name
    
    def clusters(self) -> dict[str, ClusterConfig]:
        return self._clusters
    
    def lookupClusterByName(self, clusterName: str) -> ClusterConfig | None:
        return self._clusters.get(clusterName)
    
    def addCluster(self, cluster: ClusterConfig):
        self._clusters[cluster.name()] = cluster

class VersionBump(Enum):
    NONE = 0
    FIX = 1
    MINOR = 2
    MAJOR = 3

class VolatusVersion:
    def __init__(self, major: int, minor: int, fix: int, build: int = 0, prerelease: str = ''):
        self._major = major
        self._minor = minor
        self._fix = fix
        self._build = build
        self._prerelease = prerelease

    def __str__(self) -> str:
        ver = f'{self._major}.{self._minor}.{self._fix}'
        if self._prerelease:
            ver += f'-{self._prerelease}'

        if self._build > 0:
            ver += f'+{self._build}'

        return ver
    
    def bump(self, bumpType: VersionBump):
        match bumpType:
            case VersionBump.NONE:
                if self._build:
                    self._build += 1
                else:
                    self._build = 1

            case VersionBump.FIX:
                self._fix += 1

                if self._build:
                    self._build += 1
                else:
                    self._build = 1

            case VersionBump.MINOR:
                self._minor += 1
                self._fix = 0

                if self._build:
                    self._build += 1
                else:
                    self._build = 1
                
            case VersionBump.MAJOR:
                self._major += 1
                self._minor = 0
                self._fix = 0
                
                if self._build:
                    self._build += 1
                else:
                    self._build = 1

    def major(self) -> int:
        return self._major
    
    def minor(self) -> int:
        return self._minor
    
    def fix(self) -> int:
        return self._fix
    
    def build(self) -> int:
        return self._build
    
    def prerelease(self) -> str:
        return self._prerelease

class ClusterLookup:
    def __init__(self, clusterName: str):
        self._cluster = clusterName

    def cluster(self) -> str:
        return self._cluster

class NodeLookup(ClusterLookup):
    def __init__(self, nodeName: str, clusterName: str):
        self._node = nodeName
        super(NodeLookup, self).__init__(clusterName)

    def node(self) -> str:
        return self._node
    
class TaskLookup(NodeLookup):
    def __init__(self, taskName: str, nodeName: str, clusterName: str):
        self._task = taskName
        super(TaskLookup, self).__init__(nodeName, clusterName)

    def task(self) -> str | None:
        return self._task
    
class GroupLookup(TaskLookup):
    def __init__(self, groupName: str, taskName: str, nodeName: str, clusterName: str):
        self._group = groupName
        super(GroupLookup, self).__init__(taskName, nodeName, clusterName)
    
    def group(self) -> str:
        return self._group

class ChannelLookup(GroupLookup):
    def __init__(self, channelName: str, groupName: str, taskName: str, nodeName: str, clusterName: str):
        self._channel = channelName
        super(ChannelLookup, self).__init__(groupName, taskName, nodeName, clusterName)

    def channel(self) -> str:
        return self._channel

class VolatusConfig:
    def __init__(self, version: VolatusVersion = None, system: SystemConfig = None):
        self._version = version
        self._system = system
        self._groups: dict[str, TaskLookup] = dict()
        self._channels: dict[str, GroupLookup] = dict()

        self.refreshLookups()

    def _addSystemDicts(self, system: SystemConfig):
        clusters = system.clusters()
        for cluster in clusters:
            self._addClusterDicts(cluster)

    def _addClusterDicts(self, cluster: ClusterConfig):
        nodes = cluster.nodes()
        for node in nodes:
            self._addNodeDicts(node)

    def _addNodeDicts(self, node: NodeConfig):
        tasks = node.tasks()
        for task in tasks:
            self._addTaskDicts(task)

    def _addTaskDicts(self, task: TaskConfig):
        groups = task.groups()
        for group in groups:
            self._addGroupDicts(group)

    def _addGroupDicts(self, group: GroupConfig):
        self._groups[group.name()] = TaskLookup(group.taskName(), group.nodeName(), group.clusterName())
        channels = group.channels()
        for channel in channels:
            self._channels[channel.name()] = GroupLookup(group.name(), group.taskName(), group.nodeName(), group.clusterName())

    def version(self) -> VolatusVersion | None:
        return self._version
    
    def system(self) -> SystemConfig | None:
        return self._system
    
    def refreshLookups(self):
        self._groups = dict()
        self._channels = dict()

        if self._system:
            self._addSystemDicts(self._system)
    
    def lookupCluster(self, cl: ClusterLookup) -> ClusterConfig | None:
        return self.lookupClusterByName(cl.cluster())
    
    def lookupClusterByName(self, clusterName: str) -> ClusterConfig | None:
        if self._system:
            return self._system.lookupClusterByName(clusterName)
        
        return None
    
    def lookupNode(self, nl: NodeLookup) -> NodeConfig | None:
        return self.lookupNodeByName(nl.node(), nl.cluster())
    
    def lookupNodeByName(self, nodeName: str, clusterName: str = None) -> NodeConfig | None:
        if clusterName:
            cluster = self.lookupClusterByName(clusterName)
            if cluster:
                return cluster.lookupNodeByName(nodeName)
        elif self._system:
            clusters = self._system.clusters()
            for clusterName, cluster in clusters.items():
                node = cluster.lookupNodeByName(nodeName)
                if node:
                    return node
                
        return None
    
    def lookupTask(self, tl: TaskLookup) -> TaskConfig | None:
        return self.lookupTaskByName(tl.task(), tl.node(), tl.cluster())

    def lookupTaskByName(self, taskName: str, nodeName: str, clusterName: str = None) -> TaskConfig | None:
        node = self.lookupNodeByName(nodeName, clusterName)
        if node:
            return node.lookupTaskByName(taskName)
        
        return None
    
    def lookupGroup(self, gl: GroupLookup) -> GroupConfig | None:
        task = self.lookupTask(gl)
        if task:
            return task.lookupGroupByName(gl.group())
        
        return None
    
    def lookupGroupByName(self, groupName: str) -> GroupConfig | None:
        tl = self._groups.get(groupName)
        if tl:
            task = self.lookupTask(tl)
            if task:
                return task.lookupGroupByName(groupName)
        
        return None
    
    def lookupChannel(self, cl: ChannelLookup) -> ChannelConfig | None:
        group = self.lookupGroup(cl)
        if group:
            return group.lookupChannelByName(cl.channel())
        
        return None
    
    def lookupChannelByName(self, channelName: str) -> ChannelConfig | None:
        gl = self._channels.get(channelName)
        if gl:
            group = self.lookupGroup(gl)
            if group:
                return group.lookupChannelByName(channelName)
            
        return None
    
    def load(self, path: Path):
        pass

    def save(self, path: Path):
        pass