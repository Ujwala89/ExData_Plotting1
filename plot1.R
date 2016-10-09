##################################################################################
## Coursera Data Sciences Course 4: Exploratory Data Analysis                   ##
## plot1.R - script to plot histogram for Global active power                   ##
##################################################################################

print("Begin plot1 script")

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

png(filename="plot1.png", width = 480, height = 480)
hist(myhpcdata$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.off() 

print("End of the script plot1, please verify plot1.png file in your home directory")
