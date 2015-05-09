#### plot1.R ####

## This is a script that creates a histogram for Global Active POwer variable in the household_power_consumption.txt data set

## Script loads the household_power_consumption.txt into the data.frame and then, base on the requirements,
## plots the histogram for 2 days only - 2/1/2007 and 2/2/2007

consDF = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
print("... Loaded household_power_consumption.txt ...")

## Filtering 2/1/2007 and 2/1/2007
consDF = consDF[(consDF$Date=="1/2/2007" | consDF$Date=="2/2/2007"),]

png(filename="plot1.png", width=480, height=480, units="px")
print("... Opened PNG graphics device ...")
hist(as.numeric(consDF$Global_active_power), xlab="Global Active Power (in kilowatts)",
     main="Global Active Power", col="red")
print("... Histogram created in plot1.png ...")
dev.off()
print("... Graphics device closed ...")