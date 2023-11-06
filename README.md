
# ADA-Research-Data-Tools

R Code repository for Data Archivists, this including Data processing, basic functions, and a Data harmonisation R shiny app build by R. 

<!-- PROJECT SHIELDS -->
![GitHub repo size](https://img.shields.io/github/languages/code-size/ADA-ANU/ADA_R_Scripts)
![GitHub license](https://img.shields.io/github/license/ADA-ANU/ADA_R_Scripts)
![GitHub contributors](https://img.shields.io/github/contributors/ADA-ANU/ADA_R_Scripts)
![GitHub Repo stars](https://img.shields.io/github/stars/ADA-ANU/ADA_R_Scripts?style=social)
![GitHub forks](https://img.shields.io/github/forks/ADA-ANU/ADA_R_Scripts?style=social)


<!-- PROJECT LOGO -->
<br />

<p align="center">
  <a href="https://github.com/ADA-ANU/ADA_Research_Data_Tools">
    <img src="Images/logo.jpg" alt="Logo" height="200">
  </a>

  <h3 align="center">ADA-Research-Data-Tools</h3>
  <p align="center">
    Please read README file to get started.
<!--     <br /> -->
<!--     <a href="https://github.com/ADA-ANU/ADA-R-Lib/blob/main/README.md"><strong> Expolor Documemtations »</strong></a> -->
<!--     <br /> -->
<!--     <br /> -->
<!--     <a href="https://github.com/ADA-ANU/ADA-R-Lib">Find Demo</a> -->
<!--     · -->
<!--     <a href="https://github.com/ADA-ANU/ADA-R-Lib/issues">Report Bug</a> -->
<!--     · -->
<!--     <a href="https://github.com/ADA-ANU/ADA-R-Lib/issues">Propose a New Feature</a> -->
<!--   </p> -->

</p>




## Table of Contents

- [💻 Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Usage](#usage)
  - [R shiny App](#rshiny)

- [📝 Release History](#Release-History)
- [👥 Authors](#authors)
- [🤝 Contributing](#contributing)







## 💻 Getting Started <a name="getting-started"></a>

== Before you start ==
### 1. The first thing is to set up an R code environment.

#### 1.1. For Windows User:
* Please instal R in your computer: see [RCAN](https://cran.r-project.org). And click **Download R for Windows** -> **install R for the first time** and install the R base distribution.

* Download an integrated development environment (IDE), Rstudio for example, Go to [RStudio](https://www.rstudio.com/products/rstudio/), and install Rstudio Desktop. You can also install jupyter notebook for R.

*Please note that Anaconda may not have the latest version for R and Rstudio, which will cause package install failure.*


### 2. Prerequisites<a name="prerequisites"></a>

In order to run this project you need the following dependencies, version of R is **4.2.X** and DT **0.2.5** , Lower version of R may cause incompatible error:

```R
library(haven);             # Imports and export SPSS (.sav) data
library(labelled);          # Calls value label, variable label and other information of the data
library(tidyverse);         # Managing data files with a better representation  
library(dplyr)              # Managing the functions using pipes %>%
library(flextable);         # To create tables with merged rows for designated columns
library(officer);           # To incorporate some of the microsoft 
library(stringr);           # contains operators to string and characters
library(sjlabelled)         # Supports 'rename_at', 'var_labels' and 'add_value_labels' functions
library(foreign)            # Imports and export SPSS (.sav) data
library(car)                # To recode or group values
library(reshape2)           # To reshape metrix
library(gmodels)            # Various R Programming Tools for Model Fitting
library(epiDisplay)         # For data exploration and result presentation
library(DT)                 # For Data demostration
library(shiny)              # Web application
    
```
you can install them by using:


```R
install.packages(c('haven','labelled','tidyverse','dplyr','flextable','officer','stringr','sjlabelled','foreign','car','reshape2','gmodels','epiDisplay','shiny','remotes'))
```

particular in Rshiny, DT 0.25 version will be used to prevent incompatible with CellEdits.
    
```R

remove.packages("DT") 

remotes::install_version("DT", version = "0.25")     
```
    
    

### 3. Setup<a name="setup"></a>

Clone this repository to Processing folder under Dataset folder:

For example: **Download** the whole repository and extract at your working folder



### 4.Usage<a name="usage"></a>

#### R Scripts

#### 0.  Shell dataset and processing report
Archive work flow, Before this, you already recived data from depositor, and got a consent for ADA processing report for ADA facilitated dataset, For more infomation refer [Shell Dataverse wiki](https://wiki.ada.edu.au/index.php/Creation_of_%27Shell_Dataverse_and_Dataset%27), [Data Processing Wiki](https://wiki.ada.edu.au/index.php/Data_Processing). Generating Data quality checks, Data confidentiality checks and Data frequency documents for identifying different kinds of issues.

#### 1. Process the data 
neither by R or SPSS according to the ADA processing report, and save the Restricted version of data

#### 2. Anoumity the restricted data
Using `Confidentialisation LinA report_General.Rmd`, or `Confidentialisation of LinA data Shorter.sps`  to anoumity the restricted data, and save the General release data.


- `Confidentialisation LinA report_General.Rmd` :   
    - Remember to change title and author, and date before Knit the Confidentialisation report.
    - Please note that be careful with folder structure,
    
    ```R
    library (haven)
    source("../Lib/DPtool.R")
    source("../Lib/linaconf.R")
    ```
    - There are 19 parameters (0.0.1 release) in argparse you can define, they are:
    
    `file_path`: restricted .sav data to confidentialise.
    
    `p_gender_name_ori`:gender variable name in the original data or you defined in restricted during processing.
    
    `p_gender_name`: gender variable name saved to the confidentialised data
    
    `p_age_group_name_ori`: age group variable name in the original data or you defined in restricted during processing.
    
    `p_age_group_name`: age group variable name saved to the confidentialised data
    
    `p_education_name_ori`: education variable name in the original data or you defined in restricted during processing.
    
    `p_education_name`: education variable name saved to the confidentialised data.
    
    `p_state_name_ori`: state variable name in the original data or you defined in restricted during processing.
    
    `p_state_name`: state variable name in the original data or you defined in restricted during processing.
    `missing_value_in_original` recode 'refuse, unknown,don't know, unable to establish, invalid,other'  to argpase@missing_label
    
    `missing_value_in_original_gender` as above, but in LinA panel data, 'other' somehow was recoded 3 May need append 3 in the end.
    
     `missing_value_in_original_gender` as above, but in LinA panel data, 'other' somehow was recoded 3 May need append 3 in the end.
     
     `missing_value_in_original_education`as above, but in social cohesion data, 'other' somehow was recoded as 11.
     
     `missing_value_in_original_age` in case there are any exeptional case. set as missing_value_in_original for now
     
     `missing_value_in_original_state` in case there are any exeptional case. set as missing_value_in_original for now

    
    
    `missing_value`: confidentialised value that saved to the general release data, usually be -97
    
    `missing_label`: confidentialised value that saved to the general release data, usually be 'Unknown' or 'Don't not/Refused'
    
    `max_iteration`: the number of the iterations that do the k-anonymity
    
    `rm_var`: variable names that will be removed in the confidentialised data. basically will be p_\[var\]_ori
    
    `save_spss_filepath`: Path to save confidentialised data, Leave it empty if you don't want to save
    
    `save_sas_filepath`: save SAS, recommended to use SPSS to save. Can't find a founction to save varfile of SAS.
    
    `save_csv_filepath`:Save as CSV, recommended to use R to save, `copy_tool.sps` cannot save .csv properly
    
    `save_dta_filepath` : Save as dta, no recommendation.
    - Then run the every R code section/cell or knit to generate a report.
  
#### 3. Save other format
Use **copy_tools.sps** to save other format such as SAS STATA CSV. (You can also save these format at R syntax in step 1 and 2)


<!--
Example command:

```sh
  rails server
```
--->


<!-- ### Run tests

To run tests, run the following command:


Example command:

```sh
  bin/rails test test/models/article_test.rb
```
--->


<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- AUTHORS -->

### DART - R shiny Applictaion
You can using the link [ShinyApp.IO](https://67g7sg-weifanjiang0anu.shinyapps.io/ADA_DRATv2/) to try. And make sure your data is secure, you can use [Demo data](https://github.com/ADA-ANU/ADA_Research_Data_Tools/tree/main/Data) from Data folder.

Full list of documentation can be found on [ADA_DRAT_v2](https://github.com/ADA-ANU/ADA_Research_Data_Tools/blob/main/README.md)





## Release History


* 0.0.1
    * Updated LinA confidentialise R syntax, tricky way to implement titil and subtitle on YAML, and allow date be updated automatically.
    * Add number at the front the R syntax filename, now it shows logical order explicitly
    * LinA confidentialse report was modified, including wording, content, grammar,summary


* 0.1.0
    * Drat tool, Rshiny application was updated







## 👥 Authors <a name="authors"></a>



👤 **Author1**

- GitHub: [@Weifan Jiang](https://github.com/JiangWeiFanAI)
- GitHub: [@Janet]()
- GitHub: [@Tina]()
- GitHub: [@Ryan]()


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>




Don't forget to hit the ⭐, If you like this repo.



Useful links 
https://docs.ada.edu.au/index.php/File_%26_Folder_Naming_Conventions
https://wiki.ada.edu.au/index.php/Creation_of_%27Shell_Dataverse_and_Dataset%27
