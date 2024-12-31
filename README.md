# r-cleandata-asnmnt

Project Description

The purpose of this project is to demonstrate the ability to collect, clean, and prepare a dataset for analysis. The project focuses on wearable computing data collected from Samsung Galaxy S smartphones, specifically from their accelerometers. This script processes the data to produce a tidy dataset.

Files in the Repository

run_analysis.R:

Merges training and test datasets.

Extracts mean and standard deviation measurements.

Labels activities and variables with descriptive names.

Creates a tidy dataset containing the average of each variable for each activity and each subject.

Outputs the tidy dataset as tidy_dataset.txt.

tidy_dataset.txt:

Contains the final tidy dataset, with averages grouped by activity and subject.

CodeBook.md:

Provides detailed descriptions of variables, data transformations, and the cleaning process.

How to Run the Script

Place the run_analysis.R script in your R working directory.

Ensure the UCI HAR Dataset directory is extracted in the working directory.

Run the script in R:

source("run_analysis.R")

The output file tidy_dataset.txt will be generated in the working directory.

