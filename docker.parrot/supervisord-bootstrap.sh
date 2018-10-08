#!/bin/bash

: ${KAFKA_TOPICS_UI_PORT:=8000}

sed -i "s/8000/${KAFKA_TOPICS_UI_PORT}/g" /caddy/Caddyfile

supervisorctl start kafka-topics-ui

echo -e "\n\n--------------------------------------------------------------------------------"
echo -e "You can now access to the Kafka Topics UI:\n"
echo -e "\tKafka Topics UI:   http://localhost:$KAFKA_TOPICS_UI_PORT"
echo -e "\nMantainer:   Matteo Capitanio <matteo.capitanio@gmail.com>"
echo -e "--------------------------------------------------------------------------------\n\n"




