#actualdata.txt obtained by following bash commands:
#grep '^[12]/2/2007' household_power_consumption.txt > actualdata.txt
#sed -i '1i\'`head -n 1 ./household_power_consumption.txt` ./actualdata.txt

system("./subset.sh")
df <- read.csv("./actualdata.txt", sep=";", header=T, na.strings=c("?"))
df$day <- format(as.Date(x = df$Date, format="%d/%m/%Y"), format="%a")
df$unixtime <- as.numeric(as.POSIXct(paste(df$Date, df$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"))
png("plot4.png", width=480, height=480, units="px")

par( mfrow = c( 2, 2 ) )

plot(df$unixtime, df$Global_active_power, type="l", main="", ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")

axis(1, at = c(1170284400,1170370800,1170457140), labels=c("Thu","Fri","Sat"))

plot(df$unixtime, df$Voltage, type="l", main="", ylab="Voltage", xlab="datetime", xaxt="n")

axis(1, at = c(1170284400,1170370800,1170457140), labels=c("Thu","Fri","Sat"))


plot(df$unixtime, df$Sub_metering_1, type="l", main="", ylab="Energy sub metering", xlab="", xaxt="n")
lines(df$unixtime, df$Sub_metering_2, col="red")
lines(df$unixtime, df$Sub_metering_3, col="blue")

axis(1, at = c(1170284400,1170370800,1170457140), labels=c("Thu","Fri","Sat"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1, col=c("black", "red", "blue"))
plot(df$unixtime, df$Global_active_power, type="l", main="", ylab="Global_reactive_power", xlab="datetime", xaxt="n")

axis(1, at = c(1170284400,1170370800,1170457140), labels=c("Thu","Fri","Sat"))

dev.off()
