from volatus.config import Cfg
from volatus.volatus import Volatus, EventLevel
from volatus.telemetry import ChannelGroup, ChannelValue

import time

# provide a "cleaner" path format that doesn't trip up on escape sequences.
# this is the same format used for paths in vjson files.
cfgPath = Cfg.normalizePath('c:/dev/lv20ce/relink/lv-volatus/VolatusScratch/daqtest.vjson')

# create the top level Volatus object. The Volatus class handles config loading
# and initializing the components as configured. With the Context Manager support
# the initialized volatus object is automatically shutdown at the end of the with block.
with Volatus(cfgPath, 'TestSystem', 'TestCluster', 'PyScript') as v:

    gAI: ChannelGroup
    hasData: bool

    # subscribe to a known group we're interested in reading published data from
    gAI, hasData = v.subscribe('TestAI', 2)

    if hasData:
        print("Data valid within timeout.")
    else:
        print("No data received yet.")

    # get a single channel to read live values from
    ch0: ChannelValue = gAI.chanByName('Alpha')

    v.reportEvent('Events', EventLevel.EVENTLEVEL_INFO, 'Test Python', 'Starting sequencing')

    # turn digital output on, for scaled values (such as inverted NO valves) this will be before scaling
    # typically meaning valves are always True = Open, False = Closed
    # the create___Command methods return a VCommand object with a send() that can be called right away or sent later
    v.createDigitalCommand('Heater_En', True).send()

    # loop ~10Hz displaying current value for the channel
    # run long enough to get some discovery packets out
    for i in range(200):
        print(ch0.value)
        time.sleep(0.1)

    # turn digital output back off
    v.createDigitalCommand('Heater_En', False).send()

    v.reportEvent('Events', EventLevel.EVENTLEVEL_INFO, 'Test Python', 'Sequence complete')

    #need to sleep a bit to give last command time to send before the with block tears down the TCP connection
    time.sleep(0.1)