setwd("/home/stephan/Dev/R/exploratory-data-analysis")

data <- read.csv("household_power_consumption.txt", header=TRUE,sep=";", stringsAsFactors = FALSE)

data2 <- subset(data, as.character(data$Date) == "1/2/2007" | as.character(data$Date) == "2/2/2007")

data2$DateTime <- strptime(paste(data2$Date, data2$Time), format='%d/%m/%Y %H:%M:%S')

Sys.setlocale(locale = "en_US.utf8")

png("plot2.png", width=480, height=480, type="quartz")
par(bg = "transparent")

with(data2, plot(DateTime, Global_active_power, pch=20, type="n",ylab = "Global active power (kilowatts)", xlab=""))
with(data2,lines(DateTime, Global_active_power, type="l"))

dev.off()