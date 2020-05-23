git clone https://github.com/SulaymanSaleem/elastic-beats

IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

sed -i 's/${ES_HOST}/'$IP'/g' elastic-beats/ubuntu/filebeat.yml
sed -i 's/${ES_PASSWORD}/<PASSWORD>/g' elastic-beats/ubuntu/filebeat.yml

sed -i 's/${ES_HOST}/'$IP'/g' elastic-beats/ubuntu/metricbeat.yml
sed -i 's/${ES_PASSWORD}/<PASSWORD>/g' elastic-beats/ubuntu/metricbeat.yml

sed -i 's/${ES_HOST}/'$IP'/g' elastic-beats/ubuntu/modules.d/elasticsearch.yml
sed -i 's/${ES_HOST}/'$IP'/g' elastic-beats/ubuntu/modules.d/kibana.yml

