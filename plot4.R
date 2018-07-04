#Load power consumption dataset
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Convert date format
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

#Subset data using dates & formate Date/Time
power <- subset(power, subset=(Date>="2007-02-01" & Date<="2007-02-02"))
datetime <- strptime(paste(power$Date, power$Time), "%Y-%m-%d %H:%M:%S")
datetime <- as.POSIXct(datetime)

#Plot 4 Multiple Graphs
par(mfrow=c(2,2))
plot(datetime, power$Global_active_power, type="l", ylab="Global Active Power", xlab="")
plot(datetime, power$Voltage, type="l", ylab="Voltage")
plot(datetime, power$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, power$Sub_metering_2, type="l", col="red")
lines(datetime, power$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n")
plot(datetime, power$Global_reactive_power, type="l", ylab="Global_reactive_power")
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()