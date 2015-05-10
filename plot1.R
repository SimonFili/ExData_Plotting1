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

# plotting plot1.png
# the ask is for a histogram 
# - The generic function hist computes a histogram of the given data values
# 

# First test the histogram on standard device output (screen)
hist(x = household_power_consumption$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

# Then output to file using png
png(filename = "plot1.png",width = 480,height = 480,bg = "white",type="windows")
hist(x = household_power_consumption$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()

