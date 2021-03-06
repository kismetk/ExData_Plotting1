# Loading the data
power <- read.table("household_power_consumption.txt", header=T, na.strings="?", stringsAsFactors=FALSE, comment.char="", sep=";")

# Using data from the dates 2007-02-01 and 2007-02-02
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
summary(power$Date)
newpower <- power[(power$Date=="2007-02-01") |  (power$Date=="2007-02-02"),]

# Optimise data for Plot 4
newpower$Sub_metering_1 <- as.numeric(newpower$Sub_metering_1)
newpower$Sub_metering_2 <- as.numeric(newpower$Sub_metering_2)
newpower$Sub_metering_3 <- as.numeric(newpower$Sub_metering_3)
newpower$Voltage <- as.numeric(newpower$Voltage)

# Putting Date and Time together
newpower$fullTimeDetail <- paste(newpower$Date,newpower$Time, sep=" ")
newpower$fullTimeDetail <- strptime(newpower$fullTimeDetail,format="%Y-%m-%d %H:%M")

# Making Plots 4
png(filename = "plot4.png", width = 480, height=480)

par(mfrow=c(2,2))

# Making Plot 4A
plot(newpower$fullTimeDetail,newpower$Global_active_power, type="l",
              xlab=" ",
              ylab="Global Active Power")

# Making Plot 4B
plot(newpower$fullTimeDetail,newpower$Voltage, type="l",
               xlab="datetime",
               ylab="Voltage")

# Making Plot 4C
plot(newpower$fullTimeDetail,newpower$Sub_metering_1, type="l",
              xlab=" ",
              ylab="Energy sub metering")

lines(newpower$fullTimeDetail,newpower$Sub_metering_2, col="red")

lines(newpower$fullTimeDetail,newpower$Sub_metering_3, col="blue")

legend("topright", col=c("black","red","blue"),
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       bty = "n",
       lty=c(1,1), lwd=c(1,1))

# Making Plot 4D
plot(newpower$fullTimeDetail,newpower$Global_reactive_power, type="l",
      xlab="datetime",
      ylab = "Global_reactive_power")


dev.off()






