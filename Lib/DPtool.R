

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

  
  a1[unname(val_labels(d1))] <- names(val_labels(d1))
  a2[unname(val_labels(d2))] <- names(val_labels(d2))

  if (is_empty(d3)){

    view(data.frame(a1,a2))

  }else{

    a3[unname(val_labels(d3))] <- names(val_labels(d3))
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
  age_data <- as.vector(data$p_age)

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
  #' @param colour
  #' @param n
  #' @param lighter
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
  
  values <- as.double(val_labels(data_var))
  names(values) <- names(val_labels(data_var))
  
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
  
  values <- as.integer(val_labels(data_var))
  names(values) <- names(val_labels(data_var))
  
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
  
  values <- as.character(val_labels(data_var))
  names(values) <- names(val_labels(data_var))
  
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
  variable_label <- val_labels(data_t)
  data_t <- data
  for (v in var){
    t <- data_t[[v]]
    posi_from_value <- match(from_values,val_labels(t))
    posi_from_value <- posi_from_value[!is.na(posi_from_value)]
    val_labels(t)[posi_from_value] <- to_values
    
    
    if (sort_flag){
      val_labels(t) <- sort(val_labels(t))
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
