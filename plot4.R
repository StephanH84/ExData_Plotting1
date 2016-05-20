setwd("/home/stephan/Dev/R/exploratory-data-analysis")

data <- read.csv("household_power_consumption.txt", header=TRUE,sep=";", stringsAsFactors = FALSE)

data2 <- subset(data, as.character(data$Date) == "1/2/2007" | as.character(data$Date) == "2/2/2007")

data2$DateTime <- strptime(paste(data2$Date, data2$Time), format='%d/%m/%Y %H:%M:%S')

Sys.setlocale(locale = "en_US.utf8")

png("plot4.png", width=480, height=480, type="quartz")
par(bg = "transparent",mfrow=c(2,2))

with(data2, plot(DateTime, Global_active_power, pch=20, type="n",ylab = "Global active power (kilowatts)", xlab=""))
with(data2,lines(DateTime, Global_active_power, type="l"))

with(data2, plot(DateTime, Voltage, pch=20, type="n",ylab = "Voltage", xlab="datetime"))
with(data2,lines(DateTime, Voltage, type="l"))

with(data2, plot(DateTime, Sub_metering_1, pch=20, type="n",ylab = "Energy sub metering", xlab=""))
with(data2,lines(DateTime, Sub_metering_1, type="l", col="black"))
with(data2,lines(DateTime, Sub_metering_2, type="l", col="red"))
with(data2,lines(DateTime, Sub_metering_3, type="l", col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"),lty=1,bty = "n")

with(data2, plot(DateTime, Global_reactive_power, pch=20, type="n",ylab = "Global_reactive_power", xlab="datetime"))
with(data2,lines(DateTime, Global_reactive_power, type="l"))

dev.off()