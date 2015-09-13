
my_data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, na.strings = "?")
class(my_data[,3])
my_data$Date<-as.Date(my_data$Date, format="%d/%m/%Y")
my_data[,3]<-as.numeric(my_data[,3])
my_final_data<-subset(my_data, (Date=="2007-02-01") | (Date=="2007-02-02"))
png(filename = "plot1.png", width = 480, height = 480)
hist(my_final_data$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red")
dev.off()
