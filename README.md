Peer-graded Assignment: Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 

This repo contains following files:
1. run_analysis.R: R script to create the tidy data set
2. TidyData.txt: text file as final output of R script
3. CodeBook.md: indicate all the variables and summaries calculated, along with units, and any other relevant information
4. README.md: short explanation about the project

R script 
1. Load required package: dplyr
2. Download source .zip file from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
3. Unzip the file
4. Load dataset from features, activity_label, training and test txt file and create respective column names for each dataset
5. Task 1 - Merges the training and the test sets to create one data set
6. Task 2 - Extracts only the measurements on the mean and standard deviation for each measurement
7. Task 3 - Uses descriptive activity names to name the activities in the data set, change activity field from code [1..6] into corresponding activity name in activities dataset
8. Task 4 - Appropriately labels the data set with descriptive variable names, change abbreviation into complete word and remove unnecessary special character
9. Task 5 - From the data set in Task 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject