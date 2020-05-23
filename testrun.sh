IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

sed -i 's/${ES_HOST}/'$IP'/g' instances.yml

docker-compose -f create-certs.yml run --rm create_certs

