#### plot3.R ####

## This script crates a a .PNG file with 3 plots in one chart:
##    Sub_metering_1 variable changes over the 2 days  - in black
##    Sub_metering_2 variable changes over the 2 days  - in red
##    Sub_metering_3 variable changes over the 2 days  - in blue

## Load the household_power_consumption.txt into the data.frame and then, base on the requirements,
## plots the histogram for 2 days only - 2/1/2007 and 2/2/2007

consDF = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
print("... Loaded household_power_consumption.txt ...")

## Filtering 2/1/2007 and 2/1/2007
consDF = consDF[(consDF$Date=="1/2/2007" | consDF$Date=="2/2/2007"),]

## Adding a column for datetime variable (from Data and Time character columns in the file)
consDF$DateTime = strptime(paste(consDF$Date, consDF$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
print(head(consDF))

png(filename="plot3.png", width=480, height=480, units="px")
print("... Opened PNG graphics device ...")

## Creating the plot, but without actually "painting" it - we want lines instead of points
## and we'll add them later
with(consDF, plot(DateTime,Sub_metering_1, type="n", xlab=" ", ylab="Energy sub metering", main=""))

## Adding lines to the plot
lines(consDF$DateTime, consDF$Sub_metering_1)
lines(consDF$DateTime, consDF$Sub_metering_2, col="red")
lines(consDF$DateTime, consDF$Sub_metering_3, col="blue")

## Adding the legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)

print("... Plot generated in plot3.png ...")
dev.off()
print("... Graphics device closed ...")