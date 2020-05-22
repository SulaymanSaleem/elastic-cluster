### Install filebeats and metricbeats ###

curl http://169.254.169.254/latest/meta-data/local-ipv4 > es_host
sed -i '1s/^/export ES_HOST=/' es_host
sed -i -e '$a\export ES_PASSWORD=' es_host
source ./es_host

git clone https://github.com/SulaymanSaleem/elastic-beats
cp /var/lib/docker/volumes/es_certs/ ./elastic-beats/ -r
