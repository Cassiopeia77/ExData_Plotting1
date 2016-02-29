# Read in data from txt file "household_power_consumption.txt" and set up so that the header is included and a table of 9 character variables is produced
hhEnergy <- read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE)
# Subsets the data to only include data from the 1st-2nd of Feb 2007
hhE2days <- subset(hhEnergy, hhEnergy$Date == "1/2/2007" | hhEnergy$Date == "2/2/2007")

# Converts the required variables to numeric class
hhE2days$Global_active_power <- as.numeric(hhE2days$Global_active_power)
hhE2days$Global_reactive_power <- as.numeric(hhE2days$Global_reactive_power)
hhE2days$Voltage <- as.numeric(hhE2days$Voltage)
hhE2days$Sub_metering_1 <- as.numeric(hhE2days$Sub_metering_1)
hhE2days$Sub_metering_2 <- as.numeric(hhE2days$Sub_metering_2)

# Creates a new variable in hhE2days data-frame that merges data from $Date and $Time columns into $DateTime and convert this to class POSIXlt
hhE2days$DateTime <- strptime(paste(hhE2days$Date, hhE2days$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

# Opens png() device for writing to a png file of size 480 x 480 pixels with a transparent background
png(file="plot4.png", width=480, height=480, units="px", bg ="NA")

# Sets up the png canvas to hold 4 plots (2 rows x 2 columns)
par(mfcol=c(2,2))

# Code to Create Plot 2
plot(hhE2days$DateTime, hhE2days$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Code to Create Plot 3
plot(hhE2days$DateTime, hhE2days$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
points(hhE2days$DateTime, hhE2days$Sub_metering_1, type="l")
points(hhE2days$DateTime, hhE2days$Sub_metering_2, type="l", col="red")
points(hhE2days$DateTime, hhE2days$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black","red","blue"), lwd=c(2,2,2),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Code to New Graph for 3rd Position in Plot 4
plot(hhE2days$DateTime, hhE2days$Voltage, type="l", ylab = "Voltage", xlab = "datetime")

# Code to New Graph for 4th Position in Plot 4
plot(hhE2days$DateTime, hhE2days$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()
