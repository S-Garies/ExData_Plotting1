#Load power consumption dataset
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Convert date format
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

#Subset data using dates & formate Date/Time
power <- subset(power, subset=(Date>="2007-02-01" & Date<="2007-02-02"))
datetime <- strptime(paste(power$Date, power$Time), "%Y-%m-%d %H:%M:%S")
datetime <- as.POSIXct(datetime)

#Plot 2 Graph of Global Active Power
plot(datetime, power$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off