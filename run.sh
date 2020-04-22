docker-compose -f create-certs.yml run --rm create_certs
docker-compose -f elastic-docker-tls.yml up -d

docker exec -it es01 bash -c "bin/elasticsearch-setup-passwords auto --url https://localhost:9200 <<<"y"" >elasticpasswords.txt

awk '/PASSWORD kibana/{print $NF}' elasticpasswords.txt >> kibanapassword
# add KIBANA_PASSWWORD b4 the actual password
sed -i -e 's/^/KIBANA_PASSWORD=/' kibanapassword
#adding to end of .env
cat kibanapassword>>.env

#####installing dos2unix#####
apt install dos2unix -y
dos2unix .env
docker-compose -f elastic-docker-tls.yml stop
docker-compose -f elastic-docker-tls.yml up -d


