

# Library loading ---------------------------------------------------------
library(shiny)
library(shinyalert)
library(rhandsontable)
library(ggplot2)
library(tidyverse)
library(foreign)
library(haven)
library(DT)
# library(fs)
library (labelled)
library (dplyr)              # Managing the functions using pipes %>%
library (sjlabelled)         # Supports 'rename_at', 'var_labels' and 'add_value_labels' functions
library (Hmisc)
library(hash)
source('../Lib/DPtool.R')
# library(AMR)




# Function def ------------------------------------------------------------


callback <- c(
  "var tbl = $(table.table().node());",
  "var id = tbl.closest('.datatables').attr('id');",
  "function onUpdate(updatedCell, updatedRow, oldValue) {",
  "  var cellinfo = [{",
  "    row: updatedCell.index().row + 1,",
  "    col: updatedCell.index().column + 1,",
  "    value: updatedCell.data()",
  "  }];",
  "  Shiny.setInputValue(id + '_cell_edit:DT.cellInfo', cellinfo);",
  "}",
  "table.MakeCellsEditable({",
  "  onUpdate: onUpdate,",
  "  inputCss: 'my-input-class',",
  "  columns: [1,3,4],",
  "  confirmationButton: {",
  "    confirmCss: 'my-confirm-class',",
  "    cancelCss: 'my-cancel-class'",
  "  },",
  "  inputTypes: [",
  # "    {",
  # "      column: 1,",
  # "      type: 'list',",
  # "      options: [",
  # "        {value: '', display: ''},",
  # "        {value: 'DPII', display: 'DPII'},",
  # "        {value: 'Demo', display: 'Demo'}",
  # "      ]",
  # "    },",
  "    {",
  "      column: 1,",
  "      type: 'list',",
  "      options: [",
  "        {value: '', display: ''},",
  "        {value: 'DPII', display: 'DPII'},",
  "        {value: 'Demo', display: 'Demo'},",
  "        {value: 'Racial', display: 'Racial'},",
  "        {value: 'Political', display: 'Political'},",
  "        {value: 'Religious', display: 'Religious'},",
  "        {value: 'Sexual', display: 'Sexual'},",
  "        {value: 'Criminal', display: 'Criminal'},",
  "        {value: 'Health', display: 'Health'},",
  "        {value: 'Other', display: 'Other'},",
  "      ]",
  "    }",
  "  ]",
  "});"
)


callback_dict <- c(
  "var tbl = $(table.table().node());",
  "var id = tbl.closest('.datatables').attr('id');",
  "function onUpdate(updatedCell, updatedRow, oldValue) {",
  "  var cellinfo = [{",
  "    row: updatedCell.index().row + 1,",
  "    col: updatedCell.index().column + 1,",
  "    value: updatedCell.data()",
  "  }];",
  "  Shiny.setInputValue(id + '_cell_edit:DT.cellInfo', cellinfo);",
  "}",
  "table.MakeCellsEditable({",
  "  onUpdate: onUpdate,",
  "  inputCss: 'my-input-class',",
  "  columns: [5,6],",
  "  confirmationButton: {",
  "    confirmCss: 'my-confirm-class',",
  "    cancelCss: 'my-cancel-class'",
  "  },",
  "  inputTypes: [",
  
  "  ]",
  "});"
)




get_value_info <- function(spss_data){
  value_info <- look_for(spss_data, details = T)%>%  
    lookfor_to_long_format() %>% 
    convert_list_columns_to_character()
  
  value_info <- value_info[,c(1,2,3,5)]
  colnames(value_info) <- c( 'Serial', 'Name', 'Variable_label', 'Value_labels')
  return (value_info)
}

get_var_info <- function(spss_data){
  var_info <- look_for(spss_data) %>%                        # extract variable information from spss data
    # lookfor_to_long_format() %>%                           # Expand the table by value label, Cartesian product with value label
    convert_list_columns_to_character() %>%
    subset(select = c(pos,variable,label))
  return (var_info)
}



shinyServer( function(input, output,session) {
  ####################################################################
  #########################upload data server#########################
  ####################################################################
  uploadedFiles <- reactiveValues(files = data.frame(
    Filename = character(),
    Size = numeric(),
    Type = character(),
    Path = character(),
    stringsAsFactors = FALSE
  ))
  
  data_sav <- reactiveVal(NULL)
  
  # spss_syntax_auto <- character(0)
  
  argparse <- reactiveValues(data_freq = NULL,
                             dataset_name=NULL,
                             varName   = NULL,
                             var_info  = NULL,
                             value_info =NULL,
                             varLabel  = NULL,
                             tabflag=FALSE
  )
  
  
  
  output$fileInfoTable <- DT::renderDataTable({
    DT::datatable(uploadedFiles$files,
                  rownames = FALSE,
                  options = list(pageLength = 10,
                                 dom = 't',
                                 columnDefs = list(list(className = 'dt-center', targets = "_all"))),
                  selection = list(mode = "multiple", target = "row"),
                  escape = FALSE)
  })
  
  observeEvent(input$files, {
    if (!is.null(input$files)) {
      for (i in 1:length(input$files$datapath)) {
        filename <- input$files$name[i]
        size <- file.info(input$files$datapath[i])$size
        type <- tools::file_ext(input$files$name[i])
        path <- input$files$datapath[i]
        uploadedFiles$files <- rbind(uploadedFiles$files, data.frame(
          Filename = filename,
          Size = size,
          Type = type,
          Path = path,
          stringsAsFactors = FALSE
        ))
      }
    }
  })
  
  observeEvent(input$clearButton, {
    uploadedFiles$files = data.frame(
      Filename = character(),
      Size = numeric(),
      Type = character(),
      Path = character(),
      stringsAsFactors = FALSE
    )
  })
  
  test_txt <- reactiveVal("Initial text") 
  
  observeEvent(input$loadButton, {
    
    
    
    
    selected_rows <- input$fileInfoTable_rows_selected

    if (length(selected_rows) > 0) {
      if (uploadedFiles$files[selected_rows,]$Type=='sav'){
        data_sav(read_sav(uploadedFiles$files[selected_rows,]$Path) )
        cat('data loaded \n')
        argparse$spss_syntax_var <- character(0)
        argparse$spss_syntax_val <-  character(0)
        argparse$spss_data <- data_sav()
        argparse$var_info <-   look_for(argparse$spss_data) %>%
          lookfor_to_long_format() %>%
          convert_list_columns_to_character()
        
        argparse$varlabel <-   labelled::var_label(argparse$spss_data)  
        
        test_txt(append(test_txt(),'var info compeleted'))
        fr<- lapply(argparse$spss_data, function(x) { return(questionr::freq(x)) })
        argparse$data_freq <- get_data_frequency(argparse$var_info,fr)
        col_names_freq <- colnames(argparse$data_freq)
        
        argparse$data_freq <- cbind(rep('',nrow(argparse$data_freq)), argparse$data_freq )
        argparse$data_freq <- cbind(rep('',nrow(argparse$data_freq)), argparse$data_freq ) 
        # argparse$data_freq <- cbind(argparse$data_freq.rep('',nrow(argparse$data_freq))) 
        colnames(argparse$data_freq) <- c('Flag','Issues',col_names_freq)
        
        argparse$val_issue <- get_val_issue(unname(argparse$data_freq$Value_labels))
        
        # print(argparse$val_issue)
        
        for (i in names(argparse$val_issue )){
          if(length(argparse$val_issue [[i]])>0){
            argparse$data_freq[[2]][argparse$val_issue [[i]]]<- i
            
          }
        }
        
        argparse$data_freq_ori <- argparse$data_freq
        
        argparse$dataset_name <- tools::file_path_sans_ext(uploadedFiles$files[selected_rows,]$Filename)
        argparse$var_name_ori <-    colnames(data_sav())
        
        cat('all kind of table created. \n')
        
        argparse$var_view_info <- look_for(argparse$spss_data,labels = F,details = F)
        emp <- rep('',nrow(argparse$var_view_info))
        argparse$var_view_info <- cbind(emp,emp,argparse$var_view_info)
        
        
        
        colnames(argparse$var_view_info) <- c('Flag','DRAT','Position','Variable Name','Variable Label')
        # print( argparse$var_view_info)
        argparse$issue <- get_confidential_issue(argparse$varlabel)
        
        for (i in names(argparse$issue )){
          if(length(argparse$issue [[i]])>0){
            argparse$var_view_info[[2]][argparse$issue [[i]]]<- i
            
          }
        }
        argparse$var_view_info_ori <- argparse$var_view_info 
        
        argparse$value_info <- 1
        
        argparse$tabflag <-    T
        
        
        
        updateTabsetPanel(session, "tabs", selected = "panel2")
        # test_txt(as.character(argparse$data_freq))
        changes_var$updated_rows   = numeric(0)
        changes_var$updated_cols   =  numeric(0)
        changes_var$updated_posi   = character(0)
        changes_var$updated_values   = character(0)
        changes_val$updated_rows   = numeric(0)
        changes_val$updated_cols   =  numeric(0)
        changes_val$updated_posi   = character(0)
        changes_val$updated_values = character(0)
        
        
        
      } else if (uploadedFiles$files[selected_rows,]$Type=='rds'){
        cat('read RDS data')
        rds_arg <- readRDS(uploadedFiles$files[selected_rows,]$Path)
        data_sav(rds_arg$data_ori)
        cat('read data_sav ')
        # argparse <- rds_arg$argparse_b
        # changes_var <- rds_arg$changes_var
        # changes_val <- rds_arg$changes_val
        # print(rds_arg$changes_var$updated_posi)
        # 
        # 
        
        
        argparse$spss_data <- rds_arg$argparse_b$spss_data
        argparse$spss_syntax_var <- rds_arg$argparse_b$spss_syntax_var
        argparse$spss_syntax_val <- rds_arg$argparse_b$spss_syntax_val
        argparse$var_info  <- rds_arg$argparse_b$var_info
        argparse$varlabel  <- rds_arg$argparse_b$varlabel
        argparse$var_name_ori <-    rds_arg$argparse_b$var_name_ori
        
        argparse$data_freq <- rds_arg$argparse_b$data_freq
        argparse$data_freq_ori<- rds_arg$argparse_b$data_freq_ori

        argparse$dataset_name  <- rds_arg$argparse_b$dataset_name
        argparse$varName       <- rds_arg$argparse_b$varName

        argparse$var_view_info<- rds_arg$argparse_b$var_view_info

        argparse$issue        <- rds_arg$argparse_b$issue
        argparse$val_issue    <- rds_arg$argparse_b$val_issue
        argparse$var_view_info_ori <- rds_arg$argparse_b$var_view_info_ori

        argparse$value_info <- rds_arg$argparse_b$value_info
        argparse$tabflag <- rds_arg$argparse_b$tabflag

        changes_var$updated_rows  <- rds_arg$changes_var$updated_rows
        changes_var$updated_cols  <- rds_arg$changes_var$updated_cols
        changes_var$updated_posi  <- rds_arg$changes_var$updated_posi
        changes_var$updated_values<- rds_arg$changes_var$updated_values
        changes_val$updated_rows  <- rds_arg$changes_val$updated_rows
        changes_val$updated_cols  <- rds_arg$changes_val$updated_cols
        changes_val$updated_posi  <- rds_arg$changes_val$updated_posi
        changes_val$updated_values<- rds_arg$changes_val$updated_values

        updateTabsetPanel(session, "tabs", selected = "panel2")
        
        
      }else{
        test_txt('plz upload .sav or previous saved .rds file')
      }
      
      
     
      
    }
    
    
    
  })
  
  
  ################################################################################
  ##############################  data frequency table  ##################################
  ################################################################################
  
  
  output$data_freq_table <- DT::renderDT(
    argparse$data_freq[c(-1,-2)], # remove table identifier
    # editable = T,
    filter="top",
    extensions = "Buttons",
    options = list(
      dom = "Bfrtip",
      paging = FALSE,
      searching = T,
      # buttons=list(list(extend = "csv",exportOptions = list(modifier = list(search = "applied"))))
      buttons = 
        list('copy', 'print', list(
          extend = 'collection',
          buttons = c('csv', 'excel', 'pdf'),
          text = 'Download table as'
        ))
      
      )

    )
  
  
  output$downloadButton_freq <- downloadHandler(
    filename = function() {
      paste("ADA_DataDictionary", ".zip", sep = "")
    },
    content = function(file) {
      # Generate .docx files when download button is clicked
      if (length(argparse$spss_data)>0) {
        # print(1)
        withProgress(message = 'Knitting to Word...', {
          # print(2)
          knit_filelist <- c()
          # for (i in 1:length(uploadedFiles$files$Path)) {

          
          # print(4)
          params <- list(data_sav=argparse$spss_data,
                         doc_title = 'ADA_DataDictionary_Freq_Markdown' ,
                         author='')

            
          write.csv(argparse$data_freq[c(-1,-2)],file = "ADA_DataDictionary_Freq.csv",row.names = FALSE)
          rmarkdown::render("~/../Rcode/0.ADA_DataDictionary_Freq_Markdown v0.1(For knit).Rmd",output_format = 'word_document',
                                output_file = 'ADA_DataDictionary_Freq_Markdown.docx',
                                params = params,
                                envir = new.env()
              )
              
              
          knit_filelist <- c('ADA_DataDictionary_Freq_Markdown.docx','ADA_DataDictionary_Freq.csv')  
            
            
            
            
          # }

          zip(zipfile = file, files = knit_filelist)
          
          
          
        })
      }
    },
    contentType = "application/zip"
  )
  
  
  
  ################################################################################
  # Variable view  #############################    ##################################
  ################################################################################

  
  output[["dt_var_view"]] <- renderDT({
    # var_tb<- argparse$var_view_info[]
    
    if (length(argparse$var_view_info)>0) {
      dtable <- datatable(argparse$var_view_info,
                          rownames = FALSE,
                          callback = JS(callback),
                          options = list(dom = 'PBfrtip', 
                                         paging = FALSE,
                                         columnDefs = list( 
                                           
                                           list(searchPanes = list(show = FALSE), targets = 3:4),
                                           list(targets = 0, orderable = FALSE, className = "select-checkbox"),
                                           list(className = 'dt-center', targets = "_all")
                                         ),
                                         buttons =
                                           list('copy', 'print', list(
                                             extend = 'collection',
                                             buttons = c('csv', 'excel', 'pdf'),
                                             text = 'Download table as'
                                           )),
                                         select = list(
                                           style = "multi", selector = "td:first-child"
                                         )
                                         
                                         
                          ),
                          extensions = c('Select', 'SearchPanes','Buttons'),
                          selection = 'none'
                          
      )
      
      
      path <- './js/' # folder containing the files dataTables.cellEdit.js
      # and dataTables.cellEdit.css
      dep <- htmltools::htmlDependency(
        "CellEdit", "1.0.19", path,
        script = "dataTables.cellEdit.js", stylesheet = "dataTables.cellEdit.css",
        all_files = FALSE)
      dtable$dependencies <- c(dtable$dependencies, list(dep))
      dtable
    }
    },
  server = FALSE
  #
  
  
  
  )
  
#   selected_rows <- reactiveVal(integer(0))
#   
#   observeEvent(input$dt_var_view_rows_selected, {
#     selected_rows(input$dt_var_view_rows_selected)
#   })
#   
#   output$selected_rows_ui <- renderUI({
#     if (length(selected_rows()) > 0) {
#       selectInput(
#         "selected_rows_input",
#         "Selected Rows:",
#         choices = selected_rows(),
#         multiple = TRUE
#       )
#     } else {
#       HTML("<p>No rows selected.</p>")
#     }
#   })
# }
#   
  

  output$selectedRows <- renderPrint({
    # Get selected rows
    selected_rows <- input$dt_var_view_rows_selected
    if (length(selected_rows )> 0) {
      selected_data <- argparse$var_view_info[selected_rows, 4]
      selected_data 
      } else {
        NULL
        }
  })
  
  
  changes_var <- reactiveValues(
    updated_rows = numeric(0),
    updated_cols =  numeric(0),
    updated_posi = character(0),
    updated_values = character(0),
    
  )
  
  observeEvent(input$delete_var_button,{
    if (!is.null(input$dt_var_view_rows_selected)) {
      
        shinyalert(
          title = "Are you sure to delete the selected variables?",
          text = "Click on Yes to contitue",
          size = "s", 
          closeOnEsc = TRUE,
          closeOnClickOutside = TRUE,
          html = FALSE,
          type = "warning",
          showConfirmButton = TRUE,
          showCancelButton = TRUE,
          confirmButtonText = "Yes",
          confirmButtonCol = "#AEDEF4",
          cancelButtonText = "Cancel",
          timer = 0,
          inputId = "var_delete_confirm",
          imageUrl = "",
          animation = TRUE,
          callbackR = function(value){
            if (value) {
              var_contain <- argparse$var_view_info[input$dt_var_view_rows_selected, 3]
              changes_var$updated_rows <- c(changes_var$updated_rows, input$dt_var_view_rows_selected)
              changes_var$updated_cols <- c(changes_var$updated_cols, rep(-1,length(input$dt_var_view_rows_selected)))
              changes_var$updated_posi <-c(changes_var$updated_posi, var_contain)
              
              changes_var$updated_values <- c(changes_var$updated_values, rep('deleted',length(input$dt_var_view_rows_selected)))
              
              # argparse$spss_data <-argparse$spss_data[-var_contain] 
              argparse$var_view_info <- argparse$var_view_info[-as.numeric(input$dt_var_view_rows_selected),]
              # argparse$var_name_ori <- argparse$var_name_ori[-as.numeric(input$dt_var_view_rows_selected)]
              
              idx <- which(argparse$data_freq[,3] %in% var_contain)
              argparse$data_freq <- argparse$data_freq[-idx,]
              
              argparse$spss_syntax_var <- paste0(argparse$spss_syntax_var,"DELETE VARIABLES ",paste(argparse$var_view_info[input$dt_var_view_rows_selected, 4],collapse = ' ') , '.\n\n') 
              
              
              print('the selected row has been deleted, ')
              
              
            }
            
          }
          
        )
      
      
      

      
      
      
      
    }
  })
  
  
  
  observeEvent(input$dt_var_view_cell_edit, {
    

    info <- input$dt_var_view_cell_edit
    # str(info)
    
    if (info$col<=5 & info$col>3){
      # print('variable edits')
      modified_df <- argparse$var_view_info
      variable_full <- colnames(argparse$spss_data)
      
      
      if (!is.null(info$value)) {
        
        changes_var$updated_rows <- c(changes_var$updated_rows, info$row)
        changes_var$updated_cols <- c(changes_var$updated_cols, info$col)
        changes_var$updated_posi <-c(changes_var$updated_posi,modified_df[info$row, 3])
        
        changes_var$updated_values <- c(changes_var$updated_values, info$value)
      }
      
      modified_df[info$row, info$col] <- info$value
      variable_full[modified_df[info$row, 3]] <- info$value
      if  (info$col==4){
        
        colnames(argparse$spss_data) <-  variable_full
        
        idx_var<- which(argparse$data_freq$Position==modified_df[info$row, 3])
        argparse$data_freq$Variable[idx_var] <- info$value
        
        argparse$spss_syntax_var <- paste0(argparse$spss_syntax_var,'RENAME VARIABLES (', argparse$var_view_info[info$row, 4],' = ',info$value,' ).\n\n')


      }

      
      if (info$col==5){
        
        labelled::var_label(argparse$spss_data)[modified_df[info$row, 3]] <- info$value  
        idx_var<- which(argparse$data_freq$Position==modified_df[info$row, 3])
        argparse$data_freq$Label[idx_var] <- info$value
        
        argparse$spss_syntax_var <- paste0(argparse$spss_syntax_var,'VARIABLE LABELS ', argparse$var_view_info[info$row, 4],' "',info$value,'".\n\n')
        
      }
      
      
     
      argparse$var_view_info <- modified_df
      
      
      
      
      
      
    }else if(info$col>5){
      print('value edit')
      modified_df <- argparse$data_freq
      
      if (!is.null(info$value) & !modified_df[info$row, info$col] ==info$value) {
        
        
        changes_val$updated_rows <- c(changes_val$updated_rows, info$row)
        changes_val$updated_cols <- c(changes_val$updated_cols, info$col)
        changes_val$updated_posi <- c(changes_val$updated_posi,argparse$data_freq[info$row,3])
        changes_val$updated_values <- c(changes_val$updated_values, info$value)
        
        
        
      }
      
      
      modified_df[info$row, info$col] <- info$value
      argparse$data_freq <- modified_df
      
      idx <- which(argparse$data_freq[,3]==argparse$data_freq[info$row,3])
      value_up <- as.double(argparse$data_freq[idx,]$Value)
      names(value_up) <- argparse$data_freq[idx,]$Value_labels
      var_name_t <- argparse$data_freq[idx,4][1]
      attributes(argparse$spss_data[[var_name_t]])$labels <- value_up

      
      # argparse$spss_syntax_val <- paste0(argparse$spss_syntax_val, spss_val_syntax(var_name_t,value_up,argparse$data_freq[idx,]$Value_labels))
      # 
      # print( argparse$spss_syntax_val)
      # 
    }
    

    
  })
  
  
  output$summary_variable_edits <- renderPrint({
    if (length(changes_var$updated_rows) > 0) {
      updated_info <- data.frame(
        Row = changes_var$updated_posi,
        Action = changes_var$updated_values
      )
      updated_info
    } else {
      "No changes recorded yet."
    }
  })
  
  # Reset button action
  observeEvent(input$reset_var_button, {
    # print(1)
    if (length(changes_var$updated_rows)>0){
      shinyalert(
        title = "Are you sure to reset all variable changes?",
        text = "Click on Yes to contitue",
        size = "s", 
        closeOnEsc = TRUE,
        closeOnClickOutside = TRUE,
        html = FALSE,
        type = "warning",
        showConfirmButton = TRUE,
        showCancelButton = TRUE,
        confirmButtonText = "Yes",
        confirmButtonCol = "#AEDEF4",
        cancelButtonText = "Cancel",
        timer = 0,
        inputId = "var_reset_confirm",
        imageUrl = "",
        animation = TRUE,
        callbackR = function(value){
          if (value) {
            changes_var$updated_rows <- numeric(0)
            changes_var$updated_cols <- numeric(0)
            changes_var$updated_posi <- character(0)
            changes_var$updated_values <- character(0)
            
            argparse$spss_syntax_var <- character(0)
            
            argparse$var_view_info <- argparse$var_view_info_ori
            colnames(argparse$spss_data) <- colnames(data_sav())
            labelled::var_label(argparse$spss_data) <-  labelled::var_label(data_sav())
            
            posi_left<- argparse$data_freq$Position
            posi_from_freq <- which(argparse$data_freq_ori$Position %in% posi_left)
            print(posi_from_freq)
          
            
            t <- argparse$data_freq_ori[6:7] 
            t[posi_from_freq,] <- argparse$data_freq[6:7]
            # print(2)
            argparse$data_freq<- argparse$data_freq_ori
            # print(head(argparse$data_freq[6:7],10))
            argparse$data_freq[6:7] <- t
            # print(head(t,10))
            print('the tabel has been rested, ')

            
          }
          
        }
        
      )
    }


  })
  
  observeEvent(input$check_button, {
    updateTabsetPanel(session, "tabs", selected = "panel4")
    
    selected_rows <- input$dt_var_view_rows_selected
    if (length(selected_rows )> 0) {
      selected_data <- argparse$var_view_info[selected_rows, 4]
      
    } else {
      selected_data <- NULL
    }
    
    updateSelectizeInput(session, "selected_var_box", choices = selected_data, 
                         # selected = selected_rows
                         )
    
  })
  
  
  
  observeEvent(input$export_var_button, {

    
  })
  
  
  
  
  ######################### Value view ################################
  
  output$dt_value_view <- renderDT({
    # var_tb<- argparse$var_view_info[]

    if (length(argparse$data_freq)>0) {
      dtable_value <- datatable(argparse$data_freq,
                          rownames = FALSE,
                          
                          callback = JS(callback_dict),
                          options = list(dom = 'PBlfrtip',
                                         paging = FALSE,
                                         rowGroup = list(dataSrc=c(3,4)),

                                         columnDefs = list(
                                           list(visible=FALSE, targets=c(0,2,3,4)),
                                           list(searchPanes = list(show = FALSE), targets = 2:7)
                                           # list(targets = 0, orderable = FALSE, className = "select-checkbox"),
                                           # list(className = 'dt-center', targets = "_all")
                                         ),
                                         buttons =
                                           list(c('selectAll', 'selectNone'),'copy', 'print', list(
                                             extend = 'collection',
                                             buttons = c('csv', 'excel', 'pdf'),
                                             text = 'Download table as'
                                           )
                                           
                                           
                                           ),
                                         select = list(style = 'os', items = 'row')

                          ),
                          extensions = c( 'Select',
                                        'SearchPanes',
                                         'Buttons','RowGroup'),
                          selection = 'none'

      )


      path <- './js/' # folder containing the files dataTables.cellEdit.js
      # and dataTables.cellEdit.css
      dep <- htmltools::htmlDependency(
        "CellEdit", "1.0.19", path,
        script = "dataTables.cellEdit.js", stylesheet = "dataTables.cellEdit.css",
        all_files = FALSE)
      dtable_value$dependencies <- c(dtable_value$dependencies, list(dep))
      dtable_value
    }
  },
  server = FALSE
  )


  
  
  changes_val <- reactiveValues(
    updated_rows = numeric(0),
    updated_cols =  numeric(0),
    updated_posi = character(0),
    updated_values = character(0),
    
  )
  
  
  output$val_sumary  <- renderPrint({
      if (length(changes_val$updated_rows) > 0) {
        
        
        names_var <- c()
        for (i in 1:length(changes_val$updated_posi )){
          
          names_var <-c(names_var,argparse$data_freq_ori$Variable[which(argparse$data_freq_ori$Position %in% changes_val$updated_posi[i])][1]) 
          
        }
        
        
        updated_info <- data.frame(
          # Names = argparse$data_freq[changes_val$updated_posi,4],
          Names = names_var,
          
          New_Value = changes_val$updated_values
        )
        updated_info
      } else {
        "No changes recorded yet."
      }
    })
  
  
  observeEvent(input$dt_value_view_cell_edit, {

    info <- input$dt_value_view_cell_edit
    # str(info)

    if (info$col<=5 & info$col>3){
      # print('variable edits')
      modified_df <- argparse$var_view_info
      variable_full <- colnames(argparse$spss_data)
      
      
      if (!is.null(info$value)) {
        
        changes_var$updated_rows <- c(changes_var$updated_rows, info$row)
        changes_var$updated_cols <- c(changes_var$updated_cols, info$col)
        changes_var$updated_posi <-c(changes_var$updated_posi,modified_df[info$row, 3])
        
        changes_var$updated_values <- c(changes_var$updated_values, info$value)
      }
      
      modified_df[info$row, info$col] <- info$value
      variable_full[modified_df[info$row, 3]] <- info$value
      if  (info$col==4){
        
        colnames(argparse$spss_data) <-  variable_full
        
        idx_var<- which(argparse$data_freq$Position==modified_df[info$row, 3])
        argparse$data_freq$Variable[idx_var] <- info$value
        
        argparse$spss_syntax_var <- paste0(argparse$spss_syntax_var,'RENAME VARIABLES (', argparse$var_view_info[info$row, 4],' = ',info$value,' ).\n\n')
        
        
      }
      
      
      if (info$col==5){
        
        labelled::var_label(argparse$spss_data)[modified_df[info$row, 3]] <- info$value  
        idx_var<- which(argparse$data_freq$Position==modified_df[info$row, 3])
        argparse$data_freq$Label[idx_var] <- info$value
        
        argparse$spss_syntax_var <- paste0(argparse$spss_syntax_var,'VARIABLE LABELS ', argparse$var_view_info[info$row, 4],' "',info$value,'".\n\n')
        
      }
      
      
      
      argparse$var_view_info <- modified_df
      
      
      

      
      
    }else if(info$col>5){
      print('value edit')
      modified_df <- argparse$data_freq
      
      if (!is.null(info$value) & !modified_df[info$row, info$col] ==info$value) {
        
        
        changes_val$updated_rows <- c(changes_val$updated_rows, info$row)
        changes_val$updated_cols <- c(changes_val$updated_cols, info$col)
        changes_val$updated_posi <- c(changes_val$updated_posi,argparse$data_freq[info$row,3])
        changes_val$updated_values <- c(changes_val$updated_values, info$value)
        
        
        
      }
      
      
      modified_df[info$row, info$col] <- info$value
      argparse$data_freq <- modified_df
      
      

      idx <- which(argparse$data_freq[,3]==argparse$data_freq[info$row,3])
      value_up <- as.double(argparse$data_freq[idx,]$Value)
      names(value_up) <- argparse$data_freq[idx,]$Value_labels
      var_name_t <- argparse$data_freq[idx,4][1]
      cat(var_name_t)
      attributes(argparse$spss_data[[var_name_t]])$labels <- value_up
      
      
      # argparse$spss_syntax_val <- paste0(argparse$spss_syntax_val, spss_val_syntax(var_name_t,value_up,argparse$data_freq[idx,]$Value_labels))
      # print(spss_val_syntax(var_name_t,value_up,argparse$data_freq[idx,]$Value_labels))
      # 
      
    }
    

    

    
    
  }
  )
  
  
  observeEvent(input$reset_val_button, {
    if(length(changes_val$updated_rows)>0 )
    shinyalert(
      title = "Are you sure to reset all value changes?",
      text = "Click on Yes to contitue",
      size = "s", 
      closeOnEsc = TRUE,
      closeOnClickOutside = TRUE,
      html = FALSE,
      type = "warning",
      showConfirmButton = TRUE,
      showCancelButton = TRUE,
      confirmButtonText = "Yes",
      confirmButtonCol = "#AEDEF4",
      cancelButtonText = "Cancel",
      timer = 0,
      inputId = "val_reset_confirm",
      imageUrl = "",
      animation = TRUE,
      callbackR = function(value){
        if (value) {

          
          changes_val$updated_rows <- numeric(0)
          changes_val$updated_cols <- numeric(0)
          changes_val$updated_posi <- character(0)
          changes_val$updated_values <- character(0)
          
          # argparse$spss_syntax_var <- character(0)
          posi_left <- argparse$var_view_info[,3]
          
          argparse$data_freq[6:7] <- argparse$data_freq_ori[which(argparse$data_freq_ori$Position %in% posi_left),][6:7]
          # argparse$data_freq[4:5] <- argparse$data_freq_ori[which(argparse$data_freq_ori$Position %in% posi_left),][4:5]
          argparse$val_issue <- get_val_issue(unname(argparse$data_freq$Value_labels))
          
          
          for (i in names(argparse$val_issue )){
            if(length(argparse$val_issue [[i]])>0){
              argparse$data_freq[[2]][argparse$val_issue [[i]]]<- i
              
            }
          }
          
        }
        
        
        place_hoder_1 <- colnames(argparse$spss_data)
        place_hoder_2 <- labelled::val_labels(argparse$spss_data)
        place_hoder_3 <- labelled::var_label(argparse$spss_data)
        argparse$spss_data <- data_sav()
        
        for (i in 1: length(place_hoder_1)){
          attributes(argparse$spss_data[[i]])$labels <- unlist(unname(place_hoder_2[i]))
          labelled::var_label(argparse$spss_data)[i] <-unlist(unname(place_hoder_3[i])) 
        }
        # var_label(argparse$spss_data) <- place_hoder_3
        colnames(argparse$spss_data) <- place_hoder_1
        # labelled::val_labels(argparse$spss_data) <- place_hoder_2
        
        
        
      }
      
    )
    
    
    
    

  })
  
  observeEvent(input$lower_maj, {
    
    selected_rows <- input$dt_value_view_rows_selected
    if (length(selected_rows )> 0) {
      # print(argparse$data_freq[selected_rows, 7])
      argparse$data_freq[selected_rows, 7] <- str_to_sentence(argparse$data_freq[selected_rows, 7])
      
      changes_val$updated_rows <- c(changes_val$updated_rows, selected_rows)
      changes_val$updated_cols <- c(changes_val$updated_cols, rep(7,length(selected_rows)))
      changes_val$updated_posi <- c(changes_val$updated_posi,argparse$data_freq[selected_rows,3])
      changes_val$updated_values <- c(changes_val$updated_values, str_to_sentence(argparse$data_freq[selected_rows, 7]))  

      
      var_contain <- unique(argparse$data_freq[selected_rows,]$Position)

      
      for (i in 1:length(var_contain)){
        idx <- which(argparse$data_freq[,3]==var_contain[i])
        var_name_t <- argparse$data_freq[idx,4][1]
        value_up <- as.double(argparse$data_freq[idx,]$Value)
        names(value_up) <- argparse$data_freq[idx,]$Value_labels
        attributes(argparse$spss_data[[var_name_t]])$labels <- value_up
        
      }
      
      
      
    } 
    


    
    
  })
  
  observeEvent(input$replace_punc, {
    
    selected_rows <- input$dt_value_view_rows_selected
    if (length(selected_rows )> 0) {
      # print(argparse$data_freq[selected_rows, 7])
      if (input$selectionType == 'Customize'){
        selected_punctuation <- input$customItems
        if (length(selected_punctuation)>0){
          pattern <- paste0("[", paste(selected_punctuation, collapse = ""), "]")  
          
          argparse$data_freq[input$dt_value_view_rows_selected,7] <- gsub(pattern, input$customItems_to, argparse$data_freq[input$dt_value_view_rows_selected,7])
          changes_val$updated_rows <- c(changes_val$updated_rows, selected_rows)
          changes_val$updated_cols <- c(changes_val$updated_cols, rep(7,length(selected_rows)))
          changes_val$updated_posi <- c(changes_val$updated_posi,argparse$data_freq[selected_rows,3])
          changes_val$updated_values <- c(changes_val$updated_values, str_to_sentence(argparse$data_freq[selected_rows, 7]))
          
        }
        
        
        
        
        
        
      }else{# all punc
        
        argparse$data_freq[input$dt_value_view_rows_selected,7] <- gsub("[[:punct:]]", input$customItems_to, argparse$data_freq[input$dt_value_view_rows_selected,7])
        changes_val$updated_rows <- c(changes_val$updated_rows, selected_rows)
        changes_val$updated_cols <- c(changes_val$updated_cols, rep(7,length(selected_rows)))
        changes_val$updated_posi <- c(changes_val$updated_posi,argparse$data_freq[selected_rows,3])
        changes_val$updated_values <- c(changes_val$updated_values, str_to_sentence(argparse$data_freq[selected_rows, 7]))
        
      }
      # argparse$data_freq[selected_rows, 7] <- str_to_sentence(argparse$data_freq[selected_rows, 7])
      # 
      # changes_val$updated_rows <- c(changes_val$updated_rows, selected_rows)
      # changes_val$updated_cols <- c(changes_val$updated_cols, rep(7,length(selected_rows)))
      # # changes_var$updated_posi <- 
      # changes_val$updated_values <- c(changes_val$updated_values, str_to_sentence(argparse$data_freq[selected_rows, 7]))  
      
      
      
      
      var_contain <- unique(argparse$data_freq[selected_rows,]$Position)
      for (i in 1:length(var_contain)){
        idx <- which(argparse$data_freq[,3]==var_contain[i])
        var_name_t <- argparse$data_freq[idx,4][1]

        value_up <- as.double(argparse$data_freq[idx,]$Value)

        names(value_up) <- argparse$data_freq[idx,]$Value_labels

        attributes(argparse$spss_data[[var_name_t]])$labels <- value_up
        
        
      }
        
        
      
    } 
  })
  
  

  
  
  
  
  ################################################################################
  ############################## risk assessment   ##################################
  ################################################################################

  #need observation envent to spss data. or refresh button(preferenced. cause there are lot of changed, do not refresh every time , it cause lot of laggy.)
  
  output$selected_var_info <- renderPrint({
    
    selected_rows <- input$dt_var_view_rows_selected
    if (length(selected_rows )> 0) {
      selected_info <- data.frame(
        Name = argparse$var_view_info[selected_rows, 4],
        Label = argparse$var_view_info[selected_rows, 5]
        
      )
      selected_info
      
    } else {
      "No variable selected yet."
    }
    
  })
  
  observeEvent(input$show_cross, {
    
    
  })
  
  
  output$cross_freq_tab <- renderDT({
    
    if(!is.null(input$selected_var_box)){
      cross_freq <- reshape2::melt(table( labelled::to_factor( argparse$spss_data[,(input$selected_var_box)]   )))
      posi <- match(input$selected_var_box,argparse$var_view_info$`Variable Name`)
      colnames (cross_freq) <- c(unname(argparse$var_view_info$`Variable Label`[posi]),     'Counts')
      cross_freq <- cross_freq[which(!cross_freq$Counts==0),]
      
      
      
      
      
      datatable(cross_freq, 
                options = list(
                  dom = "Bfrtip",
                  paging = FALSE,
                  searching = T,
                  buttons = 
                    list('copy', 'print', list(
                      extend = 'collection',
                      buttons = c('csv', 'excel', 'pdf'),
                      text = 'Download table as'
                    ))
                  
                )# list
      ) %>%
        formatStyle(
          columns = c(unname(argparse$var_view_info$`Variable Label`[posi]), 'Counts'),
          valueColumns = 'Counts',
          target = 'row',
          fontWeight = styleInterval(3, c('normal', 'bold')),
          backgroundColor = styleInterval(3, c('#FF6A6A', 'white'))#,#FF6A6A'#EE6363','#CD3333'lightcoral
        )

    }

    
  })
  

  
  observeEvent(input$show_cross, {
    
    
  })
  
  ################################################################################
  ##############################    ##################################
  ################################################################################
  
  output$textBoxOutput <- renderText({
    # Render the updated text in the text box
    test_txt()
  })
  
  
  

  ############################## Data quality    ##################################

  
  ############################### save and export ################################
  output$save_breakpoint <- downloadHandler(
    filename = function() {
      paste(argparse$dataset_name,sep='-',Sys.Date()) %>% 
        paste0('_breakpoint.rds')
    },
    
    content = function(file) {
      if(nrow(argparse$spss_data)>0){
        withProgress(message = 'Save as breakpoint...', {
          
          out <- list(
            data_ori=data_sav(),
          
            argparse_b=argparse,
            changes_val=changes_val,
            changes_var=changes_var
            
            
          )
            
          saveRDS(out, file)
        })
        
      }
      
    
    }
  )
  
  output$save_var_summary <- renderPrint({
    # print('print summary')
    if (length(changes_var$updated_rows) > 0) {
      # print(changes_var$updated_posi)
      extracted_values_list <- c()

      # print(extracted_values_list)
      deleted_index <- which(changes_var$updated_cols==-1)
      t_cols<- changes_var$updated_cols
      t_cols[deleted_index] <- rep(4,length(deleted_index))
      
      deleted_row_colname <- colnames(argparse$var_view_info)[ t_cols]
      for (i in 1:length(changes_var$updated_posi)){
        # print(data.frame(argparse$var_view_info_ori)[changes_var$updated_rows[i], changes_var$updated_cols[i]])
        extracted_values_list <- c(extracted_values_list,as.character(argparse$var_view_info_ori[changes_var$updated_rows[i],t_cols[i]] ))
        
      }

      deleted_row_colname[deleted_index] <- rep('deleted',length(deleted_index))
      updated_info <- data.frame(
        Position = changes_var$updated_posi,
        ChangedColumn = deleted_row_colname,
        OriginalValue = extracted_values_list,
        ChangeTo = changes_var$updated_values
      )
      updated_info
      # extracted_values_list
    } else {
      "No changes recorded yet."
    }
  })
  
  
  output$save_val_summary <- renderPrint({
    if (length(changes_val$updated_rows) > 0) {
      
      
      updated_info <- data.frame(
        Names = argparse$data_freq[changes_val$updated_rows,4],
        Original=paste(argparse$data_freq[changes_val$updated_rows,6],argparse$data_freq[changes_val$updated_rows,7],sep = ' : '),
        
        New_Value = paste(argparse$data_freq[changes_val$updated_rows,6],argparse$data_freq[changes_val$updated_rows,7],sep = ':')
      )
      updated_info
    } else {
      "No changes recorded yet."
    }
  })
  
  
  output$save_spss_name <- renderUI({
    
    textInput("spss_file_name", "Name of file:",value = argparse$dataset_name)

  })
  
  output$save_file_summary <- renderText({
    file_summary_str <- 'Data_processing_log.txt\n'
    if (input$save_sav){
      file_summary_str <- paste0(file_summary_str,input$spss_file_name,'_SPSS_',input$spss_file_version,'.sav\n')
      
    }
    if (input$save_stata){
      file_summary_str <- paste0(file_summary_str,input$spss_file_name,'_SPSS_',input$spss_file_version,'.dta\n')
      
    }
    
    if (input$save_sas){
      file_summary_str <- paste0(file_summary_str,input$spss_file_name,'_SPSS_',input$spss_file_version,'.sas7bdat\n')
      
    }
    
    if (input$save_csv){
      file_summary_str <- paste0(file_summary_str,input$spss_file_name,'_SPSS_',input$spss_file_version,'.csv\n')
      
    }
    
    if (input$translation_sps){
      file_summary_str <- paste0(file_summary_str,input$spss_file_name,'_format_convert.sps\n')
      
    }
    
    # if (input$translation_sps){
    #   file_summary_str <- paste0(file_summary_str,input$spss_file_name,'_format_convert.sps\n')
    #   
    # }
    file_summary_str
    

    
  })
  updates_variable <- function(){
    
  }
  
  
  output$save_spss_data_button <- downloadHandler(
    
    
    filename = function() {
      paste("output", ".zip", sep = "")
    },
    content = function(file) {
      withProgress(message = 'Saving Data...', {
        export_file_list <- c()
        
        spss_data_save <- argparse$spss_data
        # cat(file,'\n')
        root_path <- sub("/[^/]*$", "/", file)
        # log_file_path <- paste0(root_path,'Data_processing_log.txt')
        log_file_path <- 'Data_processing_log.txt'
        
        print('save log file')
        writeLines(paste0('Save at',Sys.time()," \n\n"),log_file_path)
        export_file_list <- c(export_file_list,log_file_path)
        print('saving rows')
        if (length(changes_val$updated_rows) > 0) {
          print('saving value')
          cat('Value changes info:\n', file = log_file_path,append = T)
          updated_info <- data.frame(
            Names = argparse$data_freq[changes_val$updated_rows,4],
            Original=paste(argparse$data_freq[changes_val$updated_rows,6],argparse$data_freq[changes_val$updated_rows,7],sep = ' : '),
            
            New_Value = paste(argparse$data_freq[changes_val$updated_rows,6],argparse$data_freq[changes_val$updated_rows,7],sep = ':')
          )
          print('saved tab')
          write.table(updated_info, file = log_file_path, append = TRUE, sep = "\t", col.names = TRUE)
          
          
        } else {
          cat('Value changes info: "No changes recorded yet."\n\n\n', file = log_file_path,append = T)
          
        }
        
        
        if (length(changes_var$updated_rows) > 0 ) {
          extracted_values_list <- c()
          
          # print(extracted_values_list)
          deleted_index <- which(changes_var$updated_cols==-1)

          t_cols<- changes_var$updated_cols
          t_cols[deleted_index] <- rep(4,length(deleted_index))
          
          deleted_row_colname <- colnames(argparse$var_view_info)[ t_cols]
          #########deal with deleted
          # cat(changes_var$updated_posi[deleted_index])
          if ( length(deleted_index)>0){
            spss_data_save <-argparse$spss_data[-c(as.integer(changes_var$updated_posi[deleted_index]))]
            
          }
          
          
          # print(spss_data_save)
          for (i in 1:length(changes_var$updated_posi)){
            # print(data.frame(argparse$var_view_info_ori)[changes_var$updated_rows[i], changes_var$updated_cols[i]])
            extracted_values_list <- c(extracted_values_list,as.character(argparse$var_view_info_ori[changes_var$updated_rows[i],t_cols[i]] ))
            
          }
          
          deleted_row_colname[deleted_index] <- rep('deleted',length(deleted_index))
          updated_info <- data.frame(
            Position = changes_var$updated_posi,
            ChangedColumn = deleted_row_colname,
            OriginalValue = extracted_values_list,
            ChangeTo = changes_var$updated_values
          )

          cat('Variable changes info:\n', file = log_file_path,append = T)
          write.table(updated_info, file = log_file_path, append = TRUE, sep = "\t", col.names = TRUE)
          cat('\n\n\n', file = log_file_path,append = T)
          # extracted_values_list
        } else {
          cat('Variable changes info: No changes recorded yet.\n\n\n', file = log_file_path,append = T)

        }

        print('log saved')
        
        if (input$save_sav){
          print('sav saved')
          save_sav_filepath<- paste0(input$spss_file_name,'_SPSS_',input$spss_file_version,'.sav')
          # print(save_sav_filepath)
          export_file_list <- c(export_file_list,save_sav_filepath)
          write_sav(spss_data_save,save_sav_filepath)

        }
        if (input$save_stata){
          save_filepath<- paste0(input$spss_file_name,'_STATA_',input$spss_file_version,'.dta')
          # print(save_filepath)
          export_file_list <- c(export_file_list,save_filepath)
          write_dta(spss_data_save,save_filepath)

        }
        if (input$save_sas){
          
          save_filepath<- paste0(input$spss_file_name,'_SAS_',input$spss_file_version,'.sas7bdat')
          # print(save_filepath)
          export_file_list <- c(export_file_list,save_filepath)
          write_sas(spss_data_save,save_filepath)
          

        }
        if (input$save_csv){
          save_filepath<- paste0(input$spss_file_name,'_CSV_',input$spss_file_version,'.csv')
          # print(save_filepath)
          export_file_list <- c(export_file_list,save_filepath)
          write_csv(spss_data_save,save_filepath)

        }
      
        if (input$process_sps){
          # cat(file,'\n')
          # spss_syntax_t <- paste0("cd ' ",file_path_sans_ext(file),"'. \n\n")
          
          format_convert_path <- paste0(input$spss_file_name,'_processing_syntax.sps')
          cat(paste0("cd '[ CHANGE THIS TO PATH DATA STORE]'. \n\n"),file = format_convert_path )
          
          
          # cat("GET FILE='",paste0(input$spss_file_name,'_SPSS_',input$spss_file_version,'.sav') ,"'.\n",file = format_convert_path,append = T)
          cat("GET FILE='",argparse$dataset_name,".sav'.\n",file = format_convert_path,append = T)
          cat("DATASET NAME dataset1 WINDOW=FRONT.\n",file = format_convert_path,append = T)
          cat("DATASET ACTIVATE dataset1.\n\n\n",file = format_convert_path,append = T)
          
          
          
          if(length(changes_val$updated_rows)>0){
            
            
            # cat(paste0("cd ' ",tools::file_path_sans_ext(file),"'. \n\n"),file = format_convert_path )

            
            posi = argparse$data_freq[changes_val$updated_rows,3]
            # cat(posi)
            posi <- unique(posi)
            
            # cat(argparse$var_name_ori,'\n')
            for (i in 1:length(posi)){
              cat(posi[i],"\n")
              idx <- which(argparse$data_freq[,3] == posi[i])
              cat(spss_val_syntax(argparse$var_name_ori[posi[i]],
                                  val_num = argparse$data_freq[idx,6],
                                  val_names = argparse$data_freq[idx,7]),file = format_convert_path,append = T)
              
              # argparse$spss_syntax_var <- c(argparse$spss_syntax_var, spss_val_syntax(argparse$var_name_ori,
              # val_num = argparse$data_freq[idx,6],
              # val_names = argparse$data_freq[idx,7]
              # 
              # ))
            }
            
            
          }
          
          if(length(changes_var$updated_rows)>0){
            
            cat('\n',argparse$spss_syntax_var,file = format_convert_path,append = T)
          }
          
          
          export_file_list <- c(export_file_list,format_convert_path)
        }

        # if (input$translation_sps){
        #   file_summary_str <- c(export_file_list, paste0(file_summary_str,input$spss_file_name,'_format_convert.sps\n'))
        #   
        # }
        # 
        # 
        #   
            
          
            
            
            
          
          # # print(knit_filelist)
          # print(file)
          # Create a ZIP file containing the generated .docx files
          zip(zipfile = file, files = export_file_list)
          
          
          
        })
      
    },
    contentType = "application/zip"
  )
  
  
  
})


