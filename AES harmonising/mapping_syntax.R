# Load the readxl package
library(readxl)
library(dplyr)
###################### You can change this section############################
xlsx_file <- "./AES_VALUE_MAPPING_DEMS.xlsx"    # path to excel file

file_path <- 'mapping_dems.sps'                 #output path
########################################################################



sheet_names <- excel_sheets(xlsx_file)  
# test_variable <- 'mocob' #
# spss_syntax <- "cd 'Z:/assda/publish/ANU/Archivists/RyanPerry/02. OTHER PROJECTS/Anzlead value mapping/data/'.   # only for ez copy
spss_syntax <- "cd 'C:/Users/wj1671/proj/anzlead/data/'.
GET FILE='aes01.sav'.
DATASET NAME aes01_datafile WINDOW=FRONT.

GET FILE='aes04.sav'.
DATASET NAME aes04_datafile WINDOW=FRONT.

GET FILE='aes87.sav'.
DATASET NAME aes87_datafile WINDOW=FRONT.

GET FILE='aes90.sav'.
DATASET NAME aes90_datafile WINDOW=FRONT.

GET FILE='aes93.sav'.
DATASET NAME aes93_datafile WINDOW=FRONT.

GET FILE='aes96.sav'.
DATASET NAME aes96_datafile WINDOW=FRONT.

GET FILE='aes98.sav'.
DATASET NAME aes98_datafile WINDOW=FRONT.

GET FILE='aes07.sav'.
DATASET NAME aes07_datafile WINDOW=FRONT.

GET FILE='aes10.sav'.
DATASET NAME aes10_datafile WINDOW=FRONT.

GET FILE='aes13.sav'.
DATASET NAME aes13_datafile WINDOW=FRONT.

GET FILE='aes16.sav'.
DATASET NAME aes16_datafile WINDOW=FRONT.

GET FILE='aes19_unrestricted.sav'.
DATASET NAME aes19_unrestricted WINDOW=FRONT.

GET FILE='aes22_unrestricted_v2.sav'.
DATASET NAME aes22_unrestricted_v2 WINDOW=FRONT.

"

did_not_hormo <-'the following variable label is not processed, May because doesnt detect keywords "Target name":   '    
did_not_hormo_posi <- c()

var_keep_list <- c()

for (i in 1:length(sheet_names)){
# for (i in 1:which(sheet_names==test_variable)){
# for (i in which(sheet_names=='faptid14')){
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
  df <- df %>% select_if(~!all(is.na(.)))
  # end_row <- which(is.na(df$Name))
  # df <- df[1:end_row[1]-1,]
  # end_row <- nrow(df)
  # df <- df[1:end_row[1],]
  
  
  file_name <- unname(unlist(df[1,]))[c(-1,-2)]
  var_name <- unname(unlist(df[2,]))[c(-1,-2)]
  value_labels <- unname(unlist(df[,1]))[c(-1,-2)]
  tar_value <- unname(unlist(df[,2]))[c(-1,-2)]
  
  
  for (j in 1:length(file_name)) {
    var_keep_list[[file_name[j]]] <- c(var_keep_list[[file_name[j]]] ,sheet)
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






# keep_var <- sheet_names[-did_not_hormo_posi]
for (j in 1:length(file_list)) {

  spss_syntax <- paste0(spss_syntax,'DATASET ACTIVATE ',file_list[j],'.\n')

  spss_syntax <- paste0(spss_syntax,'MATCH FILES\nFILE = *\n/keep\n')
  keep_var <- var_keep_list[[file_list[j] ]]
  for (variable in 1:length(keep_var)) {
    spss_syntax <-paste0(spss_syntax,keep_var[variable],'\n')
  }
  spss_syntax <-paste0(spss_syntax,'.\n')

  spss_syntax <- paste0(spss_syntax,"SAVE OUTFILE='",strsplit(file_list[j],"_")[[1]][1],"_harmonized.sav'.\n\n")


}



writeLines(spss_syntax, file_path)

