i <- 0
rawdata <- data.frame()
repeat {
newline <- read.table("household_power_consumption.txt", na.strings="?",sep = ";",
                      nrows=1,skip=i)
i <- i+1
rawdata <- rbind(rawdata,newline)
if (i == 4){
  break
}
  
}