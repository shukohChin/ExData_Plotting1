Plot4 <- function() {
  # assume the data file and R script to be in the working directory
  colclasses = c("character", "character", rep("numeric", 7))
  epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = colclasses, na.strings = "?")
  epc$Datetime <- strptime(paste(epc$Date, epc$Time), format = "%d/%m/%Y %H:%M:%S")
  use.data <- subset(epc, epc$Datetime >= as.POSIXlt("2007-02-01") & epc$Datetime < as.POSIXlt("2007-02-03"))
  # open graphic device and create
  png(file = "plot4.png", width = 480, height = 480, units = "px", bg = "darkgrey")
  par(mfrow = c(2, 2))
  with(use.data, {
    plot(Datetime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
    plot(Datetime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
    plot(Datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
    points(Datetime, Sub_metering_2, type = "l", col = "red")
    points(Datetime, Sub_metering_3, type = "l", col = "blue")
    legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Datetime, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
  })
  # close graphic device
  dev.off()
}