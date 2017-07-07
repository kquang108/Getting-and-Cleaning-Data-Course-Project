# READ IN DATA
# 1 Data
test.data <- read.table("./UCI HAR Dataset/test/X_test.txt", colClasses = as.character())
train.data <- read.table("./UCI HAR Dataset/train/X_train.txt", colClasses = as.character())
# 2 Activity Labels
test.labels <- read.table("./UCI HAR Dataset/test/y_test.txt", colClasses = as.character())
train.labels <- read.table("./UCI HAR Dataset/train/y_train.txt", colClasses = as.character())
# 3 Subjects
test.subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", colClasses = as.character())
train.subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", colClasses = as.character())
# 4 Features
features <- read.table("./UCI HAR Dataset/features.txt", colClasses = as.character())
# 5 Activity Names
activity <- read.table("./UCI HAR Dataset/activity_labels.txt", colClasses = as.character())

# 1. MERGE TABLES 
data <- bind_rows(train.data, test.data)
labels <- bind_rows(train.labels, test.labels)
subjects <- bind_rows(train.subjects,test.subjects)

# 2. EXTRACT THE MEASUREMENT MEAN & STD
select.mean.std <- grep("mean|std",features[,2])
measurements <- data[,select.mean.std]

# 3. USE DESCRIPTIVE ACTIVITY NAMES TO NAME THE DATA SET
activity.labels <- left_join(labels,activity, by = "V1")
names(subjects) <- "Subjects"
names(activity.labels) <- c("Activity.code", "Activity.Desc")
activity.labels <- select(activity.labels, Activity.Desc)

# 4. LABEL DATA SET WITH DESCRIPTIVE VARIABLE NAMES
names(measurements) <- features[select.mean.std,2]
names(measurements) <- sub("^t","time_",names(measurements))
names(measurements) <- sub("^f","freq_",names(measurements))
names(measurements) <- sub("\\()","",names(measurements))

# Combine measurements with subject and activity labels
tidy.data <- data.frame(subjects,activity.labels,measurements)

# 5. INDEPENDENT TABLE WITH AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT
tidy <- tidy.data %>%
        arrange(Subjects, Activity.Desc) %>%
        group_by(Subjects, Activity.Desc) %>%
        summarise_all(funs(mean))