## Reading all the data from household_power_consuption.txt file in work directory
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", quote = "",
                   dec = ".", numerals = c("no.loss"), na.strings = "?", nrows = 2075260)
## Date and Time --> into Date_Time (POSIXlt class)
Date_Time <- strptime(paste(data[,1], data[,2], sep = " "), "%d/%m/%Y %H:%M:%S")

## Replacing Date and Time columns with Date_Time column
new_data <- cbind(Date_Time, data[,3:9])
## Substracting data subset for dates 2007-02-01 and 2007-02-02 only
sub_data <- new_data[which(Date_Time >="2007-02-01"& Date_Time <"2007-02-03"), ]

## Creating a plot on the screen device
par(mfrow = c(1,1))
with(sub_data, plot(Date_Time, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))
with(sub_data, lines(Date_Time, Sub_metering_1))
with(sub_data, lines(Date_Time, Sub_metering_2, col = "red"))
with(sub_data, lines(Date_Time, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), y.intersp = 0.7)

## Copying the plot to the PNG file
dev.copy(png, file = "plot3.png")
dev.off()