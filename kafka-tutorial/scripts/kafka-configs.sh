#!/usr/bin/env bash

CMD=$(echo "$0" | cut -d'/' -f2)

docker exec -i -t kafka-1 \
    "/opt/bitnami/kafka/bin/${CMD}" \
    --bootstrap-server kafka-1:9193 \
#    --command-config /opt/kafka/certs/kafka_client.properties \
    "$@"
