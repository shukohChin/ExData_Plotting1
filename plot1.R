Plot1 <- function() {
  # assume the data file and R script to be in the working directory
  colclasses = c("character", "character", rep("numeric", 7))
  epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = colclasses, na.strings = "?")
  date.convert <- as.Date(strptime(epc$Date, format = "%d/%m/%Y"))
  epc$Date = date.convert
  use.data <- subset(epc, epc$Date == as.Date("2007-02-01") | epc$Date == as.Date("2007-02-02"))
  # open graphic device and create
  png(file = "plot1.png", width = 480, height = 480, units = "px", bg = "darkgrey")
  hist(use.data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  # close graphic device
  dev.off()
}