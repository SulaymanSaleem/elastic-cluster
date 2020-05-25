git clone https://github.com/SulaymanSaleem/elastic-beats
cp /var/lib/docker/volumes/es_certs/ elastic-beats/ -r

IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
PASSWORD=
sed -i 's/${ES_HOST}/'$IP'/g' elastic-beats/ubuntu/filebeat.yml
sed -i 's/${ES_PASSWORD}/'$PASSWORD'/g' elastic-beats/ubuntu/filebeat.yml

sed -i 's/${ES_HOST}/'$IP'/g' elastic-beats/ubuntu/metricbeat.yml
sed -i 's/${ES_PASSWORD}/'$PASSWORD'/g' elastic-beats/ubuntu/metricbeat.yml

sed -i 's/${ES_HOST}/'$IP'/g' elastic-beats/ubuntu/modules.d/elasticsearch.yml
sed -i 's/${ES_PASSWORD}/'$PASSWORD'/g' elastic-beats/ubuntu/modules.d/elasticsearch.yml

sed -i 's/${ES_HOST}/'$IP'/g' elastic-beats/ubuntu/modules.d/kibana.yml
sed -i 's/${ES_PASSWORD}/'$PASSWORD'/g' elastic-beats/ubuntu/modules.d/kibana.yml


sed -i 's/${ES_PASSWORD}/'$PASSWORD'/g' provisioning/datasources/filebeat.yml
sed -i 's/${ES_PASSWORD}/'$PASSWORD'/g' provisioning/datasources/metricbeat.yml
