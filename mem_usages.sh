#!/bin/bash
# Script is created by Abhishek Gharat abhishek@balasai.com on 08/09/2018
# Script monitors the Memory usgae of Linux hosts and generate the NRPE status code as output.
# At the time of creation it is 80% memory usage as warning and 90% memory usgae as Critical.
# You can modify the values by just replacing values in if else. Script dosent support the external arguments.

if [ "$1" = "-w" ] && [ "$2" -gt "0" ] && [ "$3" = "-c" ] && [ "$4" -gt "0" ]; then

memtotal=$(free | awk 'NR==2 {print $2}')
memused=$(free | awk 'NR==2 {print $3}')
memfree=$(free | awk 'NR==2 {print $4}')

memTotal_m=$(free -h | awk 'NR==2 {print $2}')
memUsed_m=$(free -h | awk 'NR==2 {print $3}')
memfree_m=$(free -h | awk 'NR==2 {print $4}')


mem=$((($memused*100)/$memtotal))

        if [ "$mem" -ge "$4" ]; then
                echo "Memory CRITICAL Total: $memTotal_m - Used: $memUsed_m  -$mem% used!|TOTAL=$memTotal_m;USED=$memUsed_m;FREE=$memfree_m"
                $(exit 2)
        elif [ "$mem" -ge "$2" ]; then
                echo "Memory WARNING Total: $memTotal_m  - Used: $memUsed_m  - $mem% used!|TOTAL=$memTotal_m;USED=$memUsed_m;FREE=$memfree_m"
                $(exit 1)
        else
                echo "Memory OK Total: $memTotal_m  - Used: $memUsed_m  - $mem% used!|TOTAL=$memTotal_m;USED=$memUsed_m;FREE=$memfree_m"
                $(exit 0)
        fi
exit


else
        echo "check_mem v1.1"
        echo ""
        echo "Usage:"
        echo "check_mem.sh -w <warnlevel> -c <critlevel>"
        echo ""
        echo "warnlevel and critlevel is percentage value without %"
        echo ""
        echo "Copyright (C) 2018 Abhishek Gharat (abhishek@balasai.com)"
        exit
fi
