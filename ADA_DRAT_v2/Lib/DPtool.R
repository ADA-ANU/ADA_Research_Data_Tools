# this file is mainly used for LinA panel data, will find generality with other data

#' Title
#' 
#' @param colour
#' @param n
#' @param lighter
#' 
#' @return
#' @export
#' 
#' @examples
#' 
#' 
#' 
#' 
#' 

# group_numberic_data <- function(data,bins,include_head=F,include_tail=T) {
# 
#   for (i in 1:(length(bins)-1)){
#     posi <- which(data<=(bins[i+1]-1 )& data>=bins[i])
#     age_data[posi] <- i
#   }
# 
# 
# }

####################### Draft for group 2 or 3 values into one category.
# group_value <- function(data_var,from_value,to_value,new_value_label,refresh_value_code=T,refresh_missing_value_code=F){#  if you would like to code the categories from 1, set TRUE
#   value_labels <- attributes(data_var)$labels 
#   
# }
# 
# group_value(data[[p_gender_name_ori]])
# 
# posi_var_need <- value_labels %in% missing_value_in_original_gender
# if (refresh_value_code){
#   n <- length(which(!posi_missing))
#   new_value <- c(1:n,)
# } else{
#   old_value <- as.vector(attributes(data[[p_gender_name_ori]])$labels)[!posi_missing]  
# }
# 
# 
# value_labels <- c(1,2,3,4,-97) %>% 
#   as.numeric()
# names(value_labels) <- c('123123','asdasd','asdasdad','asdasd','asdasd')
# 
# age_data <- labelled(as.double(age_data),labels = value_labels,label = varible_label)
# 
# attributes(age_data)$format.spss <- format_spss
###################################################################################



value_label_comparison<- function(d1,d2,d3=c()){
  #' Title
  #' 
  #' @param colour
  #' @param n
  #' @param lighter
  #' 
  #' @return
  #' @export
  #' 
  #' @examples
  #' 
  #' value_label_comparison(data$A1,data2$A1)
  #' 
  #' 
  
  
  a1 <- rep('',10000)
  a2 <- rep('',10000)
  a3 <- rep('',10000)

  
  a1[unname(labelled::val_labels(d1))] <- names(labelled::val_labels(d1))
  a2[unname(labelled::val_labels(d2))] <- names(labelled::val_labels(d2))

  if (is_empty(d3)){

    view(data.frame(a1,a2))

  }else{

    a3[unname(labelled::val_labels(d3))] <- names(labelled::val_labels(d3))
    view(data.frame(a1,a2,a3))
  }
  
  
}




group_values <- function(data_var,from_values,to_value='',to_value_label,NA_code_to_ignore=c(-99:-1,90:99)){
  #  if you would like to code the categories from 1, set TRUE
  #' Title
  #' 
  #' @param colour
  #' @param n
  #' @param lighter
  #' 
  #' @return
  #' @export
  #' 
  #' @examples
  #' 
  #' group_values(spss_data$A1,c(1000:1999),1,'Government Job')
  #' 
  #' 
  
  
  na_flag <- F
  if (NA %in% from_values){
    na_flag <- T
    
  }
  
  
  from_values <- sort(from_values) #sign the code by default
  if (to_value==''){
    to_value <- from_values[1]
  }
  if (na_flag){
    from_values <- c(from_values,NA)
  }
  
  
  regx <- paste0('c(',paste(as.character(from_values),collapse =',')) %>%
    paste0(')=') %>% 
    paste0(to_value)
  
  value_labels <- attributes(data_var)$labels
  variable_label <- attributes(data_var)$label
  posi_from_value <- value_labels %in% from_values    #Find the position of the Refuse, dont know, Missing, or other in the gender value labels.
  # cat(posi_from_value,'\n')
  # len_valid_value <- length(which(!posi_from_value))
  new_values <- value_labels[!posi_from_value] #including the NA values
  new_value_labels <- names(new_values)
  
  tryCatch(
    {
      if (to_value%in% as.vector(new_values)){
        stop()
      }
      
    },
    error = function(e){
      message("the new value is dupulicated with other, please change 'to_value' parameters)")})
  
  
  new_values <- c(new_values,to_value) %>% as.numeric()
  
  
  names(new_values) <- c(new_value_labels,to_value_label)
  # print(new_values)
  new_values <- sort(new_values)
  # 
  data_t   <- car::recode (data_var, regx) %>%
    as.integer() %>%
    labelled(new_values,label = variable_label)
  attributes(data_t)$format.spss <- attributes(data_var)$format.spss
  data_t
}





value_name <- function(data,var){
  
  return(attributes(data[[var]])$labels )
  
}


delete_value <- function(data,var,de_value){
  # make sure that no or 0 respondant in the value.
  data_t <- data
  for (v in var){
    
    t <- data_t[[v]]                      # try not using as_factor as it will loss the values with 0 respondant in levels/value_labels.
    attributes(t)$labels <- attributes(t)$labels[-which(attributes(t)$labels==de_value)]
    data_t[[v]] <- t
  }
  return(data_t)
}





age_groups <- function(age_data,age_bins,varible_label,format_spss='F3.0',missing_value='-97',missing_label='Unknow'){
  # this file is mainly used for LinA panel data, will find generality with other data
  
  #' Title
  #' 
  #' @param colour
  #' @param n
  #' @param lighter
  #' 
  #' @return
  #' @export
  #' 
  #' @examples
  #' 

  missing_posi <- which(age_data==missing_value)

  new_value_labels <-c(missing_label)

  for (i in 1:(length(age_bins)-1)){
    posi <- which(age_data<=(age_bins[i+1]-1 )& age_data>=age_bins[i])
    label_string <- paste0(as.character(age_bins[i]),'-') %>%
      paste0(as.character(age_bins[i+1]-1)) %>%
      paste0(' years')
    
    new_value_labels <- c(new_value_labels,label_string)
    
    age_data[posi] <- i
  }
  
  new_value_labels <- c(new_value_labels,paste0(as.character(age_bins[-c(1:i)])) %>% 
                          paste0(' or more years' ))
  
  posi <- which(age_data>=(age_bins[i+1] ))
  age_data[posi] <- i+1
  
  value_labels <- c(missing_value,1:length(age_bins)) %>% 
    as.numeric()
  names(value_labels) <- new_value_labels
  value_labels <- sort(value_labels)
  age_data <- labelled(as.double(age_data),labels = value_labels,label = varible_label)
  
  attributes(age_data)$format.spss <- format_spss
  age_data
}


freq_table <- function(data,variable_name,graph=F){
  #' Title
  #' 
  #' 
  #' @return
  #' @export
  #' 
  #' @examples
  freqtab <- tab1(labelled::to_factor(data[[variable_name]]) ,graph = graph)
  freqtab$first.line <- paste0('Frequency table for ',paste0(variable_name,' \n'))
  rownames(freqtab$output.table) <- paste0(rownames(freqtab$output.table),
                                           paste0(': ',c(attributes(data[[variable_name]])$labels,''))
  )
  freqtab
}






add_new_value<- function(data,var,value_label,value,sort=T){
  #' Title
  #'  the problem is if there are a new zeland 1201, add new zeland 1200, it will update new zeland 1200
  #' @param colour
  #' @param n
  #' @param lighter
  #' 
  #' @return
  #' @export
  #' 
  #' @examples
  tryCatch(
    {
      if (!(length(value)==length(value_label))){
        stop()
      }
      
    },
    error = function(e){
      message("length of value : ",paste(value,collapse = ", "), 
              " and value_label : ", paste(value_label,collapse = ", ")," are not same ")
    }
  )
  
  
  
  for (i in var){
    t <- data[[i]]
    attr_label <- attributes(t)$labels 
    for (v in 1:length(value)) {
      attr_label[[value_label[v]]] <- value[v]

    }
    
    
    if (sort==T){
      attributes(t)$labels <- sort( attr_label)
    }else{
      attributes(t)$labels <- attr_label  
    }
    
    data[[i]] <- t
  }
  data
}

find_substring_var_label <- function(data,substring,print=F){
  idx <- which(as.logical(lapply(data, function(e) grepl(substring, var_label(e),ignore.case = F))))
  
  if (print){
    cat(paste(names(data)[idx],collapse = "\n"))
  }  
  return(names(data)[idx])
}

replace_substring_var_labels <- function(data,from_substring,to_substring='',print_spss_code=T){
  var <- find_substring_var_label(data,from_substring)
  if (print_spss_code){
    for (i in var){
      line <- paste0('VARIABLE LABELS ',i) %>% 
        paste0(' "') %>% 
        paste0(gsub(from_substring, to_substring, var_label(data[[i]]))) %>% 
        paste0('".\n')
      cat(line)
    }
  }
  return (gsub(from_substring, to_substring, var_label(data)))
}

locate_substring_var_label <- function(data,substring){
  return(unlist(lapply(data, function(e) c(regexpr(substring, var_label(e))))))
}



############################




find_undefined_value <- function(data,include_string=F,print=F){
  idx <- lapply(data, check_undefined_value)
  var_undefinedvalue <- names(data)[which(unname(unlist(idx)))]
  if (print){
    cat(paste(var_undefinedvalue,collapse = "\n"))  
  }
  
  return (var_undefinedvalue)
}


check_undefined_value <- function(data,include_string=F){
  if (include_string){
    return (!all(na.omit(unique(data))%in% unname(attributes(data)$labels)) )
  }else{
    return ((!all(na.omit(unique(data))%in% unname(attributes(data)$labels))) & (!is.character(data))  )  
  }
  
}




locate_substring_var_label <- function(data,var_name,substring){
  return (regexpr(substring, var_label(data[[var_name]])))
}




find_var_names_by_value <- function(data,value){
  #' The function will find the variables that have the value you put in
  #'
  #' @param data :spss data read by heaven::read_sav. 
  #' @param value : a integer of value you want to find in all variabels.
  #'
  #' @return a string list:  contains all variable name that contains the certain value
  #' @export
  #'
  #' @examples find_var_names_by_value(spss_data)
  
  var_name <- names(data)
  var_name_value<- c()
  cat("seeking for value name for ",value,'\n')
  for (i in var_name) {
    value_lables <- attributes(data[[i]])$labels
    if ( c(as.character(value)) %in% value_lables){
      var_name_value <- c(var_name_value,i)
      posi <- which(value_lables==value)
      cat('    ',i,': ' ,names(attributes(data[[i]])$labels[posi]),'\n ')
    }
  } 
  return(var_name_value)
}

find_var_names_by_keyword <- function(data,value_name,mode='ambiguity'){
  #' The function is used to find variable that contains certain value names/ keywords.
  #'
  #' @param data: spss data read by heaven::read_sav. 
  #' @param value_name: a string for the value names you would like to seek 
  #' @param mode: logical substring match: ambiguity is stands for the param value_name is a substring of value label.
  #'                                       exact means value_name you input is exactly the value label you would like to find.
  #' 
  #'
  #' @return: a list of variable names that contains the value_name as your input
  #' @export
  #'
  #' @examples find_var_names_by_keyword(spss_data,'stupid value names')
  var_name <- names(data)
  var_name_value<- c()
  tryCatch(
    {
      if (!(mode %in% c('ambiguity','exact') )){
        mode <- 'ambiguity'
      }
      
    },
    error = function(e){
      message('the search mode is not ambiguity or exact, will set mode to ambiguity by default')
    }
  )
  
  
  cat("seeking for value name for ",value_name,'\n')
  for (i in var_name) {
    value_lables <- attributes(data[[i]])$labels
    value_lables_names <- names(value_lables)
    
    
    
    if (mode=='ambiguity') {
      
      posi <- grep(value_name,value_lables_names,ignore.case = T)
      # print(length(posi))
      if ( length(posi)>0){
        full_name_of_value <- value_lables_names[posi]
        var_name_value <- c(var_name_value,i)
        cat('    ',i,': [', value_lables[posi],']' ,full_name_of_value,'\n ')
      }
    }
    
    if (mode=='exact') {
      posi <- which(value_name==value_lables_names)
      if ( length(posi)>0){
        full_name_of_value <- value_lables_names[posi]
        var_name_value <- c(var_name_value,i)
        cat('    ',i,': [', value_lables[posi],']' ,full_name_of_value,'\n ')
      }
    }
    
  } 
  return(var_name_value)
}

convert_ch2double <-  function(data_var,spss_format=''){
  
  values <- as.double(labelled::val_labels(data_var))
  names(values) <- names(labelled::val_labels(data_var))
  
  t <- data_var %>%
    as.vector()%>%
    as.double() %>%
    labelled(labels = values,label=var_label(data_var))
  if (spss_format==''){
    attributes(t)$format.spss <- attributes(data_var)$format.spss
  }else{
    attributes(t)$format.spss <- spss_format
  }
  t
  
}

convert_ch2int <-  function(data_var,spss_format=''){
  
  values <- as.integer(labelled::val_labels(data_var))
  names(values) <- names(labelled::val_labels(data_var))
  
  t <- data_var %>%
    as.vector()%>%
    as.integer() %>%
    labelled(labels = values,label=var_label(data_var))
  if (spss_format==''){
    attributes(t)$format.spss <- attributes(data_var)$format.spss
  }else{
    attributes(t)$format.spss <- spss_format
  }
  t
  
}

convert_2ch <-  function(data_var,spss_format=''){
  
  values <- as.character(labelled::val_labels(data_var))
  names(values) <- names(labelled::val_labels(data_var))
  
  t <- data_var %>%
    as.vector()%>%
    as.character() %>%
    labelled(labels = values,label=var_label(data_var))
  if (spss_format==''){
    attributes(t)$format.spss <- attributes(data_var)$format.spss
  }else{
    attributes(t)$format.spss <- spss_format
  }
  t
  
}




update_values <- function(data,var,from_values,to_values,sort_flag=F){

    #' This function is used for changing value of the value label
    #'
    #' @param data_var         -  labelled data : spss sav data, usually read via heaven::read_sav()
    #' @param var          -  character     : the variable list that you would like to change its value
    #' @param value_from   -  integer       : the original data value you would like to change
    #' @param value_to     -  integer       : the value you would like to change to
    #'
    #' @return It will return a tibble type of data (same as the one read from haven::read_sav) that changed all values, given a varible list
    #' @export
    #'
    #' @examples update_values(data = aes_16_long,vari,c(1,3,5,7,9,11,13,15,17,19),c(1:10))


  tryCatch(
    {
      if (!(length(from_values)==length(to_values))){
        stop()
      }
      
    },
    error = function(e){
      message("length of value_need_change_list_from : ",paste(from_values,collapse = ", "), 
              " and value_need_change_list_to : ", paste(to_values,collapse = ", ")," are not same ")
    }
  )
  
  regx <- paste(sapply(seq_along(from_values), function(x) sprintf("%d=%d", from_values[x], to_values[x])), collapse=";")
  
  data_t <- data
  variable_label <- labelled::val_labels(data_t)
  for (v in var){
    t <- data_t[[v]]
    posi_from_value <- match(from_values,labelled::val_labels(t))
    posi_from_value <- posi_from_value[!is.na(posi_from_value)]
    labelled::val_labels(t)[posi_from_value] <- to_values
    
    
    if (sort_flag){
      labelled::val_labels(t) <- sort(labelled::val_labels(t))
    }
    
    t   <- car::recode (t, regx)
    attributes(t)$format.spss <- attributes(data_t[[v]])$format.spss
    data_t[[v]] <- t
  }
  data_t
}





#' update_values <-  function(data,var,value_from,value_to){
#'   
#'   
#'   
#'   #' This function is used for changing value of the value label
#'   #'  
#'   #' @param data         -  labelled data : spss sav data, usually read via heaven::read_sav()
#'   #' @param var          -  character     : the variable list that you would like to change its value
#'   #' @param value_from   -  integer       : the original data value you would like to change 
#'   #' @param value_to     -  integer       : the value you would like to change to
#'   #' 
#'   #' @return It will return a tibble type of data (same as the one read from haven::read_sav) that changed all values, given a varible list
#'   #' @export
#'   #' 
#'   #' @examples
#'   
#'   
#'   "
#'   
#'   return(): 
#'   
#'   @params:
#'   @data:                    spss .sav data that read by heaven
#'   @var:                     a list string or a single string:     a variable name, such as A2A, p_gender, dem_9
#'   @value_from:              a list that contain the original value that you would like to change, such as c(98,99)
#'   @value_to:                a int list that contain the original value that you would like to change, such as c(98,99)
#'   
#'   Examplple:
#'   update_values(data,'A6',c(99,98),c(-99,-98))
#'   "
#'   data_t <- data
#'   for (v in var){
#'     
#'     t <- data_t[[v]]                      # try not using as_factor as it will loss the values with 0 respondant in levels/value_labels.
#'     tryCatch(
#'       {
#'         if (!(length(value_from)==length(value_to))){
#'           stop()
#'         }
#'         
#'       },
#'       error = function(e){
#'         message("length of value_need_change_list_from : ",paste(value_from,collapse = ", "), 
#'                 " and value_need_change_list_to : ", paste(value_to,collapse = ", ")," are not same ")
#'       }
#'     )
#'     
#'     for (i in 1:length(value_from)) {
#'       t[which(t==value_from[i])] <- value_to[i]
#'       attributes(t)$labels[which(attributes(t)$labels==value_from[i])] <- value_to[i]
#'       
#'     }
#'     
#'     attributes(t)$labels <- sort(attributes(t)$labels)
#'     data_t[[v]] <- t
#'   }
#'   
#'   return(data_t)
#' }

update_values_ver0 <-  function(data,var,value_from,value_to){
" abandonded 
 function is used for changing value of the value label
  return(): It will return a value
  
  @params:
  @data:                    spss .sav data that read by heaven
  @var:                     a single string:     a variable name, such as A2A, p_gender, dem_9
  @value_from:              a list that contain the original value that you would like to change, such as c(98,99)
  @value_to:                a int list that contain the original value that you would like to change, such as c(98,99)
  
  Examplple:
  update_values(data,'A6',c(99,98),c(-99,-98))
  "
  
  t <- data[[var]]                      # try not using as factor as it will loss the values with 0 respondant in levels/value_labels.
  
  # level_t <- as.character(attributes(t)$labels)
  # value_name_t<- names(labelled::val_labels(t))
  # value_need_change_list_from <- c(98,99)
  # value_need_change_list_to <- c(-98,-99)
  tryCatch(
    {
      if (!(length(value_from)==length(value_to))){
        stop()
      }
      
    },
    error = function(e){
      message("length of value_need_change_list_from : ",paste(value_from,collapse = ", "), 
              " and value_need_change_list_to : ", paste(value_to,collapse = ", ")," are not same ")
    }
  )
  
  for (i in 1:length(value_from)) {
    attributes(t)$labels[which(attributes(t)$labels==value_from[i])] <- value_to[i]
    t[which(t==value_from[i])] <- value_to[i]
  }
  
  return(t)
  
}



update_value_labels <-  function(data,var,value_label_from,value_label_to){
  " furture work: using value to locate the value label that need to change
  This function is used for changing value of the value label
  return(): It will return a value
  
  @params:
  @data:                    spss .sav data that read by heaven
  @var:                     a single string:     a variable name, such as 'A2A', 'p_gender', 'dem_9'
  @value_label_from:        a string list that contain the original value that you would like to change, such as c('Refs','very li')
  @value_label_to:          a string list that contain the original value that you would like to change, such as c('refused','very likely')
  
  Examplple:
  update_value_labels(data,'A6',c('Refs','very li'),c('refused','very likely'))
  "
  
  t <- data[[var]]                      # try not using as factor as it will loss the values with 0 respondant in levels/value_labels.
  
  # level_t <- as.character(attributes(t)$labels)
  # value_name_t<- names(labelled::val_labels(t))
  # value_need_change_list_from <- c(98,99)
  # value_need_change_list_to <- c(-98,-99)
  tryCatch(
    {
      if (!(length(value_label_from)==length(value_label_to))){
        stop()
      }
      
    },
    error = function(e){
      message("length of value_need_change_list_from : ",paste(value_label_from,collapse = ", "), 
              " and value_need_change_list_to : ", paste(value_label_to,collapse = ", ")," are not same ")
    }
  )
  
  for (i in 1:length(value_label_from)){
    posi <- which(names(attributes(t)$labels)==value_label_from[i])
    names(attributes(t)$labels)[posi] <- value_label_to[i]
  }
  
  
  return(t)
  
}

get_data_frequency <-  function(var_info,fr){
  
  dictionary            <- var_info [,c(1,2,3,6)]
  colnames (dictionary) <- c( 'Serial' ,'Name', 'Variable_label', 'Value_labels')
  check_box <-  matrix(rep('',nrow (dictionary) ) ,ncol = 1)
  
  dictionary            <- data.frame (dictionary)
  
  Frequency             <- rep (NA, times = nrow (dictionary))
  varName               <- unique(dictionary$Name) ; m <- 0
  
  for (i in 1: length (varName )){
    d1 <- subset (dictionary, dictionary$Name ==  varName [i] ); n1 <- nrow (d1)
    f1 <- data.frame(fr[[i]]); f2 <- as.numeric(unlist(f1[1]));
    for (j in 1: n1){   Frequency  [m+j] <- f2[j]} 
    m <- m + n1
  }
  
  value <- sub(".*\\[([^][]+)].*", "\\1", dictionary$Value_labels)
  value_l <- str_split_fixed(dictionary$Value_labels, "] ",n=2)[,2]
  
  
  
  dictionary <- cbind (dictionary[1:3],data.frame(value),data.frame(value_l), Frequency)
  colnames (dictionary) <- c('Position', 'Variable','Label', 'Value','Value_labels', 'Frequency')
  
  # dictionary$Frequency  = ifelse(is.na(dictionary$Value_labels), NA, Frequency)
  # dictionary <- cbind (dictionary[1],dictionary[1],dictionary[2:4], Frequency,check_box)
  
  
  
  
  # colnames (dictionary) <- c( 'Variable','Position','Label', 'Value','Value_labels', 'Frequency')
  dictionary$Frequency  <-  ifelse(is.na(dictionary$Value), '', Frequency)
  dictionary$Value_labels  <-  ifelse(is.na(dictionary$Value), '', dictionary$Value_labels)
  
  dictionary$Value  <-  ifelse(is.na(dictionary$Value), '', dictionary$Value)
  
  return (as.data.frame(dictionary))
}


get_confidential_issue <- function(varLabel){
  confidentiality_hash <- hash()
  confidentiality_hash['DPII']    <-str_which  (varLabel, regex("(identi)|(ID)|(Name)|(name)|(Phone)|(phone)|(Mobile)|(mobile)",ignore_case = TRUE), negate = FALSE)
  confidentiality_hash['Demo']     <-str_which  (varLabel, regex("(edu)|(gender)|(sex)|(age)|(state)",ignore_case = TRUE), negate = FALSE)
  confidentiality_hash['Racial']   <- str_which  (varLabel,regex("(birth)|(born)|(country)|(place)|(origin)|(ethnic)|(speak)|(language)|(mother)|(father)|(ancestry)|(Identify)|(indigenous)|(torres strait)|(islander)|(aboriginal) ",ignore_case = TRUE) , negate = FALSE) 
  confidentiality_hash['Political']<- str_which  (varLabel,regex("(member)|(align)|(political)|(party)|(left)|(right)|(election)|(vote)",ignore_case = TRUE) , negate = FALSE) 
  confidentiality_hash['Religious']<-  str_which  (varLabel,regex("(church)|(mosque)|(temple)|(synagogue)|(service)|(observe)|(practice)|(religion)",ignore_case = TRUE) , negate = FALSE)
  confidentiality_hash['Sexual']   <- - str_which  (varLabel,regex("(identif)|(gay)|(lesbian)|(binary)|(queer)|(LGBT)|(orientation)|(practice)|(bisexual)|(transgender)|(intersex)|(asexual)|(pansexual)",ignore_case = TRUE) , negate = FALSE) 
  confidentiality_hash['Criminal'] <- str_which  (varLabel,regex("(criminal)|(record)|(conviction)|(sentenced)|(drug)|(abuse)",ignore_case = TRUE) , negate = FALSE) 
  confidentiality_hash['Health']   <- str_which  (varLabel,regex("(Health)|(Genetic)|(Ancestry)|(Disease)|(Chronic)|(Pain)|(Disability)|(disabled)|(Heart)|(kidney)|(lung)|(respiratory)|(COVID)",ignore_case = TRUE) , negate = FALSE)
  # confidentiality_hash['Other']    <- NULL
  # confidentiality_hash['All'] <- c( confidentiality_hash[['DPII']]      ,
  #                                   confidentiality_hash[['Demo']]     ,
  #                                   confidentiality_hash[['Racial']]   ,
  #                                   confidentiality_hash[['Political']],
  #                                   confidentiality_hash[['Religious']],
  #                                   confidentiality_hash[['Sexual']]   ,
  #                                   confidentiality_hash[['Criminal']] ,
  #                                   confidentiality_hash[['Health']]   ,
  #                                   # confidentiality_hash[['Other']]    ,
  # 
  # )
  confidentiality_hash
}


first_letter_uppercase_grep <- function(paragraph){
  
  re <- c()
  for (i in 1:length(paragraph)){
  
    sentences <- unlist(strsplit(paragraph[i], "\\. "))
    if (grepl("^[0-9]", paragraph[i]) ){
      
      re <- c(re,F)
    }else{
      if (any(!grepl("^[A-Z]", sentences))){
        re <- c(re,T)
      }
      else{
        re <- c(re,F)
      }
    }
    

  }
  re
  
}

count_uppercase <- function(text) {
  
  words <- unlist(strsplit(text, "[[:punct:] ]"))
  words <- words[words != ""]
  uppercase_count <- str_count(words, "[A-Z]")
  return(uppercase_count)
}

# first_uppercase_letter_grep <- function(text){
#   
# }

uppercase_grep <- function(text,maxi_uppercase=2){
  re <- c()
  for (i in 1:length(text)){
    
    re <- c(re,any(count_uppercase(text[i])>maxi_uppercase))
  }
    
  re
}

mid_uppercase_grep <- function(text){
  grepl("[a-z]+[A-Z]+[a-z]+", text)
}


punctuation_grep <- function(text){
  special_punctuation_pattern <- "[[:punct:]]"
  grepl(special_punctuation_pattern, text)
}

# replace_punc <- function(puncs,punc_to,text)


get_val_issue <- function(value_label_list){
  value_quality_hash <- hash()
  special_punctuation_pattern <- "[[:punct:]]"
  value_quality_hash['Uppercase'] <- union(which(uppercase_grep(text=value_label_list)),which(first_letter_uppercase_grep(paragraph = value_label_list))) %>%
    union(which(mid_uppercase_grep(value_label_list)))
    
    
  value_quality_hash['Punctuation'] <- which(grepl(special_punctuation_pattern, value_label_list))
  
  value_quality_hash
}


spss_val_syntax <- function(var_name,val_num,val_names){
  t_str <- paste0('VALUE LABELS ',var_name)
  
  for (v in 1:length(val_num)){
    t_str <- paste0(t_str,"\n", val_num[v], ' "',val_names[v],'"')
    
  }
  t_str <- paste0(t_str,'.\n')
  t_str
}


spss_convert_syntax <- function(filename,postfix){
  t_str <- paste0("SAVE TRANSLATE OUTFILE='",filename,'_STATA_',postfix,".dta'\n/TYPE=STATA\n/VERSION=12\n/EDITION=SE\n/MAP\n/REPLACE.\n\n\n")
  
  t_str <- paste0(t_str,'SAVE TRANSLATE OUTFILE="',filename,'_SAS_',postfix,'.sas7bdat"\n/TYPE=SAS\n/VERSION=9\n/PLATFORM=WINDOWS\n/ENCODING="UTF8"\n/MAP\n/REPLACE\n/VALFILE="',filename,'_SAS_',postfix,'.sas".\n\n')
  
  t_str <- paste0(t_str,'SAVE TRANSLATE OUTFILE="',filename,'_CSV_',postfix,'.csv"\n/TYPE=CSV\n/ENCODING="UTF8"\n/MAP\n/REPLACE\n/FIELDNAMES\n/CELLS=VALUES.\n')
  
  t_str
}
