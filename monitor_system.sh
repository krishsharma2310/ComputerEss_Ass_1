
LOG_FILE="$HOME/system_usage.log" 
INTERVAL=5                         

echo "System Monitoring Started..."
echo "Logging to: $LOG_FILE"
echo "Press CTRL+C to stop."
=
while true
do
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    MEM_USAGE=$(free -m | awk '/Mem:/ { printf("%.2f"), $3/$2*100 }')

  
    echo "$(date): CPU: $CPU_USAGE% | MEM: $MEM_USAGE%" >> "$LOG_FILE"

    sleep $INTERVAL
done
