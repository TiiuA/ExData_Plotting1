## Reading the data from the file

df_power = read.csv("household_power_consumption.txt", header=T,
                            sep=";", stringsAsFactors=F, na.strings="?",
                            colClasses=c("character", "character", "numeric",
                                         "numeric", "numeric", "numeric",
                                         "numeric", "numeric", "numeric"))

## Formatting the date and subseting the data only on 2007-02-01 and 2007-02-02
df_power$Date = as.Date(df_power$Date, format="%d/%m/%Y")
startDate = as.Date("01/02/2007", format="%d/%m/%Y")
endDate = as.Date("02/02/2007", format="%d/%m/%Y")
df_power = df_power[df_power$Date >= startDate & df_power$Date <= endDate, ]

## Creating the plot
png(filename="plot1.png", width=480, height=480)
hist(as.numeric(df_power$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()

