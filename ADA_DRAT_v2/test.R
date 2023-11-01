library(shiny)

ui <- fluidPage(
  radioButtons("selectionType", "Select items:", 
               choices = c("All", "Customize")),
  conditionalPanel(
    condition = "input.selectionType == 'Customize'",
    textInput("customItems", "Customize items (comma-separated):")
  ),
  uiOutput("selectedItems")
)

server <- function(input, output, session) {
  output$selectedItems <- renderUI({
    if (input$selectionType == "All") {
      selected_items <- "All items selected."
    } else {
      custom_items <- input$customItems
      selected_items <- paste("Customized items:", custom_items)
    }
    HTML(selected_items)
  })
}

shinyApp(ui, server)





# library(shiny)
# library(DT)
# 
# # Sample data
# data <- data.frame(
#   Name = c("ohn", "Mary", "David", "ALICE", "Bob", "SARAH"),
#   Age = c(30, 25, 40, 35, 28, 32)
# )
# 
# ui <- fluidPage(
#   checkboxInput("filterUpperCase", "Filter Uppercase Names"),
#   DTOutput("table")
# )
# 
# server <- function(input, output, session) {
#   output$table <- renderDT({
#     # Check if the checkbox is checked
#     if (input$filterUpperCase) {
#       # Filter rows where Name contains uppercase characters
#       filtered_data <- data[grepl("[A-Z]", data$Name), ]
#     } else {
#       filtered_data <- data
#     }
#     
#     # Render the filtered DataTable
#     datatable(filtered_data)
#   })
# }
# 
# shinyApp(ui, server)
# 
# 


# ui <- fluidPage(
#   tabsetPanel(
#     id = "wizard",
#     type = "hidden",
#     tabPanel("page_1", 
#              "Welcome!",
#              actionButton("page_12", "next")
#     ),
#     tabPanel("page_2", 
#              "Only one page to go",
#              actionButton("page_21", "prev"),
#              actionButton("page_23", "next")
#     ),
#     tabPanel("page_3", 
#              "You're done!",
#              actionButton("page_32", "prev")
#     )
#   )
# )
# 
# server <- function(input, output, session) {
#   switch_page <- function(i) {
#     updateTabsetPanel(inputId = "wizard", selected = paste0("page_", i))
#   }
#   
#   observeEvent(input$page_12, switch_page(2))
#   observeEvent(input$page_21, switch_page(1))
#   observeEvent(input$page_23, switch_page(3))
#   observeEvent(input$page_32, switch_page(2))
# }
# 
# shinyApp(ui, server)
