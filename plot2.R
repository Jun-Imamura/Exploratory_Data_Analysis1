fileUrl = "./household_power_consumption.txt"
houseDat <- read.table(fileUrl, sep=";", header=TRUE)
houseDat$DateTime <- strptime(paste(houseDat$Date, houseDat$Time), "%d/%m/%Y %H:%M:%S")
dat <- (houseDat$DateTime >= "2007-02-01" & houseDat$DateTime < "2007-02-03")
subHouseDat <- houseDat[dat,]
subHouseDat$Global_active_power <- as.numeric(as.character(subHouseDat$Global_active_power))
par(mfrow=c(1,1))
plot(subHouseDat$DateTime, subHouseDat$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(subHouseDat$DateTime, subHouseDat$Global_active_power)
dev.copy(png, file="plot2.png")
dev.off()
