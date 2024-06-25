#!/bin/bash

THRESHOLD=80  # Set your low battery threshold percentage

# Get the battery percentage
BATTERY_LEVEL=$(acpi -b | grep -P -o '[0-9]+(?=%)')

# Get the battery charging status
STATUS=$(acpi -b | grep -o "Charging\|Discharging")

# Send notification if the battery level is below the threshold and discharging
if [ "$STATUS" == "Discharging" ] && [ "$BATTERY_LEVEL" -le "$THRESHOLD" ]; then
    notify-send -u critical "Low Battery" "Battery level is at ${BATTERY_LEVEL}%"
fi

# Output battery level for Waybar display
# echo "Battery: ${BATTERY_LEVEL}%"

