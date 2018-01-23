Declare Requirements
```{r}
require(tidyr)
require(dplyr)
require(stringr)
```

Create the directories to store merged data sets
```{r}
if (!dir.exists("./data/merged")) { dir.create("./data/merged") }
```

 Get a list of all the files containing the train sets in order to use them as the guide to find their peers
```{r}
files <- list.files(path = "./data/train",
                          full.names = TRUE,
                          pattern = "_train.txt$")
```

 This function reads each file from both train and test sets and merge them into one dataset, creating a new file with "merged" appended to filename.
```{r}
for (each_file in files) {
        
        train <- read.table(each_file,
                    header = FALSE,
                    stringsAsFactors = FALSE)
        
        test <- read.table(file = gsub(pattern = "train",
                               replacement = "test",
                               x = each_file),
                           header = FALSE,
                           stringsAsFactors = FALSE)
        
        write.table(x = test,
                    file = gsub(pattern = "train",
                               replacement = "merged",
                               x = each_file),
                    col.names = FALSE,
                    append = TRUE,
                    row.names = FALSE)
        
        rm(test)
        
        write.table(x = train,
                    file = gsub(pattern = "train",
                               replacement = "merged",
                               x = each_file),
                    col.names = FALSE,
                    append = TRUE,
                    row.names = FALSE)
        
        rm(train, each_file)
}

rm(files) # free memory
```

 Read the features.txt file
```{r}
features_names <- read.table("features.txt", stringsAsFactors = FALSE)
```

 Use regular expression to select only the mean and standard deviation features names
```{r}
means_and_stds_grepl <- grepl(pattern = "(mean|std)\\(",
                              x = features_names$V2)

means_and_stds_grep <- grep(pattern = "(mean|std)\\(",
                            x = features_names$V2)
```

 Store the value of features$V2 of the rows that have mean and standard deviation variables.
```{r}
features_var_names <- features_names[means_and_stds_grep,2]

rm(features_names, means_and_stds_grep) # free memory
```

 Edit feature names
```{r}
features_var_names <- gsub(pattern = "-",
    replacement = "_",
    x = features_var_names)

features_var_names <- sub(pattern = '\\()',
    replacement = '',
    x = features_var_names)
```

 Read the X_merged file (X_train and X_test merged)
```{r}
X_merged <- read.table("data/merged/X_merged.txt",
                       stringsAsFactors = FALSE)
```

 Get only the mean and std variables from X_merged, and store the result in a new data frame, called readings
```{r}
readings <- X_merged[means_and_stds_grepl]

rm(X_merged, means_and_stds_grepl) # Remove the big X_merged data frame from memory.
```

 Use the vector features_var_names to give names to the variables in feature_values data frame
```{r}
names(readings) <- features_var_names

rm(features_var_names) # free memory
```

 Read subject
```{r}
subjects <- read.table("data/merged/subject_merged.txt",
                               stringsAsFactors = FALSE)
```

 Read Y
```{r}
activities <- read.table("data/merged/Y_merged.txt",
                               stringsAsFactors = FALSE)
```

 Merge subject and activity variables
```{r}
merged_data <- cbind(subjects, activities)

rm(subjects, activities) # free memory
```

 Change column names to more descriptive ones
```{r}
names(merged_data) <- c("subject", "activity")
```

 Read the activity labels file
```{r}
activity_labels <- read.table("activity_labels.txt", stringsAsFactors = FALSE)
```

 Extract activities' names from activity_labels data frame, and store them in a single vector to use them as labels when creating factors
```{r}
activity_labels <- as.character(activity_labels$V2)
```

 Edit variable names
```{r}
activity_labels <- tolower(activity_labels) # All characters to lowercase
activity_labels <- sub("walking_", "", activity_labels) # Just upstairs and downstairs, instead of walking_upstairs and walking_downstairs
```

 Merge feature values with subject and activity values
```{r}
merged_data <- cbind(merged_data, readings)

rm(readings) # free memory
```

Calculates the mean value for each variable for each subject and activity
```{r}
final_data <- aggregate(merged_data[,3:68], 
                        list(merged_data$subject, merged_data$activity),
                        "mean") %>% 
        rename(subject = Group.1,
               activity = Group.2) %>% 
        arrange(subject)

rm(merged_data) # free memory
```

Use the edited variable names as labels to the factors created for the activity column of final_data
```{r}
final_data$activity <- factor(final_data$activity,
                               levels = 1:6,
                               labels = activity_labels
                               )
rm(activity_labels) # free memory
```

Turn subject variable into a factor
```{r}
final_data$subject <- factor(final_data$subject, levels = 1:30)
```

Create the file containing the final_data data frame
```{r}
write.table(final_data,file = "final_data.txt", row.names = FALSE)
```
