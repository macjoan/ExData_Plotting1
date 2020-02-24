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

#makikng the plot 3
png("plot3.png", width=480, height=480)
  plot(powerDF$Time, powerDF$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
    lines(powerDF$Time, powerDF$Sub_metering_1)
    lines(powerDF$Time, powerDF$Sub_metering_2, col = "red")
    lines(powerDF$Time, powerDF$Sub_metering_3, col = "blue")
    legend("topright", lty=1, col=c("black","red","blue"), 
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    title(main="Energy sub-metering")
dev.off()
