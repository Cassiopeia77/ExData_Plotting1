> hhEnergy <- read.table("household_power_consumption.txt", header = TRUE, sep =";")
> hhE2days <- subset(hhEnergy, hhEnergy$Date == "1/2/2007" | hhEnergy$Date == "2/2/2007")
> hhE2days$Global_active_power <- as.numeric(as.character(hhE2days$Global_active_power))
> png(file="plot1.png", width=480, height=480, units=px)
> hist(hhE2days$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")