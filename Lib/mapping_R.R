# Load the readxl package
library(readxl)
library(dplyr)
library(haven)
###################### You can change this section############################
xlsx_file <- "./AES_VALUE_MAPPING_DEMS.xlsx"    # path to excel file

file_path <- 'mapping_dems.sps'                 #output path
root_dir <- './data/'
file_list <- c('aes01.sav',
               'aes04.sav',
               'aes87.sav',
               'aes90.sav',
               'aes93.sav',
               'aes96.sav',
               'aes98.sav',
               'aes07.sav',
               'aes10.sav',
               'aes13.sav',
               'aes16.sav',
               'aes19_unrestricted.sav',
               'aes22_unrestricted_v2.sav')

########################################################################
sheet_names <- excel_sheets(xlsx_file)  
spss_filepath <- paste0(root_dir,file_list)
spss_data_list <- list()
# Loop through the SPSS files, read them, and store them in the list


for (file in spss_filepath) {
  # Extract the filename without the path and extension
  
  file_name <- tools::file_path_sans_ext(basename(file))
  file_name <- str_sub(file_name,1,5)
  # Read the SPSS file using haven::read_sav
  spss_data <- haven::read_sav(file)
  
  # Store the data frame in the list with its filename as a named element
  spss_data_list[[file_name]] <- spss_data
}


did_not_hormo <-'the following variable label is not processed, May because doesnt detect keywords "Target name":   \n'    
file_name <- tools::file_path_sans_ext(basename(spss_filepath))

for (i in 1:length(sheet_names)){
  
  sheet <- sheet_names[i]
  cat(sheet,'\n')
  df <- read_excel(xlsx_file,sheet =sheet)
  first_row <- which(df$Name == 'Target name')
  if (identical(first_row,integer(0)) ){
    did_not_hormo <- paste0(did_not_hormo,sheet,', ')
    did_not_hormo_posi <- c(did_not_hormo_posi, which(sheet_names%in%  sheet ))
    next
    
  }
  
  variable_name_tar <- df$Name[1]
  variable_label_tar <- df$Name[3]
  df <- df[first_row:nrow(df),]
  df <- df %>% select_if(~!all(is.na(.)))
  # end_row <- which(is.na(df$Name))
  # df <- df[1:end_row[1]-1,]
  # end_row <- nrow(df)
  # df <- df[1:end_row[1],]
  
  
  file_data_name <- unname(unlist(df[1,]))[c(-1,-2)]
  file_data_name <- str_sub(file_data_name,1,5)
  var_name <- unname(unlist(df[2,]))[c(-1,-2)]
  value_labels <- unname(unlist(df[,1]))[c(-1,-2)]
  tar_value <- unname(unlist(df[,2]))[c(-1,-2)]
  
  if (variable_name_tar!=sheet){
    cat('there is wrong sheet name or target name in table')
    
  }
  
  
  for (j in 1:length(file_name)) {
    
    # spss_syntax <- paste0(spss_syntax,'DATASET ACTIVATE ',file_name[j],'.\n')
    # spss_syntax <- paste0(spss_syntax,'VARIABLE LABELS ',var_name[j],' "',variable_label,'".\n')
    
    
    
    data_proc <- spss_data_list[[file_name[j]]][[var_name[j]]]
    
    posi_from_value <- match(from_values,labelled::val_labels(t))
    posi_from_value <- posi_from_value[!is.na(posi_from_value)]
    labelled::val_labels(t)[posi_from_value] <- to_values
    
    update_values()
    
    
    
    spss_syntax <- paste0(spss_syntax,'Recode ',var_name[j],' ')
    values_unharmo  <- unname(unlist(df[,j+2]))[c(-1,-2)]
    
    
    for (e in 1:length(tar_value)) {
      if (!is.na(values_unharmo[e])){
        spss_syntax <- paste0(spss_syntax,'(',values_unharmo[e],' = ',tar_value[e],') ')
      }
      
      
    }
    
    tar_value_labels <- character(0)
    names(tar_value) <- value_labels
    uni_tar_value<- unique(tar_value)
    
    for (e in 1:length(uni_tar_value)) {
      
      real_value <- uni_tar_value[e]
      real_labels <- names(which(tar_value==real_value))[1]
      if (!is.na(real_value)){
        tar_value_labels <- paste0(tar_value_labels,'\n',real_value," '",real_labels,"'")
      }
      
      
    }
    
    spss_syntax <- paste0(spss_syntax,' (ELSE = COPY).\n')
    
    
    # rename the var name
    spss_syntax <- paste0(spss_syntax,'VALUE LABELS ',var_name[j])
    spss_syntax <- paste0(spss_syntax,tar_value_labels,'.\nEXECUTE.\n')
    # spss_syntax <- paste0(spss_syntax,'\n\n\n')
    spss_syntax <- paste0(spss_syntax,'RENAME VARIABLES (',var_name[j],' = ',sheet,').\n\n')
    
    
    
    # regenerate the vlaue label
    
    
    
    
    
  }
  
  
}





##############################################################







for (i in 1:length(sheet_names)){
  # for (i in 1:which(sheet_names==test_variable)){
  # for (i in which(sheet_names==test_variable)){
  # for (i in 22){
  # sheet <- 'elcnwsp'
  sheet <- sheet_names[i]
  cat(sheet,'\n')
  
  df <- read_excel(xlsx_file,sheet =sheet)
  first_row <- which(df$Name == 'Target name')
  if (identical(first_row,integer(0)) ){
    did_not_hormo <- paste0(did_not_hormo,sheet,', ')
    did_not_hormo_posi <- c(did_not_hormo_posi, which(sheet_names%in%  sheet ))
    next
    
  }
  
  variable_name <- df$Name[1]
  variable_label <- df$Name[3]
  df <- df[first_row:nrow(df),]
  # end_row <- which(is.na(df$Name))
  # df <- df[1:end_row[1]-1,]
  # end_row <- nrow(df)
  # df <- df[1:end_row[1],]
  
  
  file_name <- unname(unlist(df[1,]))[c(-1,-2)]
  var_name <- unname(unlist(df[2,]))[c(-1,-2)]
  value_labels <- unname(unlist(df[,1]))[c(-1,-2)]
  tar_value <- unname(unlist(df[,2]))[c(-1,-2)]
  
  
  for (j in 1:length(file_name)) {
    
    spss_syntax <- paste0(spss_syntax,'DATASET ACTIVATE ',file_name[j],'.\n')
    spss_syntax <- paste0(spss_syntax,'VARIABLE LABELS ',var_name[j],' "',variable_label,'".\n')
    
    spss_syntax <- paste0(spss_syntax,'Recode ',var_name[j],' ')
    values_unharmo  <- unname(unlist(df[,j+2]))[c(-1,-2)]
    
    
    for (e in 1:length(tar_value)) {
      if (!is.na(values_unharmo[e])){
        spss_syntax <- paste0(spss_syntax,'(',values_unharmo[e],' = ',tar_value[e],') ')
      }
      
      
    }
    
    tar_value_labels <- character(0)
    names(tar_value) <- value_labels
    uni_tar_value<- unique(tar_value)
    
    for (e in 1:length(uni_tar_value)) {
      
      real_value <- uni_tar_value[e]
      real_labels <- names(which(tar_value==real_value))[1]
      if (!is.na(real_value)){
        tar_value_labels <- paste0(tar_value_labels,'\n',real_value," '",real_labels,"'")
      }
      
      
    }
    
    spss_syntax <- paste0(spss_syntax,' (ELSE = COPY).\n')
    
    
    # rename the var name
    spss_syntax <- paste0(spss_syntax,'VALUE LABELS ',var_name[j])
    spss_syntax <- paste0(spss_syntax,tar_value_labels,'.\nEXECUTE.\n')
    # spss_syntax <- paste0(spss_syntax,'\n\n\n')
    spss_syntax <- paste0(spss_syntax,'RENAME VARIABLES (',var_name[j],' = ',sheet,').\n\n')
    
    
    
    # regenerate the vlaue label
    
    
    
    
    
  }
  
  
}





file_list <- c('aes01_datafile','aes04_datafile',
               'aes87_datafile',
               'aes90_datafile',
               'aes93_datafile',
               'aes96_datafile',
               'aes98_datafile',
               'aes07_datafile',
               'aes10_datafile',
               'aes13_datafile',
               'aes16_datafile',
               'aes19_unrestricted',
               'aes22_unrestricted_v2')


for (j in 1:length(file_list)) {
  
  spss_syntax <- paste0(spss_syntax,'DATASET ACTIVATE ',file_list[j],'.\n')
  
  spss_syntax <- paste0(spss_syntax,"SAVE OUTFILE='",strsplit(file_list[j],"_")[[1]][1],"_harmonized.sav'.\n\n")
  
  
}




keep_var <- sheet_names[-did_not_hormo_posi]
for (j in 1:length(file_list)) {
  
  data_t <- read_sav(paste0('./data/',unlist(strsplit(file_list[j],'_'))[1],'_harmonized.sav'))
  keep_v <- names(data_t)[which(names(data_t)%in%keep_var)]
  spss_syntax <- paste0(spss_syntax,'DATASET ACTIVATE ',file_list[j],'.\n')
  
  spss_syntax <- paste0(spss_syntax,'MATCH FILES\nFILE = *\n/keep\n')
  
  for (variable in 1:length(keep_v)) {
    spss_syntax <-paste0(spss_syntax,keep_v[variable],'\n')
  }
  spss_syntax <-paste0(spss_syntax,'.\n')
  
  spss_syntax <- paste0(spss_syntax,"SAVE OUTFILE='",strsplit(file_list[j],"_")[[1]][1],"_harmonized.sav'.\n\n")
  
  
}



writeLines(spss_syntax, file_path)

