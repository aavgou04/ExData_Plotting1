my_data<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, na.strings = "?", check.names = F, comment.char = "")
my_data$Date<-as.Date(my_data$Date, format="%d/%m/%Y")
my_data[,3]<-as.numeric(my_data[,3])
my_final_data<-subset(my_data, (Date=="2007-02-01") | (Date=="2007-02-02"))


corrected<-paste(as.Date(my_final_data$Date), my_final_data$Time)
my_final_data$DateTime<-as.POSIXct(corrected)

png(filename = "plot2.png", width = 480, height = 480)
plot(my_final_data$Global_active_power~my_final_data$DateTime, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
