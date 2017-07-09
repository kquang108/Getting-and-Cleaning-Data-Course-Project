## The objective of this project is to demonstrate the ability to collect, work with, and clean a data set
In particular, the student is required to create one R script called run_analysis.R that does the following:

Merges the training and the test sets to create one data set
Extracts only the measurements on the mean and standard deviation for each measurement
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names
Creates a second, independent tidy data set with the average of each variable for each activity and each subject

## Type of data from research about Human Activity Recognition
The data used for this project are represented by the research collected from the Samsung Galaxy S smartphone. In particular, the research was carried out with a group of 30 volunteer, aged between years 19 and 48. Each person performed six activities wearing a smartphone on the waist.

## Requirement of this project
1. Submission of tidy data set
2. Provision of a link to a Github repository with your script for performing the analysis
3. Provision of a code book (called 'CodeBook.md') that describes the variables, the data, and any transformations or work
4. Inclusion of ReadMe.md file

## Review criteria
1. The submitted data set is tidy
2. The Github repo contains the required scripts
3. GitHub contains a code book
4. The README that explains the analysis files is clear and understandable
5. The work submitted for this project is the work of the student who submitted it

## Summary of this project
This repo includes the following files:

1. This README explains how all of the scripts work and how they are connected.
2. run_analysis.R includes the R code to execute the creation of the tidy data set. Prior to executing the run_analysis.R code, the data from the research website are assumed to be downloaded and the associated zip-file to be extracted in the R working folder.
3. Output.txt represents the tidy data set following the execution of run_analysis.R and using write.table() and row.name=FALSE to create this text file.
4. CodeBook.md is a code book that describes the variables, the data, and any transformations or work requried to clean the data.
