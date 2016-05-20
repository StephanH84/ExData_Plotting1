setwd("/home/stephan/Dev/R/exploratory-data-analysis")

data <- read.csv("household_power_consumption.txt", header=TRUE,sep=";", stringsAsFactors = FALSE)

data2 <- subset(data, as.character(data$Date) == "1/2/2007" | as.character(data$Date) == "2/2/2007")

gap <- as.numeric(data2$Global_active_power)

Sys.setlocale(locale = "en_US.utf8")

png("plot1.png", width=480, height=480, type="quartz")
par(bg = "transparent")

hist(gap, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()