# Code Book

## Overview
This dataset is a summarized version of the Human Activity Recognition using Smartphones dataset at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data measurements have been limited to the mean and standard deviation of each type of measurement. The data has been summarized with respect to each subject and activity by taking the mean of each measurement feature. The original dataset is the statistical features of measurements over an instance of doing that activity. So this summarization is the mean of those means and standard deviations.

The data does not have units. The original dataset measurements were normalized on a -1 to 1 scale.

## Processing

To present a summarized dataset we reorganized and reduced the volume of data presented. 

We limited the values presented to only have the mean and standard deviation of each type of measurement.

The original dataset had separate files for each variable, the activity lookup, the values, and the value headers. Those have been combined into one file. The first row has the headers. The first two columns are the variables and the other columns are the values.

The original dataset had many observations for each subject and activity combination. This summary dataset presents the mean values for each of those combinations.

The original dataset was split into two parts, training and test data. While suitable for machine learning, to describe all of the data we combined them into a single dataset.

The final dataset is a wide-format tidy dataset. The data has been reformatted to be a wide format tidy dataset. The first two columns, subject_id and activity are the variables and every other column is a single summarized value.

## Data Dictionary

#### subject_id
Represent an individual who produced the measurements.
* 1 .. 30

#### activity
The activity that the person was doing when the measurements were taken.
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

#### time_body_accel_mean_(X/Y/Z)_mean
Mean of body accelerometer measurement means on the 3-axises for the time domain.

####  time_body_accel_stdev_(X/Y/Z)_mean
Mean of body accelerometer measurement standard deviations on the 3 axes for the time domain.

#### time_gravity_accel_mean_(X/Y/Z)_mean
Mean of gravity accelerometer measurement means on the 3 axes for the time domain.

####  time_gravity_accel_stdev_(X/Y/Z)_mean
Mean of gravity acceleromteter measurement standard deviations on the 3 axes for the time domain.

#### time_body_accelJerk_mean_(X/Y/Z)_mean
Mean of body accelerometer jerk measurement means on the 3 axes for the time domain.

####  time_body_accelJerk_stdev_(X/Y/Z)_mean
Mean of body accelerometer jerk measurement standard deviations on the 3 axes for the time domain.

#### time_body_gyro_mean_(X/Y/Z)_mean
Mean of body gyroscope measurement means on the 3 axes for the time domain.

#### time_body_gyro_stdev_(X/Y/Z)_mean
Mean of body gyroscope measurement standard deviations on the 3 axes for the time domain.

#### time_bodyJerk_gyro_mean_(X/Y/Z)_mean
Mean of body gyroscope jerk measurement means on the 3 axes for the time domain.

#### time_bodyJerk_gyro_stdev_(X/Y/Z)_mean
Mean of body gyroscope jerk measurement standard deviations on the 3 axes for the time domain.

#### time_body_accelMag_mean_mean
Mean of the body accelerometer magnatude mean for the time domain.

#### time_body_accelMag_stdev_mean
Mean of the body accelerometer magnatude standard deviation for the time domain.

#### time_gravity_accelMag_mean_mean
Mean of the gravity accelerometer magnatude mean for the time domain.

#### time_gravity_accelMag_stdev_mean
Mean of the gravity accelerometer magnatude standard deviation for the time domain.

#### time_body_accelJerkMag_mean_mean
Mean of the body jerk accelerometer magnatude mean for the time domain.

#### time_body_accelJerkMag_stdev_mean
Mean of the body jerk accelerometer magnatude standard deviation for the time domain.

#### time_body_gyroMag_mean_mean
Mean of the body gyroscope magnatude mean for the time domain.

#### time_body_gyroMag_stdev_mean
Mean of the body gyroscope magnatude standard deviation for the time domain.

#### time_body_gyroJerkMag_mean_mean
Mean of the body jerk gyroscope magnatude mean for the time domain.

#### time_body_gyroJerkMag_stdev_mean
Mean of the body jerk gyroscope magnatude standard deviation for the time domain.

#### freq_body_accel_mean_(X/Y/Z)_mean
Mean of body accelerometer measurement means on the 3-axises for the frequency domain.

####  freq_body_accel_stdev_(X/Y/Z)_mean
Mean of body accelerometer measurement standard deviations on the 3 axes for the frequency domain.

#### freq_body_accelJerk_mean_(X/Y/Z)_mean
Mean of body accelerometer jerk measurement means on the 3 axes for the frequency domain.

#### freq_body_accelJerk_stdev_(X/Y/Z)_mean
Mean of body accelerometer jerk measurement standard deviations on the 3 axes for the frequency domain.

#### freq_body_gyro_mean_(X/Y/Z)_mean
Mean of body gyroscope measurement means on the 3 axes for the frequency domain.

#### freq_body_gyro_stdev_(X/Y/Z)_mean
Mean of body gyroscope measurement standard deviations on the 3 axes for the frequncy domain.

#### freq_body_accelMag_mean_mean
Mean of the body accelerometer magnatude mean for the frequency domain.

#### freq_body_accelMag_stdev_mean
Mean of the body accelerometer magnatude standard deviation for the frequency domain.

#### freq_body_bodyAccelJerkMag_mean_mean
Mean of the body to body jerk accelerometer magnatude mean for the frequency domain.

#### freq_body_bodyAccelJerkMag_stdev_mean
Mean of the body to body jerk accelerometer magnatude standard deviation for the frequency domain.

#### freq_body_bodyGyroMag_mean_mean
Mean of the body to body gyroscope magnatude mean for the frequency domain.

#### freq_body_bodyGyroMag_stdev_mean
Mean of the body to body gyroscope magnatude standard deviation for the frequency domain.

#### freq_body_bodyGyroJerkMag_mean_mean
Mean of the body to body jerk gyroscope magnatude mean for the frequency domain.

#### freq_body_bodyGyroJerkMag_stdev_mean
Mean of the body to body jerk gyroscope magnatude standard deviation for the frequency domain.


