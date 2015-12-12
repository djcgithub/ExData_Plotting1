# Read in Electric Consumption Data
ECD_data<-read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = -1)

# Select only data from the dates 2007-02-01 and 2007-02-02
d<-grep("2007-02-01|2007-02-02",as.Date(ECD_data$Date,"%d/%m/%Y"),value=FALSE)

# Create date time combinations
x<-strptime(paste(ECD_data[d,"Date"], ECD_data[d,"Time"]), "%d/%m/%Y %H:%M:%S")

# Output plot to .png file
png(filename = "plot2.png", width = 480, height = 480)

# Plot of Global_active_power (y-axis) against DateTime (x-axis)
plot(x,ECD_data[d,"Global_active_power"],xlab = "", ylab = "Global Active Power (kilowatts)",type = "n")
lines(x,ECD_data[d,"Global_active_power"])

dev.off()