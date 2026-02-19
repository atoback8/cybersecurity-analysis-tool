#!/bin/bash
echo "Searching for suspicious login attempts"
grep "Failed Password" /var/log/auth.log > suspicious_ips.txt
echo "Analysis complete. Results saves to suspicious_ips.txt"
