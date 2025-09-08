from volatus.volatus import *

import time

# provide a "cleaner" path format that doesn't trip up on escape sequences.
# this is the same format used for paths in vjson files.
cfgPath = Cfg.normalizePath('c:/dev/lv20ce/relink/lv-volatus/VolatusScratch/daqtest.vjson')

# create the top level Volatus object. The Volatus class handles config loading
# and initializing the components as configured. With the Context Manager support
# the initialized volatus object is automatically shutdown at the end of the with block.
with Volatus(cfgPath, 'TestSystem', 'TestCluster', 'PyScript') as v:

    # subscribe to a known group we're interested in reading published data from
    gAI = v.subscribe('TestAI')

    # get a single channel to read live values from
    ch0 = gAI.chanByName('Alpha')

    # turn digital output on, for scaled values (such as inverted NO valves) this will be before scaling
    # typically meaning valves are always True = Open, False = Closed
    v.sendDigitalCommand('Heater_En', True)

    # loop ~10Hz displaying current value for the channel
    for i in range(20):
        print(ch0.value)
        time.sleep(0.1)

    # turn digital output back off
    v.sendDigitalCommand('Heater_En', False)