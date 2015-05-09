#### plot4.R ####

## This script generates a .PNG file with 4 separate plots:
## Plot 1: plot of Global_active_power variable changing over 2 days, in seconds
## Plot 2: plot of Voltage variable changing over 2 days, in seconds
## Plot 3: One chart with 3 plots:
##         Sub_metering_1 variable changin over the 2 days - in black
##         Sub_metering_2 variable changin over the 2 days - in red
##         Sub_metering_3 variable changin over the 2 days - in blue
## Plot 4: plot of Global_reactive_power variable changing over 2 days, in seconds

## Load the household_power_consumption.txt into the data.frame and then, base on the requirements,
## plots the histogram for 2 days only - 2/1/2007 and 2/2/2007

consDF = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
print("... Loaded household_power_consumption.txt ...")

## Filtering 2/1/2007 and 2/1/2007
consDF = consDF[(consDF$Date=="1/2/2007" | consDF$Date=="2/2/2007"),]

## Adding a column for datetime variable (from Data and Time character columns in the file)
consDF$DateTime = strptime(paste(consDF$Date, consDF$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

png(filename="plot4.png", width=480, height=480, units="px")
print("... Opened PNG graphics device ...")

## 2 rows and 2 columns of graphs
par(mfrow = c(2,2))

## Plot 1:
## Creating the plot, but without actually "painting" it - we want lines instead of points
## and we'll add them later
with(consDF, plot(DateTime,Global_active_power, type="n", xlab=" ", 
                  ylab="Global Active Power", main=""))
## Adding lines to the plot
lines(consDF$DateTime, consDF$Global_active_power)    

print("... Global Activity Power plot complete ...")

## Plot 2:
with(consDF, plot(DateTime,Voltage, type="n", xlab="datetime", ylab="Voltage", main=""))
## Adding lines to the plot
lines(consDF$DateTime, consDF$Voltage)    

print("... Voltage plot complete ...")

## Plot 3:
## Creating the plot, but without actually "painting" it - we want lines instead of points
## and we'll add them later
with(consDF, plot(DateTime,Sub_metering_1, type="n", xlab=" ", ylab="Energy sub metering", main=""))

## Adding lines to the plot
lines(consDF$DateTime, consDF$Sub_metering_1)
lines(consDF$DateTime, consDF$Sub_metering_2, col="red")
lines(consDF$DateTime, consDF$Sub_metering_3, col="blue")
## Adding the legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, bty="n")

print("... Energy Sub metering plot complete ...")

## Plot 4:
## Creating the plot, but without actually "painting" it - we want lines instead of points
## and we'll add them later
with(consDF, plot(DateTime,Global_reactive_power, type="n", xlab="datetime", 
                  ylab="Global_reactive_power", main=""))
## Adding lines to the plot
lines(consDF$DateTime, consDF$Global_reactive_power)    

print("... Global_reactive_power plot complete ...")

print("... Plots generated in plot4.png ...")
dev.off()
print("... Graphics device closed ...")