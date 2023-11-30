# Load the readxl package
library(readxl)
library(dplyr)
library(haven)
library(stringr)
xlsx_file <- "./ANZLEAD_Party_Codes.xlsx"    # path to excel file

sheet_names <- excel_sheets(xlsx_file)  
party_code <-read_excel(xlsx_file,sheet ='Sheet1') [,2:3]
