hhEnergy <- read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE)
hhE2days <- subset(hhEnergy, hhEnergy$Date == "1/2/2007" | hhEnergy$Date == "2/2/2007")
hhE2days$Sub_metering_1 <- as.numeric(hhE2days$Sub_metering_1)
hhE2days$Sub_metering_2 <- as.numeric(hhE2days$Sub_metering_2)

hhE2days$DateTime <- strptime(paste(hhE2days$Date, hhE2days$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

png(file="plot3.png", width=480, height=480, units="px", bg ="NA")
plot(hhE2days$DateTime, hhE2days$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
points(hhE2days$DateTime, hhE2days$Sub_metering_1, type="l")
points(hhE2days$DateTime, hhE2days$Sub_metering_2, type="l", col="red")
points(hhE2days$DateTime, hhE2days$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black","red","blue"), lwd=c(2,2,2),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
