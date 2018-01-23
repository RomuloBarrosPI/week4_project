require(tidyr)
require(dplyr)
require(stringr)

# Create the directories to store merged data sets
if (!dir.exists("UCI HAR Dataset/merged")) { 
        
        dir.create("UCI HAR Dataset/merged") 
}

# Get a list of all the files containing the train sets in order to use them 
# as the guide to find their test sets peers
files <- list.files(path = "UCI HAR Dataset/train",
                    full.names = TRUE,
                    pattern = "_train.txt$")

# This for loop reads each file from both train and test sets and merge them 
# into one dataset, creating a new file with the word "merged" appended to filename.
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

# Read the features.txt file
features_names <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)

# Use regular expression to select only the mean and the standard deviation 
# features' names
means_and_stds_grepl <- grepl(pattern = "(mean|std)\\(",
                              x = features_names$V2)

means_and_stds_grep <- grep(pattern = "(mean|std)\\(",
                            x = features_names$V2)

# Store the value of the rows that have mean and standard deviation variables.
features_var_names <- features_names[means_and_stds_grep,2]

rm(features_names, means_and_stds_grep) # free memory

# Edit feature names
# Change - for _
features_var_names <- gsub(pattern = "-",
                           replacement = "_",
                           x = features_var_names)
# Remove ()
features_var_names <- sub(pattern = '\\()',
                          replacement = '',
                          x = features_var_names)

# Read the X_merged file (X_train and X_test merged)
X_merged <- read.table("UCI HAR Dataset/merged/X_merged.txt",
                       stringsAsFactors = FALSE)

# Get only the mean and std variables from X_merged, and store the result in 
# a new data frame, called readings 
readings <- X_merged[means_and_stds_grepl]

rm(X_merged, means_and_stds_grepl) # Remove the big X_merged from memory.

# Use the vector features_var_names to give names to the variables in 
# feature_values data frame
names(readings) <- features_var_names

rm(features_var_names) # free memory

# Read subject
subjects <- read.table("UCI HAR Dataset/merged/subject_merged.txt",
                       stringsAsFactors = FALSE)

# Read Y (activities)
activities <- read.table("UCI HAR Dataset/merged/Y_merged.txt",
                         stringsAsFactors = FALSE)

# Merge subject and activity variables
merged_data <- cbind(subjects, activities)

rm(subjects, activities) # free memory

# Change column names to more descriptive ones
names(merged_data) <- c("subject", "activity")

# Read the activity labels file
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

# Extract activities' names from activity_labels data frame, and store them 
# in a single vector to use them as labels when creating factors
activity_labels <- as.character(activity_labels$V2)

# Edit variable names
## All characters to lowercase
activity_labels <- tolower(activity_labels)

## Just upstairs and downstairs, 
## instead of walking_upstairs and walking_downstairs
activity_labels <- sub("walking_", "", activity_labels) 

# Use the edited variable names as labels to the factors created for the 
# activity column of merged_data
merged_data$activity <- factor(merged_data$activity,
                               levels = 1:6,
                               labels = activity_labels
)

rm(activity_labels) # free memory

# Merge feature values with subject and activity values
merged_data <- cbind(merged_data, readings)

rm(readings) # free memory

# Create factors for the subject column
merged_data$subject <- factor(merged_data$subject, levels = 1:30)

# Create a second, independent tidy data set with the 
# average of each variable for each activity and each subject.
final_data <- aggregate(merged_data[,3:68],
                        list(merged_data$subject,
                             merged_data$activity),
                        "mean") %>%
        rename(subject = Group.1,
               activity = Group.2) %>% 
        arrange(subject)

rm(merged_data) # free memory

# Create the "final_data.txt" file in the working directory
write.table(final_data,file = "final_data.txt", row.names = FALSE)
