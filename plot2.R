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

# Create Plot 2
plot(x = df$Date_Time, 
     y = df$Global_active_power,
     type = 'l',
     xlab = '',
     ylab = 'Global Active Power (kilowatts)')

# Export as PNG
dev.copy(png, 'plot2.png', height = 480, width = 480)
dev.off()
