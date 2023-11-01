upload_data <- tabPanel("Upload data",
                        value="panel1",
                          sidebarLayout(
                            sidebarPanel(
                              h4('Upload a spss data or a previous work'),# will support sas
                              fileInput("files", "Choose/Drop Files", multiple = TRUE),
                              hr(),
                              # h4('Upload a work (.RD)'),# will support sas
                              
                              # textOutput("textBoxOutput")
                             
        


                            ),
                            mainPanel(
                              h4("Uploaded Files:"),

                              DT::dataTableOutput("fileInfoTable"),
                              br(),
                              # actionButton('createButton','Create'),
                              actionButton('clearButton','Clear'),
                              actionButton('loadButton','Load Data')


                            )
                          )
                  
                  
)#tabPanel

data_dictionary <- tabPanel(title = "Data Dictionary",
                            value="panel2",
                        fluidPage(
                          # h1('Data Dictionary  \t \t \t \t \t \t'),
                          titlePanel("Data Dictionary"),
                          
                          # align = "right",  # Align the content to the right
                          downloadButton("downloadButton_freq", "Save knitted table"),
                          tags$div(HTML("<br><br>")),
                          
                          br(),

                          DT::dataTableOutput("data_freq_table"),
                                  
                                  
                        )
)
                        





var_view <- tabPanel("Variable View",
                        value="panel3",
                        sidebarLayout(
                          sidebarPanel(
                            actionButton('reset_var_button','Reset Changes'),
                            actionButton('export_var_button','Export Data'),
                            
                            # tags$style(type='text/css', '#summary_variable_edits {white-space: pre-wrap;}'),
                            # style = "position:fixed;width:inherit;",
                            # h4('Issue Type:')
                            # selectInput('varview_in1', 'Issue Type::', choices = c('All','DPII','Demo','Racial','Political','Religious','Sexual','Criminal','Health','Other'), multiple = TRUE),
                            hr(),
                            h4('Selected variabels'),
                            uiOutput("selectedRows"),
                            actionButton('delete_var_button','Delete'),
                            actionButton('check_button','Go to frequency check'),
                            
                            hr(),
                            h4('Variable Changes Summary'),
                            verbatimTextOutput("summary_variable_edits"),
                            
                            
                            
                            # div(style="width:500px;padding-left:100px;",fluidRow(verbatimTextOutput("placeholder", placeholder = TRUE))),
                            
                            
                          ),
                          mainPanel(
                            # h2("Uploaded Files:"),

                            DTOutput("dt_var_view"),
                          )
                        )
)



value_view <- tabPanel("Value View",
                            value="panel5",
                            sidebarLayout(
                              sidebarPanel(
                                
                                actionButton('reset_val_button','Reset Changes'),
                                actionButton('export_val_button','Export Data'),
                                hr(),
                                h4('Select & Majuscule '),
                                # checkboxInput(inputId = 'Maju_check',label = 'Majuscule filter',value = F),
                                
                                actionButton('lower_maj','Lowercase'),
                                
                                hr(),
                                h4('Punctuation'),
                                # checkboxInput(inputId = 'punc_check',label = '  filter',value = F),
                                br('All Punctuation:!#$%&"\'()*+,-./:;<=>?@[ \ ]^_`{|}~'),
                                radioButtons("selectionType", "Select items:", 
                                             choices = c("All", "Customize")),
                                
                                
                                conditionalPanel(
                                  condition = "input.selectionType == 'Customize'",
                                  
                                  selectInput("customItems", "Customize items punctuation to replace:",
                                              choices = c("!","#","$","%","&",'"',"'","(",")","*","+",",","-",".","/",":",";","<","=",">","?","@","[","]","^","_","`","{","|","}","~"),
                                              multiple = TRUE),
                                  
                                ),
                                br('Replace with: keep empty to delet punctuation'),
                                textInput("customItems_to", "Customize items"),
                                # actionButton('refresh_punc','replace'),
                                actionButton('replace_punc','replace'),
                                
                                
                                hr(),
                                h4('Value Changes Summary'),
                                
                                verbatimTextOutput("val_sumary"),
                              ),
                              mainPanel(
                                # h2("Uploaded Files:"),
                                
                                DTOutput("dt_value_view"),
                              )
                            )
)



risk_assessment <- tabPanel("Risk assessment",
                     value="panel4",
                     sidebarLayout(
                       sidebarPanel(
                         # actionButton('reset_var_button','Reset Changes'),
                         # actionButton('export_var_button','Export Data'),
                         # uiOutput("selected_var"),
                         
                         selectizeInput(
                           'selected_var_box', '1. Select variables', choices = NULL,
                           multiple = TRUE # to prevent large amount of calculation time
                         ),
                         
                         
                         # checkboxInput("dzero", label = "Delete zero", value = TRUE),
                         # actionButton('show_cross','Show'),
                         
                         verbatimTextOutput("selected_var_info"),

                         
                         
                       ),
                       mainPanel(
                         # h2("Uploaded Files:"),
                         
                         DTOutput("cross_freq_tab"),
                       )
                     )
)


capital_reduce<- tabPanel("page_1", 
                          sidebarLayout(
                            sidebarPanel(

                              actionButton('capital_button','Export Data'),
                              actionButton('','Export Data'),
                             
                              selectizeInput(
                                'selected_var_box', '1. Select variables', choices = NULL,
                                multiple = TRUE # to prevent large amount of calculation time
                              ),
                              
                              
                              # checkboxInput("dzero", label = "Delete zero", value = TRUE),
                              # actionButton('show_cross','Show'),
                              
                              verbatimTextOutput("selected_var_info"),
                              
                              
                              
                            ),
                            mainPanel(
                              # h2("Uploaded Files:"),
                              
                              DTOutput("cross_freq_tab"),
                            )
                          )
)




data_proc_tab <- tabPanel("Processing",
                          value="panel6",
                          fluidPage(
                            tabsetPanel(
                              id = "wizard",
                              type = "hidden",
                              capital_reduce,
                              tabPanel("page_2", 
                                       "Only one page to go",
                                       actionButton("page_21", "prev"),
                                       actionButton("page_23", "next")
                              ),
                              tabPanel("page_3", 
                                       "You're done!",
                                       actionButton("page_32", "prev")
                              )
                            )
                          )
)
  
  
  
 






data_page <- function(){
  tabPanel( "Data",
             
             tabsetPanel(
               id="tabs",
               upload_data,
               data_dictionary,
               var_view,
               value_view,
               risk_assessment,
               # data_proc_tab,
               
               # Help,
               
             )#tabsetPanel
          
  )#tabPanel
}
