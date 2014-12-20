# This file include the detailed description of what I did to the data sets 

## Detailed description
1. I read all the data sets into memory including "X_train.txt", "y_train.txt", "subject_train.txt",
"subject_text.txt", "y_train.txt", "y_test.txt", "features.txt", "activity_labels.txt"
2. I merged the train and test data sets into three data frames: the "feature_data" data frame, "activity" 
data frame and the "subject" data frame
3. I changed the column names of the "feature_data" data frame to be descriptive
4. I selected all the columns of feature_data containing the strings "mean" or "std"
5. I column bind the above three data frames into one data frame, and named it "data"
6. I merged the activity names into "data"
7. I averaged the features for each subject and each activity and named it "clean_data"
8. I wrote the "clean_data" into a file named "cleanData.txt" with the argument "row.name=FALSE"


