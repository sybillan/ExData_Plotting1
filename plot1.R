setwd("C:/Users/admin/Downloads/")
h<-read.table("household_power_consumption.txt", header=T, sep=";")
h$Date<-as.Date(h$Date,"%d/%m/%Y")
h2<-h[h$Date>="2007-02-01" & h$Date<="2007-02-02",]
var1<-(as.numeric(as.character(h2$Global_active_power)))

png("plot1.png",width = 480, height = 480, units = "px")
hist(var1, main="Global Active Power", col="red",xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
