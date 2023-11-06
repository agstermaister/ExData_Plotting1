setwd("C:/Users/aeordogh/OneDrive - Nexus365/Desktop/R/Exploratory data analysis/Week 1 peer assignment")
if (!file.exists("data")){
        dir.create("data")
}
df_power_cons <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows =  2100000)
df_power_cons$Date = as.Date(df_power_cons$Date, "%d/%m/%Y")
df_power_cons$Time = strptime(df_power_cons$Time, "%H:%M:%S")
df_power_short <-df_power_cons[df_power_cons$Date >= "2007-02-01" & df_power_cons$Date <= "2007-02-02",]
df_power_short$Global_active_power = as.numeric(df_power_short$Global_active_power)
png(file="plot1.png", width=480, height=480)
hist(df_power_short$Global_active_power,col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
