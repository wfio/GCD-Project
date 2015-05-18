require("dplyr")

run_analysis <- function () {
# Calls various functions and writes out a text file of the summary results 
# Args: none
#Returns:
# A table data.frame of the means of each activity (6) for each subject

  vars <- read.table("features.txt", header = FALSE, sep = "")
  test <- test.process(vars)
  train <- train.process(vars)
  interim <- int.dataset(test, train)
  final <- final.dataset(interim)  
  write.table(final, file = "run_anaysis_tidy_data_generic.txt", row.names = FALSE)  
}
test.process <- function(vars) {
  # Reads the 'test' raw data text files
  # Args: 
  #   vars: Table of variable/activityLabel names from features.txt
  # Returns:
  #  A data.frame of subjectNums, activityLabels and Observations for test
  #  Uses subsetting to set variable names for steps #3 and #4
  test.sub <- read.table("test/subject_test.txt", header = FALSE)
  test.activity <- read.table("test/y_test.txt", header = FALSE)
  test.obs <- read.table("test/X_test.txt", header = FALSE)
  test.dat <- bind_cols(test.sub, test.activity, test.obs)  
  
  #set the activity labels in 'labels' column based upon the numeric present
  # satisfying the requirements of step #3 and #4
  colnames(test.dat) <- c("subject", "activity", as.character(vars[,2]))
  test.dat$activity <- ifelse(test.dat$activity == 1, "walking", 
                       ifelse(test.dat$activity == 2, "walking_upstairs", 
                         ifelse(test.dat$activity == 3, "walking_downstairs", 
                           ifelse(test.dat$activity == 4, "sitting", 
                             ifelse(test.dat$activity == 5, "standing", 
                               ifelse(test.dat$activity == 6, "laying", NA))))))
  
  #Clean up & returns
  rm(test.sub, test.activity, test.obs)
  return(test.dat)
}
train.process <- function(vars) {
  # Reads the 'train' raw data text files
  # Args: 
  #   vars: Table of variable/activityLabel names from features.txt
  # Returns:
  #  A data.frame of subjectNums, activityLabels and Observations for training
  #  Uses subsetting techniques to set variable names based upon ActivityLabels
  train.sub <- read.table("train/subject_train.txt", header = FALSE)
  train.activity <- read.table("train/y_train.txt", header = FALSE)
  train.obs <- read.table("train/X_train.txt", header = FALSE, sep = "")
  train.dat <- bind_cols(train.sub, train.activity, train.obs)    
  
  #set the activity labels in 'labels' column based upon the numeric present
  # satisfying the requirements of step #3 and #4
  colnames(train.dat) <- c("subject", "activity", as.character(vars[,2]))
  train.dat$activity <- ifelse(train.dat$activity == 1, "walking", 
                        ifelse(train.dat$activity == 2, "walking_upstairs",
                          ifelse(train.dat$activity == 3, "walking_downstairs", 
                            ifelse(train.dat$activity == 4, "sitting", 
                              ifelse(train.dat$activity == 5, "standing", 
                                ifelse(train.dat$activity == 6, "laying", NA))))))
  
  #Clean up and return
  rm(train.sub, train.activity, train.obs, vars)
  return(train.dat)
}
int.dataset <- function(test, train) {
  # Combines test/train data sets extracts data - Steps #1 & #2
  # Args: 
  #   test: Data.frame from the test dataset pre-processing
  #   train: Data.frame from the train dataset pre-processing
  # Returns:
  #  A data table of means/stdevs grouped by activityLabels and subject number
  #  and arranged by subject number ascending.
  dftbl <- bind_rows(test, train)
  dftbl %>%
    group_by(subject, activity) %>%
    select(subject, activity, matches('mean'), matches('std')) %>%
    arrange(dftbl, subject) %>%
    return
}
final.dataset <- function(interim) {
  # Combines test/train data sets extracts data - Steps #1 & #2
  # Args: 
  #   interim a tbl_df for final extraction of means of activities
  #   of subjects
  # Returns:
  #  A data table of means/stdevs arranged by subject number
  final.df <- interim
  final.df %>% 
    summarise_each(funs(mean)) %>%
    print    
}
