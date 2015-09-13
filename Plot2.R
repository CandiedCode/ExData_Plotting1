setwd("/Users/CandiedCode/Documents/Code/Coursera/DataScience/ExploringData/ExData_Plotting1")

#data <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
file <- file("household_power_consumption.txt")

##Date: Date in format dd/mm/yyyy
#We will only be using data from the dates 2007-02-01 and 2007-02-02. 
#so pattern would be start 1 or 2 /2/2007
data <- read.table(text = grep("^[1,2]/2/2007", readLines(file), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE, na.strings = "?")

#lets fix the date
#https://stat.ethz.ch/R-manual/R-devel/library/base/html/strptime.html
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Plot2 -> Global Active Power
#https://stat.ethz.ch/R-manual/R-devel/library/graphics/html/plot.html
plot(data$Datetime
     , data$Global_active_power
     , type = "l"
     , xlab = ""
     , ylab = "Global Active Power (kilowatts)")