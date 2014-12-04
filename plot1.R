#actualdata.txt obtained by following bash commands:
#grep '^[12]/2/2007' household_power_consumption.txt > actualdata.txt
#sed -i '1i\'`head -n 1 ./household_power_consumption.txt` ./actualdata.txt

system("./subset.sh")
df <- read.csv("./actualdata.txt", sep=";", header=T, na.strings=c("?"))

png("plot1.png", width=480, height=480, units="px")
hist(df$Global_active_power, plot=T, col = "red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
