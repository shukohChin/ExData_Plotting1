Plot3 <- function() {
  # assume the data file and R script to be in the working directory
  colclasses = c("character", "character", rep("numeric", 7))
  epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = colclasses, na.strings = "?")
  epc$Datetime <- strptime(paste(epc$Date, epc$Time), format = "%d/%m/%Y %H:%M:%S")
  use.data <- subset(epc, epc$Datetime >= as.POSIXlt("2007-02-01") & epc$Datetime < as.POSIXlt("2007-02-03"))
  # open graphic device and create
  png(file = "plot3.png", width = 480, height = 480, units = "px", bg = "darkgrey")
  with(use.data, plot(Datetime, Sub_metering_1, type = "l", main = "", xlab = "", ylab = "Energy sub metering"))
  with(use.data, points(Datetime, Sub_metering_2, type = "l", col = "red"))
  with(use.data, points(Datetime, Sub_metering_3, type = "l", col = "blue"))
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  # close graphic device
  dev.off()
}