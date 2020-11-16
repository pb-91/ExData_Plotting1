#load libraries
library(dplyr)
library(data.table)
library(datasets)

df <- fread("household_power_consumption.txt")
df <- filter(df, Date == "1/2/2007" | Date == "2/2/2007")

#Construct the plot
datetime <- strptime(paste(df$Date, df$Time),"%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2), mar=c(4,4,2,1))
with(df, {
  plot(datetime, df$Global_active_power, type="l", ylab="Global Active Power")
  plot(datetime, df$Voltage, type="l", ylab="Voltage")
  plot(datetime, Sub_metering_1, type="n", ylab="Energy sub metering")
  points(datetime, Sub_metering_1, type="l", col="black")
  points(datetime, Sub_metering_2, type="l", col="red")
  points(datetime, Sub_metering_3, type="l", col="blue")
  legend("topright", lty="solid", y.intersp=0.5, bty = "n", col=c("black", "red", "blue"),  cex=0.7, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(datetime, Global_reactive_power, type="l", ylab="Global_reactive_power")
})


#Save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png, file="plot4.png", width=480, height=480, units="px")
dev.off()