fileUrl = "./household_power_consumption.txt"
houseDat <- read.table(fileUrl, sep=";", header=TRUE)
houseDat$DateTime <- strptime(paste(houseDat$Date, houseDat$Time), "%d/%m/%Y %H:%M:%S")
dat <- (houseDat$DateTime >= "2007-02-01" & houseDat$DateTime < "2007-02-03")
subHouseDat <- houseDat[dat,]
par(mfrow=c(1,1))
hist(as.numeric(as.character(subHouseDat$Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png")
dev.off()