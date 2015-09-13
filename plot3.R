
my_data<-read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE, dec = ".")
my_final_data<- my_data[my_data$Date %in% c("1/2/2007", "2/2/2007"),]

DateTime <- strptime(paste(my_final_data$Date, my_final_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
my_final_data$DateTime<-DateTime
my_final_data$Global_active_power<-as.numeric(my_final_data$Global_active_power)
my_final_data$Sub_metering_1<- as.numeric((my_final_data$Sub_metering_1))
my_final_data$Sub_metering_2<- as.numeric((my_final_data$Sub_metering_2))
my_final_data$Sub_metering_3<- as.numeric((my_final_data$Sub_metering_3))

png(filename = "plot3.png", width = 480, height = 480)
with(my_final_data, plot(DateTime,Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
lines(my_final_data$DateTime, my_final_data$Sub_metering_2, type="l", col="red")
lines(my_final_data$DateTime, my_final_data$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(2,2,2), col = c("black","red","blue"))
dev.off()