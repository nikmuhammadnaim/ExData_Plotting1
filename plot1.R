library(tidyverse)

# Read the data from local file
power_consumption <- read_delim('data/household_power_consumption.txt',
                                delim = ';',
                                na = '?',
                                col_types = cols(Date = col_date('%d/%m/%Y')))

# Check summary
summary(power_consumption)

# Filter for Date between 2007-02-01 to 2007-02-02
df <- power_consumption %>% 
  filter(Date >= '2007-02-01', Date <= '2007-02-02')

# Create Plot 1
hist(df$Global_active_power, xlab = 'Global Active Power (kilowatts)', col='red', main='Global Active Power')

# Export as PNG
dev.copy(png, 'plot1.png', height = 480, width = 480)
dev.off()
