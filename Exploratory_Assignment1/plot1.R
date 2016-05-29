## plot1.R
## This code file will create a png file for plot 1 in Assignment 1
## for exploratory data analysis

# First we read the .txt data into a dataframe
epcdata <- read.table("exdata-data-household_power_consumption/easier.txt",
                      header = TRUE, sep = ";", na.strings = "?")
## Note that I have created a .txt file that contains only the dates we
## are using for this assignment called "easier.txt"

## Now we create the file that will contain the plot
png('plot1.png')

## ...and then the code for the graph followed by turning the png device off
hist(epcdata$Global_active_power, col = "red", main = "Global Active Power",
     ylab = "Frequency", xlab = "Global Active Power (kilowatts)")

dev.off()
