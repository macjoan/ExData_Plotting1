# REading  the file andsaving in a R object mfor power consumption data

powerDF <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

powerDF <- subset(powerDF, powerDF$Date=="1/2/2007" | powerDF$Date == "2/2/2007")

# Convert date an time as Date and time type

powerDF$Date <- as.Date(powerDF$Date, format="%d/%m/%Y")
powerDF$Time <- strptime(powerDF$Time, format="%H:%M:%S")

powerDF[powerDF$Date=="2007-02-01", "Time"] <- format(powerDF[powerDF$Date=="2007-02-01", "Time"],
                                                      "2007-02-01 %H:%M:%S")
powerDF[powerDF$Date=="2007-02-02", "Time"] <- format(powerDF[powerDF$Date=="2007-02-02", "Time"],
                                                      "2007-02-02 %H:%M:%S")

#Making the plot 2
png("plot2.png", width=480, height=480)
with(powerDF, plot(Time, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l"))
title(main="Global Active Power Vs Time")
dev.off()