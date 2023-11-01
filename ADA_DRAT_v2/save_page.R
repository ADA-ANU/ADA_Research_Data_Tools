save_tab <- tabPanel("Save Files",
                     value="panel_save_1",
                     
                     fluidPage(
                       # tags$head(
                       #   tags$style(HTML(".btn-custom {
                       #    width: 100%; /* Adjust the width as needed */
                       #                    }"
                       #   ))
                       # ),
                       
                       
                       
                       sidebarLayout(
                         sidebarPanel(
                           h4('Save the workplace'),
                           downloadButton('save_breakpoint','Save the work'),
                           
                           br(),
                           hr(),
                            
                           h4('Save the spss data'),
                           checkboxInput(inputId = 'save_sav',label = 'Save as .spss',value = T),
                           checkboxInput(inputId = 'save_stata',label = 'Save as .dta',value = T),
                           checkboxInput('save_sas',label = 'Save as .sas',value = T),
                           checkboxInput('save_stata',label = 'Save as .dta',value = T),
                           checkboxInput('save_csv',label = 'Save as .csv',value = T),
                           # br(),
                           h5('Save blog and processing syntax'),
                           
                           checkboxInput(inputId = 'translation_sps', label = 'convert format .sps',value = T),
                           checkboxInput(inputId = 'process_sps', label = 'Process .sps',value = T),
                           checkboxInput(inputId = 'process_R', label = 'Process .R',value = T),
                           
                           
                           downloadButton('Save spss data')
                           
                           

                         ),
                         
                         mainPanel(
                           h4('Changes in Variable'),
                           verbatimTextOutput('save_var_summary'),
                           h4('Changes in value lable'),
                           verbatimTextOutput('save_val_summary'),
                         )
                       )
                       
                       
                       
                     )#fluid page
)# tab


export_report <- tabPanel("Export Report",
                     value="panel_save_2",
                     


                       sidebarLayout(
                         sidebarPanel(
                           
                           
                           
                         ),
                         
                         mainPanel(

                         )
                       )
                       
                       
                       

)# tab





save_export_page <- function(){
  tabPanel( "Save & Export",
            
            tabsetPanel(
              id="tabs_save",
              save_tab,

              
              
              # Help,
              
            )#tabsetPanel
            
  )#tabPanel
}