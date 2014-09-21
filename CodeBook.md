---
title: "Code Book-Human Activity Recognition Using Smartphones Dataset"
author: "Jack Elendil B. Lagare"
date: "September 14, 2014"
output: html_document
---

### Dataset Contents


***
Reference: README.txt


***The dataset includes the following files:***

- 'README.txt'

- 'features_info.txt': Information about the variables used in the feature vector.

- 'features.txt': Lists the variables in the feature vector.

- 'activity_labels.txt': Lookup table for the human-readable activity labels.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'train/subject_train.txt': The subjects who performed the activity. From 1-30.

- 'test/y_test.txt': Test labels.

- 'test/subject_test.txt': The subjects who performed the activity. From 1-30. 

***The following files are also included in the dataset but was not part of the data analysis since the given train and test data are already enough to generate a summary.***

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.


### Processing the Data 


***
1. Read test data.

2. Merge the test and training data into one dataset.

3. Initialize ***dplyr*** data frame. This was done to take advantage of the data manipulation
features of the package.

4. Read activities and subjects. 

5. Merge test and train subject data.

6. Replace coded values of activities with descriptive labels. Merge test and train activity data.

7.  Read features.

8. Using regular expressions, remove features that have nothing to do with mean and standard deviation. Assign features vector as column names of the data frame.

9. Match the trimmed features list with the columns. The select verb of the dplyr package was used in this step.

10. Rename features. Removed punctuation marks, changed "mean" to "Mean" and "std" to "StdDev", fixed typos (ie. BodyBody), and replace "t" with "time" and "f" with "freq".

11. Bind activity and subject column to the dataset.

12. Generate summarised data for each activity, subject, and variable. Used colmeans to achieve this and bound the rows to a new data frame.

13. Write summarised data to file. You may see the generated file **tidy_dataset.txt** in this directory.

### Variables 

***
|      Original Variable      |      Renamed Variable     |                                                                         Description                                                                         |
|:---------------------------:|:-------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------:|
| tBodyAcc-mean()-X           | timeBodyAccMeanX          | Mean value of the body acceleration signal measured in the indicated axis.                                                                                  |
| tBodyAcc-mean()-Y           | timeBodyAccMeanY          | Mean value of the body acceleration signal measured in the indicated axis.                                                                                  |
| tBodyAcc-mean()-Z           | timeBodyAccMeanZ          | Mean value of the body acceleration signal measured in the indicated axis.                                                                                  |
| tGravityAcc-mean()-X        | timeGravityAccMeanX       | Mean value of the gravity acceleration signal measured in the indicated axis.                                                                               |
| tGravityAcc-mean()-Y        | timeGravityAccMeanY       | Mean value of the gravity acceleration signal measured in the indicated axis.                                                                               |
| tGravityAcc-mean()-Z        | timeGravityAccMeanZ       | Mean value of the gravity acceleration signal measured in the indicated axis.                                                                               |
| tBodyAccJerk-mean()-X       | timeBodyAccJerkMeanX      | Mean value of the body acceleration signal derivation used to obtain jerk signals in the indicated axis.                                                    |
| tBodyAccJerk-mean()-Y       | timeBodyAccJerkMeanY      | Mean value of the body acceleration signal derivation used to obtain jerk signals in the indicated axis.                                                    |
| tBodyAccJerk-mean()-Z       | timeBodyAccJerkMeanZ      | Mean value of the body acceleration signal derivation used to obtain jerk signals in the indicated axis.                                                    |
| tBodyGyro-mean()-X          | timeBodyGyroMeanX         | Mean value of the angular velocity in the indicated axis.                                                                                                   |
| tBodyGyro-mean()-Y          | timeBodyGyroMeanY         | Mean value of the angular velocity in the indicated axis.                                                                                                   |
| tBodyGyro-mean()-Z          | timeBodyGyroMeanZ         | Mean value of the angular velocity in the indicated axis.                                                                                                   |
| tBodyGyroJerk-mean()-X      | timeBodyGyroJerkMeanX     | Mean value of the angular velocity derivation used to obtain jerk signals in the indicated axis.                                                            |
| tBodyGyroJerk-mean()-Y      | timeBodyGyroJerkMeanY     | Mean value of the angular velocity derivation used to obtain jerk signals in the indicated axis.                                                            |
| tBodyGyroJerk-mean()-Z      | timeBodyGyroJerkMeanZ     | Mean value of the angular velocity derivation used to obtain jerk signals in the indicated axis.                                                            |
| tBodyAccMag-mean()          | timeBodyAccMagMean        | Mean value of the magnitude of the body acceleration signal measured.                                                                                       |
| tGravityAccMag-mean()       | timeGravityAccMagMean     | Mean value of the magnitude of the gravity acceleration.                                                                                                    |
| tBodyAccJerkMag-mean()      | timeBodyAccJerkMagMean    | Mean value of the magnitude of the body acceleration signal derivation used to obtain jerk signals.                                                         |
| tBodyGyroMag-mean()         | timeBodyGyroMagMean       | Mean value of the magnitude of the angular velocity.                                                                                                        |
| tBodyGyroJerkMag-mean()     | timeBodyGyroJerkMagMean   | Mean value of the magnitude of the angular velocity derivation used to obtain jerk signals.                                                                 |
| fBodyAcc-mean()-X           | freqBodyAccMeanX          | Mean value of the body acceleration signal measured in the indicated axis where a Fast Fourier Transform was applied.                                       |
| fBodyAcc-mean()-Y           | freqBodyAccMeanY          | Mean value of the body acceleration signal measured in the indicated axis where a Fast Fourier Transform was applied.                                       |
| fBodyAcc-mean()-Z           | freqBodyAccMeanZ          | Mean value of the body acceleration signal measured in the indicated axis where a Fast Fourier Transform was applied.                                       |
| fBodyAccJerk-mean()-X       | freqBodyAccJerkMeanX      | Mean value of the body acceleration signal derivation used to obtain jerk signals in the indicated axis where a Fast Fourier Transform was applied.         |
| fBodyAccJerk-mean()-Y       | freqBodyAccJerkMeanY      | Mean value of the body acceleration signal derivation used to obtain jerk signals in the indicated axis where a Fast Fourier Transform was applied.         |
| fBodyAccJerk-mean()-Z       | freqBodyAccJerkMeanZ      | Mean value of the body acceleration signal derivation used to obtain jerk signals in the indicated axis where a Fast Fourier Transform was applied.         |
| fBodyGyro-mean()-X          | freqBodyGyroMeanX         | Mean value of the angular velocity in the indicated axis where a Fast Fourier Transform was applied.                                                        |
| fBodyGyro-mean()-Y          | freqBodyGyroMeanY         | Mean value of the angular velocity in the indicated axis where a Fast Fourier Transform was applied.                                                        |
| fBodyGyro-mean()-Z          | freqBodyGyroMeanZ         | Mean value of the angular velocity in the indicated axis where a Fast Fourier Transform was applied.                                                        |
| fBodyAccMag-mean()          | freqBodyAccMagMean        | Mean value of the magnitude of the body acceleration signal measured where a Fast Fourier Transform was applied.                                            |
| fBodyBodyAccJerkMag-mean()  | freqBodyAccJerkMagMean    | Mean value of the magnitude of the body acceleration signal derivation used to obtain jerk signals where a Fast Fourier Transform was applied.              |
| fBodyBodyGyroMag-mean()     | freqBodyGyroMagMean       | Mean value of the magnitude of the angular velocity derivation used to obtain jerk signals where a Fast Fourier Transform was applied.                      |
| fBodyBodyGyroJerkMag-mean() | freqBodyGyroJerkMagMean   | Mean value of the magnitude of the angular velocity derivation used to obtain jerk signals where a Fast Fourier Transform was applied.                      |
| tBodyAcc-std()-X            | timeBodyAccStdDevX        | Standard deviation of the body acceleration signal measured in the indicated axis.                                                                          |
| tBodyAcc-std()-Y            | timeBodyAccStdDevY        | Standard deviation of the body acceleration signal measured in the indicated axis.                                                                          |
| tBodyAcc-std()-Z            | timeBodyAccStdDevZ        | Standard deviation of the body acceleration signal measured in the indicated axis.                                                                          |
| tGravityAcc-std()-X         | timeGravityAccStdDevX     | Standard deviation of the gravity acceleration signal measured in the indicated axis.                                                                       |
| tGravityAcc-std()-Y         | timeGravityAccStdDevY     | Standard deviation of the gravity acceleration signal measured in the indicated axis.                                                                       |
| tGravityAcc-std()-Z         | timeGravityAccStdDevZ     | Standard deviation of the gravity acceleration signal measured in the indicated axis.                                                                       |
| tBodyAccJerk-std()-X        | timeBodyAccJerkStdDevX    | Standard deviation of the body acceleration signal derivation used to obtain jerk signals in the indicated axis.                                            |
| tBodyAccJerk-std()-Y        | timeBodyAccJerkStdDevY    | Standard deviation of the body acceleration signal derivation used to obtain jerk signals in the indicated axis.                                            |
| tBodyAccJerk-std()-Z        | timeBodyAccJerkStdDevZ    | Standard deviation of the body acceleration signal derivation used to obtain jerk signals in the indicated axis.                                            |
| tBodyGyro-std()-X           | timeBodyGyroStdDevX       | Standard deviation of the angular velocity in the indicated axis.                                                                                           |
| tBodyGyro-std()-Y           | timeBodyGyroStdDevY       | Standard deviation of the angular velocity in the indicated axis.                                                                                           |
| tBodyGyro-std()-Z           | timeBodyGyroStdDevZ       | Standard deviation of the angular velocity in the indicated axis.                                                                                           |
| tBodyGyroJerk-std()-X       | timeBodyGyroJerkStdDevX   | Standard deviation of the angular velocity derivation used to obtain jerk signals in the indicated axis.                                                    |
| tBodyGyroJerk-std()-Y       | timeBodyGyroJerkStdDevY   | Standard deviation of the angular velocity derivation used to obtain jerk signals in the indicated axis.                                                    |
| tBodyGyroJerk-std()-Z       | timeBodyGyroJerkStdDevZ   | Standard deviation of the angular velocity derivation used to obtain jerk signals in the indicated axis.                                                    |
| tBodyAccMag-std()           | timeBodyAccMagStdDev      | Standard deviation of the magnitude of the body acceleration signal measured.                                                                               |
| tGravityAccMag-std()        | timeGravityAccMagStdDev   | Standard deviation of the magnitude of the gravity acceleration.                                                                                            |
| tBodyAccJerkMag-std()       | timeBodyAccJerkMagStdDev  | Standard deviation of the magnitude of the body acceleration signal derivation used to obtain jerk signals.                                                 |
| tBodyGyroMag-std()          | timeBodyGyroMagStdDev     | Standard deviation of the magnitude of the angular velocity.                                                                                                |
| tBodyGyroJerkMag-std()      | timeBodyGyroJerkMagStdDev | Standard deviation of the magnitude of the angular velocity derivation used to obtain jerk signals.                                                         |
| fBodyAcc-std()-X            | freqBodyAccStdDevX        | Standard deviation of the body acceleration signal measured in the indicated axis where a Fast Fourier Transform was applied.                               |
| fBodyAcc-std()-Y            | freqBodyAccStdDevY        | Standard deviation of the body acceleration signal measured in the indicated axis where a Fast Fourier Transform was applied.                               |
| fBodyAcc-std()-Z            | freqBodyAccStdDevZ        | Standard deviation of the body acceleration signal measured in the indicated axis where a Fast Fourier Transform was applied.                               |
| fBodyAccJerk-std()-X        | freqBodyAccJerkStdDevX    | Standard deviation of the body acceleration signal derivation used to obtain jerk signals in the indicated axis where a Fast Fourier Transform was applied. |
| fBodyAccJerk-std()-Y        | freqBodyAccJerkStdDevY    | Standard deviation of the body acceleration signal derivation used to obtain jerk signals in the indicated axis where a Fast Fourier Transform was applied. |
| fBodyAccJerk-std()-Z        | freqBodyAccJerkStdDevZ    | Standard deviation of the body acceleration signal derivation used to obtain jerk signals in the indicated axis where a Fast Fourier Transform was applied. |
| fBodyGyro-std()-X           | freqBodyGyroStdDevX       | Standard deviation of the angular velocity in the indicated axis where a Fast Fourier Transform was applied.                                                |
| fBodyGyro-std()-Y           | freqBodyGyroStdDevY       | Standard deviation of the angular velocity in the indicated axis where a Fast Fourier Transform was applied.                                                |
| fBodyGyro-std()-Z           | freqBodyGyroStdDevZ       | Standard deviation of the angular velocity in the indicated axis where a Fast Fourier Transform was applied.                                                |
| fBodyAccMag-std()           | freqBodyAccMagStdDev      | Standard deviation of the magnitude of the body acceleration signal measured where a Fast Fourier Transform was applied.                                    |
| fBodyBodyAccJerkMag-std()   | freqBodyAccJerkMagStdDev  | Standard deviation of the magnitude of the body acceleration signal derivation used to obtain jerk signals where a Fast Fourier Transform was applied.      |
| fBodyBodyGyroMag-std()      | freqBodyGyroMagStdDev     | Standard deviation of the magnitude of the angular velocity where a Fast Fourier Transform was applied.                                                     |
| fBodyBodyGyroJerkMag-std()  | freqBodyGyroJerkMagStdDev | Standard deviation of the magnitude of the angular velocity derivation used to obtain jerk signals where a Fast Fourier Transform was applied.              |