##################################################################################
## Coursera Data Sciences Course 4: Exploratory Data Analysis                   ##
## plot4.R - script to plot 4 time series graphs                                ##
##################################################################################

print("Begin plot4 script")

filenm <- "./data/household_power_consumption.txt"
print ("Reading data from file ./data/household_power_consumption.txt")
hpcdata <- read.table( filenm , header = TRUE , sep=";" , na.strings = "?" , stringsAsFactors = FALSE) #read data

print("Creating a date/time variable in POSIXlt format")
hpcdata$dttm <- strptime(paste(hpcdata$Date,hpcdata$Time), "%d/%m/%Y %H:%M:%S")          #create date & time for filtering later

print("Extract 2 days of data needed for the plot")
myhpcdata <- subset(hpcdata, as.Date(hpcdata$dttm) == "2007-02-01" | as.Date(hpcdata$dttm) == "2007-02-02")

print("Converting dttm variable to POSIXct format so that complete.cases can be used")
myhpcdata$dttm <- as.POSIXct(myhpcdata$dttm)

print("Removing not available data")
myhpcdata <- myhpcdata[complete.cases(myhpcdata),]

print("Completed creating data object required for plot, starting plot now")

print("Begin plot4 script")


font_size = 1
font_family = "serif"
mline = 3
mcex= 1

png(filename="plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

print("creating plot1-timeseries graph against Global Active Power")
plot(myhpcdata$dttm,myhpcdata$Global_active_power,type="l",ylab = "n", xlab="") 
mtext(side = 2, "Global Active Power",line = mline, cex = mcex, family = font_family ,font = font_size)

print("creating plot2-timeseries graph against Voltage")
plot(myhpcdata$dttm,myhpcdata$Voltage,type="l",ylab = "n",xlab="datetime") 
mtext(side = 2, "Voltage",line = mline, cex = mcex, family = font_family ,font = font_size)

print("creating plot3-timeseries graph against Entergy Sub metering")

plot(myhpcdata$dttm,myhpcdata$Sub_metering_1,type="l",ylab = NA, xlab = NA)
lines(myhpcdata$dttm,myhpcdata$Sub_metering_2,type="l",col="red")
lines(myhpcdata$dttm,myhpcdata$Sub_metering_3,type="l",col="blue")
mtext(side = 2, "Energy sub metering",line = mline, cex = mcex, family = font_family ,font = font_size)
mylabels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
mylabels_col <- c("black","red","blue")
legend("topright", mylabels, lwd = .05, col = mylabels_col, bty = "n", cex = 1)

print("creating plot4-timeseries graph against Global Reactive Power")
plot(myhpcdata$dttm,myhpcdata$Global_reactive_power,type="l",ylab = "n",xlab="datetime") 
mtext(side = 2, "Global_reactive_power",line = mline, cex = mcex, family = font_family ,font = font_size)

dev.off()

print("End of the script plot4, please verify plot4.png file in your home directory")


