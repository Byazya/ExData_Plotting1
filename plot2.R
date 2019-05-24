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
with(sub_data, plot(Date_Time, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n"))
with(sub_data, lines(Date_Time, Global_active_power))

## Copying the plot to the PNG file
dev.copy(png, file = "plot2.png")
dev.off()