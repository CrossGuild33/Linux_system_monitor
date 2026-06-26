#!/bin/bash

#############################################
# Linux System Monitor using Bash
# Author: Julio Cesar
#############################################

# Threshold configuration
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80

#############################################
# Alert Function
#############################################
send_alert() {
    echo "$(tput setaf 1)ALERT: $1 usage exceeded threshold! Current value: $2%$(tput sgr0)"
}

#Important to do current monitoring
While true; do
#############################################
# CPU Monitoring
#############################################
  cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
  cpu_usage=${cpu_usage%.*}
  
  echo "Current CPU usage: ${cpu_usage}%"
  
  if (( cpu_usage >= CPU_THRESHOLD )); then
      send_alert "CPU" "$cpu_usage"
  fi

#############################################
# Memory Monitoring
#############################################
  memory_usage=$(free | awk '/Mem/ {printf("%.1f", ($3/$2) * 100)}')
  echo "Current memory usage: ${memory_usage}%"
  
  memory_usage=${memory_usage%.*}
  
  if (( memory_usage >= MEMORY_THRESHOLD )); then
      send_alert "Memory" "$memory_usage"
  fi

#############################################
# Disk Monitoring
#############################################
  disk_usage=$(df -h / | awk 'NR==2 {print $5}')
  disk_usage=${disk_usage%\%}
  
  echo "Current disk usage: ${disk_usage}%"
  
  if (( disk_usage >= DISK_THRESHOLD )); then
      send_alert "Disk" "$disk_usage"
  fi

#############################################
# For display current stats alongside while loop
#############################################
  clear
  echo "Resource Usage:"
  echo "CPU: $cpu_usage%"
  echo "Memory: $memory_usage%"
  echo "Disk: $disk_usage%"
  sleep 2  

done
