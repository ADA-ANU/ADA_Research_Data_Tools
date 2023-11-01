library(shiny)
library(shinythemes)
library(rhandsontable)
library(DT)
library(markdown)
# source("server.R")
# source("util.R")
# source("spss_data_page.R")
# source("metadata_page.R")
source("readme_page.R")
source("data_page.R")
source("save_page.R")



shinyUI(navbarPage("Australia Data Archive", collapsible = TRUE, inverse = TRUE, windowTitle = 'ADA DRAT', theme = shinytheme("cerulean"), #spacelab
                 # spss_data_view(get_varName(),get_varLabel()),
                 # readme(),
                 data_page(),
                 save_export_page(),
))
