# Check for dataset and download if needed
if (!file.exists("dataset.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "dataset.zip", method = "curl")
  unzip("dataset.zip")
  message("Downloaded and unzipped the UCI HAR Dataset.")
} else {
  message("Dataset (UCI HAR) already downloaded.")
}

library(dplyr)

# Read data
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("id", "activity"))
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))

# Select mean and std features
mean_std_features <- grep("mean\\(\\)|std\\(\\)", features$feature)
feature_names <- features$feature[mean_std_features]

# Load and subset data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")[, mean_std_features]
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity_id")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")[, mean_std_features]
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity_id")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

# Combine data
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)
data <- cbind(subject_data, y_data, x_data)

# Merge with activity labels
data <- merge(data, activity_labels, by.x = "activity_id", by.y = "id")
data$activity_id <- NULL # Remove the ID column

# Correctly set column names for measurements (avoiding overwriting "activity")
measurement_cols <- 3:(ncol(data) - 1) # Correct index for measurement columns
colnames(data)[measurement_cols] <- feature_names

# Clean column names
colnames(data) <- gsub("BodyBody", "Body", colnames(data))
colnames(data) <- gsub("^t", "Time", colnames(data))
colnames(data) <- gsub("^f", "Frequency", colnames(data))
colnames(data) <- gsub("-mean\\(\\)", "Mean", colnames(data))
colnames(data) <- gsub("-std\\(\\)", "StdDev", colnames(data))
colnames(data) <- gsub("-", "", colnames(data))

# Create tidy dataset
tidy_data <- data %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean), .groups = "drop")

# Display and write
head(tidy_data)
write.table(tidy_data, "tidy_dataset.txt", row.name = FALSE)
