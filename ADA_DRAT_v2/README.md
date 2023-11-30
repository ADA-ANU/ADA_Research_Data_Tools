# ADA_DRAT_v2
 For 2023 eResearch
 
### Install all dependencies
For compatible reasons, we are going to use R 4.2.X and DT 0.2.5 


```R
install.packages(c('haven','labelled','tidyverse','dplyr','flextable','officer','stringr','sjlabelled','foreign','car','reshape2','gmodels','epiDisplay','shiny','remotes'))
```

particular in Rshiny, DT 0.25 version will be used to prevent incompatible with CellEdits.
    
```R

remove.packages("DT") 

remotes::install_version("DT", version = "0.25")     
```


## Demo
Use the link [ShinyApp.IO](https://67g7sg-weifanjiang0anu.shinyapps.io/ADA_DRATv2/)to try the tool. To ensure data security, please do not upload sensitive data. The best way to make sure your data is secure, deploy the project on your local computer. If you would simply like a demo, you can use the training version data from the Data folder instead. (Tina: Which data folder?)

## Documentation


### Upload data

<img src="Images/upload_page.png" alt="drawing" width="800"/>

<!-- <p align="center">
    <img src="Images/upload_page.png" alt="Logo" height="200">
  <h4 align="center">Upload data page</h4>
<p align="center">
    </p> -->
    
The DRAT tool allows users to upload data files for assessment. Multiple files can be uploaded and stored at once.  Drag and drop your files onto the â€˜Choose/Drop Filesâ€™ bar or select them from your local computer using the â€˜Browseâ€™ function. Select the files you whish to assess in the list of uploaded files and press â€˜Load Dataâ€™. 

### Dictionary view

<img src="Images/dict_page.png" alt="drawing" width="800"/>

<!-- ![dict_page](){:height="100px" width="100px"} -->

The Data Dictionary screen will now show your uploaded data, including the variable names and labels, as well as the number of values for categorical variables. You can filter the data view by typing in the search box at the top of the table or the search boxes on top of each column. You can copy the displayed table to the clipboard or download it as a CSV, Excel, or PDF Data Dictionary file. 
(Tina: Not sure what the Position column would be used for) 


### Variable View 

<img src="Images/var_view_page.png" alt="drawing" width="800"/>

#### Sensitive data keyword search.  
In the â€˜Variable Viewâ€™ screen, the DRAT will flag variables with categories of potentially sensitive data including questions about religion, racial identity, pollical affiliation, or criminal behaviour. 


Currently this function is used to highlight potential variables of concern. The DRAT will eventually use this information to classify datasets according to disclosure risk. 

 
Users can reclassify variables in the drop-down menus to reject the sensitive data flag, or manually flag a variable that the DRAT has failed to detect. To do this, click on the flag (e.g. Racial) you whish to edit in the DRAT column. This will change the flag to a drop down menu. Select a new flag  or select the empty field at the top of the list to take the existing flag out of the table. Press confirm to make the change. To add a flag to a row that the DRAT did not automatically flag, click on the row in question in the DRAT column. This will also enable the drop down menu.  

(Tina: I think there should be a short explaination to each flag, e.g. Demo: demographic information)

### Data curation

In this view, you can also edit variable lables. Simply click on the label you wish to edit, make your changes and press confirm. 

You can also delete a variable entirely. To do this, select the variable(s) in question by ticking the box in the first column. Then press "delete" in the side menu. 

The Variable Changes Summery on the left hand side will show a list of changes you made. 

Press "Copy" to copy the table to the clipboard, press "Print" to print out the table or press "Download table as" to download the table as CSV, Excel or PDF. 

(Tina: The Export Data button is doing anything)

Note: Do not use the browser arrows to go back and forth. This will reload the tool and your progress will be lost.

(Tina: Can we do something about that? Can I save my progress here somewhere?)

### Risk assessment

Select the variables you would like to assess via the check box. To select the variables of a certain risk category, select the category in the list at the top of the page by clicking on it. For instance, click on "Demo" to filter for all demographic variables, then select all the check boxes. Then press "Go to frequency check". This will automatically take you to the risk assessemnt view. 

(Tina: This really needs a select all button) 
(Tina: I can see the selecte variables in the risk assessment view but nothing else)



### Value View

<img src="Images/val_view_page.png" alt="drawing" width="800"/>


##### Removing punctuation from value labels
Punctuation value labels can interfer with the display of the data in formats such as CSV. To remove punctuation from value labels click on "Puctuation" in the Issues panel at the top of the table. Select the all rows and click "Replace" in the left hand side menu. Alternativle, enter a character in the box over the replace button to replace punctuation with this character. 

(Tina: This did not remove all comma or apostophies, possibly because of differnt encodings.)
(Tina: It might be a good idea to let the user decide which punctuation they want to remove, e.g. just the commas but nothing else.)

##### Removing inconsistent uppercase text. 
To remove inconsistant use of upercase click Uppercase in the Issues panel. DRAT considers the following as inconsistant use of uppercase:
 * The initial value label is not capitalised 
 * Two or more uppercase in a single word, uppercase in the middle of a word.

Hghlight the rows you with inconsistant upper case. Make sure rows that contain acronyms, such as USA, NSW, CSRM, or not selected, then press "Lowercase". 



### Save & export

<img src="Images/save_page.png" alt="drawing" width="800"/>

#### Save breakpoint
Save as breakpoint function, will collect all parameters that DRAT has and store it as R Data Serialization R Data Serialization (.rds) file. You can upload the saved data file in in the load data screen to recover the work process.

(Tina: It would be good if each screen had a save work button)

#### Save data and syntax

To save the edited data, tick the check box of the format you would like to export to. You can save the edited data as .sav .sas7bdat .csv and .dta. the data name will be \[Dataset_name\]_\[data format\]_\[version_name\].\[format\]

DRAT will create SPSS syntax that reflects all the processing the user has done before, by ticking .sps syntax check box.

DRAT will also create SPSS syntax that converts .sav data to .sas7bdat .csv and .dta, by ticking .sps syntax check box. As R can not create .sas syntax file along with .sas7bdat.


## Example case

See [ANUPoll training data]()

Goto main page:[ShinyApp.IO](https://67g7sg-weifanjiang0anu.shinyapps.io/ADA_DRATv2/), or press `Run App` on top of RStudio.


