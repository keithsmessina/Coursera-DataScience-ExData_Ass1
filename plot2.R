# Creates a function to load household power consumption data and create an
# array of four exploratory graphs
plotGraph <- function(){
  
  # Load raw data from zip file and save into a variable
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
  
  # Filter the raw data for the two relevant dates for analysis
  filteredData <- rawdata[as.Date(rawdata[,"Date"], format="%d/%m/%Y")
                          == as.Date("01/02/2007", format="%d/%m/%Y")|
                            as.Date(rawdata[,"Date"], format="%d/%m/%Y") ==
                            as.Date("02/02/2007", format="%d/%m/%Y"),]
  
  # Prepare device for saving plot image
  png("plot2.png", width=480, height=480, units="px")
  
  # Create empty plot for Global Active Power column as a function of time
  plot(as.POSIXct(paste(filteredData$Date, filteredData$Time), format="%d/%m/%Y %T"),
       filteredData$Global_active_power, xlab="",
       ylab="Global Active Power (kilowatts)", type="n")
  
  # Add lines to the plot for Global Active Power column as a function of time
  lines(as.POSIXct(paste(filteredData$Date, filteredData$Time), format="%d/%m/%Y %T"),
         filteredData$Global_active_power, type="l")
  
  # Close the graphics device to save png
  dev.off()
}