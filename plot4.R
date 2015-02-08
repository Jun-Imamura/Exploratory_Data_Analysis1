fileUrl = "./household_power_consumption.txt"
houseDat <- read.table(fileUrl, sep=";", header=TRUE)
houseDat$DateTime <- strptime(paste(houseDat$Date, houseDat$Time), "%d/%m/%Y %H:%M:%S")
dat <- (houseDat$DateTime >= "2007-02-01" & houseDat$DateTime < "2007-02-03")
subHouseDat <- houseDat[dat,]

subHouseDat$Sub_metering_1 <- as.numeric(as.character(subHouseDat$Sub_metering_1))
subHouseDat$Sub_metering_2 <- as.numeric(as.character(subHouseDat$Sub_metering_2))
subHouseDat$Sub_metering_3 <- as.numeric(as.character(subHouseDat$Sub_metering_3))
subHouseDat$Global_active_power <- as.numeric(as.character(subHouseDat$Global_active_power))
subHouseDat$Voltage <- as.numeric(as.character(subHouseDat$Voltage))
subHouseDat$Global_reactive_power <- as.numeric(as.character(subHouseDat$Global_reactive_power))
par(mfrow=c(2,2))

##for topleft
plot(subHouseDat$DateTime, subHouseDat$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(subHouseDat$DateTime, subHouseDat$Global_active_power)
##for topright
plot(subHouseDat$DateTime, subHouseDat$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(subHouseDat$DateTime, subHouseDat$Voltage)
#for bottomleft
plot(subHouseDat$DateTime, subHouseDat$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(subHouseDat$DateTime, subHouseDat$Sub_metering_1)
lines(subHouseDat$DateTime, subHouseDat$Sub_metering_2, col="red")
lines(subHouseDat$DateTime, subHouseDat$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1),col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##for bottomright
plot(subHouseDat$DateTime, subHouseDat$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(subHouseDat$DateTime, subHouseDat$Global_reactive_power)

dev.copy(png, file="plot4.png")
dev.off()