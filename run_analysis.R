library(dplyr)

# read data description
features <- read.table("features.txt", col.names = c("n","functions"))

# read activity labels
activities <- read.table("activity_labels.txt", col.names = c("code", "activity"))

# read train data
X_train <- read.table("train/X_train.txt", col.names = features$functions)
Y_train <- read.table("train/Y_train.txt", col.names = "code")
Sub_train <- read.table("train/subject_train.txt", col.names = "subject")

# read test data
X_test <- read.table("test/X_test.txt", col.names = features$functions)
Y_test <- read.table("test/Y_test.txt", col.names = "code")
Sub_test <- read.table("test/subject_test.txt", col.names = "subject")

# 1. Merges the training and the test sets to create one data set.
X_total <- rbind(X_train, X_test)
Y_total <- rbind(Y_train, Y_test)
Subject_total <- rbind(Sub_train, Sub_test)
Merged_data <- cbind(Subject_total, Y_total, X_total)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
TidyData <- Merged_data %>% select(subject, code, contains("mean()"), contains("std()"))

# 3. Uses descriptive activity names to name the activities in the data set
TidyData$code <- activities[TidyData$code, 2]

# 4. Appropriately labels the data set with descriptive variable names.
names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.
FinalData <- TidyData %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)

## Final Check
str(FinalData)