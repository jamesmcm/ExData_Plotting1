grep '^[12]/2/2007' household_power_consumption.txt > actualdata.txt
sed -i '1i\'`head -n 1 ./household_power_consumption.txt` ./actualdata.txt