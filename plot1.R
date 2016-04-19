# Loading the data
power <- read.table("household_power_consumption.txt", header=T, na.strings="?", stringsAsFactors=FALSE, comment.char="", sep=";")

# Using data from the dates 2007-02-01 and 2007-02-02
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
summary(power$Date)
newpower <- power[(power$Date=="2007-02-01") |  (power$Date=="2007-02-02"),]

# Optimise data for Plot 1
newpower$Global_active_power <- as.numeric(newpower$Global_active_power)

# Making Plots 1
png(filename = "plot1.png", width = 480, height=480)

hist(newpower$Global_active_power, col="red", main="Global Active Power",
              xlab="Global Active Power (killowatts)",
              ylab="Frequency") 

dev.off()





