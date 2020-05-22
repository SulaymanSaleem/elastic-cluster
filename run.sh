docker-compose -f create-certs.yml run --rm create_certs
docker-compose -f elastic-docker-tls.yml up -d

docker exec -it es01 bash -c "bin/elasticsearch-setup-passwords auto --url https://localhost:9200 <<<"y"" >elasticpasswords.txt

awk '/PASSWORD kibana/{print $NF}' elasticpasswords.txt >> kibanapassword
awk '/PASSWORD elastic/{print $NF}' elasticpasswords.txt >> elasticpassword
# add KIBANA_PASSWWORD b4 the actual password
sed -i -e 's/^/KIBANA_PASSWORD=/' kibanapassword
sed -i -e 's/^/ELASTIC_PASSWORD=/' elasticpassword
#adding to end of .env
cat kibanapassword>>.env
cat elasticpassword>>.env
#####installing dos2unix#####
apt install dos2unix -y
dos2unix .env
docker-compose -f elastic-docker-tls.yml stop
docker-compose -f elastic-docker-tls.yml up -d

rm -rf kibanapassword elasticpassword
docker exec -it es01 bash -c "bin/elasticsearch-plugin install repository-s3 <<<"y""
docker exec -it es02 bash -c "bin/elasticsearch-plugin install repository-s3 <<<"y""
docker exec -it es03 bash -c "bin/elasticsearch-plugin install repository-s3 <<<"y""

docker-compose -f elastic-docker-tls.yml restart

### Install filebeats and metricbeats ###
git clone https://github.com/SulaymanSaleem/elastic-beats
cd elastic-beats/ubuntu/
curl http://169.254.169.254/latest/meta-data/local-ipv4 > es_host
sed -i '1s/^/export ES_HOST=/' es_host
source ./es_host

#### Grafana run script ####
./grafanarun.sh
