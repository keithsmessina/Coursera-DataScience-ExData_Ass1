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
hist(filteredData$Global_active_power, ylim=c(0,1200), col="red", include.lowest=TRUE,
     xlab="Global Active Power (kilowatts)", main="Global Active Power")