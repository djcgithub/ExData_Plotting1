# Read in Electric Consumption Data
ECD_data<-read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = -1)

# Select only data from the dates 2007-02-01 and 2007-02-02
d<-grep("2007-02-01|2007-02-02",as.Date(ECD_data$Date,"%d/%m/%Y"),value=FALSE)

# Output plot to .png file
png(filename = "plot1.png", width = 480, height = 480)

# Histogram plot of Global_active_power
hist(ECD_data[d,"Global_active_power"],col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()