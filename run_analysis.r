# this is an r file to get and clean accelerometer data

fileurl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl1, destfile = destfile = "/Users/matthewellis/Desktop/Coursera/A3/rprog_data_ProgAssignment3-data//Project4/datafile1.csv", method = "curl")
dateDownloaded <- date()

read.csv("/Users/matthewellis/Desktop/Coursera/A3/rprog_data_ProgAssignment3-data/datafile1.csv")

