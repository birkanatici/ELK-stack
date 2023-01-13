#!/bin/bash

generate_log() {
  local log_messages=("User login successful: username=johndoe" "Error connecting to database: host=127.0.0.1, port=5432, error=connection refused" "System reboot initiated by user admin" "Server outage detected at 12:30 PM, initiating failover procedure" "Security alert: suspicious activity detected from IP address 192.168.1.100" "Backup completed successfully: files=100, size=200GB" "System performance issue detected, high memory usage: usage=90%, process=mongod" "Incoming request: method=POST, path=/api/users, client=192.168.1.100" "Application error: message='null pointer exception', method=main(), class=App" "Cron job completed: name=cleanup, status=success, duration=10m")
  local random_message=${log_messages[$((RANDOM % ${#log_messages[@]}))]}
  local log_level=("INFO" "DEBUG" "ERROR" "TRACE" "WARN")
  local app_name=("app1" "app2" "app3" "app4" "app5")
  local container_id=$((1 + RANDOM % 100))
  local request_url=("/home" "/about" "/contact" "/faq" "/services")
  local parameters=("param1=value1" "param2=value2" "param3=value3" "param4=value4" "param5=value5")
  local random_log_level=${log_level[$((RANDOM % ${#log_level[@]}))]}
  local random_app_name=${app_name[$((RANDOM % ${#app_name[@]}))]}
  local random_request_url=${request_url[$((RANDOM % ${#request_url[@]}))]}
  local random_parameters=${parameters[$((RANDOM % ${#parameters[@]}))]}
  local random_number=$((1 + RANDOM % 1000))
  local host_name=$(hostname)
  local json_log="{\"hostname\":\"$host_name\",\"app_name\":\"$random_app_name\",\"container_id\":\"$container_id\",\"log_level\":\"$random_log_level\",\"message\":\"$random_message\",\"request_url\":\"$random_request_url\",\"parameters\":\"$random_parameters\"}"
  echo "$json_log"
  echo "$json_log" | nc -N logstash 5000
}

# Send logs to Logstash
while :; do
  generate_log
  sleep 1
done

