my_data<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, na.strings = "?", check.names = F, comment.char = "")
my_data$Date<-as.Date(my_data$Date, format="%d/%m/%Y")
my_data[,3]<-as.numeric(my_data[,3])
my_final_data<-subset(my_data, (Date=="2007-02-01") | (Date=="2007-02-02"))

corrected<-paste(as.Date(my_final_data$Date), my_final_data$Time)
my_final_data$DateTime<-as.POSIXct(corrected)

my_final_data$Global_active_power<-as.numeric(my_final_data$Global_active_power)
my_final_data$Sub_metering_1<- as.numeric((my_final_data$Sub_metering_1))
my_final_data$Sub_metering_2<- as.numeric((my_final_data$Sub_metering_2))
my_final_data$Sub_metering_3<- as.numeric((my_final_data$Sub_metering_3))
my_final_data$Voltage<- as.numeric(my_final_data$Voltage)
my_final_data$Global_reactive_power<- as.numeric(my_final_data$Global_reactive_power)


png(filename = "plot4.png", width = 480, height = 480)
par(mfcol=c(2,2), mar=c(4,4,2,2))
plot(my_final_data$Global_active_power~my_final_data$DateTime, type="l", xlab = "", ylab = "Global Active Power")

with(my_final_data, plot(DateTime,Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
lines(my_final_data$DateTime, my_final_data$Sub_metering_2, type="l", col="red")
lines(my_final_data$DateTime, my_final_data$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(2,2,2), col = c("black","red","blue"), bty="n")

with(my_final_data, plot(DateTime,Voltage, type="l", ylab="Voltage", xlab="datetime"))

with(my_final_data, plot(DateTime, Global_reactive_power, type="l", ylab="Global_Reactive_Power",xlab="datetime"))
dev.off()
