##################################################################################
## Coursera Data Sciences Course 4: Exploratory Data Analysis                   ##
## plot3.R - script to plot time series against Energy sub metering             ##
##################################################################################

print("Begin plot3 script")
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

png(filename="plot3.png", width = 480, height = 480)                           #open png device

plot(myhpcdata$dttm,myhpcdata$Sub_metering_1,type="l",ylab = NA, xlab = NA)    #plot graph for first variable with no labels for X & Y axis
lines(myhpcdata$dttm,myhpcdata$Sub_metering_2,type="l",col="red")              #plot graph for second variable on the same graph in red
lines(myhpcdata$dttm,myhpcdata$Sub_metering_3,type="l",col="blue")             #plot graph for the third variable on the same graph in blue
mtext(side = 2, "Energy sub metering", line = 2)                               #label y-axis

mylabels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")              #create a vector for legend descriptions    
mylabels_col <- c("black","red","blue")                                        #create a vector for legend colors
legend("topright", mylabels, lwd = .05, col = mylabels_col)                    #plot legend

dev.off()                                                                      #close png device

print("End of the script plot3, please verify plot3.png file in your home directory")

