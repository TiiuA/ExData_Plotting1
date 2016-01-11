
## Reading the data from the file

df_power = read.csv("household_power_consumption.txt", header=T,
                    sep=";", stringsAsFactors=F, na.strings="?",
                    colClasses=c("character", "character", "numeric",
                                 "numeric", "numeric", "numeric",
                                 "numeric", "numeric", "numeric"))

df_power$timestamp = strptime(paste(df_power$Date, df_power$Time),
                              format="%d/%m/%Y %H:%M:%S", tz="UTC")
startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")
df_power = df_power[df_power$timestamp >= startDate & df_power$timestamp <= endDate, ]

## Creating the plot
png(filename="plot4.png", width=480, height=480)

# Setting the canvas for 4 plots
par(mfcol=c(2,2))

# First plot
plot(df_power$timestamp, df_power$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")

# Second plot
plot(df_power$timestamp, df_power$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(df_power$timestamp, df_power$Sub_metering_2, col="red")
lines(df_power$timestamp, df_power$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=par("lwd"), bty="n")

# Third Plot
plot(df_power$timestamp, df_power$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# Fourth plot
plot(df_power$timestamp, df_power$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()