##
plot_4 <- read.table("./household_power_consumption.txt", header = TRUE, 
                     sep = ";", stringsAsFactors = FALSE, dec = ".")
plot_4_data <- plot_4[plot_4$Date %in% c("1/2/2007", "2/2/2007"), ]
plot_4_timedate <- strptime(paste(plot_4_data$Date, plot_4_data$Time, 
                                  sep =" "), "%d/%m/%Y %H:%M:%S") 

## setting the rows and columns for the graphs + margins
par(mfrow = c(2, 2))
par(mar = c(4, 5, 4, 5))

## Plotting the first graph (plot2)
plot_4_Gap <- as.numeric(plot_4_data$Global_active_power)
plot(plot_4_timedate, plot_4_Gap, type = "l", xlab = "", ylab = "Global Active Power", 
     cex.lab = 0.8)

## plotting the second graph
plot_4_Vol <- as.numeric(plot_4_data$Voltage)
plot(plot_4_timedate, plot_4_Vol, type = "l", xlab = "datetime", ylab = "Voltage", 
     cex.lab = 0.8, cex.axis = 0.8)

## Plotting the third graph (plot3) | (again trying to fit the legend somehow (fail))
plot_4_S1 <- as.numeric(plot_4_data$Sub_metering_1)
plot_4_S2 <- as.numeric(plot_4_data$Sub_metering_2)
plot_4_S3 <- as.numeric(plot_4_data$Sub_metering_3)

plot(plot_4_timedate, plot_4_S1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(plot_4_timedate, plot_4_S3, col = "blue", type = "l")
lines(plot_4_timedate, plot_4_S2, col = "red", type = "l")
legend("topright", bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd = 0, ncol = 1, col = c("black", "blue", "red"), cex = 0.7)

## Making the last graph by making a new numeric variable Global rea.power
## then creating the plot
plot_4_Grp <- as.numeric(plot_4_data$Global_reactive_power)
plot(plot_4_timedate, plot_4_Grp, type = "l", xlab = "datetime", ylab = "Global_Relative_Power", 
     cex.lab = 0.8, cex.axis = 0.8)

##S Copying and saving the graphs
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()