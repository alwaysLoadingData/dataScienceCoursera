

#This file loads the data set, tidys it, and produces summary datasets

library(tidyr)
library(dplyr)

root_data_dir = "getdata/projectfiles/UCI HAR Dataset/"

#Load feature names
features <- 
  read.table(paste(root_data_dir,"features.txt", sep = ""),
             col.names = c("column_number", "feature_title"))
features_to_keep <-
  grep("std\\()|mean\\()", features[["feature_title"]])

#Load activity names
activities <-
  read.table(paste(root_data_dir,"activity_labels.txt", sep = ""), 
             col.names = c("activity_id", "activity"))

#load test Dataset
test_data <-
    read.table(paste(root_data_dir,"test/X_test.txt", sep = ""),
               col.names = features[["feature_title"]])
test_subject <-
    read.table(paste(root_data_dir,"test/subject_test.txt", sep = ""),
               col.names = c("subject_id"))
test_activity <-
    read.table(paste(root_data_dir,"test/Y_test.txt", sep = ""),
               col.names = c("activity_id"))

#get the descriptive names of the activities
test_activity <-
  test_activity %>%
  inner_join(activities, by = c("activity_id"))

#get rid of any observations that we don't want to keep
test_data <-
  test_data %>% 
  select(features_to_keep)

#join activity and subject data, remove activity_id
test_data <-
  test_subject %>%
  bind_cols(test_activity) %>%
  select(-activity_id) %>%
  bind_cols(test_data)

#repeat the same steps with the training data
training_data <-
  read.table(paste(root_data_dir,"train/X_train.txt", sep = ""),
             col.names = features[["feature_title"]])
training_subject <- 
  read.table(paste(root_data_dir,"train/subject_train.txt", sep = ""),  
             col.names = c("subject_id"))
training_activity <-
  read.table(paste(root_data_dir,"train/Y_train.txt", sep = ""),  
             col.names = c("activity_id"))

training_activity <- 
  training_activity %>%
  inner_join(activities, by = c("activity_id"))

training_data <- 
  training_data %>% 
  select(features_to_keep)

training_data <- 
  training_subject %>%
  bind_cols(training_activity) %>%
  select(-activity_id) %>%
  bind_cols(training_data)


#now join everything together
full_data <-
  bind_rows(training_data, test_data)

# sorry for the wall of text here, but this seemed most resonable
summary_col_names <-
  c("subject_id", "activity",
    "time_body_accel_mean_X_mean", "time_body_accel_mean_Y_mean", "time_body_accel_mean_Z_mean",
    "time_body_accel_stdev_X_mean", "time_body_accel_stdev_Y_mean", "time_body_accel_stdev_Z_mean",
    "time_gravity_accel_mean_X_mean", "time_gravity_accel_mean_Y_mean", "time_gravity_accel_mean_Z_mean",
    "time_gravity_accel_stdev_X_mean", "time_gravity_accel_stdev_Y_mean", "time_gravity_accel_stdev_Z_mean",
    "time_body_accelJerk_mean_X_mean", "time_body_accelJerk_mean_Y_mean", "time_body_accelJerk_mean_Z_mean",
    "time_body_accelJerk_stdev_X_mean", "time_body_accelJerk_stdev_Y_mean", "time_body_accelJerk_stdev_Z_mean",
    "time_body_gyro_mean_X_mean", "time_body_gyro_mean_Y_mean", "time_body_gyro_mean_Z_mean",
    "time_body_gyro_stdev_X_mean", "time_body_gyro_stdev_Y_mean", "time_body_gyro_stdev_Z_mean",
    "time_body_gyroJerk_mean_X_mean", "time_body_gyroJerk_mean_Y_mean", "time_body_gyroJerk_mean_Z_mean",
    "time_body_gyroJerk_stdev_X_mean", "time_body_gyroJerk_stdev_Y_mean", "time_body_gyroJerk_stdev_Z_mean",
    "time_body_accelMag_mean_mean", "time_body_accelMag_stdev_mean",
    "time_gravity_accelMag_mean_mean", "time_gravity_accelMag_stdev_mean",
    "time_body_accelJerkMag_mean_mean", "time_body_accelJerkMag_stdev_mean",
    "time_body_gyroMag_mean_mean", "time_body_gyroMag_stdev_mean",
    "time_body_gyroJerkMag_mean_mean", "time_body_gyroJerkMag_stdev_mean",
    "freq_body_accel_mean_X_mean", "freq_body_accel_mean_Y_mean", "freq_body_accel_mean_Z_mean",
    "freq_body_accel_stdev_X_mean", "freq_body_accel_stdev_Y_mean", "freq_body_accel_stdev_Z_mean",
    "freq_body_accelJerk_mean_X_mean", "freq_body_accelJerk_mean_Y_mean", "freq_body_accelJerk_mean_Z_mean",
    "freq_body_accelJerk_stdev_X_mean", "freq_body_accelJerk_stdev_Y_mean", "freq_body_accelJerk_stdev_Z_mean",
    "freq_body_gyro_mean_X_mean", "freq_body_gyro_mean_Y_mean", "freq_body_gyro_mean_Z_mean",
    "freq_body_gyro_stdev_X_mean", "freq_body_gyro_stdev_Y_mean", "freq_body_gyro_stdev_Z_mean",
    "freq_body_accelMag_mean_mean", "freq_body_accelMag_stdev_mean",
    "freq_body_bodyAccelJerkMag_mean_mean", "freq_body_bodyAccelJerkMag_stdev_mean",
    "freq_body_bodyGyroMag_mean_mean", "freq_body_bodyGyroMag_stdev_mean",
    "freq_body_bodyGyroJerkMag_mean_mean", "freq_body_bodyGyroJerkMag_stdev_mean")

#Create a summary dataset
summary_data <-
  full_data %>%
  group_by(subject_id, activity) %>%
  summarize_each(funs(mean)) %>%
  arrange(subject_id, activity)

#assign the column names
colnames(summary_data) <- summary_col_names

# Write out the summary into a file
write.table(summary_data, "getdata/projectfiles/harSummary.txt", row.names = FALSE)

# This command will read the data back into R
#read_summary <- read.table("getdata/projectfiles/harSummary.txt", header = TRUE, stringsAsFactors = FALSE)