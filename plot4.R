
## Download the zip file and unzip it
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "data.zip", mode = "wb")
unzip("data.zip")
## After unzipping, a file named "household_power_consumption.txt" was generated in the working directory

## Read data into a file
data <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F, na.strings = "?")

## Extract two-day data, and combine "Date" and "Time" into a new column "datetime" in the datetime format
data2d <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
data2d$datetime <- strptime(paste(data2d$Date, data2d$Time), "%d/%m/%Y %H:%M:%S")


## Plot 4

png("plot4.png") ## Open PNG device, and create 'plot4.png' in the working directory

## Create a 2*2 plot and send it to the file 'plot4.png'
par(mfrow = c(2, 2))
with(data2d, {
  plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power") ## the first figure
  plot(datetime, Voltage, type = "l") ## the second figure
  plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering") ## the third figure
  lines(datetime, Sub_metering_2, col = "red") ## the second line for the third figure
  lines(datetime, Sub_metering_3, col = "blue") ## the third line for the third figure
  legend("topright", bty = 'n', lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(datetime, Global_reactive_power, type = "l") ## the fourth figure
})

dev.off() ## Close the PNG file device
