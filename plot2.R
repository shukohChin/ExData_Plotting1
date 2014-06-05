Plot2 <- function() {
  # assume the data file and R script to be in the working directory
  colclasses = c("character", "character", rep("numeric", 7))
  epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = colclasses, na.strings = "?")
  epc$Datetime <- strptime(paste(epc$Date, epc$Time), format = "%d/%m/%Y %H:%M:%S")
  use.data <- subset(epc, epc$Datetime >= as.POSIXlt("2007-02-01") & epc$Datetime < as.POSIXlt("2007-02-03"))
  # open graphic device and create
  png(file = "plot2.png", width = 480, height = 480, units = "px", bg = "darkgrey")
  with(use.data, plot(Datetime, Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)"))
  # close graphic device
  dev.off()
}
