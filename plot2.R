# read data
house_dt <- read.table("./data/household_power_consumption.txt", header = TRUE, sep=";",stringsAsFactors=FALSE, dec = ".")
feb_dt <- house_dt[house_dt$Date %in% c("1/2/2007","2/2/2007"), ]

# set font size
par(cex=0.8)

# transform data
plot2_dt <- transform(feb_dt, Date = strptime(paste(feb_dt$Date, feb_dt$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), 
                      Global_active_power = as.numeric(Global_active_power))

# plot to png and close png
png("plot2.png", width = 480, height = 480, bg = "white")
plot(plot2_dt$Date,plot2_dt$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()