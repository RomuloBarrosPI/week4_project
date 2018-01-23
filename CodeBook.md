Code Book 
=========

## This file gives some explanations about the variables. 
### For information how the script works, read README.md file, as it was suggested by the project assignment guidelines.

The readings were collected form smartphones held by 30 volunteer subjects. The subjects executed 6 different activities (variable activity). Data were collected by two different features of the smartphone: the accelerometer and the gyroscope. In each activity performed by each subject, some mean and standard deviation measurements were taken by the researchers. Some measurements have both Time and Frequency domains.

This data set have 180 observations of 68 variables.

The variables are as follow:

|#|Variable|Description|
|-|--------|-----------|
|1|subject| An identifier of the subject who carried out the experiment.|
|2|activity| The activity performed by the subject. |
|3-5|tBodyAcc_mean_XYZ| The mean of the estimated body acceleration for each of the 3 axis (X, Y, and Y)|
|6-8|tBodyAcc_std_XYZ| The standard deviation of the estimated body acceleration for each of the 3 axis (X, Y, and Y)|
|9-11|tGravityAcc_mean_XYZ| The mean of gravitational acceleration for each of the 3 axis (X, Y, and Y)|
|12-14|tGravityAcc_std_XYZ| The standard deviation of gravitational acceleration for each of the 3 axis (X, Y, and Y)|
|15-17|tBodyAccJerk_mean_XYZ| The mean of jerk signals from the estimated body acceleration for each of the 3 axis (X, Y, and Y)|
|18-20|tBodyAccJerk_std_XYZ| The standard deviation of jerk signals from the estimated body acceleration for each of the 3 axis (X, Y, and Y)|
|21-23|tBodyGyro_mean_XYZ| The mean of the estimated body angular velocity from the gyroscope for each of the 3 axis (X, Y, and Y)|
|24-26|tBodyGyro_std_XYZ| The standard deviation of the estimated body angular velocity from the gyroscope for each of the 3 axis (X, Y, and Y) |
|27-29|tBodyGyroJerk_mean_XYZ| The mean of jerk signals from the estimated body angular velocity from the gyroscope for each of the 3 axis (X, Y, and Y)|
|30-32|tBodyGyroJerk_std_XYZ| The standard deviation of jerk signals from the estimated body angular velocity from the gyroscope for each of the 3 axis (X, Y, and Y)|
|33|tBodyAccMag_mean| The mean of the magnitude of the estimated body acceleration |
|34|tBodyAccMag_std| The standard deviation of the magnitude of the estimated body acceleration |
|35|tGravityAccMag_mean| The mean of the magnitude of the gravity acceleration |
|36|tGravityAccMag_std| The standard deviation of the magnitude of the gravity acceleration magnitude |
|37|tBodyAccJerkMag_mean| The mean of the magnitude of the jerk signals from the estimated body acceleration |
|38|tBodyAccJerkMag_std| The standard deviation of the magnitude of the jerk signals from the estimated body acceleration |
|39|tBodyGyroMag_mean| The mean of the magnitude of the estimated body angular velocity from the gyroscope |
|40|tBodyGyroMag_std| The standard deviation of the magnitude of the estimated body angular velocity from the gyroscope |
|41|tBodyGyroJerkMag_mean| The mean of the magnitude of the jerk signals from the estimated body angular velocity from the gyroscope |
|42|tBodyGyroJerkMag_std| The standard deviation of the magnitude of the jerk signals from estimated body angular velocity from the gyroscope |
|43-45|fBodyAcc_mean_XYZ| The "same" as the 3-5 variable, but in the frequency domain |
|46-48|fBodyAcc_std_XYZ| The "same" as the 6-8 variable, but in the frequency domain |
|49-51|fBodyAccJerk_mean_XYZ| The "same" as the 15-17 variable, but in the frequency domain |
|52-54|fBodyAccJerk_std_XYZ| The "same" as the 18-20 variable, but in the frequency domain|
|55-57|fBodyGyro_mean_XYZ| The "same" as the 21-23 variable, but in the frequency domain |
|58-60|fBodyGyro_std_XYZ| The "same" as the 24-26 variable, but in the frequency domain |
|61|fBodyAccMag_mean| The "same" as the 36 variable, but in the frequency domain |
|62|fBodyAccMag_std| The "same" as the 37 variable, but in the frequency domain |
|63|fBodyBodyAccJerkMag_mean| The "same" as the 38 variable, but in the frequency domain |
|64|fBodyBodyAccJerkMag_std| The "same" as the 39 variable, but in the frequency domain |
|65|fBodyBodyGyroMag_mean| The "same" as the 40 variable, but in the frequency domain |
|66|fBodyBodyGyroMag_std| The "same" as the 41 variable, but in the frequency domain |
|67|fBodyBodyGyroJerkMag_mean| The "same" as the 42 variable, but in the frequency domain |
|68|fBodyBodyGyroJerkMag_std| The "same" as the 43 variable, but in the frequency domain |
