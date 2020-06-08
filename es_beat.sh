git clone https://github.com/SulaymanSaleem/elastic-beats
git clone https://github.com/SulaymanSaleem/logstashInstall
cp /var/lib/docker/volumes/es_certs/ elastic-beats/ -r

IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
PASSWORD=
BUCKET=
### for ubuntu ###
sed -i 's/${ES_HOST}/'$IP'/g' elastic-beats/ubuntu/filebeat.yml
sed -i 's/${ES_PASSWORD}/'$PASSWORD'/g' elastic-beats/ubuntu/filebeat.yml

sed -i 's/${ES_HOST}/'$IP'/g' elastic-beats/ubuntu/metricbeat.yml
sed -i 's/${ES_PASSWORD}/'$PASSWORD'/g' elastic-beats/ubuntu/metricbeat.yml

sed -i 's/${ES_HOST}/'$IP'/g' elastic-beats/ubuntu/modules.d/elasticsearch.yml
sed -i 's/${ES_PASSWORD}/'$PASSWORD'/g' elastic-beats/ubuntu/modules.d/elasticsearch.yml

sed -i 's/${ES_HOST}/'$IP'/g' elastic-beats/ubuntu/modules.d/kibana.yml
sed -i 's/${ES_PASSWORD}/'$PASSWORD'/g' elastic-beats/ubuntu/modules.d/kibana.yml

### for centos ####
sed -i 's/${ES_HOST}/'$IP'/g' elastic-beats/centos/filebeat.yml
sed -i 's/${ES_PASSWORD}/'$PASSWORD'/g' elastic-beats/centos/filebeat.yml

sed -i 's/${ES_HOST}/'$IP'/g' elastic-beats/centos/metricbeat.yml
sed -i 's/${ES_PASSWORD}/'$PASSWORD'/g' elastic-beats/centos/metricbeat.yml

sed -i 's/${ES_HOST}/'$IP'/g' elastic-beats/centos/modules.d/elasticsearch.yml
sed -i 's/${ES_PASSWORD}/'$PASSWORD'/g' elastic-beats/centos/modules.d/elasticsearch.yml

sed -i 's/${ES_HOST}/'$IP'/g' elastic-beats/centos/modules.d/kibana.yml
sed -i 's/${ES_PASSWORD}/'$PASSWORD'/g' elastic-beats/centos/modules.d/kibana.yml

### for Logstash ###
sed -i 's/${ES_HOST}/'$IP'/g' logstashInstall/conf.d/email.conf
sed -i 's/${ES_PASSWORD}/'$PASSWORD'/g' logstashInstall/conf.d/email.conf
sed -i 's/${BUCKET}/'$BUCKET'/g' logstashInstall/conf.d/email.conf

sed -i 's/${ES_HOST}/'$IP'/g' logstashInstall/conf.d/spark_access.conf
sed -i 's/${ES_PASSWORD}/'$PASSWORD'/g' logstashInstall/conf.d/spark_access.conf
sed -i 's/${BUCKET}/'$BUCKET'/g' logstashInstall/conf.d/spark_access.conf

sed -i 's/${ES_HOST}/'$IP'/g' logstashInstall/logstash.yml
sed -i 's/${ES_PASSWORD}/'$PASSWORD'/g' logstashInstall/logstash.yml

### for Grafana ###
sed -i 's/${ES_PASSWORD}/'$PASSWORD'/g' provisioning/datasources/filebeat.yml
sed -i 's/${ES_PASSWORD}/'$PASSWORD'/g' provisioning/datasources/metricbeat.yml
sed -i 's/${ES_PASSWORD}/'$PASSWORD'/g' provisioning/datasources/logstash.yml
