##################################################################################
## Coursera Data Sciences Course 4: Exploratory Data Analysis                   ##
## exploredata_prep.R - script to download and unzip data in the data directory ##
##################################################################################

print("Begin explore data analysis script to download the dataset in data directory under home folder")

library(tools)
        
### Download and unzip the files from the given url ###

if(!file.exists("./data")){
  print("creating data directoy in home directory")
  dir.create("./data")
}

### delete zip file from the directory if exists ###

if(file.exists("./data/household_power_consumption.zip")) {
  filenm <- file_path_as_absolute("./data/household_power_consumption.zip")
  if (file.remove(filenm)) {
     print(c("deleting existing zip file from the directory: file name=",filenm))
  } else {
    stop("Error deleting existing zip file")
  }
}

fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"         #url to the input dataset

print("downloading the assignment dataset as household_power_consumption.zip")

download.file(fileUrl,destfile="./data/household_power_consumption.zip")
  
print("unzipping the files in a folder under data directory")

unzip("./data/household_power_consumption.zip",exdir="./data",overwrite = TRUE)

print("End of exploredata_prep.R script: completed downloading and unzipping the files")
print("Please run Plot1, Plot2, Plot3, Plot4 scripts in any order to verify all the graphs")
