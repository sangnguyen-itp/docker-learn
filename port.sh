#!/bin/bash

env=$1
chmod +x port.sh
port_line=$(grep 'SERVICE_PORT=' config."${env}".env)
arrPort=(${port_line//=/ })
port=${arrPort[1]}

echo "${port}"


