#!/bin/bash

LOG_DIR=~/monitoramento_nginx/logs


mkdir -p $LOG_DIR

if systemctl is-active --quiet nginx; then
    STATUS="ONLINE"
    MESSAGE="Rodando"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Nginx - $STATUS - MESSAGE" >> $LOG_DIR/nginx_online.log
else
   STATUS="OFFLINE"
   MESSAGE="Não está rodando"
  echo "$(date '+%Y-%m-%d %H:%M:%S') - Nginx - $STATUS - $MESSAGE" >> $LOG_DIR/nginx_offline.log
fi
 

