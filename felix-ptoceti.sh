
# get Curl
apt-get update && apt-get install -y curl

mkdir /opt/osgi
# Install felix distribution
curl -O http://archive.apache.org/dist/felix/org.apache.felix.main.distribution-4.2.1.tar.gz && \
tar zxf org.apache.felix.main.distribution-4.2.1.tar.gz && rm org.apache.felix.main.distribution-4.2.1.tar.gz && \
cp -r felix-framework-4.2.1 /opt/osgi
mkdir -p /var/felix/fileinstall

cp -r conf /opt/osgi/felix-framework-4.2.1
cp -r configurations /opt/osgi/felix-framework-4.2.1
cp -r load /opt/osgi/felix-framework-4.2.1
cp -r data /opt/osgi/felix-framework-4.2.1
cp launch_felix.sh /opt/osgi/felix-framework-4.2.1/launch_felix.sh
cp felix-only_config /opt/osgi/felix-framework-4.2.1/felix-only_config

cp felix.sh /etc/init.d


cd /opt/osgi/felix-framework-4.2.1

./launch_felix.sh < felix-only_config &
wait

sudo chmod +x /etc/init.d/felix.sh
sudo update-rc.d felix.sh defaults


