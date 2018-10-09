#!/bin/bash

: ${PORT:=8000}

supervisorctl start kafka-topics-ui

/wait-for-it.sh localhost:$PORT -t 20
rc=$?
if [ $rc -ne 0 ]; then
    echo -e "\n--------------------------------------------"
    echo -e "   Kafka Topics UI not ready! Exiting..."
    echo -e "--------------------------------------------"
    exit $rc
fi

echo -e "\n\n--------------------------------------------------------------------------------"
echo -e "You can now access to the Kafka Topics UI:\n"
echo -e "\tKafka Topics UI:   http://localhost:$PORT"
echo -e "\nMantainer:   Matteo Capitanio <matteo.capitanio@gmail.com>"
echo -e "--------------------------------------------------------------------------------\n\n"




