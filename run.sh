docker-compose -f create-certs.yml run --rm create_certs
docker-compose up -d
docker run --rm -v es_certs:/certs --network=es_elastic docker.elastic.co/elasticsearch/elasticsearch:7.5.1 curl --cacert /certs/ca/ca.crt -u elastic:PleaseChangeMe https://es01:9200

