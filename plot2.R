# Loading the data
power <- read.table("household_power_consumption.txt", header=T, na.strings="?", stringsAsFactors=FALSE, comment.char="", sep=";")

# Using data from the dates 2007-02-01 and 2007-02-02
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
summary(power$Date)
newpower <- power[(power$Date=="2007-02-01") |  (power$Date=="2007-02-02"),]

# Optimise data for Plot 2
newpower$Global_active_power <- as.numeric(newpower$Global_active_power)

# Putting Date and Time together
newpower$fullTimeDetail <- paste(newpower$Date,newpower$Time, sep=" ")
newpower$fullTimeDetail <- strptime(newpower$fullTimeDetail,format="%Y-%m-%d %H:%M")

# Making Plots 2
png(filename = "plot2.png", width = 480, height=480)

plot(newpower$fullTimeDetail,newpower$Global_active_power, type="l",
              xlab=" ",
              ylab="Global Active Power (killowatts)")

dev.off()











