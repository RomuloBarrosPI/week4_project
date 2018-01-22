# project_week4

The run_analisys.R script merges two data sets (train and test) into a single one. Then it performs some tidying tasks so the data set can be used for further analisys.

The problem consists of having two different data sets divided into 6 different files. Each data set is similar to the other, except that one contains train data and the other contains test data.

The files for each data set are:

- y_train.txt / y_test.txt: a single-variable data set containing the ID of the activity performed by the subject.
- subject_train.txt / subject_test.txt: a single-variable data set containing the ID of the subject.
- X_train.txt / X_test.txt: a data set containing recordings of 561 different variables.

Additionaly, two files containing metadata were given:

- activity_labels.txt: indicating the label for each of the 6 different activity codes used in y_... files.
- features.txt: indicates the label for each of the 561 measurements in X_... files.

After performing the merging of the data, a second, independent tidy data set is created, inside which there are the average value of each measurement for each activity and each subject. The file final_data.txt contains this second data set.
