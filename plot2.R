hhEnergy <- read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE)
hhE2days <- subset(hhEnergy, hhEnergy$Date == "1/2/2007" | hhEnergy$Date == "2/2/2007")
hhE2days$Global_active_power <- as.numeric(hhE2days$Global_active_power)

hhE2days$DateTime <- strptime(paste(hhE2days$Date, hhE2days$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

png(file="plot2.png", width=480, height=480, units="px", bg ="NA")
plot(hhE2days$DateTime, hhE2days$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()