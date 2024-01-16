## Round 1

### Produce
```
docker exec -it kafka-0 bash
```
Create a topic

```
cd /opt/bitnami/kafka/bin/
./kafka-topics.sh \
  --bootstrap-server localhost:9092 --create \
  --topic orders --partitions 3 --replication-factor 3
```

```
./kafka-console-producer.sh \
  --bootstrap-server localhost:9092 --topic orders
>product: apples, quantity: 5
>product: lemons, quantity: 7
```



### Consume
```
docker exec -it kafka-0 bash
cd /opt/bitnami/kafka/bin/
## consume messages
./kafka-console-consumer.sh \
 --bootstrap-server localhost:9092 --topic orders --from-beginning
```

#### Check volumes
```
docker volume ls | grep data$
```
#### Inspect the volumes
```
sudo ls -l /var/lib/docker/volumes/kafka_0_data/_data/data
```


## UIs

kafka-ui   http://localhost:8282
kpow http://localhost:3000 (license missing)


## Setup Kafkactl

Create config file: `$HOME/.config/kafkactl/config.yml`, see `kafkactl.sample.yaml`

### Installation
#### Mac
```
brew tap deviceinsight/packages
brew install deviceinsight/packages/kafkactl
```

#### Linux
Get the `.deb` from the release page and install via `dpkg`
https://github.com/deviceinsight/kafkactl/releases

#### Test setup
```
kafkactl list brokers
```

## Config
### Change replication factor

#### Using Kafka Tooling

Running python-producer will create a topic `orders` w/o replication.


```
docker exec -it kafka-0 /bin/bash
/opt/bitnami/kafka/bin$ ./kafka-reassign-partitions.sh --bootstrap-server kafka-0:9092 --reassignment-json-file /opt/transfer/repl-fac.json --execute
```

Verify
```
./kafka-reassign-partitions.sh --bootstrap-server kafka-0:9092 --reassignment-json-file /opt/transfer/repl-fac.json --verify
Status of partition reassignment:
Reassignment of partition orders-0 is completed.

Clearing broker-level throttles on brokers 101,102,103
Clearing topic-level throttles on topic orders
```


### References
https://jaehyeon.me/blog/2023-05-18-kafka-development-with-docker-part-2/
