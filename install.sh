apt-get install mysql-server openvpn easy-rsa

# mysql .sh scripts and udp and tcp openvpn server configurations
cp -R script /etc/openvpn/
cp *.conf /etc/openvpn/

# easy-rsa certificate generation
cp -R /usr/share/easy-rsa /etc/openvpn/
cd /etc/openvpn/easy-rsa
source ./vars
./clean-all
./build-ca
./build-key-server server
./build-key client
./build-dh
mv keys /etc/openvpn/

# openvpn logging
mkdir /etc/openvpn/log
touch /etc/openvpn/log/openvpn.log
touch /etc/openvpn/log/tcp_443.log
touch /etc/openvpn/log/udp_53.log
chmod -R 755 /etc/openvpn

/etc/openvpn/script/test_connect_db.sh test 1234

# share internet to client

