# read data
house_dt <- read.table("./data/household_power_consumption.txt", header = TRUE, sep=";",stringsAsFactors=FALSE, dec = ".")
feb_dt <- house_dt[house_dt$Date %in% c("1/2/2007","2/2/2007"), ]

#Set margin and font size
par(mar=c(3,4,2,1), cex=0.6)

# transform data to the required format
plot4_dt <- transform(feb_dt, Date = strptime(paste(feb_dt$Date, feb_dt$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), 
                      Global_reactive_power = as.numeric(Global_reactive_power), Voltage = as.numeric(Voltage), 
                      Global_intensity = as.numeric(Global_intensity), Sub_metering_1 = as.numeric( Sub_metering_1), 
                      Sub_metering_2 = as.numeric(Sub_metering_2), Sub_metering_3 = as.numeric(Sub_metering_3))

# set png file as plotting device
png("plot4.png", width = 480, height = 480)

# set plot dimension
par(mfcol = c(2,2))

# plot Global Active Power
plot(plot4_dt$Date,plot4_dt$Global_active_power, type="l", ylab = "Global Active Power", xlab="")

# plot Energy sub metering
plot(plot4_dt$Date,plot4_dt$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(plot4_dt$Date,plot4_dt$Sub_metering_2, type="l", col = "red")
lines(plot4_dt$Date,plot4_dt$Sub_metering_3, type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"), bty="n", cex = 0.8)
#par(cex=0.6)

# plot Voltage
plot(plot4_dt$Date,plot4_dt$Voltage, type="l", ylab = "Voltage", xlab="datetime")

# plot Global Reactive Power
plot(plot4_dt$Date,plot4_dt$Global_reactive_power, type="l", ylab = "Global Reative Power", xlab="datetime")

# close png file
dev.off()