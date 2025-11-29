#!/bin/bash
# ---------------------------------------------------------
# Script Name: monitor_system.sh
# Purpose: Log CPU and memory usage at regular intervals
# Author: Your Name
# Date: 29-11-2025
# ---------------------------------------------------------

# === Variables ===
LOG_FILE="$HOME/system_usage.log"   # Log output file
INTERVAL=5                          # Interval (seconds) between logs

echo "System Monitoring Started..."
echo "Logging to: $LOG_FILE"
echo "Press CTRL+C to stop."

# === Continuous monitoring loop ===
while true
do
    # Capture CPU & memory usage
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    MEM_USAGE=$(free -m | awk '/Mem:/ { printf("%.2f"), $3/$2*100 }')

    # Write to log file
    echo "$(date): CPU: $CPU_USAGE% | MEM: $MEM_USAGE%" >> "$LOG_FILE"

    sleep $INTERVAL
done
