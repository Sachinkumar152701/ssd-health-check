#!/bin/bash
# Script to check SSD/NVMe health - Created by Sachin Kumar

echo "Checking SSD Health..."
echo "-----------------------------------"

# For NVMe drives
if command -v nvme >/dev/null 2>&1; then
    nvme list
    nvme smart-log /dev/nvme0
fi

# For SATA SSDs
if command -v smartctl >/dev/null 2>&1; then
    sudo smartctl -H /dev/sda
    sudo smartctl -A /dev/sda
fi

echo "-----------------------------------"
echo "SSD Health check complete."
