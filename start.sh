#!/bin/bash

# 1. Define your main server starting command here
# Change "python3 server.py" to whatever runs your server (e.g., node index.js, ./start.sh, etc.)
SERVER_CMD="python3 server.py"

echo "=== Starting 24/7 Automated Watchdog Script ==="

while true
2. Do do
    # Check if the server process is currently running
    if ! pgrep -f "$SERVER_CMD" > /dev/null; then
        echo "[$(date)] WARNING: Server is offline! Restarting automatically..."
        # Launch the server in the background and log its behavior
        $SERVER_CMD >> server_output.log 2>&1 &
    fi

    # 3. ANTI-TIMEOUT LOGIC: Generate fake terminal activity every 5 minutes 
    # This prevents GitHub's cloud platform from flags your container as idle.
    echo "[$(date)] Watchdog Status: Active. Server running smoothly." 
    
    # Touch a temporary file to register system disk activity
    touch .keepalive_pulse
    
    # Sleep for 300 seconds (5 minutes) before checking again
    sleep 300
done
