docker-compose -f create-certs.yml run --rm create_certs
docker-compose -f elastic-docker-tls.yml up -d

#docker exec es01 /bin/bash -c "bin/elasticsearch-setup-passwords \
#auto \
#--url https://localhost:9200"


