from volatus.vecto.util import ipType, resolveAddress

def main():
    ip1 = '127.0.0.1'
    ip2 = '10.34.197.201'
    ip3 = '10.42.229.0/24'
    ip4 = '0.0.0.0'
    ip5 = '10.42.229.28'

    print(ipType(ip1))
    print(resolveAddress(ip1))

    print(ipType(ip2))
    print(resolveAddress(ip2))

    print(ipType(ip3))
    print(resolveAddress(ip3))

    print(ipType(ip4))
    print(resolveAddress(ip4))

    print(ipType(ip5))
    print(resolveAddress(ip5))

if __name__ == '__main__':
    main()