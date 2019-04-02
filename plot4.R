library(tidyverse)

# Read the data from local file
power_consumption <- read_delim('data/household_power_consumption.txt',
                                delim = ';',
                                na = '?',
                                col_types = cols(Date = col_date('%d/%m/%Y')))

# Check summary
summary(power_consumption)

# Filter for Date between 2007-02-01 to 2007-02-02 then create a new column
# called date_time
df <- power_consumption %>% 
  filter(Date >= '2007-02-01', Date <= '2007-02-02') %>% 
  mutate(Date_Time = parse_datetime(str_c(Date, Time, sep = ' ')))

# Set the canvas to 2 rows and 2 columns
par(mfrow = c(2, 2))

# Create Plot 4
#Plot 4.1
plot(x = df$Date_Time, 
     y = df$Global_active_power,
     type = 'l',
     xlab = '',
     ylab = 'Global Active Power (kilowatts)')

#Plot 4.2
plot(x = df$Date_Time, 
     y = df$Voltage,
     type = 'l',
     xlab = 'datetime',
     ylab = 'Voltage')

#Plot 4.3
plot(x = df$Date_Time, 
     y = df$Sub_metering_1,
     type = 'l',
     xlab = '',
     ylab = 'Energy sub metering')
lines(x = df$Date_Time, y= df$Sub_metering_2, col='red')
lines(x = df$Date_Time, y= df$Sub_metering_3, col='blue')
legend("topright", 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'),
       lty = 1,
       lwd = 1,
       cex = 0.8,
       box.lty = 0)

# Plot 4.4
plot(x = df$Date_Time, 
     y = df$Global_reactive_power,
     type = 'l',
     xlab = 'datetime',
     ylab = 'Global_reactive_power')

# Export as PNG
dev.copy(png, 'plot4.png', height = 480, width = 480)
dev.off()
