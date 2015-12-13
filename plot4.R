setwd("./R/Course Project 1/")
a <- read.table('household_power_consumption.txt',header = TRUE,sep = ";",stringsAsFactors = FALSE, dec = ".")
dataset <- a[a$Date %in% c("1/2/2007","2/2/2007"),]
dataset$Date <- as.Date(dataset$Date,format = "%d/%m/%Y")
dataset$Time <- strptime(paste(dataset$Date, dataset$Time,sep = " "),format = "%Y-%m-%d %H:%M:%S")
dataset$Global_active_power<-as.numeric(dataset$Global_active_power)                  
dataset$Sub_metering_1 <-as.numeric(dataset$Sub_metering_1)
dataset$Sub_metering_2 <-as.numeric(dataset$Sub_metering_2)
dataset$Sub_metering_3 <-as.numeric(dataset$Sub_metering_3)
dataset$Voltage<-as.numeric(dataset$Voltage)
dataset$Global_reactive_power<-as.numeric(dataset$Global_reactive_power)
png("plot4.png",width = 480, height = 480)
par(mfrow = c(2,2))
plot(dataset$Time,dataset$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power",cex = 0.2)

plot(dataset$Time,dataset$Voltage,type = "l", xlab = "datetime", ylab = "Voltage")

plot(dataset$Time,dataset$Sub_metering_1,type = "l",ylab = "Energy sub metering",xlab = "")
lines(dataset$Time,dataset$Sub_metering_2,type = "l",col="red")
lines(dataset$Time,dataset$Sub_metering_3,type = "l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,lwd=2.5,col=c("black","red","blue"),bty = "o")

plot(dataset$Time,dataset$Global_reactive_power,type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()