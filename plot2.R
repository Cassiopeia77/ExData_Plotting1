# Read in data from txt file "household_power_consumption.txt" and set up so that the header is included and a table of 9 character variables is produced
hhEnergy <- read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE)
# Subsets the data to only include data from the 1st-2nd of Feb 2007
hhE2days <- subset(hhEnergy, hhEnergy$Date == "1/2/2007" | hhEnergy$Date == "2/2/2007")
# Converts the Global_active_power variable to numeric class
hhE2days$Global_active_power <- as.numeric(hhE2days$Global_active_power)

# Creates a new variable in hhE2days data-frame that merges data from $Date and $Time columns into $DateTime and convert this to class POSIXlt
hhE2days$DateTime <- strptime(paste(hhE2days$Date, hhE2days$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
hhE2days$DateTime <- strptime(paste(hhE2days$Date, hhE2days$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

# Opens png() device for writing to a png file of size 480 x 480 pixels with a transparent background
png(file="plot2.png", width=480, height=480, units="px", bg ="NA")
# Creates a xy line plot of DateTime vs. Global_active_power and labels y-axis and leaves the x-axis blank
plot(hhE2days$DateTime, hhE2days$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()