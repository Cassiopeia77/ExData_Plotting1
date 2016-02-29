# Read in data from txt file "household_power_consumption.txt" and set up so that the header is included
hhEnergy <- read.table("household_power_consumption.txt", header = TRUE, sep =";")
# Subsets the data to only include data from the 1st-2nd of Feb 2007
hhE2days <- subset(hhEnergy, hhEnergy$Date == "1/2/2007" | hhEnergy$Date == "2/2/2007")
# Converts the Global_active_power variable to numeric class (via character class)
hhE2days$Global_active_power <- as.numeric(as.character(hhE2days$Global_active_power))

# Opens png() device for writing to a png file of size 480 x 480 pixels with a transparent background
png(file="plot1.png", width=480, height=480, units=px)
# Creates a histogram of Global_active_power with appropriate labels and title
hist(hhE2days$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()