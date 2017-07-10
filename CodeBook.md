## Objective of this code book
This code book describes the variables, the data, and any transformations or work requried to clean the data.




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
