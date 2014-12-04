#actualdata.txt obtained by following bash commands:
#grep '^[12]/2/2007' household_power_consumption.txt > actualdata.txt
#sed -i '1i\'`head -n 1 ./household_power_consumption.txt` ./actualdata.txt

system("./subset.sh")
df <- read.csv("./actualdata.txt", sep=";", header=T, na.strings=c("?"))
df$day <- format(as.Date(x = df$Date, format="%d/%m/%Y"), format="%a")
df$unixtime <- as.numeric(as.POSIXct(paste(df$Date, df$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"))
plot(df$unixtime, df$Global_active_power, type="l", main="", ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")
#1170284400

#1170370800
axis(1, at = seq(10, 200, by = 10), las=2)