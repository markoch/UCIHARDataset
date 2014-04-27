library(reshape2)
##Reading basic information
message("Reading basic information")
activity <- read.table("activity_labels.txt", col.names=c("ColumnID", "Activity"),colClasses = "character");
features <- read.table("features.txt", col.names=c("ColumnID", "ColumnName"));
columnHeader <- features[,"ColumnName"];
meanStd <- c(".*mean.*", ".*std.*");
meanStdHeader <- unique (grep(paste(meanStd,collapse="|"),features$ColumnName, value=TRUE));
columnToUse <- which(is.element(features$ColumnName, meanStdHeader))

##Reading the subject, acitivity and test data
message("Reading test data")
subject_test <- read.table(file.path("test","subject_test.txt"))
activity_test <- read.table(file.path("test","y_test.txt"), col.names=c("Activity"))
x_test <- read.table(file.path("test","X_test.txt"))

##Reading the subject, acitivity and training data
message("Reading training data")
subject_train <- read.table(file.path("train","subject_train.txt"))
activity_train <- read.table(file.path("train","y_train.txt"), col.names=c("Activity"))
x_train <- read.table(file.path("train","X_train.txt"))

## Create data sets
message("Processing data")
activity_test <- factor(x=activity_test$Activity,labels=activity$Activity,ordered=TRUE)
activity_train <- factor(x=activity_train$Activity,labels=activity$Activity,ordered=TRUE)
x_test_result <- x_test[,columnToUse]
x_train_result <- x_train[,columnToUse]

message("Creating the mean and standard deviation data set")
x_test_result <- cbind(activity_test, subject_test,x_test_result)
names(x_test_result) <- c("Activity", "Subject", meanStdHeader)
x_train_result <- cbind(activity_train, subject_train,x_train_result)
names(x_train_result) <- c("Activity", "Subject", meanStdHeader)
UCIHARDataset <- rbind(x_test_result,x_train_result)
message("Name: UCIHARDataset")
message("(Rows: " , nrow(UCIHARDataset), appendLF=FALSE)
message(" Columns: " , ncol(UCIHARDataset), ")")

message("Creating the average data set")
AverageDataset <- melt(UCIHARDataset, meassure.vars=meanStdHeader, id=c("Activity", "Subject"))
AverageDataset <- dcast(AverageDataset, Activity + Subject ~ variable, mean)
message("Name: AverageDataset")
message("(Rows: " , nrow(AverageDataset), appendLF=FALSE)
message(" Columns: " , ncol(AverageDataset), ")")
message("Writing CSV output file to UCIHARDataset.txt")
write.csv(UCIHARDataset, file="UCIHARDataset.txt")
message("Writing CSV output file to AverageDataset.txt")
write.csv(AverageDataset, file="AverageDataset.txt")
