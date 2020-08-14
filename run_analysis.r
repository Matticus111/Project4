# This is an r file to demonstrate tidying a dataset

# install packages
install.packages("dplyr")
library(dplyr)

# download the file

fileurl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl1, destfile = "/Users/matthewellis/Desktop/Coursera/A3/rprog_data_ProgAssignment3-data//Project 4/datafile1.csv", method = "curl")
dateDownloaded <- date()

# assigns training files to objects

xtrain <- read.table("/Users/matthewellis/Desktop/Coursera/A3/rprog_data_ProgAssignment3-data//Project 4/UCI HAR dataset/train/x_train.txt")
ytrain <- read.table("/Users/matthewellis/Desktop/Coursera/A3/rprog_data_ProgAssignment3-data//Project 4/UCI HAR dataset/train/y_train.txt")
subtrain <- read.table("/Users/matthewellis/Desktop/Coursera/A3/rprog_data_ProgAssignment3-data//Project 4/UCI HAR dataset/train/subject_train.txt")

# assigns testing files to objects

xtest <- read.table("/Users/matthewellis/Desktop/Coursera/A3/rprog_data_ProgAssignment3-data//Project 4/UCI HAR dataset/test/X_test.txt")
ytest <- read.table("/Users/matthewellis/Desktop/Coursera/A3/rprog_data_ProgAssignment3-data//Project 4/UCI HAR dataset/test/y_test.txt")
subtest <- read.table("/Users/matthewellis/Desktop/Coursera/A3/rprog_data_ProgAssignment3-data//Project 4/UCI HAR dataset/test/subject_test.txt")

# assigns names to objects 

variablenames <- read.table("/Users/matthewellis/Desktop/Coursera/A3/rprog_data_ProgAssignment3-data//Project 4/UCI HAR dataset/features.txt")
activitylabels <- read.table("/Users/matthewellis/Desktop/Coursera/A3/rprog_data_ProgAssignment3-data//Project 4/UCI HAR dataset/activity_labels.txt")

# Merges the training and the test sets to create one data set.

Xcombined <- rbind(xtrain, xtest)
Ycombined <- rbind(ytrain, ytest)
subcombined <- rbind(subtrain, subtest)

# Extracts only the measurements on the mean and standard deviation for each measurement.

x <- variablenames[grep("mean\\(\\)|std\\(\\)", variablenames[,2]),]
Xcombined_extracted <- Xcombined[,x[,1]]

# Uses descriptive activity names to name the activities in the data set

colnames(Ycombined) <- "activity"
Ycombined$activitylabel <- factor(Ycombined$activity, labels = as.character(activitylabels[,2]))
activitylabel <- Ycombined[, -1]

# Appropriately labels the data set with descriptive variable names.

colnames(Xcombined_extracted) <- variablenames[x[,1],2]

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
colnames(subcombined) <- "subject"
total <- cbind(Xcombined_extracted, activitylabel, subcombined)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
write.table(total_mean, file = "/Users/matthewellis/Desktop/Coursera/A3/rprog_data_ProgAssignment3-data//Project 4/UCI HAR dataset/tidydataset.txt", row.names = FALSE, col.names = TRUE)