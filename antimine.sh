#!/bin/bash

# List of known mining software/process names
MINING_SOFTWARE=("xmrig" "minerd" "ethminer" "ccminer" "cpuminer" "cgminer" "bfgminer" "nicehash")

while true; do
    for miner in "${MINING_SOFTWARE[@]}"; do
        # Check for the process and kill it
        pids=$(pgrep -f "$miner")
        if [ ! -z "$pids" ]; then
            echo "Detected mining process: $miner. Killing..."
            kill -9 $pids
        fi
    done
    # Sleep for a few seconds before checking again
    sleep 10
done
