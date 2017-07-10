# read data
house_dt <- read.table("./data/household_power_consumption.txt", header = TRUE, sep=";",stringsAsFactors=FALSE, dec = ".")
feb_dt <- house_dt[house_dt$Date %in% c("1/2/2007","2/2/2007"), ]

# set font size
par(cex=0.8)

# transform data
plot3_dt <- transform(feb_dt, Date = strptime(paste(feb_dt$Date, feb_dt$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), Sub_metering_1 = as.numeric( Sub_metering_1), Sub_metering_2 = as.numeric(Sub_metering_2), Sub_metering_3 = as.numeric(Sub_metering_3))

# plot to png and close png
png("plot3.png", width = 480, height = 480, bg = "white")
plot(plot3_dt$Date,plot2_dt$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(plot3_dt$Date,plot2_dt$Sub_metering_2, type="l", col = "red")
lines(plot3_dt$Date,plot2_dt$Sub_metering_3, type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()