# Getting and Cleaning Data Week 4 Course Project

This repository holds my work for the course project on creating a tidy dataset of accelerometer data. 

## The Data

The data for this project comes from Samsung Galaxy S smartphone. 

## The script

The script I wrote for this project downloads the files and assigns the individual datasets to objects. The variable names from the file documentation was also assigned to two objects, variablename and activitylabels. 

The training data and the test data were then merged together using rbind. 

Next, only the measurements on the mean and standard deviation for each measurement were extracted from the data. 

activity labels and variable names were then added to the objects. 

Next a independent tidy dataset was created using cbind. This tidy dataset was created showing the mean of each variable for each activity and each subject. 
