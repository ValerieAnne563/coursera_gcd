## TL; DR ##
run _run_analysis.R_, and it will produce  
#### stds_and_means.csv
This is the dataset for Objectives 1-4. See "Result Files" for a detailed description of its contents.  

#### summaries.txt
This is the dataset for Objective 5. See "Result Files" for a detailed description of its contents.  

## Side Effects ##
run_analysis.R generates several files.  
If sourced, it does not change the working directory.

### Result Files ###

#### produces stds_and_means.csv  

This is a comma-separated file including 88 variable names and 10299 results
- The feature_labels have been reformatted to replace dashes with underscores, and remove parens
- First variable is the subject_id
- Second variable is the activity_name
- Remaining 86 variables are the means and averages for all measurements [every feature originally labeled -mean() or -std()]

#### produces summaries.csv

- Captures all -mean() and -std() measurements from the original dataset
- Where the experiment captured multiple observations of a subject at a given activity, this script provides the average.

For example, the average _tBodyAcc_mean_X_ for subject 1 while walking. 

### Original data ###
run_analysis.R will check to see if there is a file called "feature.txt" in the current working directory.  
If it does not find one, it will download and unzip all the original data in to a directory called "UCI_HAR Dataset"