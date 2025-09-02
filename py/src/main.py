from volatus.telemetry import *
from volatus.config import *

import time

# provide a "cleaner" path format that doesn't trip up on escape sequences.
# this is the same format used for paths in vjson files.
cfgPath = Cfg.normalizePath('c:/dev/lv20ce/relink/lv-volatus/VolatusScratch/daqtest.vjson')

# load the configuration object from disk
# the volatus config class provides convenient lookup methods used for interacting
#   with telemetry and commands
vCfg: VolatusConfig = ConfigLoader.load(cfgPath)

print('Config hash: ' + vCfg.hash)

# create the telemetry object which handles subscriptions and reading group data
#   from the network
tlm = Telemetry()

# get a known group config that we are interested in subscribing for data from
aiGroup = tlm.subscribeToGroupCfg(vCfg.lookupGroupByName('TestAI'))

# lookup a value we want to get current value from
chAlpha = aiGroup.channel['Alpha']

# display channel value roughly ten times a second
for i in range(100):
    print(chAlpha.value)
    time.sleep(0.1)

# shutdown the telemetry handling
tlm.close()