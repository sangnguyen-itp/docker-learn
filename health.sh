#!/bin/bash
/usr/bin/wget --no-verbose --tries=1 --spider http://localhost:$app_port/ping || exit 1