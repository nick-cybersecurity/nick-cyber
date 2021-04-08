#/bin/bash

echo March 15 Losses
grep '05:00:00 AM' 0310_Dealer_schedule | awk '{print $1,$2,$5,$6}'
grep '08:00:00 AM' 0310_Dealer_schedule | awk '{print $1,$2,$5,$6}'
grep '02:00:00 PM' 0310_Dealer_schedule | awk '{print $1,$2,$5,$6}'

