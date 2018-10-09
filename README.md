# **kafka-topics-ui**
___

### Description
___

This image runs [**Kafka Topics UI**](https://github.com/Landoop/kafka-topics-ui.git).


You can pull it with:

    docker pull parrotstream/kafka-topics-ui


You can also find other images based on different Kafka Topics UI releases, using a different tag in the following form:

    docker pull parrotstream/kafka-topics-ui:[kafka-topics-ui-release]


Start with Docker Compose:

    docker-compose -p parrot -f docker.parrot/docker-compose.yml up


## Configuration

In the docker-compose.yml you can update the following environment variables:

  - `KAFKA_REST_PROXY_URL`: the URL to point to Kafka Rest Proxy
  - `PROXY`: set to `true` the URL to point to Kafka Rest Proxy
  - `PORT`: the docker internal port to expose the Kafka Topics UI. Remember to change 
  - `MAX_BYTES`: to set the default maximum amount of bytes to fetch from each topic
  - `RECORD_POLL_TIMEOUT`: to set the timeout in ms
  - `COLOR`: to set different header colors for each set up cluster
  - `DEBUG_LOGS_ENABLED`: set to `true` to enable the debug logs

Once started you'll be able to access to the following UI:

| **Kafka Topics UI**        |**URL**                   |
|:---------------------------|:-------------------------|
| *Kafka Topics UI*          | http://localhost:8001    |


## Relevant Projects

* [Schema Registry UI](https://github.com/parrot-stream/schema-registry-ui), View, create, evolve and manage your Avro Schemas on your Kafka cluster
* [Kafka Connect UI](https://github.com/parrot-stream/kafka-connect-ui), Set up and manage connectors for multiple connect clusters


## License

The project is licensed under the [BSL](http://www.landoop.com/bsl) license.


## Available tags:

- Kafka Connect UI 0.9.6 ([0.9.6](https://github.com/parrot-stream/kafka-connect-ui/blob/0.9.6/Dockerfile), [latest](https://github.com/parrot-stream/kafka-connect-ui/blob/latest/Dockerfile))
