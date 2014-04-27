Version 1.0
====================
The run_analsis.R script file will analyze the Human Activity Recognition Using Smartphones Dataset
Version 1.0 data. For a description of the data files please review the content of README.txt

## Data
The analyzed data is stored in UCUHARDataset and AverageDataset R variable and stored to the
filesystem in the files UCUHARDataset.txt and AverageDataset.txt encoded in CSV format.

Both files contain the following structure: Activity, Subject followed by the measurements on the
mean and standard deviation for each measurement. 
The UCUHARDataset contains each measurement in its own row. Tthe AverageDataset contains the
average of every mean and standard deviation measurement for each activity and subject.

## Processing
The processing of the original data is done in the following main steps:

1. Reading basic information
2. Reading test data
3. Reading training data
4. Processing data
5. Creating the mean and standard deviation data set
6. Creating the average data set
7. Writing Output files

### Reading basic information
This step reads general data files. The activity_labels.txt and features.txt. are read. The conent of the features.txt file is further processed to include ony the mean and std values.
### Reading test data
The step reads the files containing activity, subject and main test data files.
### Reading training data
The step reads the files containing activity, subject and main training data files.
### Processing data
This step performs a lookup of the activity codes read in step 2. and 3. with the activity values read in step 1. The test and training data is filtered to contain only the mean and std values.
### Creating the mean and standard deviation data set
This steps creates the first data set containing the mean and standard deviation of every meassurement.
The test data and training data is created by merging the Activity, Subject and meassurement data. Finally
the test and training data is merged into one data set.
### Creating the average data set
This steps creates the second data set containing for each activity and each person the mean of every meassurement. 
### Writing Output files
The output files are created in the last step. The data in the output files is encoded in CSV format and stored with txt file extension.