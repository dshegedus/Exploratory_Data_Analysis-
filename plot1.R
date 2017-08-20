## Loading dplyr and lubridate packages
library(dplyr)
library(lubridate)

plot_1 <- read.table("./household_power_consumption.txt", header = TRUE, 
                     sep = ";", stringsAsFactors = FALSE)

## dmy function to make the dates as.dates 
plot_1$Date <- dmy(plot_1$Date)

## subsetting the required dates into a new var.
plot_1_data <- filter(plot_1, Date >= "2007-02-01" & Date <= "2007-02-02")

## Making Gap to as.numeric 
plot_1_data$Global_active_power <- as.numeric(plot_1_data$Global_active_power)

## creating the histogram 
with(plot_1_data, hist(Global_active_power, main = "Global Active Power", 
                       xlab = "Global Active Power (kilowatts)", col = "red"))

## Copying from screen graph device to png
dev.copy(png, file = "plot1.png", width = 480, height = 480)

## Turning png dev. off.
dev.off()
