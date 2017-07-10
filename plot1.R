# read data
house_dt <- read.table("./data/household_power_consumption.txt", header = TRUE, sep=";",stringsAsFactors=FALSE, dec = ".")
feb_dt <- house_dt[house_dt$Date %in% c("1/2/2007","2/2/2007"), ]

# set font size
par(cex=0.8)

# transform data
plot1_dt <- transform(feb_dt, Global_active_power = as.numeric(Global_active_power))

# plot to png and close png
png("plot1.png", width = 480, height = 480, bg = "white")
hist(plot1_dt$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()