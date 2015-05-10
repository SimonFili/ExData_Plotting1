# Set Working directory
setwd("W:/Simon/DataScientist_Coursera/ExploratoryDataAnalysis/ExData_Plotting1")

# ----  Reading data set --- #
# Get line range for range of date 2007-02-01 and 2007-02-02 using grep
# This result is the lines numbers of the date range
LinesDateRange <- grep("^[12]/2/2007", readLines("household_power_consumption.txt"))

# Read data in, skipping to first row of date range and reading number of rows.
household_power_consumption <- read.delim(file = "household_power_consumption.txt",header = T, sep = ";", skip = LinesDateRange[1]-1, nrows = length(LinesDateRange) )

# The above, skiped the header column name, this will fix this
# get column name and set in main data set
ColNamesData <- read.delim(file = "household_power_consumption.txt", nrows=1, sep = ";")
colnames(household_power_consumption) <- colnames(ColNamesData)

# plotting plot4.png
# the ask is for 4 plots with date/time on X and 4 different content on Y 
# To get the Date/Time, we will use 2 function
# 1) paste: to concatenate the date and time
# 2) strptime : to format the date+time in date/time format
# Then we will add this as a new column

household_power_consumption$DateTime <- strptime(paste(household_power_consumption$Date,household_power_consumption$Time,sep = " " ), format="%d/%m/%Y %H:%M:%S") 

# First test the plot on standard device output (screen)
# Set plot array
par(mfrow = c(2,2))
# Plot 1, top-left
plot(household_power_consumption$DateTime,household_power_consumption$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power")
# Plot 2, top-right
plot(household_power_consumption$DateTime,household_power_consumption$Voltage,type = "l", xlab = "datetime", ylab = "Voltage")
# Plot 3, bottom-left
plot(household_power_consumption$DateTime,household_power_consumption$Sub_metering_1,type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(household_power_consumption$DateTime,household_power_consumption$Sub_metering_2,type = "l", col = "red", xlab = "", ylab = "Energy sub metering")
lines(household_power_consumption$DateTime,household_power_consumption$Sub_metering_3,type = "l", col = "blue", xlab = "", ylab = "Energy sub metering")
legend("topright", bty = "n",lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_1","Sub_metering_3"))
# Plot 4, bottom-right
plot(household_power_consumption$DateTime,household_power_consumption$Global_reactive_power,type = "l", xlab = "datetime", ylab = "Global_reactive_power")


# Then output to file using png
png(filename = "plot4.png",width = 480,height = 480,bg = "white",type="windows")

par(mfrow = c(2,2))
# Plot 1, top-left
plot(household_power_consumption$DateTime,household_power_consumption$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power")
# Plot 2, top-right
plot(household_power_consumption$DateTime,household_power_consumption$Voltage,type = "l", xlab = "datetime", ylab = "Voltage")
# Plot 3, bottom-left
plot(household_power_consumption$DateTime,household_power_consumption$Sub_metering_1,type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(household_power_consumption$DateTime,household_power_consumption$Sub_metering_2,type = "l", col = "red", xlab = "", ylab = "Energy sub metering")
lines(household_power_consumption$DateTime,household_power_consumption$Sub_metering_3,type = "l", col = "blue", xlab = "", ylab = "Energy sub metering")
legend("topright", bty = "n",lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_1","Sub_metering_3"))
# Plot 4, bottom-right
plot(household_power_consumption$DateTime,household_power_consumption$Global_reactive_power,type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
