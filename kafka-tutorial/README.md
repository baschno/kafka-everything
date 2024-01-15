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
 --bootstrap-server localhost:9092 --topic orders --from-beginnin
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

Create config file: `$HOME/.config/kafkactl/config.yml`

### Installation
#### Mac
```
brew tap deviceinsight/packages
brew install deviceinsight/packages/kafkactl
```

#### Linux
Get the `.deb` from the release page and install via `dpkg`
https://github.com/deviceinsight/kafkactl/releases


### References
https://jaehyeon.me/blog/2023-05-18-kafka-development-with-docker-part-2/
