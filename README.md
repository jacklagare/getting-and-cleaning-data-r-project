## Readme ##

***

#### Package Contents ####


***


```
.
+-- run_analysis.R
+-- CodeBook.md
+-- ReadMe.md
+-- dataset
    | activity_labels.txt
    | features_info.txt
    | features.txt
    | README.txt
    | +-- test
      | +-- Inertial Signals
        | body_acc_x_test.txt
        | body_acc_y_test.txt
        | body_acc_z_test.txt
        | body_gyro_x_test.txt
        | body_gyro_y_test.txt
        | body_gyro_z_test.txt
        | total_acc_x_test.txt
        | total_acc_y_test.txt
        | total_acc_z_test.txt
      | subject_test.txt
      | X_test.txt
      | y_test.txt
   | +-- train
     | +-- Inertial Signals
        | body_acc_x_train.txt
        | body_acc_y_train.txt
        | body_acc_z_train.txt
        | body_gyro_x_train.txt
        | body_gyro_y_train.txt
        | body_gyro_z_train.txt
        | total_acc_x_train.txt
        | total_acc_y_train.txt
        | total_acc_z_train.txt
      | subject_train.txt
      | X_train.txt
```
The descriptions below do not include the files included in the dataset provided.

|           File                  |          Description         |
|-----------------------------|-------------------|
| run_analysis.R              | The R script whose function is to get and clean the     dataset provided.                  |
| CodeBook.md                 | Description of the data analysis process and the variables included.                  |
| ReadMe.md                   | Provides a guide on how to run the script and the description input/output files.                  |


#### Running the Script ####


***
To run the analysis script, you need to have the R Console or RStudio open.

1. Unzip dataset into directory. Rename folder to **dataset**.

2. Set the working directory to the current directory: setwd("path_to_current_dir");

3. Load the source file: source("run_analysis.R");

4. Execute the run_analysis function: run_analysis();

5. If the script runs successfully, a file called ***tidy_data.txt*** will be generated. This is the tidy data set output of the analysis.


**For more information regarding the data analysis process, see the code book.**