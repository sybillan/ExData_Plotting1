setwd("C:/Users/admin/Downloads/")
h<-read.table("household_power_consumption.txt", header=T, sep=";")
h$Date<-as.Date(h$Date,"%d/%m/%Y")
h2<-h[h$Date>='2007-02-01' & h$Date<='2007-02-02',] 
h2$Time2<-as.POSIXct(paste(h2$Date, h2$Time), format="%Y-%m-%d %H:%M:%S") 
x<-c("Thu","Fri","Sat") 
var1<-(as.numeric(h2$Global_active_power))/500 
png("plot2.png", 480, 480)
plot(h2$Time2,var1, type='l', ylab="Global Active Power (kilowatts)", xlab="")
dev.off()


