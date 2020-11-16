#load libraries
library(dplyr)
library(data.table)
library(datasets)

df <- fread("household_power_consumption.txt")
df <- filter(df, Date == "1/2/2007" | Date == "2/2/2007")

#Construct the plot
timestamp <- strptime(paste(df$Date, df$Time),"%d/%m/%Y %H:%M:%S")
with(df, plot(timestamp, Sub_metering_1, type="n", ylab="Energy sub metering"))
with(df, points(timestamp, Sub_metering_1, type="l", col="black"))
with(df, points(timestamp, Sub_metering_2, type="l", col="red"))
with(df, points(timestamp, Sub_metering_3, type="l", col="blue"))
legend("topright", lty="solid", y.intersp=0.5, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png, file="plot3.png", width=480, height=480, units="px")
dev.off()