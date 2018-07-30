#!/bin/sh

# TRUNCATE THE APACHE ERROR LOG
# RUN IN BACKGROUND WITH: sh watch-apache-log.sh > /dev/null 2>&1 &
# REF: https://insidethe.agency/blog/how-to-tail-apache-logs-to-ubuntu-notifications

apache_log() {
  while inotifywait -e modify /var/log/apache2/error.log; do
    line=$(tail -n1 /var/log/apache2/error.log | cut -c 81-);
    notify-send "$line"; 
  done
}

apache_log &
