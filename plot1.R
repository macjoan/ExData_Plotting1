# REading  the file andsaving in a R object mfor power consumption data

powerDF <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

powerDF <- subset(powerDF, powerDF$Date=="1/2/2007" | powerDF$Date == "2/2/2007")

#making an histagram
png("plot1.png", width=480, height=480)
hist(powerDF$Global_active_power, col = "red", main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()