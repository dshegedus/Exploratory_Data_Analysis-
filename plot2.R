
plot_2 <- read.table("./household_power_consumption.txt", header = TRUE, 
                     sep = ";", stringsAsFactors = FALSE, dec = ".")

## Subsetting the dates with a different method 
plot_2_data <- plot_2[plot_2$Date %in% c("1/2/2007", "2/2/2007"), ]

## Merging timedates together into time/dates classes
plot_2_timedate <- strptime(paste(plot_2_data$Date, plot_2_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##
plot_2_Gap <- as.numeric(plot_2_data$Global_active_power)

## Making the plot for with type line
plot(plot_2_timedate, plot_2_Gap, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## 
dev.copy(png, file = "plot2.png", width = 480, height = 480)

##
dev.off()
