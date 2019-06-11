# Getting-and-Cleaning-Data-Course-Project
Final Project for Getting and Cleaning Data Course

## Data Set used
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

  First, download and unzip the data file into your R working directory.
  Second, download the R source code into your R working directory.
  Finally, execute R source code to generate tidy data file.

The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. The variable in the data Y indicates activity type the subjects performed during recording.

## Code
The code combined training dataset and test dataset, and extracted partial variables to create another dataset with the averages of each variable for each activity.

## New dataset
The new generated dataset contained variables calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for all subjects.

## The code was written based on the instruction of this assignment
Create one R script called run_analysis.R that does the following.

  Merges the training and the test sets to create one data set.
  Extracts only the measurements on the mean and standard deviation for each measurement.
  Uses descriptive activity names to name the activities in the data set
  Appropriately labels the data set with descriptive variable names.
  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
