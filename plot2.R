
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


## Plot 2

png("plot2.png") ## Open PNG device, and create 'plot2.png' in the working directory

## Create a plot and send it to the file 'plot2.png'
with(data2d, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.off() ## Close the PNG file device
