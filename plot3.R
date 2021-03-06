setwd("C:/Users/admin/Downloads/")
h<-read.table("household_power_consumption.txt", header=T, sep=";")
h$Date<-as.Date(h$Date,"%d/%m/%Y")
h2<-h[h$Date>="2007-02-01" & h$Date<="2007-02-02",]
h2$Time2<-as.POSIXct(paste(h2$Date, h2$Time), format="%Y-%m-%d %H:%M:%S") 

x<-c("Thu","Fri","Sat") 

n<-h2[,c("Sub_metering_1","Sub_metering_2","Sub_metering_3")]
n$Sub_metering_1<-as.numeric(as.character(n$Sub_metering_1))
n$Sub_metering_2<-as.numeric(as.character(n$Sub_metering_2))
n$Sub_metering_3<-as.numeric(as.character(n$Sub_metering_3))
png("sample.png",480,480)
plot(h2$Time2,n$Sub_metering_1, type='l', ylab="Energy Sub Metering", xlab="", ylim=c(0,40)) 
lines(h2$Time2,n$Sub_metering_2,type='l', col="red") 
lines(h2$Time2,n$Sub_metering_3,type='l', col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", cex=1, lty=c(1,1,1),col=c("black","red","blue"))

dev.off()
