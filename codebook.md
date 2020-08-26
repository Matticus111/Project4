# Codebook 

The run_analysis.r script takes the UCI HAR Dataset and performs data preperation to create a tidy dataset. 

### 1. download the dataset

  The UCI HAR Dataset is downloaded to the project 4 folder. 
  
### 2. Assigning files to objects
  
  The UCI HAR Dataset training files and testing files are assigned to objects. Also, the variable names and activity labels are assigned to objects
  
### 3. Merging objects
  
  The x datasets and the y datasets are respectively merged. As is the subtraining and subtesting objects.
  
### 4. Extracting 
  
  The mean and standard deviation for each measurement is extracted
  
### 5. Labels 
  
  Label objects are assigned to the merged objects
  
### 6. Tidy Data
  
  The independent tidy data set with the averages of each activity and each subject is created. 
