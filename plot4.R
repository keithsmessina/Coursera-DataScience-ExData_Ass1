plotGraph <- function(){
  rawdata <- read.table(unz("exdata_data_household_power_consumption.zip",
                            "household_power_consumption.txt"), col.names =c(
                              "Date","Time","Global_active_power","Global_reactive_power",
                              "Voltage", "Global_intensity", "Sub_metering_1",
                              "Sub_metering_2", "Sub_metering_3"), colClasses=c(
                                as.Date(character(), format = "%Y-%m-%d"),
                                strptime(character(), format ="%T"), as.double(character()),
                                as.double(character()), as.double(character()),
                                as.double(character()), as.double(character()),
                                as.double(character()), as.double(character())),
                        na.strings="?",sep = ";", stringsAsFactors = FALSE, header=TRUE)
  filteredData <- rawdata[as.Date(rawdata[,"Date"], format="%d/%m/%Y")
                          == as.Date("01/02/2007", format="%d/%m/%Y")|
                            as.Date(rawdata[,"Date"], format="%d/%m/%Y") ==
                            as.Date("02/02/2007", format="%d/%m/%Y"),]
  library(datasets)
  png("plot4.png", width=480, height=480, units="px")
  par(mfrow = c(2, 2))
  plot(as.POSIXct(paste(filteredData$Date, filteredData$Time), format="%d/%m/%Y %T"),
       filteredData$Global_active_power, xlab="",
       ylab="Global Active Power", type="n")
  lines(as.POSIXct(paste(filteredData$Date, filteredData$Time), format="%d/%m/%Y %T"),
        filteredData$Global_active_power, type="l")
  plot(as.POSIXct(paste(filteredData$Date, filteredData$Time), format="%d/%m/%Y %T"),
       filteredData$Voltage, ylab="Voltage", xlab="datetime", type="n")
  lines(as.POSIXct(paste(filteredData$Date, filteredData$Time), format="%d/%m/%Y %T"),
        filteredData$Voltage, type="l")
  plot(as.POSIXct(paste(filteredData$Date, filteredData$Time), format="%d/%m/%Y %T"),
       filteredData$Sub_metering_1, xlab="",
       ylab="Energy sub metering", type="n")
  lines(as.POSIXct(paste(filteredData$Date, filteredData$Time), format="%d/%m/%Y %T"),
        filteredData$Sub_metering_1, type="l")
  lines(as.POSIXct(paste(filteredData$Date, filteredData$Time), format="%d/%m/%Y %T"),
        filteredData$Sub_metering_2, type="l", col="red")
  lines(as.POSIXct(paste(filteredData$Date, filteredData$Time), format="%d/%m/%Y %T"),
        filteredData$Sub_metering_3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,
         col=c("black", "red", "blue"), bty = "n", cex = .9)
  plot(as.POSIXct(paste(filteredData$Date, filteredData$Time), format="%d/%m/%Y %T"),
       filteredData$Global_reactive_power, ylab="Global_reactive_power", 
       xlab="datetime", type="n")
  lines(as.POSIXct(paste(filteredData$Date, filteredData$Time), format="%d/%m/%Y %T"),
        filteredData$Global_reactive_power, type="l")

  dev.off()
}