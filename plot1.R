#Load power consumption dataset
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Convert date format
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

#Subset data using dates
power <- subset(power, subset=(Date>="2007-02-01" & Date<="2007-02-02"))

#Plot 1 Histogram of Global Active Power
hist(power$Global_active_power, col="red", main=paste("Global Active Power"), xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off