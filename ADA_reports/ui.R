library(shiny)
library(DT)

ui <- fluidPage(
  titlePanel("Upload .sav File(s)"),
  sidebarLayout(
    sidebarPanel(
      fileInput("files", "Choose/Drop Files", multiple = TRUE),
      hr(),
      h4('Select to knit'),
      checkboxInput("Checkbox_conf", label = "Confidentialisation Check (.docx)", value = T),

      checkboxInput("checkbox_DQ", label = "Data Quality Check (.docx)", value = T),

      checkboxInput("checkbox_DD", label = "Data Dictionary (.docx &.csv)", value = T),
      
      checkboxInput("checkbox_pcopy", label = "Perservation copy (.dat & .sps)", value = F),
      
      checkboxInput("checkbox_concord", label = "Concordance file (.csv)", value = F),
      
      hr(),
      # textInput("person_name", label = "Archivist name", value = "Enter text..."),
      
      # verbatimTextOutput('prefix',"02_APS_data")
      
      selectInput('person_name', 'Archivist name', 
                  c('Your name','Janet McDougall','Ryan Perry','Tina Gregor','Weifan Jiang'),
                  multiple=F, selectize=TRUE)
      
      
    ),
    mainPanel(
      h4("Uploaded Files:"),
      
      DT::dataTableOutput("fileInfoTable"),
      br(),
      # actionButton('createButton','Create'),
      downloadButton("downloadButton", "Download"),
      actionButton('deleteButton','Delete')
      
      
    )
  )
)

