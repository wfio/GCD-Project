# Getting and Cleaning Data Course Project (GCD)
## README file prepared by Zach

### Overview

 The purpose of this script is to provide a tidy data output for later review 
 and analysis. The script uses a functional programming as well as a split-comb
 ine and apply approach for ingesting untidy data, manipulating individual elem
 ments within the dataset and finally preparing the dataset via merging for lat-
 er review and analysis.
 
 ### Accessing the files
 
 The files you need to download to run this script are located at:
  [External Link] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
 
### Script Generation Environment & Techniques

 The script was prepared in a Windows 7 32-bit environment and crafted using 
 RStudio v0.98.1103 running on R-base version 3.20.0. The only non-generic pack-
 age used to complete this script is the Hadley Wickham 'dplyr' package. The pa-
 ckage version used for this assignment was 0.4.1.
 
 ### What to expect from the script and output
 
 The parent function (run_analysis) calls other functions within the environme-
 nt to process each phase of the data manipuation exercise. Initially, the fun-
 ction works on two different datasets (test & training) preparing them for gr-
 ouping, merging and final summary stat generation in the final_dataset() call.
 
 The function will print the results to the user while at the same time generat-
 ating a .txt file called "run_analysis_tidy_data.txt". To view the output text
 file please consider the following command in your R console:
 
    *your_var <- read.table(file_path, header = TRUE)*
      *View(your_var)* 
      
  If you're using RStudio, otherwise print() to your console.
  
  ## Preparing the dataset in *your* environment for running the script
  
  1. Download the course *.zip file to your PC and extract the data to a direc-
  tory on your harddrive.
    1.1. You will be left with a parent directory /UCI HAR Dataset followed by:
     1.1.2 /test directory, three text files and an Inertia sub-dir.
     1.1.3 /training directory, three text files and an Inertia sub-dir.
     1.1.4 /four text files that were used to prepare variable, measurement na-
     mes/details and a README.
  2. Save the run_analysis.R script into the /UCI HAR Dataset directory.
  3. Set your working directory to: *setwd("file_path_of_UCI_HART_Dataset")*.
    3.1 Verify your working directory by: *getwd()*
    3.2 Verify the files from above were loaded by: *list.files()*
  4. The script requires the 'dplyr' package. If you do not have it installed, 
  please perform: *install.packages("dplyr")* from your console. The dependenc-
  ies and other requirements of the package should be reviewed before proceeding
  by reviewing the package description at:
  
    [dplyr](http://cran.r-project.org/web/packages/dplyr/index.html)
  
  5. Once all of the above are complete, please open the script utilizing the
  source function: *source("file_path")
  6. This will load the R script executable code into the console.
  7. Type *run_analysis()* and R will execute the code, print the results to
  the console and then write a text file into the working directory.

 
 
