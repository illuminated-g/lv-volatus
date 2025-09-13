from glob import glob
from os.path import dirname
from pathlib import Path
import subprocess

def main():
    print("\n  == gen-proto ==")
    print("Starting Python ProtoBuf message generation for the Volatus framework.")
    print(" * This expects lv-vecto cloned as a sibling of lv-volatus.")
    print(" * Ensure protoc is available on the path and is available in the shell.")

    volatusRoot = Path(__file__).parent.parent.parent
    vectoRoot = volatusRoot.parent.joinpath("lv-vecto")

    volatusProtoDir = volatusRoot.joinpath("proto")
    vectoProtoDir = vectoRoot.joinpath("proto")

    volatusProtoDefs = glob(str(volatusProtoDir) + "\\*.proto")
    vectoProtoDefs = glob(str(vectoProtoDir) + "\\*.proto")

    volatusOutDir = Path(__file__).parent.parent.joinpath("src").joinpath("volatus").joinpath("proto")
    vectoOutDir = volatusOutDir.parent.joinpath("vecto").joinpath("proto")

    print("\n  == Generating base Vecto messages ==")

    for vectoProto in vectoProtoDefs:
        print("Building proto message for " + vectoProto + " ...", end="")
        subprocess.run([
            "protoc",
            "--proto_path=" + str(vectoProtoDir),
            "--pyi_out=" + str(vectoOutDir),
            "--python_out=" + str(vectoOutDir),
            vectoProto
            ])
        print (" Done")
    
    print("\n == Generating Volatus messages ==")

    for volatusProto in volatusProtoDefs:
        print("Building proto message for " + volatusProto + " ...", end="")
        subprocess.run([
            "protoc",
            "--proto_path=" + str(volatusProtoDir),
            "--pyi_out=" + str(volatusOutDir),
            "--python_out=" + str(volatusOutDir),
            volatusProto
            ])
        print (" Done")


if __name__ == "__main__":
    main()
else:
    print("This file must be run directly.")
