#!/bin/bash

memtotal=$(free | awk 'NR==2 {print $2}')
memused=$(free | awk 'NR==2 {print $3}')
memfree=$(free | awk 'NR==2 {print $4}')

memTotal_m=$(free -h | awk 'NR==2 {print $2}')
memUsed_m=$(free -h | awk 'NR==2 {print $3}')
memfree_m=$(free -h | awk 'NR==2 {print $4}')


mem=$((($memused*100)/$memtotal))

        if ((90<=$mem)); then
                echo "Memory CRITICAL Total: $memTotal_m - Used: $memUsed_m  -$mem% used!|TOTAL=$memTotal_m;USED=$memUsed_m;FREE=$memfree_m"
                $(exit 2)
        elif ((80<=$mem && $mem<=89)); then
                echo "Memory WARNING Total: $memTotal_m  - Used: $memUsed_m  - $mem% used!|TOTAL=$memTotal_m;USED=$memUsed_m;FREE=$memfree_m"
                $(exit 1)
        else
                echo "Memory OK Total: $memTotal_m  - Used: $memUsed_m  - $mem% used!|TOTAL=$memTotal_m;USED=$memUsed_m;FREE=$memfree_m"
                $(exit 0)
        fi
exit
