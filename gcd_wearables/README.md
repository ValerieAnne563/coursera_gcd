### About this repo
This repository is part of project to practice arranging, cleaning, in R, as well as the ability to document a data set.  
It is shared to faciliate a peer review as part of Coursera's "Getting and Cleaning Data" course.

### About this data
Wearable fitness trackers have made it possible to measure the movement of everyday activities (or inactivities) and track/incentivize the activity levels of a given person. 

The University of California - Irvine performed a study, using accelerometers on a Samsung Galaxy S smartphone, to capture the movements of 30 volunteers performing six different activities. A full description is available [here](
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones "UCI Machine Learning Repository")

This project summarizes and organizes the results of that study data with regard to the following objectives:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Source files and documentation  

    ├── README.md          This file. 
    ├── codebook.md        A description of the input data, method of analysis, and manual for the output data
    ├── run_analysis.R     This single R script acquires and generates txt files as described below
  
### Quick start  
    source("./run_analysis.R")"

_run_analysis.R_ will generate two output files.

It will check for a file called "feature.txt" in the current working directory.  
If it does not find one, it will download and unzip all the original study data in to a directory called "UCI_HAR Dataset"

The working directory before and after the script will remain the same.

### Result Files
    ├── target
    │   ├── means_and_stds.csv
    │   └── summaries.txt

##### means_and_stds.csv
Fulfills objectives 1-4

This is a comma-separated file including 81 variables and 10299 results
- The feature_labels have been reformatted to replace dashes with underscores, and remove parens
- First variable is the subject_id
- Second variable is the activity_name
- Remaining 86 variables are the means and averages for all measurements [every feature originally labeled -mean() or -std()]

#### summaries.txt
Fulfills objective 5

- Captures all -mean() and -std() measurements from the original dataset
- Where the experiment captured multiple observations of a subject at a given activity, this script provides the average.

For example, the average _tBodyAcc_mean_X_ for subject 1 while walking. 
