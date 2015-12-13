setwd("./R/Course Project 1/")
a <- read.table('household_power_consumption.txt',header = TRUE,sep = ";",stringsAsFactors = FALSE, dec = ".")
dataset <- a[a$Date %in% c("1/2/2007","2/2/2007"),]
dataset$Date <- as.Date(dataset$Date,format = "%d/%m/%Y")
dataset$Time <- strptime(paste(dataset$Date, dataset$Time,sep = " "),format = "%Y-%m-%d %H:%M:%S")
dataset$Global_active_power<-as.numeric(dataset$Global_active_power)                  
png("plot1.png",width = 480, height = 480)
hist(dataset$Global_active_power, col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()