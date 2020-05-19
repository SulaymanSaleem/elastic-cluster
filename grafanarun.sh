
docker-compose -f grafana.yml up -d

docker exec -w "/usr/share/grafana/conf/" grafana openssl req \
  -new \
  -newkey rsa:4096 \
  -days 3650 \
  -nodes \
  -x509 \
  -subj "/C=US/ST=CA/L=SF/O=Netpulse/CN=grafana.netpulse" \
  -keyout grafana.key \
  -out grafana.cert

docker-compose -f grafana.yml restart
