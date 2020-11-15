#load libraries
library(dplyr)
library(data.table)
library(datasets)

df <- fread("household_power_consumption.txt")
df <- filter(df, Date == "1/2/2007" | Date == "2/2/2007")

#Construct the plot
hist(as.numeric(df$Global_active_power), col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")

#Save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png, file="plot1.png", width=480, height=480, units="px")
dev.off()