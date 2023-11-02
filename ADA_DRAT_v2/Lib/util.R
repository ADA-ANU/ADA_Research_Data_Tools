library(haven);        # To read .SAV data 
library(labelled);     # To extarct information from the data
library(flextable);    # To create tables with merged rows for designated columns
library(officer)

spss_value_labels <- function(var){
  
  posi <- which(sapply(names(data), function(x) grepl(x, var_label(var))))
  Line_1 <- paste0('ADD VALUE LABELS ',names(posi)) %>% 
    paste0('\n')
  cat(Line_1)
  vals<- val_labels(var)
  for (i in 1:(length(vals)-1)){
    Lines <- paste0(vals[i]," '") %>% 
      paste0(names(vals)[i]) %>% 
      paste0("'\n")
    
    cat(Lines)
  }
  Lines <- paste0(vals[i+1]," '") %>% 
    paste0(names(vals)[i+1]) %>% 
    paste0("'.\n") %>% 
    paste0('EXECUTE.\n')
  cat(Lines)
}




IPII_GEO_keywords<- regex("(vill)|(town)|(post)|(code)",ignore_case = TRUE)
IPII_NGEO_keywords<- regex("(edu)|(occupation)",ignore_case = TRUE)




chooserInput <- function(inputId, leftLabel, rightLabel, leftChoices, rightChoices,
                         size = 5, multiple = FALSE) {
  
  leftChoices <- lapply(leftChoices, tags$option)
  rightChoices <- lapply(rightChoices, tags$option)
  
  if (multiple)
    multiple <- "multiple"
  else
    multiple <- NULL
  
  tagList(
    singleton(tags$head(
      tags$script(src="chooser-binding.js"),
      tags$style(type="text/css",
                 HTML(".chooser-container { display: inline-block; }")
      )
    )),
    div(id=inputId, class="chooser",
        div(class="chooser-container chooser-left-container",
            tags$select(class="left", size=size, multiple=multiple, leftChoices)
        ),
        div(class="chooser-container chooser-center-container",
            icon("arrow-circle-o-right", "right-arrow fa-3x"),
            tags$br(),
            icon("arrow-circle-o-left", "left-arrow fa-3x")
        ),
        div(class="chooser-container chooser-right-container",
            tags$select(class="right", size=size, multiple=multiple, rightChoices)
        )
    )
  )
}

registerInputHandler("shinyjsexamples.chooser", function(data, ...) {
  if (is.null(data))
    NULL
  else
    list(left=as.character(data$left), right=as.character(data$right))
}, force = TRUE)











IPII_GEO_check <- function(varLabel){
  ipii_geo_posi<- str_which  (varLabel,IPII_GEO_keywords , negate = FALSE)
  return(ipii_geo_posi)
}

IPII_NGEO_check <- function(varLabel){
  ipii_ngeo_posi<- str_which  (varLabel,IPII_NGEO_keywords , negate = FALSE)
  return(ipii_ngeo_posi)
}


confidentiality_check <- function(varLabel){

  ipii_geo_posi <- IPII_GEO_check(varLabel)
  ipii_ngeo_posi <- IPII_NGEO_check(varLabel)

  # IPII_GEO_keywords
  # arch_posi <- issue_extractor(data_freq,'Ipii')
  # var_posi <- sort(union(var_posi,arch_posi)) 
  # var_match <- str_extract(varLabel[ipii_posi], IPII_keywords) 
  # print(varLabel)
  return(list(IPII=c(ipii_geo_posi,ipii_ngeo_posi),
              IPII_geo_posi=ipii_geo_posi,
              IPII_ngeo_posi=ipii_ngeo_posi,
              DPII_posi=''))
}

which_name  <- function(spss_data, var_names) {
  
  
}

str_prefix_detect <- function(value_lables,chooser_input){
  
  result <- c()
  for(i in 1:length(value_lables)){
    
    for (j in 1:length(chooser_input)) {
      # print("1")
      if(value_lables[i]== substring(chooser_input[j],1,nchar(value_lables[i]) ) ) {
        # print(c(value_lables[i],chooser_input[j]))
        result <- c(result,i)
        }
      
    }

  }
  return(result)
}



generate_data_dict_freq<- function(data_freq_path="",data=''){
  
  # tryCatch({
  #   if (data=="" & value_info==""){
  #     # data <- haven::read_sav(sav_path)
  #     data <- read.spss(sav_path,to.data.frame = T)
  #     }else()
  #   
  #   
  #   },
  #   error = function(e){
  #     print("File Access Error: File does not exists or permission denied, please check the SPSS(.sav) File path.",)
  #   }
  # )


  
  #####################################################################################################################
  ###############    Get necessary information to create dictionary, The information included here ####################
  ###                Serial number, name of the variable, variable label and value levels 
  ###############    Other information include: 
  ###                Type of variable, Number of missing cases, Number of unique values and range
  ###############    Archivist can include extra information here if needed                        ####################  
  #####################################################################################################################
  dictionary <- c()
  tryCatch({

      #####################################################################################################################
      ################         Collect information from the data file (No change)           ###############################
      #####################################################################################################################

      var_info <-   look_for(data,details = T) %>%
        lookfor_to_long_format() %>%
        convert_list_columns_to_character()
      
      dictionary            <- var_info [,c(1,2,3,5)]
      colnames (dictionary) <- c( 'Serial' ,'Name', 'Variable_label', 'Value_labels')
      

    },
      error = function(e){
        print("please input value_info or spss data")
      }
  )
  
  

  # check_box <-  matrix(rep('',nrow (dictionary) ) ,ncol = 1)
  
  dictionary            <- data.frame (dictionary)
  fr                    <- lapply(data, function(x) { return(questionr::freq(x)) })
  
  # print(dictionary)
  Frequency                 <- rep (NA, times = nrow (dictionary))
  varName               <- unique(dictionary$Name) ; m <- 0
  
  for (i in 1: length (varName )){
    d1 <- subset (dictionary, dictionary$Name ==  varName [i] ); n1 <- nrow (d1)
    f1 <- data.frame(fr[[i]]); f2 <- as.numeric(unlist(f1[1]));
    for (j in 1: n1){   Frequency  [m+j] <- f2[j]} 
    m <- m + n1
  }
  
  dictionary <- cbind (dictionary, Frequency)
  dictionary$Frequency  = ifelse(is.na(dictionary$Value_labels), NA, Frequency)
  

  
  
  ########## original without checkbox
  # 
  # dictionary <- flextable(
  #   dictionary,
  #   col_keys = c(  'Serial', 'Name', 'Variable_label', 'Value_labels', 'Frequency'))
  # 
  # dictionary  <- merge_v           (dictionary , j = ~ Serial + Name + Variable_label)
  # dictionary  <- border_inner_h    (dictionary , part="all", border = fp_border(color="gray"))
  # dictionary  <- align             (dictionary , align = "left", part = "body")
  # dictionary  <- valign            (dictionary , valign = "top", part = "body")
  # 
  # dictionary  <- color             (dictionary , color = "black", part = "all")
  
  
  
  ######################  with checkbox, may ues in the future ############
  # dictionary <- cbind (dictionary[1],dictionary[1],dictionary[2:4], Frequency,check_box)
  # colnames (dictionary) <- c( 'Serial','Check_box_var', 'Name', 'Variable_label', 'Value_labels', 'Frequency','Check_box_val')
  
  # colnames (dictionary) <- c( 'Serial','Check_box_var', 'Name', 'Variable_label', 'Value_labels', 'Frequency','Check_box_val')
  # dictionary$Frequency  <-  ifelse(is.na(dictionary$Value_labels), NA, Frequency)
  # dictionary_1  <- as.data.frame(dictionary)
  # dictionary_1$Check_box_var <- check_box
  posi <- which(duplicated(dictionary$Name))
  dictionary$Name[posi] <- ''
  dictionary$Variable_label[posi] <- ''
  
  if (data_freq_path!='') {
    write.csv(as.data.frame(dictionary),file = data_freq_path,row.names = FALSE)  
  } else{
    return(as.data.frame(dictionary))  
  }
}





