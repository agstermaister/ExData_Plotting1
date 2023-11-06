df_power_cons <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows =  2100000)
df_power_cons$Date = as.Date(df_power_cons$Date, "%d/%m/%Y")
library("lubridate")
df_power_cons$DateTime <- with(df_power_cons, ymd(Date) + hms(Time))
df_power_short <-df_power_cons[df_power_cons$Date >= "2007-02-01" & df_power_cons$Date <= "2007-02-02",]
png(file="plot4.png", width=480, height=480)
par(mfrow = c(2,2))
with(df_power_short, {
        plot(DateTime, Global_active_power,type = "l", ylab = "Global Active Power", xlab = "")
        plot(DateTime, Voltage, type = "l")
        plot(DateTime, Sub_metering_1,type = "l", xlab="", ylab = "Energy Sub metering")
        lines(df_power_short$DateTime, df_power_short$Sub_metering_2,type = "l", col = "red")
        lines(df_power_short$DateTime, df_power_short$Sub_metering_3,type = "l", col = "blue")
        legend("topright",col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd =1 )
        plot(DateTime, Global_reactive_power, type = "l")
        
})
dev.off()