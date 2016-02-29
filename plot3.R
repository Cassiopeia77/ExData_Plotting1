# Read in data from txt file "household_power_consumption.txt" and set up so that the header is included and a table of 9 character variables is produced
hhEnergy <- read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE)
# Subsets the data to only include data from the 1st-2nd of Feb 2007
hhE2days <- subset(hhEnergy, hhEnergy$Date == "1/2/2007" | hhEnergy$Date == "2/2/2007")
# Converts the Sub_metering_1 & _2 variables to numeric class (from Character class)
hhE2days$Sub_metering_1 <- as.numeric(hhE2days$Sub_metering_1)
hhE2days$Sub_metering_2 <- as.numeric(hhE2days$Sub_metering_2)

# Creates a new variable in hhE2days data-frame that merges data from $Date and $Time columns into $DateTime and convert this to class POSIXlt
hhE2days$DateTime <- strptime(paste(hhE2days$Date, hhE2days$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

# Opens png() device for writing to a png file of size 480 x 480 pixels with a transparent background
png(file="plot3.png", width=480, height=480, units="px", bg ="NA")
# Creates an empty xy line plot framework for DateTime vs. Sub_metering_1 and labels y-axis and leaves the x-axis blank
plot(hhE2days$DateTime, hhE2days$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
# Adds lines for Variables Sub_metering_1 (default black line), Sub_metering_2 (red line) & then Sub_metering_3 
points(hhE2days$DateTime, hhE2days$Sub_metering_1, type="l")
points(hhE2days$DateTime, hhE2days$Sub_metering_2, type="l", col="red")
points(hhE2days$DateTime, hhE2days$Sub_metering_3, type="l", col="blue")
# Adds a legend to the plot for the 3 lines
legend("topright", col=c("black","red","blue"), lwd=c(2,2,2),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
