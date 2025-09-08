# IG Volatus

Volatus is a data acquisition and control framework intended to be suitable for small data acquisition applications up to larger distributed test systems including several nodes performing data acquisition and commanding. While Volatus is initially written in LabVIEW, it uses tooling, Google's Protobuf, over top of simple networking communications to enable development of applications in nearly any environment.

## Python Volatus

This Python package provides core configuration and communication capabilities to allow python scripts to interact with a Volatus system. Initially these capabilities will be limited to receiving telemetry data and sending commands as would be necessary in an automation script. Eventually more capabilities will be added to make it possible to build entire applications in Python and generate data from Python scripts.