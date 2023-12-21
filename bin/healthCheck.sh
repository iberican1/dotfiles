#!/bin/bash

# Function to check CPU usage
check_cpu() {
    local cpu_usage=$(top -bn 1 | awk '/%Cpu/{print $2}')
    local cpu_cores=$(nproc)
    printf "| %-20s | %-15s |\n" "CPU Usage" "$cpu_usage%"
    printf "| %-20s | %-15s |\n" "CPU Cores" "$cpu_cores"
}

# Function to check memory usage
check_memory() {
    local mem_total=$(free -m | awk '/Mem:/{print $2}')
    local mem_used=$(free -m | awk '/Mem:/{print $3}')
    local mem_percent=$(free -m | awk '/Mem:/{print $3/$2 * 100}')
    printf "| %-20s | %-15s |\n" "Memory Total" "$mem_total MB"
    printf "| %-20s | %-15s |\n" "Memory Used" "$mem_used MB"
    printf "| %-20s | %-15s |\n" "Memory Usage" "$mem_percent%"
}

# Function to check disk usage
check_disk() {
    local disk_total=$(df -h / | awk '/\//{print $2}')
    local disk_used=$(df -h / | awk '/\//{print $3}')
    local disk_avail=$(df -h / | awk '/\//{print $4}')
    local disk_percent=$(df -h / | awk '/\//{print $5}')
    printf "| %-20s | %-15s |\n" "Disk Total" "$disk_total"
    printf "| %-20s | %-15s |\n" "Disk Used" "$disk_used"
    printf "| %-20s | %-15s |\n" "Disk Available" "$disk_avail"
    printf "| %-20s | %-15s |\n" "Disk Usage" "$disk_percent"
}

# Function to check system load
check_load() {
    local load_avg_1=$(uptime | awk -F'[a-z]:' '{print $2}' | cut -d',' -f1)
    local load_avg_5=$(uptime | awk -F'[a-z]:' '{print $3}')
    local load_avg_15=$(uptime | awk -F'[a-z]:' '{print $4}')
    printf "| %-20s | %-15s |\n" "Load Average (1min)" "$load_avg_1"
    printf "| %-20s | %-15s |\n" "Load Average (5min)" "$load_avg_5"
    printf "| %-20s | %-15s |\n" "Load Average (15min)" "$load_avg_15"
}

# Main function to run all checks
main() {
    echo "+----------------------+-----------------+"
    echo "|      Health Check   |      Status     |"
    echo "+----------------------+-----------------+"

    check_cpu
    check_memory
    check_disk
    check_load

    echo "+----------------------+-----------------+"
}

main

