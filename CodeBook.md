## Objective of this code book
This code book describes the variables, the data, and any transformations or work requried to clean the data.

## The objective of this project is to demonstrate the ability to collect, work with, and clean a data set

In particular, the student is required to create one R script called run_analysis.R that does the following:

Merges the training and the test sets to create one data set Extracts only the measurements on the mean and standard deviation for each measurement Uses descriptive activity names to name the activities in the data set Appropriately labels the data set with descriptive variable names Creates a second, independent tidy data set with the average of each variable for each activity and each subject

## Steps in run_analysis.R to achieve the objective:

. Prior to executing the run_analysis.R code, the data from the research website are assumed to be downloaded and the associated zip-file to be extracted in the R working folder.

1. READ IN DATA - use the read.table R command to read and save the data sets to 
test.data & train.data: actual data sets from the 9 volunteer 'test' group and 21 volunteer 'train' group
test.labels & train.labels: these signify the activities for each column in the test.data and train.data sets
test.subjects & train.subjects: these column vectors representing the volunteer's data set
features: represents a row vector including all the variable names
actvity: a lookup table that translates the number to the character activity, e.g. "1 for Walking"

2. MERGE TABLES - use bind_rows R command to combine the test.data and train.data sets, test.labels and train.labels, test.subjects and train.subjects, respectively.

3. EXTRACT THE MEASUREMENT MEAN & STANDARD DEVIATION
select.mean.std <- grep("mean|std",features[,2]) - lookups the vector of features, and grep returns the numerical position of the character "mean" or "std". Finally saves the results to the variable "select.mean.std".
measurements <- data[,select.mean.std] - use "select.mean.std" to identify the columns from data (combined test.data and train.data) and saves in "measurements".

4. USE DESCRIPTIVE ACTIVITY NAMES TO NAME THE DATA SET
activity.labels <- left_join(labels,activity, by = "V1") - "left join" the the numeric vector labels and the activity label vector. "left join" is similar to merge but it retains the order of the first "V1" column.
names(subjects) <- "Subjects" - label the column with the name "Subjects"
names(activity.labels) <- c("Activity.code", "Activity.Desc") - label the columns with the names "Activity.code" and "Activity.Desc"

5. LABEL DATA SET WITH DESCRIPTIVE VARIABLE NAMES
This section is about tidying up the labels of the data sets. 
names(measurements) <- features[select.mean.std,2] - label the columns of the measurement data set with the names of the mean & std variables
names(measurements) <- sub("^t","time" ",names(measurements)) - lookups the letter "t" at he beginning of any character variable and replaces with "time"
names(measurements) <- sub("^f","freq",names(measurements)) lookups the letter "f" at he beginning of any character variable and replaces with "freq"
names(measurements) <- sub("\\()","",names(measurements)) removes "()" from any character variable

6. INDEPENDENT TABLE WITH AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT
tidy.data <- data.frame(subjects,activity.labels,measurements) - combines the column vectors subjects and activity as well as the measurement data set.

"tidy <- tidy.data %>%
arrange(Subjects, Activity.Desc) %>%
group_by(Subjects, Activity.Desc) %>%
summarise_all(funs(mean))" - use the chain function from the package 'dplyr' to modify the tidy.data set and saves the results in the variable 'tidy'. First arrange and group by the data sets by subjects and activity description, then use summarise_all to calculate the mean between observations. The group_by command defines the grouping of how the mean is calculated.

## Output file
is saved in tidy and can be saved with write.table() and row.name=FALSE to create the text file 'output.txt'. The first two columns of the output are the "Subject" (numbered from 1 to 30) and the name of the activity. The remaining columns represent the activities. The numeric values are the average of each observations, with the mean separated by subject and activity.

## Variabes used in the data
30 volunteers were recorded during their exercise. 9 volunteers were part of the test data group, whereas the remaining 21 volunteers formed part of the train data group. Various body signals were recorded to define these variables. The signals for this data set stems from the "accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ". The time variable is defined as 'time' and the frequency variable is defined as 'freq'. The signals were further refined to obtain detailed 'Jerk' signals, such as "tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ". The complete set of these signals are:

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

These set of signals are capured via various statistics. For our exercise we are interested in the mean and standard deviation.

Source: features_info.txt and README.txt from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
