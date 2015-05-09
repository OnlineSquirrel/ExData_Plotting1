#### plot2.R ####

## This script creates a plot of Global Active Power variable change over the times (in seconds) 
## in the household_power_consumption.txt data set

## Script loads the household_power_consumption.txt into the data.frame and then, base on the requirements,
## plots the histogram for 2 days only - 2/1/2007 and 2/2/2007

consDF = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
print("... Loaded household_power_consumption.txt ...")

## Filtering 2/1/2007 and 2/1/2007
consDF = consDF[(consDF$Date=="1/2/2007" | consDF$Date=="2/2/2007"),]

## Adding a column for datetime variable (from Data and Time character columns in the file)
consDF$DateTime = strptime(paste(consDF$Date, consDF$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")


png(filename="plot2.png", width=480, height=480, units="px")
print("... Opened PNG graphics device ...")

## Creating the plot, but without actually "painting" it - we want lines instead of points
## and we'll add them later
with(consDF, plot(DateTime,Global_active_power, type="n", xlab=" ", ylab="Global Active Power (in kilowatts)", main=""))

## Adding lines to the plot
lines(consDF$DateTime, consDF$Global_active_power)

print("... Plot generated in plot2.png ...")
dev.off()
print("... Graphics device closed ...")