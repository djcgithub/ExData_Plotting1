# Read in Electric Consumption Data
ECD_data<-read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = -1)

# Select only data from the dates 2007-02-01 and 2007-02-02
d<-grep("2007-02-01|2007-02-02",as.Date(ECD_data$Date,"%d/%m/%Y"),value=FALSE)

# Create date time combinations
x<-strptime(paste(ECD_data[d,"Date"], ECD_data[d,"Time"]), "%d/%m/%Y %H:%M:%S")

# Output plot to .png file
png(filename = "plot4.png", width = 480, height = 480)

# Set up a plot with 2 rows 2 columns
par(mfrow = c(2, 2))

# 1 (Top left) - Plot of Global_active_power (y-axis) against DateTime (x-axis)
plot(x,ECD_data[d,"Global_active_power"],xlab = "", ylab = "Global Active Power",type = "n")
lines(x,ECD_data[d,"Global_active_power"])

# 2 (Top right) - Plot of Voltage (y-axis) against DateTime (x-axis)
plot(x,ECD_data[d,"Voltage"],xlab="datetime",ylab = "Voltage",type = "n")
lines(x,ECD_data[d,"Voltage"])

# 3 (Bottom left) - Plot of Energy Sub Metering (y-axis) against DateTime (x-axis) by Sub Meter
# type ="n" sets up the plot and does not fill it with data
plot(x, ECD_data[d,"Sub_metering_1"], main = "", xlab = "", ylab = "Energy sub metering", type = "n")
# subsets of data are plotted here using different colors
lines(x, ECD_data[d,"Sub_metering_1"], col="black")
lines(x, ECD_data[d,"Sub_metering_2"], col="red")
lines(x, ECD_data[d,"Sub_metering_3"], col="blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8, lwd=1, bty="n")

# 4 (Bottom right) - Plot of Global Reactive Power (y-axis) against DateTime (x-axis)
plot(x,ECD_data[d,"Global_reactive_power"],xlab="datetime",ylab = "Global_reactive_power", type = "n")
lines(x,ECD_data[d,"Global_reactive_power"])

dev.off()