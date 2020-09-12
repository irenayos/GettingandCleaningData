## Peer-graded Assignment: Getting and Cleaning Data Course Project

## Load dplyr package
library(dplyr)

## Download source .zip file
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./WearableComputing.zip")

## Unzip file
unzip("WearableComputing.zip")

## Load dataset from features, activity_label, training and test txt file
## Create respective column names for each dataset
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("num","feature"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("num", "activity"))
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature, check.names = FALSE)
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity")
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
xTest <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature, check.names = FALSE)
yTest <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity")

## Task 1
## Merges the training and the test sets to create one data set
xAll <- rbind(xTrain, xTest)
yAll <- rbind(yTrain, yTest)
subjectAll <- rbind(subjectTrain, subjectTest)
MergeData <- cbind(subjectAll, yAll, xAll)

## Task 2
## Extracts only the measurements on the mean and standard deviation for each measurement
TidyData <- MergeData[,grep("^subject$|^activity$|[Mm]ean|[Ss]td",names(MergeData))]

## Task 3
## Uses descriptive activity names to name the activities in the data set
## Change activity field from code [1..6] into corresponding activity name in activities dataset
TidyData$activity <- activities[TidyData$activity, "activity"]

## Task 4
## Appropriately labels the data set with descriptive variable names
## Change abbreviation into complete word
## Remove unnecessary special character
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("[^[:alnum:]]meanFreq[^[:alnum:]]+", "MeanFrequency", names(TidyData))
names(TidyData)<-gsub("[^[:alnum:]]mean[^[:alnum:]]+", "Mean", names(TidyData))
names(TidyData)<-gsub("[^[:alnum:]]std[^[:alnum:]]+", "StandardDeviation", names(TidyData))

## Task 5
## From the data set in Task 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject
write.table(TidyData %>% group_by(subject, activity) %>% summarise_all(funs(mean)), "TidyData.txt", row.name=FALSE)
