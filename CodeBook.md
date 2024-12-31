Overview

This codebook describes the variables, data, and transformations performed to produce the tidy dataset tidy_dataset.txt.

Source Data

Dataset Name: Human Activity Recognition Using Smartphones

Source: UCI Machine Learning Repository

Description: Data collected from the accelerometers of Samsung Galaxy S smartphones during different physical activities.

Transformations Performed

Merge Training and Test Data:

Combined X_train.txt and X_test.txt (features), y_train.txt and y_test.txt (activity labels), and subject_train.txt and subject_test.txt (subject IDs).

Extract Mean and Standard Deviation Features:

Selected features containing "mean()" or "std()" using regular expressions.

Use Descriptive Activity Names:

Replaced activity IDs with descriptive activity names from activity_labels.txt.

Label Data with Descriptive Variable Names:

Updated feature names for clarity (e.g., tBodyAcc-mean()-X became TimeBodyAccMeanX).

Create Independent Tidy Dataset:

Averaged each variable by activity and subject.

Variables in tidy_dataset.txt

Identifiers:

subject: Unique identifier for each participant (1-30).

activity: The activity performed, one of:

WALKING

WALKING_UPSTAIRS

WALKING_DOWNSTAIRS

SITTING

STANDING

LAYING

Measurements:

Variables include the average of mean and standard deviation features grouped by subject and activity.

Examples of variable names:

TimeBodyAccMeanX: Average of the mean for time-domain body acceleration in the X direction.

FrequencyBodyAccJerkStdDevY: Average of the standard deviation for frequency-domain body jerk acceleration in the Y direction.

Output

File: tidy_dataset.txt

Format: Tab-separated values.

Content: 180 rows (30 subjects x 6 activities) and 68 columns (1 subject + 1 activity + 66 measurements).
