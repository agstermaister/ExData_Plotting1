df_power_cons <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows =  2100000)
df_power_cons$Date = as.Date(df_power_cons$Date, "%d/%m/%Y")
library("lubridate")
df_power_cons$DateTime <- with(df_power_cons, ymd(Date) + hms(Time))
df_power_short <-df_power_cons[df_power_cons$Date >= "2007-02-01" & df_power_cons$Date <= "2007-02-02",]
png(file="plot2.png", width=480, height=480)
plot(df_power_short$DateTime, df_power_short$Global_active_power,type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()