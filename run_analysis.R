run_analysis <- function() {
  
  ## Import dplyr package
  require(dplyr);
  
  ## Read and merge datasets
  raw_data_test <- read.table("dataset/test/X_test.txt");
  
  raw_data_train <- read.table("dataset/train/X_train.txt");
    
  merged_data <- rbind(raw_data_test,raw_data_train);
  
  merged_df <-tbl_df(merged_data);
  
  ## Read activities and subjects
  activity_labels <- read.table("dataset/activity_labels.txt");
  act_labels_vector <- as.vector(activity_labels[,2]);
    
  raw_y_test <- read.table("dataset/test/y_test.txt");
  raw_y_train <- read.table("dataset/train/y_train.txt");
  
  raw_subj_test <- read.table("dataset/test/subject_test.txt");
  raw_subj_train <- read.table("dataset/train/subject_train.txt");
  
  merged_subj_data <- rbind(raw_subj_test,raw_subj_train);
  
  ## Replace coded values
  raw_y_test <- replaceValuesUsingLookup(as.vector(raw_y_test),act_labels_vector);
  raw_y_train <- replaceValuesUsingLookup(as.vector(raw_y_train),act_labels_vector);
  
  merged_y_data <- rbind(raw_y_test,raw_y_train);
  
  ## Read features
  
  features <- read.table("dataset/features.txt");
  
  features <- t(features[,2]);
  
  features_vector <- as.vector(features);
  
  ## Add column headers
  
  features_mean <- grep("mean\\(\\)",features_vector, perl=TRUE, value=TRUE)
  features_std <- grep("std()",features_vector,perl=TRUE,value=TRUE);
  
  features_vector_trimmed <- c(features_mean,features_std);

  ## Assign labels
  colnames(merged_df) <- features_vector;
  
  ## Remove unnecessary columns
  colNums <- match(features_vector_trimmed,names(merged_df));

  trimmed_df <- select(merged_df,colNums);
  
  ## Give better labels 
  renamed_vars <- relabelVariables(names(trimmed_df));
  View(renamed_vars);
  colnames(trimmed_df) <- renamed_vars;
  
  colnames(merged_y_data) <- c("activity");
  colnames(merged_subj_data) <- c("subject");
  
  # Bind activities and subjects to dataset
  trimmed_df <- cbind(merged_y_data,trimmed_df);
  trimmed_df <- cbind(merged_subj_data,trimmed_df);
  
  summarised_data <- '';
  
  for(subject in 1:30){
    
    for(act in 1:length(act_labels_vector)){
    
      df_temp <- filter(trimmed_df, subject == subject, activity == act_labels_vector[act]);
      
      df_for_summary <- select(df_temp,-subject,-activity);
        
      summary_var_col <- colMeans(df_for_summary);
      
      summary_var_col <- t(summary_var_col);
      
      summary_var_col <- cbind(subject,act_labels_vector[act],summary_var_col);
      
      summarised_data <- rbind(summarised_data,summary_var_col);
    }
  }
  
  colnames(summarised_data)[2] <- 'activity';
  
  summarised_data <- summarised_data[-1,];
  
  result <- data.frame(summarised_data,row.names=NULL);
  
  View(result);
  
  write.table(result,file = "tidy_data.txt",quote=FALSE,sep=" ",row.names = FALSE)
  
}

replaceValuesUsingLookup <- function(d_frame,lookup_vector){
    for(i in 1:length(d_frame)){
      d_frame[i]$V1 <- lookup_vector[d_frame[i]$V1];
    }  
    
    return(d_frame);
}

relabelVariables <- function(var_vector){
  
  for(i in 1:length(var_vector)){
    var_vector[i] <- as.character(gsub("[[:punct:]]","",var_vector[i]));
    var_vector[i] <- as.character(gsub("mean","Mean",var_vector[i]));
    var_vector[i] <- as.character(gsub("std","StdDev",var_vector[i]));
    var_vector[i] <- as.character(gsub("BodyBody","Body",var_vector[i]));
    
    var_vector[i] <- sub("^f","freq",var_vector[i],perl=TRUE);
    var_vector[i] <- sub("^t","time",var_vector[i],perl=TRUE);
  }
  
  return(as.vector(var_vector));
}