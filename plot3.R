##
plot_3 <- read.table("./household_power_consumption.txt", header = TRUE, 
                     sep = ";", stringsAsFactors = FALSE, dec = ".")
plot_3_data <- plot_3[plot_3$Date %in% c("1/2/2007", "2/2/2007"), ]
plot_3_timedate <- strptime(paste(plot_3_data$Date, plot_3_data$Time, 
                                  sep =" "), "%d/%m/%Y %H:%M:%S") 

## Creating new variable for the Sub_metering measurements as.numeric
plot_3_S1 <- as.numeric(plot_3_data$Sub_metering_1)
plot_3_S2 <- as.numeric(plot_3_data$Sub_metering_2)
plot_3_S3 <- as.numeric(plot_3_data$Sub_metering_3)

## Plotting the first line S1 then adding S2 and S3 with lines()
plot(plot_3_timedate, plot_3_S1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(plot_3_timedate, plot_3_S3, col = "blue", type = "l")
lines(plot_3_timedate, plot_3_S2, col = "red", type = "l")

## Adding the legend | which was a struggle for me, it didn't want to fit in properly 
##(probably because I copied from screen to png)
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd = 1, ncol = 1, col = c("black", "blue", "red"))

dev.copy(png, file = "plot3.png", width = 480, height = 480)

dev.off()