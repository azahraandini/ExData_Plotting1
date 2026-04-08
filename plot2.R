data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data_sub <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
data_sub$datetime <- strptime(paste(data_sub$Date, data_sub$Time), format="%Y-%m-%d %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(data_sub$datetime, data_sub$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()
