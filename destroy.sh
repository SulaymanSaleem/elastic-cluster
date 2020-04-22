unset KIBANA_PASSWORD
rm -rf elasticpasswords.txt kibanapassword
docker-compose -f elastic-docker-tls.yml down -v
