
library(shiny)
library(rmarkdown)
library(zip)
options(shiny.maxRequestSize=3000*1024^2) 
library(DT)
library(haven)


server <- function(input, output, session) {
  
  # Store uploaded files
  
  
  
  
  
  uploadedFiles <- reactiveValues(files = data.frame(
    Filename = character(),
    Size = numeric(),
    Type = character(),
    Path = character(),
    stringsAsFactors = FALSE
  ))
  
  # Update fileInfoTable with uploaded file information
  output$fileInfoTable <- DT::renderDataTable({
    DT::datatable(uploadedFiles$files,
                  rownames = FALSE,
                  options = list(pageLength = 10,
                                 dom = 't',
                                 columnDefs = list(list(className = 'dt-center', targets = "_all"))),
                  selection = list(mode = "multiple", target = "row"),
                  escape = FALSE)
  })
  
  # Handle file uploads
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
  
  # Remove selected rows
  observeEvent(input$deleteButton, {
    selected_rows <- input$fileInfoTable_rows_selected
    if (length(selected_rows) > 0) {
      uploadedFiles$files <- uploadedFiles$files[-selected_rows, ]
    }
  })
  
  
  output$downloadButton <- downloadHandler(
    filename = function() {
      paste("output", ".zip", sep = "")
    },
    content = function(file) {
      # Generate .docx files when download button is clicked
      if (length(uploadedFiles$files$Path)>0) {
        # print(1)
        withProgress(message = 'Knitting to Word...', {
          # print(2)
          knit_filelist <- c()
          for (i in 1:length(uploadedFiles$files$Path)) {
            # print(3)
            # Generate .docx files
            # knit(input$rmdFile$datapath, output_file = paste0("output_", i, ".docx"))
            path_sav <- uploadedFiles$files$Path[i]
            # path_sav <- './SRC2793 ADA Final 04-11-2022.sav'
            author <- input$person_name
            Dataset_name <- tools::file_path_sans_ext(uploadedFiles$files$Filename[i])

            
            # print(4)
            params <- list(data_sav=haven::read_sav(path_sav),
                           doc_title = Dataset_name,
                           author=author)
            if (input$Checkbox_conf){
              rmarkdown::render("../Rcode/0.ADA_Confidentiality Check V1.0.Rmd",output_format = 'word_document',
                                output_file = paste0(paste0('ADA Confidentiality Check ',Dataset_name),'.docx'),
                                params = params,
                                envir = new.env()
              )
              
              knit_filelist <- c(knit_filelist,paste0(paste0('ADA Confidentiality Check ',Dataset_name),'.docx'))  
            }
            
            if (input$checkbox_DQ){
              rmarkdown::render("../Rcode/0.ADA Data Quality Check V1.0.Rmd",output_format = 'word_document',
                                output_file = paste0(paste0('ADA Data Quality Check ',Dataset_name),'.docx'),
                                params = params,
                                envir = new.env()
              )
              knit_filelist <- c(knit_filelist,paste0(paste0('ADA Data Quality Check ',Dataset_name),'.docx'))
              
            }

            if (input$checkbox_DD){
              rmarkdown::render("../Rcode/0.ADA_DataDictionary_Freq_Markdown v0.1(For knit).Rmd",output_format = 'word_document',
                                output_file = paste0(paste0('ADA Data Dictionary Freqency ',Dataset_name),'.docx'),
                                params = params,
                                envir = new.env()
              )
              
              
              knit_filelist <- c(knit_filelist,paste0(paste0('ADA Data Dictionary Freqency ',Dataset_name),'.docx'),paste0(paste0('ADA Data Dictionary Freqency ',Dataset_name),'.csv'))  
            }
            
            if (input$checkbox_pcopy){
              print('not ready yet')
              # rmarkdown::render("../Rcode/0.ADA_DataDictionary_Freq_Markdown v0.1(For knit).Rmd",output_format = 'word_document',
              #                   output_file = paste0(paste0('ADA Data Dictionary Freqency ',Dataset_name),'.docx'),
              #                   params = params,
              #                   envir = new.env()
              # )
              # 
              # 
              # knit_filelist <- c(knit_filelist,paste0(paste0('ADA Data Dictionary Freqency ',Dataset_name),'.docx'),paste0(paste0('ADA Data Dictionary Freqency ',Dataset_name),'.csv'))  
            }
            


          }
          # print(knit_filelist)
          # print(file)
          # Create a ZIP file containing the generated .docx files
          zip(zipfile = file, files = knit_filelist)
          
          
          
        })
      }
    },
    contentType = "application/zip"
  )
  
  # observeEvent(input$downloadButton, {
  # 
  #   if (!length(uploadedFiles$files$Path)>0) {
  #     showModal(modalDialog(
  #       title = "Error",
  #       "Please upload a .sav file before knitting to Word.",
  #       easyClose = TRUE
  #     ))
  #   }
  # 
  # 
  # })

}

# 
# server <- function(input, output) {
#   
#   # Render the download button as disabled initially
#   output$downloadButton <- downloadHandler(
#     filename = function() {
#       paste("output", ".zip", sep = "")
#     },
#     content = function(file) {
#       # Generate .docx files when download button is clicked
#       if (input$knitButton > 0) {
#         withProgress(message = 'Knitting to Word...', {
#           for (i in 1:3) {
#             # Generate .docx files
#             # knit(input$rmdFile$datapath, output_file = paste0("output_", i, ".docx"))
#           }
#           # Create a ZIP file containing the generated .docx files
#           zip(zipfile = file, files = paste0("output_", 1:3, ".docx"))
#         })
#       }
#     },
#     contentType = "application/zip"
#   )
#   
# }
