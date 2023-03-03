conbine_4 <- function(data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string){
#  "This function is used for converting the spss code AGGREGATE
# /OUTFILE=* MODE=ADDVARIABLES
# /BREAK=uniques4"
#  
#  Return a table with conbinnation of the four IPII, and its frequencies, and flag indicator k3_4
# 
#   @param: Data_k_norm, a empty table <-c().
#           p_gender_string,p_education_string,p_age_group2_string,p_state_string: Vectors that sliced from spss data, corresponding, gender, education, age group, and state
#  
  number_occ_4 <- reshape2::melt(table(p_gender_string,p_education_string,p_age_group2_string,p_state_string))
  number_occ_4[which(number_occ_4$p_gender_string=="*" & number_occ_4$p_education_string=="1"& number_occ_4$p_age_group2_string=="1"& number_occ_4$p_state_string=="2"),]
  number_occ_4 <- number_occ_4[which(!number_occ_4$value==0),]
  k3_4 <- rep(0,nrow(number_occ_4))
  
  #cat("\n")
  #cat("\n")
  #cat("processing uniques 4 \n")
  k3_4[which(number_occ_4$value<3)] <- 1
  #cat("the number of 1 in the number_occ_4 is ",length(which(k3_4==1)),'\n')
  k3_4[which(number_occ_4$p_gender_string=="*")] <- 0
  #cat("If one of the gender is unknow or missing, then the data is not that risk? remove the correlated data, the number of 1 in the number_occ_4 is ",length(which(k3_4==1)),'\n')
  k3_4[which(number_occ_4$p_state_string=="*")] <- 0
  #cat("If one of the p_state_string is unknow or missing,  the number of 1 in the number_occ_4 is ",length(which(k3_4==1)),'\n')
  k3_4[which(number_occ_4$p_age_group2_string=="*")] <- 0
  #cat("If one of the p_age_group2_string is unknow or missing, the number of 1 in the number_occ_4 is ",length(which(k3_4==1)),'\n')
  k3_4[which(number_occ_4$p_education_string=="*")] <- 0
  #cat("If one of the p_education_string is unknow or missing,  the number of 1 in the number_occ_4 is ",length(which(k3_4==1)),'\n')
  #cat("\n")
  #cat("\n")
  colnames(number_occ_4)[ncol(number_occ_4)] <- 'number_occ_4'
  data_k_norm <- cbind(number_occ_4,k3_4) 
  
  data_k_norm$uniques4 <- paste0(data_k_norm$p_gender_string,data_k_norm$p_education_string,data_k_norm$p_age_group2_string,data_k_norm$p_state_string)
  return(data_k_norm)
  
}

combine_3a <- function(data_k_norm,p_gender_string, p_education_string, p_age_group2_string){
  # The function is used for analyse gender, education, and age group variables.
  # 
  # Returns
  # 
  
  number_occ_3a_gea_without_state <- reshape2::melt(table(p_gender_string, p_education_string, p_age_group2_string))
  number_occ_3a_gea_without_state <- number_occ_3a_gea_without_state[which(!number_occ_3a_gea_without_state$value==0),]
  k3_3a <- rep(0,nrow(number_occ_3a_gea_without_state))
  
  #cat("processing uniques 3a: gender eduction age conbination:\n")
  k3_3a[which(number_occ_3a_gea_without_state$value<3)] <- 1
  #cat("the number of 1 in the number_occ_3a_gea_without_state is ",length(which(k3_3a==1)),'\n')
  k3_3a[which(number_occ_3a_gea_without_state$p_gender_string=="*")] <- 0
  #cat("If one of the *gender* is unknow or missing, then the data is not that risk? remove the correlated data, the number of low frequency risk of gender education age conbination remains ",length(which(k3_3a==1)),'\n')
  k3_3a[which(number_occ_3a_gea_without_state$p_age_group2_string=="*")] <- 0
  #cat("If one of the *age* is unknow or missing, the number of low frequency risk of gender education age conbination remains ",length(which(k3_3a==1)),'\n')
  k3_3a[which(number_occ_3a_gea_without_state$p_education_string=="*")] <- 0
  #cat("If one of the *education* is unknow or missing,  the number of low frequency risk of gender education age conbination remains ",length(which(k3_3a==1)),'\n')
  if (length(which(k3_3a==1))==0){
    #cat('the triplets of gender education and age has no frequencies less than 3, with no missing data')  
  }
  
  colnames(number_occ_3a_gea_without_state)[ncol(number_occ_3a_gea_without_state)] <- "number_occ_3a_gea_without_state"
  a <- cbind(number_occ_3a_gea_without_state,k3_3a)
  data_k_norm<- merge(data_k_norm,a,by=c("p_gender_string","p_education_string","p_age_group2_string")) 
  
  return(data_k_norm)
  
}

combine_3b <- function(data_k_norm,p_gender_string, p_education_string, p_state_string){
  #cat("processing uniques 3b Gender education state conbination\n")
  number_occ_3b_ges_without_age <- reshape2::melt(table(p_gender_string, p_education_string, p_state_string))
  number_occ_3b_ges_without_age <- number_occ_3b_ges_without_age[which(!number_occ_3b_ges_without_age$value==0),]
  k3_3b <- rep(0,nrow(number_occ_3b_ges_without_age))
  k3_3b[which(number_occ_3b_ges_without_age$value<3)] <- 1
  #cat("the number of low frequency (<3) of Gender education state conbination is ",length(which(k3_3b==1)),'\n')
  k3_3b[which(number_occ_3b_ges_without_age$p_gender_string=="*")] <- 0
  #cat("If one of the *gender* is unknow or missing, remove the correlated data, the number of risk Gender education state conbination is  ",length(which(k3_3b==1)),'\n')
  
  k3_3b[which(number_occ_3b_ges_without_age$p_state_string=="*")] <- 0
  #cat("If one of the *state* is unknow or missing, the number of risk Gender education state conbination remaining  ",length(which(k3_3b==1)),'\n')
  k3_3b[which(number_occ_3b_ges_without_age$p_education_string=="*")] <- 0
  #cat("If one of the *education* is unknow or missing,  the number of risk Gender education state conbination remaining  ",length(which(k3_3b==1)),'\n')
  if (length(which(k3_3b==1))==0){
    #cat('the triplets of (Gender education state) has no frequencies less than 3, with no missing data')  
  }
  #cat("\n")
  #cat("\n")
  
  colnames(number_occ_3b_ges_without_age)[ncol(number_occ_3b_ges_without_age)] <- "number_occ_3b_ges_without_age"
  a <- cbind(number_occ_3b_ges_without_age,k3_3b)
  data_k_norm<- merge(data_k_norm,a,by=c("p_gender_string","p_education_string","p_state_string")) 
  return(data_k_norm)
  
}
combine_3c <- function(data_k_norm,p_gender_string, p_age_group2_string, p_state_string){
  
  #cat("\n")
  #cat("\n")
  #cat("###################################################################################\n")
  #cat("processing uniques 3c gender, age, state conbination\n")
  number_occ_3c_gas_without_education <- reshape2::melt(table(p_gender_string, p_age_group2_string, p_state_string))
  number_occ_3c_gas_without_education <- number_occ_3c_gas_without_education[which(!number_occ_3c_gas_without_education$value==0),]
  k3_3c <- rep(0,nrow(number_occ_3c_gas_without_education))
  
  k3_3c[which(number_occ_3c_gas_without_education$value<3)] <- 1
  #cat("the number of low frequency (<3) of Gender age state conbination is ",length(which(k3_3c==1)),'\n')
  
  k3_3c[which(number_occ_3c_gas_without_education$p_gender_string=="*")] <- 0
  #cat("If one of the *gender* is unknow or missing, remove the correlated data, the number of risk Gender age state conbination is  ",length(which(k3_3c==1)),'\n')
  
  k3_3c[which(number_occ_3c_gas_without_education$p_age_group2_string=="*")] <- 0
  #cat("If one of the *age* is unknow or missing, the number of risk Gender age state conbination remaining  ",length(which(k3_3c==1)),'\n')
  k3_3c[which(number_occ_3c_gas_without_education$p_state_string=="*")] <- 0
  #cat("If one of the *state* is unknow or missing,  the number of risk Gender age state conbination remaining  ",length(which(k3_3c==1)),'\n')
  if (length(which(k3_3c==1))==0){
    #cat('the triplets of Gender age state has no frequencies less than 3')  
  }
  #cat("\n")
  #cat("\n")
  
  colnames(number_occ_3c_gas_without_education)[ncol(number_occ_3c_gas_without_education)] <- "number_occ_3c_gas_without_education"
  a <- cbind(number_occ_3c_gas_without_education,k3_3c)
  data_k_norm<- merge(data_k_norm,a,by=c("p_gender_string","p_age_group2_string","p_state_string")) 
  
  return(data_k_norm)
  
}
combine_3d <- function(data_k_norm,p_education_string, p_age_group2_string, p_state_string){
  #cat("\n")
  #cat("\n")
  #cat("###################################################################################\n")
  #cat("processing uniques 3d education, age, state conbination\n")
  
  number_occ_3d_eas_without_gender <- reshape2::melt(table(p_education_string, p_age_group2_string, p_state_string))
  number_occ_3d_eas_without_gender <- number_occ_3d_eas_without_gender[which(!number_occ_3d_eas_without_gender$value==0),]
  k3_3d <- rep(0,nrow(number_occ_3d_eas_without_gender))
  
  k3_3d[which(number_occ_3d_eas_without_gender$value<3)] <- 1
  #cat("the number of low frequency (<3) of education, age, state  conbination is ",length(which(k3_3d==1)),'\n')
  
  k3_3d[which(number_occ_3d_eas_without_gender$p_education_string=="*")] <- 0
  #cat("If one of the *education* is unknow or missing, remove the correlated data, the number of risk education, age, state  conbination is  ",length(which(k3_3d==1)),'\n')
  
  k3_3d[which(number_occ_3d_eas_without_gender$p_age_group2_string=="*")] <- 0
  #cat("If one of the *age* is unknow or missing, the number of risk education, age, state  conbination remaining  ",length(which(k3_3d==1)),'\n')
  k3_3d[which(number_occ_3d_eas_without_gender$p_state_string=="*")] <- 0
  #cat("If one of the *state* is unknow or missing,  the number of risk education, age, state  conbination remaining  ",length(which(k3_3d==1)),'\n')
  if (length(which(k3_3d==1))==0){
    #cat('the triplets of education, age, state  has no frequencies less than 3, with no missing data')  
  }
  #cat("\n")
  #cat("\n")
  
  colnames(number_occ_3d_eas_without_gender)[ncol(number_occ_3d_eas_without_gender)] <- "number_occ_3d_eas_without_gender"
  a <- cbind(number_occ_3d_eas_without_gender,k3_3d)
  data_k_norm<- merge(data_k_norm,a,by=c("p_education_string","p_age_group2_string","p_state_string")) 
  return(data_k_norm)
  
  
}

anonymizor <- function(p_string,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string) {
  # The function is used for anonymizing LinA panel data, converting from SPSS: 
  # Z:\assda\publish\ANU\Archivists\Weifan\Confidentialisation of LinA data\ryan working syntax for Lowy 2021\Confidentialisation of LinA data_Lowy2021_weifan - Copy.sps
  # 
  #inputs:
  #       @ p_string, the string varibale that you would like to confidentialised
  #       @ data_k_norm that contains 4 conbination and all 3 varibale combinations frequencies table
  #       @p_gender_string,p_education_string,p_age_group2_string,p_state_string, original spss data that'-97'(NA value) has converted into '*'
  # Returns: @p_string_con: a vector that contains a confindentialised input p_string,
  
  
  p_string_con <- p_string
  count <- 0
  for (i in posi){
    
    gen <- data_k_norm$p_gender_string[i]
    age <- data_k_norm$p_age_group2_string[i]
    edu <- data_k_norm$p_education_string[i]
    state <- data_k_norm$p_state_string[i]
    posi_t <- which(p_gender_string==gen & p_age_group2_string==age & p_education_string == edu & p_state_string==state)
    p_string_con[posi_t]='*'
    #cat("\n            ",posi_t," (gender: ",gen,"age: ",age,"education: ",edu,"state: ",state, ") to  NA \n")
    count <- count+length(posi_t)
  }
  
  #cat("\n       total ",count," respondant has been anonymized")
  return (p_string_con)
  
  
}


conf_LinA_short <- function(data, gender_varname, age_varname,education_varname,state_varname,NA_value = -97)
  #"
  #Version 0.1 - updated on 11/11/2022 by Weifan
  #
  #This version is used for confidentalisating Life in Australia only.
  #
  # This function is convered from confidentialisation of LinA lowy 2021 SPSS syntax. SPSS syntax was created by Sebastian and Ryan. 
  # SPSS path: 'Z:\assda\publish\ANU\Archivists\Weifan\Confidentialisation of LinA data\ryan working syntax for Lowy 2021\Confidentialisation of LinA data_Lowy2021_weifan - Copy.sps'
  # params: @data: SPSS .sav data file that read by haven:: read_sav
  #         @gender_varname, age_varname,education_varname,state_varname: Characters vector: the gender age education and state variable name in spss, Example :"p_gender", "banner_gender",'gender_conf'  
  
{
  
  p_gender_string    <- data[[gender_varname]]
  p_age_group2_string  <- data[[age_varname]]  #may recode is needed
  p_education_string   <- data[[education_varname]]   #may recode is needed
  p_state_string <- data[[state_varname]]          #may recode is needed
  
  # 2.2We create a concatenated string variable, system missing values are replaced by asterisks
  
  p_gender_string <- as.character(p_gender_string)
  p_gender_string[which(p_gender_string==as.character(NA_value))] <- '*'
  
  p_state_string <- as.character(p_state_string)
  p_state_string[which(p_state_string==as.character(NA_value))] <- '*'
  
  p_education_string<- as.character(p_education_string)
  p_education_string[which(p_education_string==as.character(NA_value))] <- '*'
  
  p_age_group2_string<- as.character(p_age_group2_string)
  p_age_group2_string[which(p_age_group2_string==as.character(NA_value))] <- '*'
  data_k_norm <- c()
  data_k_norm <-  conbine_4(data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  data_k_norm <-  combine_3a(data_k_norm,p_gender_string, p_education_string, p_age_group2_string)
  data_k_norm <-  combine_3b(data_k_norm,p_gender_string, p_education_string, p_state_string)
  data_k_norm <-  combine_3c(data_k_norm,p_gender_string, p_age_group2_string, p_state_string)
  data_k_norm <-  combine_3d(data_k_norm,p_education_string, p_age_group2_string, p_state_string)
  # print(data_k_norm)
  # STEP #3: Protecting demographic variables by suppressing values (duplicate variables)
  # We purposely suppressed values of selected variables so that those cases end up in cells with higher frequencies
  # (see number_occ variables); REPLACE V1, V2, V3 and V4 variables with the names of demographic variables
  ############################ check for 3a   ######################################################################
  p_state_string_con <- p_state_string
  p_gender_string_con <- p_gender_string
  p_education_string_con <- p_education_string
  p_age_group2_string_con <- p_age_group2_string
  
  
  #cat('\n ################################################################################## \n')
  
  posi <- which(data_k_norm$k3_4==1 & data_k_norm$k3_3a==0 & data_k_norm$k3_3b==0 & data_k_norm$k3_3c==0 & data_k_norm$k3_3d==0 &
                  (data_k_norm$number_occ_3c >= data_k_norm$number_occ_3b) &
                  (data_k_norm$number_occ_3c >= data_k_norm$number_occ_3d) 
  )
  #cat('\n if the conbination of four varibales(*Gender age state education *)is regarded as risk and other three conbinations is not risky,)
  #cat('and the number of combination of (Gender education age,without education)  is larger than other three conbinations \n')
  #cat('there are total number of ',length(posi),' conbanation, whose *education* recording need to be anonymized\n')
  #cat('setting *education* of respondant to NA for following:\n')
  p_education_string_con <- anonymizor(p_education_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  
  ############################# check for 3b   ######################################################################
  #cat('\n ################################################################################## \n')
  
  posi <- which(data_k_norm$k3_4==1 & data_k_norm$k3_3a==0 & data_k_norm$k3_3b==0 & data_k_norm$k3_3c==0 & data_k_norm$k3_3d==0 &
                  (data_k_norm$number_occ_3d > data_k_norm$number_occ_3c) &
                  (data_k_norm$number_occ_3d > data_k_norm$number_occ_3b) 
  )
  #cat('\n if the conbination of four varibales(*Gender age state education *)is regarded as risk and other three conbinations is not risky,)
  #cat('and the number of combination of (Gender education state,without *age*)  is larger than other three conbinations \n')
  
  #cat('there are total number of ',length(posi),' conbanation, whose *education* recording need to be anonymized\n')
  #cat('setting *education* of respondant to NA for following:\n')
  p_gender_string_con <- anonymizor(p_gender_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  
  ############################# check for 3c   ######################################################################
  #cat('\n ################################################################################## \n')
  
  # uniques3a (p_gender_string, p_education_string, p_age_group2_string)
  ##cat("processing uniques 3b Gender education state conbination\n")
  ##cat("processing uniques 3c gender, age, state conbination\n")
  ##cat("processing uniques 3d education, age, state conbination\n")
  
  
  posi <- which(data_k_norm$k3_4==1 & data_k_norm$k3_3a==0 & data_k_norm$k3_3b==0 & data_k_norm$k3_3c==0 & data_k_norm$k3_3d==0 &
                  (data_k_norm$number_occ_3b > data_k_norm$number_occ_3c) &
                  (data_k_norm$number_occ_3b > data_k_norm$number_occ_3c) ########################
  )
  #cat('\n if the conbination of four varibales(*Gender age state education *)is regarded as risk and other three conbinations is not risky,)
  #cat('and the number of combination of (gender, age, state,without education)  is larger than other three conbinations \n')
  
  #cat('there are total number of ',length(posi),' conbanation, whose *age* recording need to be anonymized\n')
  #cat('setting *age* of respondant to NA for following:\n')
  p_age_group2_string_con <- anonymizor(p_age_group2_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  
  ############################# check for 3d>=3c   ######################################################################
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==0 &
                   data_k_norm$k3_3b==1 &
                   data_k_norm$k3_3c==0 &
                   data_k_norm$k3_3d==0 &
                   (data_k_norm$number_occ_3c >= data_k_norm$number_occ_3d)
  )
  # #cat('\n if the conbination of three varibales only (gender, education, age,without *state*) has no risk \n')
  # #cat('there are total number of ',length(posi),' conbanation, whose *state* recording need to be anonymized\n')
  # #cat('setting *state* of respondant to NA for following:\n')
  p_education_string_con <- anonymizor(p_education_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  ############################# check for 3d<3c   ######################################################################
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==0 &
                   data_k_norm$k3_3b==1 &
                   data_k_norm$k3_3c==0 &
                   data_k_norm$k3_3d==0 &
                   (data_k_norm$number_occ_3c < data_k_norm$number_occ_3d)
  )
  # #cat('\n if the conbination of three varibales only (gender, education, age,without *state*) has no risk \n')
  # #cat('there are total number of ',length(posi),' conbanation, whose *state* recording need to be anonymized\n')
  # #cat('setting *state* of respondant to NA for following:\n')
  p_gender_string_con <- anonymizor(p_gender_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  ############################# check for 3b >=  3d   ######################################################################
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==0 &
                   data_k_norm$k3_3b==0 &
                   data_k_norm$k3_3c==1 &
                   data_k_norm$k3_3d==0 &
                   (data_k_norm$number_occ_3b >= data_k_norm$number_occ_3d)
  )
  # #cat('\n if the conbination of three varibales only (gender, education, age,without *state*) has no risk \n')
  # #cat('there are total number of ',length(posi),' conbanation, whose *state* recording need to be anonymized\n')
  # #cat('setting *state* of respondant to NA for following:\n')
  p_age_group2_string_con <- anonymizor(p_age_group2_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  ############################# check for 3d >  3b   ######################################################################
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==0 &
                   data_k_norm$k3_3b==0 &
                   data_k_norm$k3_3c==1 &
                   data_k_norm$k3_3d==0 &
                   (data_k_norm$number_occ_3d > data_k_norm$number_occ_3b)
  )
  p_gender_string_con <- anonymizor(p_gender_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  ############################# check for 3b >= 3c   ######################################################################
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==0&
                   data_k_norm$k3_3b==0 &
                   data_k_norm$k3_3c==0 &
                   data_k_norm$k3_3d==1 &
                   (data_k_norm$number_occ_3b >= data_k_norm$number_occ_3c)
  )
  p_age_group2_string_con <- anonymizor(p_age_group2_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  ############################# check for 3b < 3c   ######################################################################
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==0 &
                   data_k_norm$k3_3b==0 &
                   data_k_norm$k3_3c==0 &
                   data_k_norm$k3_3d==1 &
                   (data_k_norm$number_occ_3b < data_k_norm$number_occ_3c)
  )
  p_education_string_con <- anonymizor(p_education_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  #############################   ######################################################################
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==0 &
                   data_k_norm$k3_3b==0 &
                   data_k_norm$k3_3c==1 &
                   data_k_norm$k3_3d==1 
  )
  p_age_group2_string_con <- anonymizor(p_age_group2_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==0 &
                   data_k_norm$k3_3b==1 &
                   data_k_norm$k3_3c==0 &
                   data_k_norm$k3_3d==1 
  )
  p_education_string_con <- anonymizor(p_education_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)  
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==0 &
                   data_k_norm$k3_3b==1 &
                   data_k_norm$k3_3c==1 &
                   data_k_norm$k3_3d==0 
  )
  p_gender_string_con <- anonymizor(p_gender_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)  
  
  #cat('\n ################################################################################## \n')
  posi <- which(   data_k_norm$k3_3b==1 &
                   data_k_norm$k3_3c==1 &
                   data_k_norm$k3_3d==1 
  )
  p_state_string_con <- anonymizor(p_state_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)  
  ###############################################################################
  
  #  p_gender_string    <- data[[gender_varname]]
  # p_age_group2_string  <- data[[age_varname]]  #may recode is needed
  # p_education_string   <- data[[education_varname]]   #may recode is needed
  # p_state_string <- data[[state_varname]] 
  #cat('\n')
  #cat('\n')
  #cat('\n')
  #cat('\n')
  flag_need_another_iteration <- F
  data_con <- data
  # data_con$p_gender_string <- car::recode( p_gender_string_con ," '*'  -> -97",to.value="->", interval=":",separator=";") %>%
  data_con[[gender_varname]][which(p_gender_string_con=='*')] <- NA_value
  posi_na_ori <- which(p_gender_string=="*")
  posi_na_con <- which(data_con[[gender_varname]]==NA_value)
  diff <- length(posi_na_con)-length(posi_na_ori)
  if (diff!=0){
    flag_need_another_iteration <- T
    
  }
  if (diff==1){
    cat('total gender:        ',diff, ' response was suppressed \n')
  }else{
    cat('total gender:        ',diff, ' responses were suppressed \n')
  }
  
  # #cat("\n the gender NA in original data is ",posi_na_ori)
  # #cat("\n the gender NA in confi data is ",posi_na_con)
  #cat('\n')
  
  
  data_con[[education_varname]][which(p_education_string_con=='*')] <- NA_value
  posi_na_ori <- which(p_education_string=="*")
  posi_na_con <- which(data_con[[education_varname]]==NA_value)
  diff <- length(posi_na_con)-length(posi_na_ori)
  if (diff!=0){
    flag_need_another_iteration <- T
    
  }
  
  # #cat("\n the education NA in original data is ",which(p_education_string=="*"))
  # #cat("\n the education NA in confi data is ",which( data_con[[education_varname]]==NA_value))
  if (diff==1){
    cat('total education:     ',diff, ' response was suppressed \n')

  }else{
    cat('total education:     ',diff, ' responses were suppressed \n')
  }
  
  
  #cat('\n')
  
  data_con[[age_varname]][which(p_age_group2_string_con=='*')] <- NA_value
  posi_na_ori <- which(p_age_group2_string=="*")
  posi_na_con <- which(data_con[[age_varname]]==NA_value)
  diff <- length(posi_na_con)-length(posi_na_ori)
  
  if (diff!=0){
    flag_need_another_iteration <- T
    
  }
  
  if (diff==1){
    cat('total age:           ',diff, ' response was suppressed \n')
    
  }else{
    cat('total age:           ',diff, ' responses were suppressed \n')  
  }
  
  
  # #cat("\n the age NA in original data is ",which(p_age_group2_string=="*"))
  # #cat("\n the age NA in confi data is ",which(data_con[[age_varname]]==NA_value))
  #cat('\n')
  
  data_con[[state_varname]][which(p_state_string_con=='*')] <- NA_value
  posi_na_ori <- which(p_state_string=="*")
  posi_na_con <- which(data_con[[state_varname]]==NA_value)
  diff <- length(posi_na_con)-length(posi_na_ori)
  if (diff!=0){
    flag_need_another_iteration <- T
  }
  if (diff==1){
    cat('total state:         ',diff, ' response was suppressed \n')
    
  }else{
    cat('total state:         ',diff, ' responses were suppressed \n')  
  }
  
  
  # #cat("\n the state NA in original data is ",which(p_state_string=="*"))
  # #cat("\n the state NA in confi data is ",which(data_con[[state_varname]]==NA_value))
  #cat('\n')
  # results <- list('data_confi' = data_con,"flag" = flag_need_another_iteration)
  
  out <- list()
  out$data_con <- data_con
  out$flag <- flag_need_another_iteration
  
  return(out)
  
  
}




conf_LinA <- function(data, gender_varname, age_varname,education_varname,state_varname,NA_value = -97)
  #"
  #Version 0.1 - updated on 11/11/2022 by Weifan
  #
  #This version is used for confidentalisating Life in Australia only.
  #
  # This function is convered from confidentialisation of LinA lowy 2021 SPSS syntax. SPSS syntax was created by Sebastian and Ryan. 
  # SPSS path: 'Z:\assda\publish\ANU\Archivists\Weifan\Confidentialisation of LinA data\ryan working syntax for Lowy 2021\Confidentialisation of LinA data_Lowy2021_weifan - Copy.sps'
  # params: @data: SPSS .sav data file that read by haven:: read_sav
  #         @gender_varname, age_varname,education_varname,state_varname: Characters vector: the gender age education and state variable name in spss, Example :"p_gender", "banner_gender",'gender_conf'  
  
{
  
  p_gender_string    <- data[[gender_varname]]
  p_age_group2_string  <- data[[age_varname]]  #may recode is needed
  p_education_string   <- data[[education_varname]]   #may recode is needed
  p_state_string <- data[[state_varname]]          #may recode is needed
  
  # 2.2We create a concatenated string variable, system missing values are replaced by asterisks
  
  p_gender_string <- as.character(p_gender_string)
  p_gender_string[which(p_gender_string==as.character(NA_value))] <- '*'
  
  p_state_string <- as.character(p_state_string)
  p_state_string[which(p_state_string==as.character(NA_value))] <- '*'
  
  p_education_string<- as.character(p_education_string)
  p_education_string[which(p_education_string==as.character(NA_value))] <- '*'
  
  p_age_group2_string<- as.character(p_age_group2_string)
  p_age_group2_string[which(p_age_group2_string==as.character(NA_value))] <- '*'
  data_k_norm <- c()
  data_k_norm <-  conbine_4(data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  data_k_norm <-  combine_3a(data_k_norm,p_gender_string, p_education_string, p_age_group2_string)
  data_k_norm <-  combine_3b(data_k_norm,p_gender_string, p_education_string, p_state_string)
  data_k_norm <-  combine_3c(data_k_norm,p_gender_string, p_age_group2_string, p_state_string)
  data_k_norm <-  combine_3d(data_k_norm,p_education_string, p_age_group2_string, p_state_string)
  # print(data_k_norm)
  # STEP #3: Protecting demographic variables by suppressing values (duplicate variables)
  # We purposely suppressed values of selected variables so that those cases end up in cells with higher frequencies
  # (see number_occ variables); REPLACE V1, V2, V3 and V4 variables with the names of demographic variables
  ############################ check for 3a   ######################################################################
  p_state_string_con <- p_state_string
  p_gender_string_con <- p_gender_string
  p_education_string_con <- p_education_string
  p_age_group2_string_con <- p_age_group2_string
  
  
  #cat('\n ################################################################################## \n')
  
  posi <- which(data_k_norm$k3_4==1 & data_k_norm$k3_3a==0 & data_k_norm$k3_3b==0 & data_k_norm$k3_3c==0 & data_k_norm$k3_3d==0 &
                  (data_k_norm$number_occ_3a >= data_k_norm$number_occ_3b) &
                  (data_k_norm$number_occ_3a >= data_k_norm$number_occ_3c) &
                  (data_k_norm$number_occ_3a >= data_k_norm$number_occ_3d)
  )
  #cat('\n if the conbination of four varibales(*Gender age state education *)is regarded as risk and other three conbinations is not risky,)
  #cat('and the number of combination of (Gender education age,without education)  is larger than other three conbinations \n')
  #cat('there are total number of ',length(posi),' conbanation, whose *education* recording need to be anonymized\n')
  #cat('setting *education* of respondant to NA for following:\n')
  p_state_string_con <- anonymizor(p_state_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  
  ############################# check for 3b   ######################################################################
  #cat('\n ################################################################################## \n')
  
  posi <- which(data_k_norm$k3_4==1 & data_k_norm$k3_3a==0 & data_k_norm$k3_3b==0 & data_k_norm$k3_3c==0 & data_k_norm$k3_3d==0 &
                  (data_k_norm$number_occ_3b > data_k_norm$number_occ_3a) &
                  (data_k_norm$number_occ_3b > data_k_norm$number_occ_3c) &
                  (data_k_norm$number_occ_3b >= data_k_norm$number_occ_3d)
  )
  #cat('\n if the conbination of four varibales(*Gender age state education *)is regarded as risk and other three conbinations is not risky,)
  #cat('and the number of combination of (Gender education state,without *age*)  is larger than other three conbinations \n')
  
  #cat('there are total number of ',length(posi),' conbanation, whose *education* recording need to be anonymized\n')
  #cat('setting *education* of respondant to NA for following:\n')
  p_education_string_con <- anonymizor(p_education_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  
  ############################# check for 3c   ######################################################################
  #cat('\n ################################################################################## \n')
  
  # uniques3a (p_gender_string, p_education_string, p_age_group2_string)
  ##cat("processing uniques 3b Gender education state conbination\n")
  ##cat("processing uniques 3c gender, age, state conbination\n")
  ##cat("processing uniques 3d education, age, state conbination\n")
  
  
  posi <- which(data_k_norm$k3_4==1 & data_k_norm$k3_3a==0 & data_k_norm$k3_3b==0 & data_k_norm$k3_3c==0 & data_k_norm$k3_3d==0 &
                  (data_k_norm$number_occ_3c > data_k_norm$number_occ_3a) &
                  (data_k_norm$number_occ_3c > data_k_norm$number_occ_3b) &
                  (data_k_norm$number_occ_3c >= data_k_norm$number_occ_3d)
  )
  #cat('\n if the conbination of four varibales(*Gender age state education *)is regarded as risk and other three conbinations is not risky,)
  #cat('and the number of combination of (gender, age, state,without education)  is larger than other three conbinations \n')
  
  #cat('there are total number of ',length(posi),' conbanation, whose *age* recording need to be anonymized\n')
  #cat('setting *age* of respondant to NA for following:\n')
  p_age_group2_string_con <- anonymizor(p_age_group2_string,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  
  ############################# check for 3d   ######################################################################
  #cat('\n ################################################################################## \n')
  
  posi <- which(data_k_norm$k3_4==1 & data_k_norm$k3_3a==0 & data_k_norm$k3_3b==0 & data_k_norm$k3_3c==0 & data_k_norm$k3_3d==0 &
                  (data_k_norm$number_occ_3d > data_k_norm$number_occ_3a) &
                  (data_k_norm$number_occ_3d > data_k_norm$number_occ_3b) &
                  (data_k_norm$number_occ_3d >= data_k_norm$number_occ_3c)
  )
  #cat('\n if the conbination of four varibales(*Gender age state education *)is regarded as risk and other three conbinations is not risky,)
  #cat('and the number of combination of (education, age, state,without *gender*)  is larger than other three conbinations \n')
  
  #cat('there are total number of ',length(posi),' conbanation, whose *gender* recording need to be anonymized\n')
  #cat('setting *gender* of respondant to NA for following:\n')
  p_gender_string_con <- anonymizor(p_gender_string,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  ############################# check for 3d=0   ######################################################################
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==1 & data_k_norm$k3_3b==1 & data_k_norm$k3_3c==1 & data_k_norm$k3_3d==0)
  #cat('\n if the conbination of three varibales only (education, age, state,without *gender*) has no risk \n')
  
  #cat('there are total number of ',length(posi),' conbanation, whose *gender* recording need to be anonymized\n')
  #cat('setting *gender* of respondant to NA for following:\n')
  p_gender_string_con <- anonymizor(p_gender_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  ############################# check for 3c=0   ######################################################################
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==1 & data_k_norm$k3_3b==1 & data_k_norm$k3_3c==0 & data_k_norm$k3_3d==1)
  #cat('\n if the conbination of three varibales only (gender, age, state,without *education*) has no risk \n')
  
  #cat('there are total number of ',length(posi),' conbanation, whose *age* recording need to be anonymized\n')
  #cat('setting *age* of respondant to NA for following:\n')
  p_age_group2_string_con <- anonymizor(p_age_group2_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  
  ############################# check for 3b=0   ######################################################################
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==1 & data_k_norm$k3_3b==0 & data_k_norm$k3_3c==1 & data_k_norm$k3_3d==1)
  #cat('\n if the conbination of three varibales only (gender, education, state,without *age*) has no risk \n')
  
  #cat('there are total number of ',length(posi),' conbanation, whose *education* recording need to be anonymized\n')
  #cat('setting *education* of respondant to NA for following:\n')
  p_education_string_con <- anonymizor(p_education_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  ############################# check for 3a=0   ######################################################################
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==0 & data_k_norm$k3_3b==1 & data_k_norm$k3_3c==1 & data_k_norm$k3_3d==1)
  #cat('\n if the conbination of three varibales only (gender, education, age,without *state*) has no risk \n')
  
  #cat('there are total number of ',length(posi),' conbanation, whose *state* recording need to be anonymized\n')
  #cat('setting *state* of respondant to NA for following:\n')
  p_state_string_con <- anonymizor(p_state_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)########################## reminders
  
  ############################# check for 3d>=3c   ######################################################################
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==1 &
                   data_k_norm$k3_3b==1 &
                   data_k_norm$k3_3c==0 &
                   data_k_norm$k3_3d==0 &
                   (data_k_norm$number_occ_3d >= data_k_norm$number_occ_3c)
  )
  # #cat('\n if the conbination of three varibales only (gender, education, age,without *state*) has no risk \n')
  # #cat('there are total number of ',length(posi),' conbanation, whose *state* recording need to be anonymized\n')
  # #cat('setting *state* of respondant to NA for following:\n')
  p_gender_string_con <- anonymizor(p_gender_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  ############################# check for 3d<3c   ######################################################################
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==1 &
                   data_k_norm$k3_3b==1 &
                   data_k_norm$k3_3c==0 &
                   data_k_norm$k3_3d==0 &
                   (data_k_norm$number_occ_3c < data_k_norm$number_occ_3d)
  )
  # #cat('\n if the conbination of three varibales only (gender, education, age,without *state*) has no risk \n')
  # #cat('there are total number of ',length(posi),' conbanation, whose *state* recording need to be anonymized\n')
  # #cat('setting *state* of respondant to NA for following:\n')
  p_age_group2_string_con <- anonymizor(p_age_group2_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  ############################# check for 3b >=  3d   ######################################################################
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==1 &
                   data_k_norm$k3_3b==0 &
                   data_k_norm$k3_3c==1 &
                   data_k_norm$k3_3d==0 &
                   (data_k_norm$number_occ_3b >= data_k_norm$number_occ_3d)
  )
  # #cat('\n if the conbination of three varibales only (gender, education, age,without *state*) has no risk \n')
  # #cat('there are total number of ',length(posi),' conbanation, whose *state* recording need to be anonymized\n')
  # #cat('setting *state* of respondant to NA for following:\n')
  p_education_string_con <- anonymizor(p_education_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  ############################# check for 3d >  3b   ######################################################################
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==1 &
                   data_k_norm$k3_3b==0 &
                   data_k_norm$k3_3c==1 &
                   data_k_norm$k3_3d==0 &
                   (data_k_norm$number_occ_3d > data_k_norm$number_occ_3b)
  )
  p_gender_string_con <- anonymizor(p_gender_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  ############################# check for 3b >= 3c   ######################################################################
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==1 &
                   data_k_norm$k3_3b==0 &
                   data_k_norm$k3_3c==0 &
                   data_k_norm$k3_3d==1 &
                   (data_k_norm$number_occ_3b >= data_k_norm$number_occ_3c)
  )
  p_education_string_con <- anonymizor(p_education_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  ############################# check for 3b < 3c   ######################################################################
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==1 &
                   data_k_norm$k3_3b==0 &
                   data_k_norm$k3_3c==0 &
                   data_k_norm$k3_3d==1 &
                   (data_k_norm$number_occ_3b < data_k_norm$number_occ_3c)
  )
  p_age_group2_string_con <- anonymizor(p_age_group2_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  ############################# check for 3a >= 3d   ######################################################################
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==0 &
                   data_k_norm$k3_3b==1 &
                   data_k_norm$k3_3c==1 &
                   data_k_norm$k3_3d==0 &
                   (data_k_norm$number_occ_3a >= data_k_norm$number_occ_3d)
  )
  p_state_string_con <- anonymizor(p_state_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  
  ############################# check for 3a < 3d   ######################################################################
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==0 &
                   data_k_norm$k3_3b==1 &
                   data_k_norm$k3_3c==1 &
                   data_k_norm$k3_3d==0 &
                   (data_k_norm$number_occ_3a < data_k_norm$number_occ_3d)
  )
  p_gender_string_con <- anonymizor(p_gender_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  ############################# check for 3a >= 3c   ######################################################################
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==0 &
                   data_k_norm$k3_3b==1 &
                   data_k_norm$k3_3c==0 &
                   data_k_norm$k3_3d==1 &
                   (data_k_norm$number_occ_3a >= data_k_norm$number_occ_3c)
  )
  p_state_string_con <- anonymizor(p_state_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  ############################# check for 3a < 3c   ######################################################################
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==0 &
                   data_k_norm$k3_3b==1 &
                   data_k_norm$k3_3c==0 &
                   data_k_norm$k3_3d==1 &
                   (data_k_norm$number_occ_3a < data_k_norm$number_occ_3c)
  )
  p_age_group2_string_con <- anonymizor(p_age_group2_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  ############################# check for 3a >= 3b   ######################################################################
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==0 &
                   data_k_norm$k3_3b==0 &
                   data_k_norm$k3_3c==1 &
                   data_k_norm$k3_3d==1 &
                   (data_k_norm$number_occ_3a >= data_k_norm$number_occ_3b)
  )
  p_state_string_con <- anonymizor(p_state_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  ############################# check for 3a < 3b   ######################################################################
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==0 &
                   data_k_norm$k3_3b==0 &
                   data_k_norm$k3_3c==1 &
                   data_k_norm$k3_3d==1 &
                   (data_k_norm$number_occ_3a < data_k_norm$number_occ_3b)
  )
  p_education_string_con <- anonymizor(p_education_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  #############################  (number_occ_3b >= number_occ_3c) AND (number_occ_3b >= number_occ_3d)) education_string='*'.###############
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==1 &
                   data_k_norm$k3_3b==0 &
                   data_k_norm$k3_3c==0 &
                   data_k_norm$k3_3d==0 &
                   (data_k_norm$number_occ_3b >= data_k_norm$number_occ_3c)&
                   (data_k_norm$number_occ_3b >= data_k_norm$number_occ_3d)
  )
  p_education_string_con <- anonymizor(p_education_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  
  #############################  (number_occ_3c > number_occ_3b) AND (number_occ_3c > number_occ_3d)) age_string='*'.###############
  #cat('\n ################################################################################## \n')
  ################# this part is different from Linaconf _ updates!!!!!!!!!!!!
  posi <- which( data_k_norm$k3_3a==1 &
                   data_k_norm$k3_3b==0 &
                   data_k_norm$k3_3c==0 &
                   data_k_norm$k3_3d==0 &
                   (data_k_norm$number_occ_3c > data_k_norm$number_occ_3b)&
                   (data_k_norm$number_occ_3c > data_k_norm$number_occ_3d)
  )
  p_age_group2_string_con <- anonymizor(p_age_group2_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  
  #############################  (number_occ_3d > number_occ_3c) AND (number_occ_3d > number_occ_3b)) gender_string='*'. ###############
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==1 &
                   data_k_norm$k3_3b==0 &
                   data_k_norm$k3_3c==0 &
                   data_k_norm$k3_3d==0 &
                   (data_k_norm$number_occ_3d > data_k_norm$number_occ_3c)&
                   (data_k_norm$number_occ_3d > data_k_norm$number_occ_3b)
  )
  p_gender_string_con <- anonymizor(p_gender_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  
  #############################  (number_occ_3a >= number_occ_3c) AND (number_occ_3a >= number_occ_3d)) state_string='*'.###############
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==0 &
                   data_k_norm$k3_3b==1 &
                   data_k_norm$k3_3c==0 &
                   data_k_norm$k3_3d==0 &
                   (data_k_norm$number_occ_3a >= data_k_norm$number_occ_3c)&
                   (data_k_norm$number_occ_3a >= data_k_norm$number_occ_3d)
  )
  p_state_string_con <- anonymizor(p_state_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  
  #############################  (number_occ_3c > number_occ_3a) AND (number_occ_3c > number_occ_3d)) age_string='*'.###############
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==0 &
                   data_k_norm$k3_3b==1 &
                   data_k_norm$k3_3c==0 &
                   data_k_norm$k3_3d==0 &
                   (data_k_norm$number_occ_3c > data_k_norm$number_occ_3a)&
                   (data_k_norm$number_occ_3c > data_k_norm$number_occ_3d)
  )
  p_age_group2_string_con <- anonymizor(p_age_group2_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  #############################  (number_occ_3d > number_occ_3a) AND (number_occ_3d > number_occ_3c)) gender_string='*'.###############
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==0 &
                   data_k_norm$k3_3b==1 &
                   data_k_norm$k3_3c==0 &
                   data_k_norm$k3_3d==0 &
                   (data_k_norm$number_occ_3d > data_k_norm$number_occ_3a)&
                   (data_k_norm$number_occ_3d > data_k_norm$number_occ_3c)
  )
  p_gender_string_con <- anonymizor(p_gender_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  
  
  #############################  (number_occ_3a >= number_occ_3b) AND (number_occ_3a >= number_occ_3d)) state_string='*'.###############
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==0 &
                   data_k_norm$k3_3b==0 &
                   data_k_norm$k3_3c==1 &
                   data_k_norm$k3_3d==0 &
                   (data_k_norm$number_occ_3a >= data_k_norm$number_occ_3b)&
                   (data_k_norm$number_occ_3a >= data_k_norm$number_occ_3d)
  )
  p_state_string_con <- anonymizor(p_state_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  
  #############################  (number_occ_3b > number_occ_3a) AND (number_occ_3b > number_occ_3d)) education_string='*'.###############
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==0 &
                   data_k_norm$k3_3b==0 &
                   data_k_norm$k3_3c==1 &
                   data_k_norm$k3_3d==0 &
                   (data_k_norm$number_occ_3b >= data_k_norm$number_occ_3a)&
                   (data_k_norm$number_occ_3b >= data_k_norm$number_occ_3d)
  )
  p_education_string_con <- anonymizor(p_education_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  #############################  (number_occ_3d > number_occ_3c) AND (number_occ_3d > number_occ_3c)) gender_string='*'.###############
  # 2. the pattern is not same            (same) AND (same)
  #cat('\n ################################################################################## \n')
  
  posi <- which( data_k_norm$k3_3a==0 &
                   data_k_norm$k3_3b==0 &
                   data_k_norm$k3_3c==1 &
                   data_k_norm$k3_3d==0 &
                   (data_k_norm$number_occ_3d > data_k_norm$number_occ_3c)&
                   (data_k_norm$number_occ_3d > data_k_norm$number_occ_3c)
  )
  p_gender_string_con <- anonymizor(p_gender_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  
  #############################  (number_occ_3a >= number_occ_3b) AND (number_occ_3a >= number_occ_3c)) state_string='*'.###############
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==0 &
                   data_k_norm$k3_3b==0 &
                   data_k_norm$k3_3c==0 &
                   data_k_norm$k3_3d==1 &
                   (data_k_norm$number_occ_3a >= data_k_norm$number_occ_3b)&
                   (data_k_norm$number_occ_3a >= data_k_norm$number_occ_3c)
  )
  p_state_string_con <- anonymizor(p_state_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  
  #############################  (number_occ_3b > number_occ_3a) AND (number_occ_3b > number_occ_3c)) education_string='*'.###############
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==0 &
                   data_k_norm$k3_3b==0 &
                   data_k_norm$k3_3c==0 &
                   data_k_norm$k3_3d==1 &
                   (data_k_norm$number_occ_3b > data_k_norm$number_occ_3a)&
                   (data_k_norm$number_occ_3b > data_k_norm$number_occ_3c)
  )
  p_education_string_con <- anonymizor(p_education_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  #############################  (number_occ_3c > number_occ_3a) AND (number_occ_3c > number_occ_3b)) age_string='*'.###############
  #cat('\n ################################################################################## \n')
  posi <- which( data_k_norm$k3_3a==0 &
                   data_k_norm$k3_3b==0 &
                   data_k_norm$k3_3c==0 &
                   data_k_norm$k3_3d==1 &
                   (data_k_norm$number_occ_3c > data_k_norm$number_occ_3a)&
                   (data_k_norm$number_occ_3c > data_k_norm$number_occ_3b)
  )
  p_age_group2_string_con <- anonymizor(p_age_group2_string_con,posi,data_k_norm,p_gender_string,p_education_string,p_age_group2_string,p_state_string)
  
  ###############################################################################
  
  #  p_gender_string    <- data[[gender_varname]]
  # p_age_group2_string  <- data[[age_varname]]  #may recode is needed
  # p_education_string   <- data[[education_varname]]   #may recode is needed
  # p_state_string <- data[[state_varname]] 
  #cat('\n')
  #cat('\n')
  #cat('\n')
  #cat('\n')
  flag_need_another_iteration <- F
  data_con <- data
  # data_con$p_gender_string <- car::recode( p_gender_string_con ," '*'  -> -97",to.value="->", interval=":",separator=";") %>%
  data_con[[gender_varname]][which(p_gender_string_con=='*')] <- NA_value
  posi_na_ori <- which(p_gender_string=="*")
  posi_na_con <- which(data_con[[gender_varname]]==NA_value)
  diff <- length(posi_na_con)-length(posi_na_ori)
  if (diff!=0){
    flag_need_another_iteration <- T
    
  }
  cat('total gender:        ',diff, ' respondants were suppressed \n')

  
  
  data_con[[education_varname]][which(p_education_string_con=='*')] <- NA_value
  posi_na_ori <- which(p_education_string=="*")
  posi_na_con <- which(data_con[[education_varname]]==NA_value)
  diff <- length(posi_na_con)-length(posi_na_ori)
  if (diff!=0){
    flag_need_another_iteration <- T
    
  }
  

  cat('total education:     ',diff, ' respondants were suppressed \n')

  #cat('\n')
  
  data_con[[age_varname]][which(p_age_group2_string_con=='*')] <- NA_value
  posi_na_ori <- which(p_age_group2_string=="*")
  posi_na_con <- which(data_con[[age_varname]]==NA_value)
  diff <- length(posi_na_con)-length(posi_na_ori)
  
  if (diff!=0){
    flag_need_another_iteration <- T
    
  }
  cat('total age:           ',diff, ' respondants were suppressed \n')


  
  data_con[[state_varname]][which(p_state_string_con=='*')] <- NA_value
  posi_na_ori <- which(p_state_string=="*")
  posi_na_con <- which(data_con[[state_varname]]==NA_value)
  diff <- length(posi_na_con)-length(posi_na_ori)
  if (diff!=0){
    flag_need_another_iteration <- T
  }
  cat('total state:         ',diff, ' respondants were suppressed \n')

  
  out <- list()  # just for return 2 entities
  out$data_con <- data_con
  out$flag <- flag_need_another_iteration
  
  return(out)  # I wanna use python!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ----my last words.

  
}