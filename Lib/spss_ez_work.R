library(haven);        # To read .SAV data 
library(labelled);     # To extarct information from the data
library(flextable);    # To create tables with merged rows for designated columns
library(stringr)
# library(officer);      # To incorporate some of the microsoft 
source("C:/Users/wj1671/proj/ADA-R-Lib-test/Lib/DPtool.R")

data <- read_sav('Z:\\assda\\publish\\ANU\\Archivists\\Weifan\\ANUpoll data\\ANUPoll January 2023\\processing\\p100122_archive.sav')
# data_new <- read_sav('../../SRC2781M_20230216_deidentified.sav')
# data_old <- read_sav('../data/SRC2781M_20230306_deidentified.sav')
# data_ori <- read_sav('./GEN school data 22-12-20.sav')

spss_value_labels <- function(var){
  cat(var_label(var),'\n')
  posi <- which(sapply(names(data), function(x) grepl(x, var_label(var))))
  Line_1 <- paste0('ADD VALUE LABELS ',names(posi)) %>% 
    paste0('\n')
  cat(Line_1)
  vals<- val_labels(var)
  # print(vals)
  for (i in 1:(length(vals)-1)){
    Lines <- paste0(vals[i],' "') %>%
      paste0(names(vals)[i]) %>%
      paste0('"\n')
    
    cat(Lines)
  }
  Lines <- paste0(vals[i+1],' "') %>%
    paste0(names(vals)[i+1]) %>%
    paste0('".\n') %>%
    paste0('EXECUTE.\n')
  cat(Lines)
}

variable_labels <- function(data,var_list,substring_to_insert=F,idx=F){
  #print spss code
  
  ###add execption for idx and  substring
  
  line <- ''
  for (i in 1:length(var_list)){
    if (idx!=F){
      if (idx==1){
        new_var_label <- paste0(substring_to_insert,var_label(data[[var_list[i]]]))
        
      }else if(idx==-1){
        new_var_label <- paste0(var_label(data[[var_list[i]]]),substring_to_insert)
      }
      else{
        new_var_label <- paste0(substr(var_label(data[[var_list[i]]]), 1, insert_index - 1),
                       substring_to_insert,
                       substr(original_string, insert_index))
      }
    line <- ''
    line <- paste0(line,'VARIABLE LABELS ') %>% 
            paste0(var_list[i]) %>% 
            paste0(' "') %>% 
            paste0(new_var_label) %>% 
            paste0('".\n') 

      
    }
    
    cat(line)
    
  }
  
}
var_list <- find_substring_var_label(data,substring = 'DUM',print = F)

variable_labels(data,var_list, " (Restricted variable)",-1 )

find_var_names_by_keyword(data = data,value_name = 'F1b')

spss_value_labels(data$A6)
spss_value_labels(data$FINADVICE)

###############  find unis
paste(names(data)[which(grepl('SC5_',names(data)))],collapse = ', ')
###############

#####
data$RTOVET1[which(data$RTOVET!=1)]
#####
data$STREAM2[which(data$STREAMB!=3)]








#### If answer was 'We have one or more specific career guidance 
#counsellors employed at school' at question '[CAREERADVICE]
data$CGCFTE[which(data$CAREERADVICE!=3 )] #string

which(data$CAREERADVICE!=3 )
which(data$CGCFTE!='' )

#####
data$MENTORG[which(data$MENTORPROG!=3 & data$MENTORPROG!=2)]

#########MENTPURP 
data$MENTPURP[which(data$MENTORPROG!=3 & data$MENTORPROG!=2)]
which(data$MENTORPROG!=3 & data$MENTORPROG!=2)
which(data$MENTPURP=='')


######################################################
data$GOALS1A[data$ResponseID==5]

data_ori$WhatarethemaingoalsofthefirstprogramIncreasingaspirationforhighe[data_ori$ResponseID==5]
