## read data
train <- read.table("./getdata-projectfiles-UCI HAR Dataset/
                    UCI HAR Dataset/train/X_train.txt")
activity_train <- read.table("./getdata-projectfiles-UCI HAR Dataset/
                    UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./getdata-projectfiles-UCI HAR Dataset/
                    UCI HAR Dataset/train/subject_train.txt")

test <- read.table("./getdata-projectfiles-UCI HAR Dataset/
                    UCI HAR Dataset/test/X_test.txt")
activity_test <- read.table("./getdata-projectfiles-UCI HAR Dataset/
                    UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./getdata-projectfiles-UCI HAR Dataset/
                    UCI HAR Dataset/test/subject_test.txt")

feature_names <- read.table("./getdata-projectfiles-UCI HAR Dataset/
                    UCI HAR Dataset/features.txt")
activity_names <- read.table("./getdata-projectfiles-UCI HAR Dataset/
                    UCI HAR Dataset/activity_labels.txt")

## merge train and test data
feature_data <- rbind(train, test)
activity <- rbind(activity_train, activity_test)
subject <- rbind(subject_train, subject_test)

## change the variable names to be descriptive
names(feature_data) <- feature_names[,2]
names(activity) <- "activity"
names(subject) <- "subject"

## select the columns containing mean and std 
mean_and_std_name <- grep(".*mean.*|.*std.*", feature_names[,2])
feature_data <- feature_data[, mean_and_std_name]

## column bind the above three data.frames into one
data <- colbind(feature_data, activity, subject)

## name the activities to be descriptive
data <- merge(data, activity_names, by.x = "acticity", by.y = "V1")

## delete the unnecessary column the activity numbers 
## and rename the column of the activity names
data$activity <- NULL
names(data)[length(names(data))] <- "activity"

## average the features for each subject and each activity
clean_data <- aggragate(data[1:79], by = list(data$subject, data$activity),
                        FUN = mean, na.rm = TRUE)

## change the names of the two groups
names(clean_data)[1:2] <- c("subject", "activity")

## wriet clean data into file
write(clean_data, "cleanData.txt", row.name = FALSE)