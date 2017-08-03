The variables of the tidy data set:
======================================

The variable names of the tidy data set are listed below. They are self-describing, and human readable:

*ActivityLabels
*ActivityNames
*SubjectId :  An identifier of the subject who carried out the experiment.
*TimeBodyAccelerometerMeanX
*TimeBodyAccelerometerMeanY
*TimeBodyAccelerometerMeanZ
*TimeBodyAccelerometerStandardDeviationX
*TimeBodyAccelerometerStandardDeviationY
*TimeBodyAccelerometerStandardDeviationZ
*TimeGravityAccelerometerMeanX
*TimeGravityAccelerometerMeanY
*TimeGravityAccelerometerMeanZ
*TimeGravityAccelerometerStandardDeviationX
*TimeGravityAccelerometerStandardDeviationY
*TimeGravityAccelerometerStandardDeviationZ
*TimeBodyAccelerometerJerkSignalMeanX
*TimeBodyAccelerometerJerkSignalMeanY
*TimeBodyAccelerometerJerkSignalMeanZ
*TimeBodyAccelerometerJerkSignalStandardDeviationX
*TimeBodyAccelerometerJerkSignalStandardDeviationY
*TimeBodyAccelerometerJerkSignalStandardDeviationZ
*TimeBodyGyroscopeMeanX
*TimeBodyGyroscopeMeanY
*TimeBodyGyroscopeMeanZ
*TimeBodyGyroscopeStandardDeviationX
*TimeBodyGyroscopeStandardDeviationY
*TimeBodyGyroscopeStandardDeviationZ
*TimeBodyGyroscopeJerkSignalMeanX
*TimeBodyGyroscopeJerkSignalMeanY
*TimeBodyGyroscopeJerkSignalMeanZ
*TimeBodyGyroscopeJerkSignalStandardDeviationX
*TimeBodyGyroscopeJerkSignalStandardDeviationY
*TimeBodyGyroscopeJerkSignalStandardDeviationZ
*TimeBodyAccelerometerMagnitudeMean
*TimeBodyAccelerometerMagnitudeStandardDeviation
*TimeGravityAccelerometerMagnitudeMean
*TimeGravityAccelerometerMagnitudeStandardDeviation
*TimeBodyAccelerometerJerkSignalMagnitudeMean
*TimeBodyAccelerometerJerkSignalMagnitudeStandardDeviation
*TimeBodyGyroscopeMagnitudeMean
*TimeBodyGyroscopeMagnitudeStandardDeviation
*TimeBodyGyroscopeJerkSignalMagnitudeMean
*TimeBodyGyroscopeJerkSignalMagnitudeStandardDeviation
*FrequencyBodyAccelerometerMeanX
*FrequencyBodyAccelerometerMeanY
*FrequencyBodyAccelerometerMeanZ
*FrequencyBodyAccelerometerStandardDeviationX
*FrequencyBodyAccelerometerStandardDeviationY
*FrequencyBodyAccelerometerStandardDeviationZ
*FrequencyBodyAccelerometerJerkSignalMeanX
*FrequencyBodyAccelerometerJerkSignalMeanY
*FrequencyBodyAccelerometerJerkSignalMeanZ
*FrequencyBodyAccelerometerJerkSignalStandardDeviationX
*FrequencyBodyAccelerometerJerkSignalStandardDeviationY
*FrequencyBodyAccelerometerJerkSignalStandardDeviationZ
*FrequencyBodyGyroscopeMeanX
*FrequencyBodyGyroscopeMeanY
*FrequencyBodyGyroscopeMeanZ
*FrequencyBodyGyroscopeStandardDeviationX
*FrequencyBodyGyroscopeStandardDeviationY
*FrequencyBodyGyroscopeStandardDeviationZ
*FrequencyBodyAccelerometerMagnitudeMean
*FrequencyBodyAccelerometerMagnitudeStandardDeviation
*FrequencyBodyBodyAccelerometerJerkSignalMagnitudeMean
*FrequencyBodyBodyAccelerometerJerkSignalMagnitudeStandardDeviation
*FrequencyBodyBodyGyroscopeMagnitudeMean
*FrequencyBodyBodyGyroscopeMagnitudeStandardDeviation
*FrequencyBodyBodyGyroscopeJerkSignalMagnitudeMean
*FrequencyBodyBodyGyroscopeJerkSignalMagnitudeStandardDeviation


Describing the raw data:
=============================

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

This data is based on the work of   Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The work performed to clean up the raw data and to obtain a tidy data set:
======================================================

Step 1: I open R 3.3.2 and start at the R prompt by setting my working directory to my desktop where I create a new directory called "data" if it doesn't already exist.
```
	> setwd("C:/Users/FATIMA-ZAHRA/desktop")
	> if(!file.exists("data")) { dir.create("data") }
	> setwd("./data")
```

Step 2: I create a new R script called [run_analysis.R](https://github.com/fatimazahrajaafari/GettingCleaningDataProject/blob/master/run_analysis.R) that does the following instructions:
	1. Merges the training and the test sets to create one data set.
	2. Extracts only the measurements on the mean and standard deviation for each measurement.
	3. Uses descriptive activity names to name the activities in the data set
	4. Appropriately labels the data set with descriptive variable names.
	5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Step 3: I source my R script at the R prompt in the R window, then I call the function I defined in this R script
```
	> source("run_analysis.R")
	> MyFct( )
```

After calling MyFct( ), a .txt file called [TidyData.txt](https://github.com/fatimazahrajaafari/GettingCleaningDataProject/blob/master/TidyData.txt) appears in my working directory containing the average of each variable for each activity and each subject.
In the tidy data set, each column corresponds to one variable.
The first three columns correspond respectively to "ActivityLabels", "ActivityNames", and "SubjectId"; then the other columns contain the average of each variable for each activity and each subject as required in the instructions.