# Kafka Topics UI

This is a fork ot the Landoop project: a tool to browse Kafka topics and understand what's happening on your cluster. Find topics / view topic metadata / browse topic data (kafka messages) / view topic configuration / download data. This is a web tool for the [confluentinc/kafka-rest proxy](https://github.com/confluentinc/kafka-rest).

## Running it with docker

```
    docker pull parrot-stream/kafka-topics-ui
    docker run --rm -it -p 8000:8000 \
               -e "KAFKA_REST_PROXY_URL=http://kafka-rest-proxy-host:port" \
               -e "PROXY=true" \
               landoop/kafka-topics-ui
```

## Running it with docker-compose

```
    docker-compose -f docker/docker-compose.yml up
```

**Note:** The schema-registry is optional and topics are attempted to be read using Avro,
then fall back to JSON, and finally fall back to Binary.

## Build from source

```
    git clone https://github.com/parrot-stream/kafka-topics-ui.git
    cd kafka-topics-ui
    npm install -g bower
    npm install
    http-server .
```
Web UI will be available at `http://localhost:8080`

### Nginx config

If you use `nginx` to serve this ui, let angular manage routing with
```
    location / {
      add_header 'Access-Control-Allow-Origin' "$http_origin" always;
      add_header 'Access-Control-Allow-Credentials' 'true' always;
      add_header 'Access-Control-Allow-Methods' 'GET, POST, PUT, DELETE, OPTIONS' always;
      add_header 'Access-Control-Allow-Headers' 'Accept,Authorization,Cache-Control,Content-Type,DNT,If-Modified-Since,Keep-Alive,Origin,User-Agent,X-Mx-ReqToken,X-Requested-With' always;

      proxy_pass http://kafka-rest-server-url:8082;
      proxy_redirect off;

      proxy_set_header  X-Real-IP  $remote_addr;
      proxy_set_header  X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header  Host $http_host;
    }
```

### Setup Kafka Rest clusters

Use multiple Kafka Rest clusters in `env.js` :
```
var clusters = [
    {
      NAME: "prod",
      KAFKA_REST: "/api",
      MAX_BYTES: "50000",
      RECORD_POLL_TIMEOUT: "5000",
      COLOR: "#141414", // Optional
      DEBUG_LOGS_ENABLED: true
    },
    {
      NAME: "dev",
      KAFKA_REST: "localhost",
      MAX_BYTES: "50000",
      COLOR: "red",
      RECORD_POLL_TIMEOUT: "5000",
      DEBUG_LOGS_ENABLED: true
    }
  ];

```
* Use `MAX_BYTES` to set the default maximum amount of bytes to fetch from each topic.
* Use `RECORD_POLL_TIMEOUT` to set the timeout in ms.
* Use `COLOR` to set different header colors for each set up cluster.
* Set `DEBUG_LOGS_ENABLED` to true to enable the debug logs.

### CP Version support
Latest release is for CP 3.2.0 and above.

For versions older than CP 3.2.0 you will need Kafka Topics UI [version 0.8.3](https://github.com/parrot-stream/kafka-topics-ui/releases/tag/v0.8.3).
You can also build it from source by running:
```
    git clone https://github.com/parrot-stream/kafka-topics-ui.git
    cd kafka-topics-ui
    git checkout tags/v0.8.3 -b v0.8.3
    npm install -g bower
    npm install
    http-server .
```

**Important:** For Kafka REST Proxy 3.2.x you should set
`consumer.request.timeout.ms=30000`. Without this option, Kafka REST Proxy will
fail to return messages for large topics. Although the default value is `1000`,
a bug in the Kafka REST code prevents you from manually setting (depending on
some other consumer options) a value lower than `30000`.

## Changelog
[Here](https://github.com/parrot-stream/kafka-topics-ui/releases)

## License

The project is licensed under the [BSL](http://www.landoop.com/bsl) license.

## Relevant Projects

* [Schema Registry UI](https://github.com/parrot-stream/schema-registry-ui), View, create, evolve and manage your Avro Schemas for multiple Kafka clusters
* [Kafka Connect UI](https://github.com/parrot-stream/kafka-connect-ui), Set up and manage connectors for multiple connect clusters
