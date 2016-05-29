## plot4.R
## This code file will create a png file for plot 4 in Assignment 1
## for exploratory data analysis

# First we read the .txt data into a dataframe
epcdata <- read.table("exdata-data-household_power_consumption/easier.txt",
                      header = TRUE, sep = ";", na.strings = "?")
## Note that I have created a .txt file that contains only the dates we
## are using for this assignment called "easier.txt"

## To make things easier, in a few steps I am going to merge the Date and the
## Time columns into one and make it read as date and time by R. I will do this
## by creating a date and time vector, then merging it to the front of the
## dataframe, and finally removing the old Date and Time columns
date_time <- as.POSIXct(paste(epcdata$Date, epcdata$Time), format="%d/%m/%Y %H:%M:%S")
epcdata <- cbind(date_time, epcdata)
epcdata <- epcdata[, c(1, 4:10)]
names(epcdata)[1] <- "Date & Time"

## Now that we have our data all nice and sorted time to make the plot...

## First we create the file that will contain the plot
png('plot4.png')

par(mfrow = c(2,2)) ## Creates a 2x2 space for 4 graphs

## First graph in upper left corner
plot(epcdata$`Date & Time`,epcdata$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

## Second graph in upper right corner
plot(epcdata$`Date & Time`, epcdata$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage")

## Third graph in bottom left corner
plot(epcdata$`Date & Time`,epcdata$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering", ylim = c(0,40))
par(new = T)
plot(epcdata$`Date & Time`,epcdata$Sub_metering_2, type = "l", xlab = "",
     ylab = "Energy sub metering", ylim = c(0,40), col = "red")
par(new = T)
plot(epcdata$`Date & Time`,epcdata$Sub_metering_3, type = "l", xlab = "",
     ylab = "Energy sub metering", ylim = c(0,40), col = "blue")
legend('topright', names(epcdata)[6:8], lty = 1, bty = "n",
       col = c("black", "red", "blue"))

## Fourth and final graph in bottom right corner
plot(epcdata$`Date & Time`, epcdata$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()