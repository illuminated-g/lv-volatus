from pathlib import Path
from enum import Enum
import json
import queue
import os
import hashlib

class VL_Type(Enum):
    UNKNOWN = 0
    VL_System = 1
    VL_Cluster = 2
    VL_Node = 3
    VL_Task = 4
    VL_Group = 5
    VL_Channel = 6
    VL_Task_List = 7
    VL_Scaling = 8
    VL_Sensor = 9
    VL_Sensor_List = 10
    VL_Scale = 11

    def __str__(self):
        return f'{self.name}'
    
    def fromStr(s: str) -> 'VL_Type':
        if not s:
            return None
        
        try:
            e = VL_Type[s]
            return e
        except KeyError:
            return VL_Type.UNKNOWN

class VL_Meta(Enum):
    UNKNOWN = 0
    VL_Type = 1
    VL_Task_Type = 2
    VL_Group_Type = 3
    VL_Config_Version = 4
    
    def __str__(self):
        return f'{self.name}'

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
    
    def tuple(self) -> tuple[str, int]:
        return (self._address, self._port)

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
        self.publishConfig = publishConfig
        self._channels: dict[str, ChannelConfig] = dict()
        self._task = taskName
        self._node = nodeName
        self._cluster = clusterName

        for channel in channels:
            self._channels[channel.name()] = channel
    
    def isPublished(self) -> bool:
        return self.publishConfig is not None
    
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
    
    def channels(self) -> dict[str, ChannelConfig]:
        return self._channels
    
    def addChannel(self, channel: ChannelConfig):
        self._channels[channel.name()] = channel
    
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

    def groups(self) -> dict[str, GroupConfig]:
        return self._groups

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
    
    def tasks(self) -> dict[str, TaskConfig]:
        return self._tasks
    
    def addTask(self, task: TaskConfig):
        self._tasks[task.name()] = task
    
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
    
    def fromString(versionStr: str) -> 'VolatusVersion':
        parts = versionStr.split('.')
        major = int(parts[0])
        minor = int(parts[1])
        build = 0
        prerelease = ''
        
        buildParts = parts[2].split('+')
        if len(buildParts) > 1:
            build = int(buildParts[1])
        
        preParts = buildParts[0].split('-')
        if len(preParts) > 1:
            prerelease = preParts[1]

        fix = int(preParts[0])

        return VolatusVersion(major, minor, fix, build, prerelease)
    
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
    def __init__(self, version: VolatusVersion = None, hash: str = None, system: SystemConfig = None):
        self.version = version
        self.hash = hash
        self.system = system
        self.groups: dict[str, TaskLookup] = dict()
        self.channels: dict[str, GroupLookup] = dict()

        self.refreshLookups()

    def _addSystemDicts(self, system: SystemConfig):
        clusters = system.clusters()
        for cluster in clusters.values():
            self._addClusterDicts(cluster)

    def _addClusterDicts(self, cluster: ClusterConfig):
        nodes = cluster.nodes()
        for node in nodes.values():
            self._addNodeDicts(node)

    def _addNodeDicts(self, node: NodeConfig):
        tasks = node.tasks()
        for task in tasks.values():
            self._addTaskDicts(task)

    def _addTaskDicts(self, task: TaskConfig):
        groups = task.groups()
        for group in groups.values():
            self._addGroupDicts(group)

    def _addGroupDicts(self, group: GroupConfig):
        self.groups[group.name()] = TaskLookup(group.taskName(), group.nodeName(), group.clusterName())
        channels = group.channels()
        for channel in channels.values():
            self.channels[channel.name()] = GroupLookup(group.name(), group.taskName(), group.nodeName(), group.clusterName())
    
    def refreshLookups(self):
        self.groups = dict()
        self.channels = dict()

        if self.system:
            self._addSystemDicts(self.system)
    
    def lookupCluster(self, cl: ClusterLookup) -> ClusterConfig | None:
        return self.lookupClusterByName(cl.cluster())
    
    def lookupClusterByName(self, clusterName: str) -> ClusterConfig | None:
        if self.system:
            return self.system.lookupClusterByName(clusterName)
        
        return None
    
    def lookupNode(self, nl: NodeLookup) -> NodeConfig | None:
        return self.lookupNodeByName(nl.node(), nl.cluster())
    
    def lookupNodeByName(self, nodeName: str, clusterName: str = None) -> NodeConfig | None:
        if clusterName:
            cluster = self.lookupClusterByName(clusterName)
            if cluster:
                return cluster.lookupNodeByName(nodeName)
        elif self.system:
            clusters = self.system.clusters()
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
        tl = self.groups.get(groupName)
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
        gl = self.channels.get(channelName)
        if gl:
            group = self.lookupGroup(gl)
            if group:
                return group.lookupChannelByName(channelName)
            
        return None

class Cfg:
    def normalizePath(pathStr: str) -> Path:
        pathArr = pathStr.split('/')
        path: Path = None

        for segment in pathArr:
            if not path:
                path = Path(segment + os.sep)
            else:
                path = path.joinpath(segment)
        
        return path

    def childrenOf(obj: dict) -> dict:
        return {k: v for k, v in obj.items() if k != 'Meta'}
    
    def readMetaValue(obj: dict, name: str) -> str | None:
        meta = obj.get('Meta')
        if meta:
            return meta.get(name)
        
        return None
    
    def writeMetaValue(obj: dict, name: str, value: str):
        if 'Meta' not in obj:
            obj['Meta'] = {name: value}
        else:
            obj['Meta'][name] = value
    
    def vlReadMeta(obj: dict, meta: VL_Meta) -> str | None:
        m = obj.get('Meta')
        if m:
            return m.get(str(meta))
        
        return None
    
    def vlWriteMeta(obj: dict, meta: VL_Meta, value: str):
        Cfg.writeMetaValue(obj, str(meta), value)

    def vlSetType(obj: dict, type: VL_Type):
        Cfg.vlWriteMeta(obj, VL_Meta.VL_Type, str(type))
    
    def vlTypeOf(obj: dict) -> VL_Type | None:
        return VL_Type.fromStr(Cfg.vlReadMeta(obj, VL_Meta.VL_Type))            
    
    def vlFindType(obj: dict, type: VL_Type, recursePastMatch: bool = True) -> dict:
        matches = dict()

        q: queue.Queue[tuple[str, dict]] = queue.Queue()
        q.put(('', obj))

        while not q.empty():
            name, o = q.get()
            recurse = True
            if Cfg.vlTypeOf(o) == type and name != '':
                matches[name] = o
                if not recursePastMatch:
                    recurse = False
                
            if recurse:
                children: dict = Cfg.childrenOf(o)
                for name, child in children.items():
                    if isinstance(child, dict):
                        q.put((name, child))
        
        return matches

class ConfigLoader:
    def load(path: Path) -> VolatusConfig:
        hash = ''

        #hash needs to be calculated with binary mode
        with open(path, 'rb') as file:
            hash = hashlib.file_digest(file, 'sha256').hexdigest()

        with open(path, 'r', encoding='utf-8') as file:
            cfg = json.load(file)
            version = VolatusVersion.fromString(cfg['Volatus']['Meta']['VL_Config_Version'])

            #should only be a single non-Meta child in the volatus object
            children = Cfg.childrenOf(cfg['Volatus'])
            systemName, sysObj = next(iter(children.items()))

            system = SystemConfig(systemName)
            vCfg = VolatusConfig(version, hash, system)

            ConfigLoader.loadSystem(system, sysObj)

            vCfg.refreshLookups()
            return vCfg

    def save(path: Path, config: VolatusConfig):
        pass

    def loadGroup(task: TaskConfig, groupName: str, groupObj: dict):
        groupType = Cfg.vlReadMeta(groupObj, VL_Meta.VL_Group_Type)
        
        pubCfg: EndpointConfig = None
        pubObj = groupObj.get('Publish')
        if pubObj:
            pubCfg = EndpointConfig(pubObj['Address'], pubObj['Port'])

        group = GroupConfig(groupName, task.name(), task.nodeName(),
                            task.clusterName(), publishConfig= pubCfg)
        task.addGroup(group)
        
        chansObj = Cfg.vlFindType(groupObj, VL_Type.VL_Channel)
        for channelName, chanObj in chansObj.items():
            resource = chanObj.get('Resource')
            if not resource:
                resource = ''

            channel = ChannelConfig(channelName, groupName, task.name(),
                                    task.nodeName(), task.clusterName(),
                                    chanObj.get('Value'),  resource)
            
            group.addChannel(channel)

    def loadTask(node: NodeConfig, taskName: str, taskObj: dict):
        taskType = Cfg.vlReadMeta(taskObj, VL_Meta.VL_Task_Type)

        task = TaskConfig(taskName, taskType, node.name(), node.clusterName())
        node.addTask(task)

        groups = Cfg.vlFindType(taskObj, VL_Type.VL_Group, False)
        for groupName, groupObj in groups.items():
            ConfigLoader.loadGroup(task, groupName, groupObj)
    
    def loadNode(cluster: ClusterConfig, nodeName: str, nodeObj: dict):
        nodeId = nodeObj['Node_ID']
        debug = nodeObj['DebugGUIs']
        logFolder = Cfg.normalizePath(nodeObj['Events']['LogFolder'])
        
        netCfg: NodeNetworkConfig = None
        net = nodeObj.get('Network')
        if net:
            tcpCfg: TCPConfig = None
            tcp = net.get('TCP')
            if tcp:
                tcpCfg = TCPConfig(tcp['Address'], tcp['Port'], tcp['Server'])

            httpPort = net.get('HTTP_Port')
            announceInterval = net.get('Announce_Interval')
            
            netCfg = NodeNetworkConfig(tcpCfg, httpPort, announceInterval)

        targetGroups = []
        groups = nodeObj.get('Groups')
        if groups:
            for group in groups:
                targetGroups.append(group)
        
        node = NodeConfig(nodeName, nodeId, cluster.name(), logFolder, netCfg, targetGroups)
        cluster.addNode(node)

        tasksObj = nodeObj.get('Tasks')
        if tasksObj:
            tasks = Cfg.childrenOf(tasksObj)
            for taskName, taskObj in tasks.items():
                ConfigLoader.loadTask(node, taskName, taskObj)
        
    def loadCluster(system: SystemConfig, clusterName: str, clusterObj: dict):
        #Discovery endpoint config is the multicast endpoint nodes advertise on for dynamic mapping
        discObj = clusterObj.get('Discovery')
        disc = None
        if discObj:
            disc = EndpointConfig(discObj['Address'], discObj['Port'])

        groupsObj = clusterObj.get('Groups')
        
        cluster = ClusterConfig(clusterName, disc, groupsObj)
        system.addCluster(cluster)

        nodesObj = clusterObj.get('Nodes')
        nodes = Cfg.childrenOf(nodesObj)
        for nodeName, nodeObj in nodes.items():
            ConfigLoader.loadNode(cluster, nodeName, nodeObj)

    def loadSystem(system: SystemConfig, sysObj: dict):

        #ignoring sensor list for now, not needed by python automation scripts

        #iterate over and create clusters
        sysChildren = Cfg.childrenOf(sysObj)
        clustersObj = sysChildren['Clusters']
        clusters = Cfg.childrenOf(clustersObj)

        for clusterName, clusterObj in clusters.items():
            ConfigLoader.loadCluster(system, clusterName, clusterObj)