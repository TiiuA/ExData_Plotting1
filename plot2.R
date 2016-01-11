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
png(filename="plot2.png", width=480, height=480)
plot(df_power$timestamp, as.numeric(df_power$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
