# R Shiny as a data risk assessment and education tool for the Australian Data Archive




### Description

Public data repositories have an important role in facilitating open science. A challenge for repositories though is ensuring both the public availability of data and the privacy of research participants.

Both the [ADA](https://ada.edu.au/) and data owners are bound by The Privacy Act 1988. Data owners are encouraged to de-identify their data prior to submission, but archivists are often required to guide data owners through this specialist process to ensure compliance with the Privacy Act, and with ADA procedures for handling sensitive data.

We have been developing standardised and automated data risk assessment procedures using R to automate the archivist data processing workflow and produce a Data Risk Assessment Report for data owners.  Having developed code in R for this purpose, we now aim to use R Shiny as an educational and self-assessment tool for data owners (including depositors and the research community more broadly).

The R Shiny data app we are developing - the [ADA DRAT](https://67g7sg-weifanjiang0anu.shinyapps.io/Release/) (*Data Risk Assessment Tool*) - will guide users to assess their own data on a series of privacy criteria in preparation for submission. The DRAT will include pop-up educational suggestions and definitions of data privacy risk, as well as example output using live synthesised data to reflect de-identification options selected by the user.

In this presentation we will demonstrate current tool capabilities: data cleaning, flagging direct and indirect identifiers, and generating standardised vocabulary suggestions.


### Usage

#### Data Dictionary
This Data is the training version of [ANU POLL (Defence)] (https://dataverse.ada.edu.au/dataset.xhtml?persistentId=doi:10.4225/87/OA9RVE)  fourth in an ongoing series of polls being undertaken by the Social Research Centre for the ANU. Their purpose is to assess Australians' opinions on important and topical issues, with an emphasis on international comparisons. These polls are typically conducted three times a year, or about every four months. Some questions appear in every poll in order to provide information about changes in opinion over time; the majority of questions appear in one poll only. This research is used to inform public debate and policy about issues affecting Australia. The main focus of this poll was on attitudes and opinions toward issues regarding defence. Variables include opinions about the way Australia is heading; the biggest problems facing Australia today; the strength of the Australian Defence Forces; the activities of the Australian Defence Forces; issues relating to terrorist attacks; the war in Afghanistan; and Australia's alliance with the United States. Background variables include gender, age, household composition, country of birth, highest level of education, employment status and income.


#### Risk Assessment


Indirect Identifiers relate to the ability to identify an individual by combining different variables, typically demographic variables, especially when the data were recently collected.

For example, by combining place of birth, year of migration, current occupation, number of children and postcode, you might find a person who was born in Laos, migrated to Australia in 2001, is currently a taxi driver and lives with his wife, mother-in-law and six children and, from the postcode, you can see that he lives in the same small country town that you live in. You can recognise him and from reading the other information you know what his income is and which party he voted for in the last election. This is a violation of his privacy because he has lost his ability to control the flow of information about himself.

It is also important to note outliers, due to their nature are able to identify unique data. Contact the depositor regarding the presence of the outlier, suggest they may wish to deal with the outlier (for research purposes) or suggest utilising one of the techniques below for dealing with the outlier.

#### Deidentification
cross-tabulate demographic variables (where applicable) If any cross-tabulations are of 3 cases or less this is a potential privacy concern. For example common cross tabulations are Age and occupation, or Age with country of birth. If there are previous versions or other studies in the series check for any group or suppression that may have occurred to determine how to deal with potential identifiers. Collapsing

Numeric or categorical variables can be collapsed into more generic groups through recoding (see step2.2.5 Recoding and Factsheet4 Restricted Variables). Collapsing can greatly reduce the usefulness of the data and should only be done with caution and depositor agreement.

For example age could be collapsed into 5-year age groups, or country of birth could be collapsed into non-English-speaking and English-speaking. Ensure that the collapsing performed keep the data in a format that is useful to researchers, it is best to discuss with the Archive Manager or consult the depositor.

If the collapsed variable still doesn't satisfy the 'Rule of Three' another technique may need to be used.


#### Detailed Report
Not that functioning


#### Folder structure

Here's a folder structure for a Pandoc document:

```
ADA DRAT/           # Root directory.
|- Data/            # Folder used to store SPSS, CSV and other data.
|- Rmd/             # RMarkdowns files included in Shiny app
|- md/              # Markdowns files included in Shiny app
|- figure/          # Images folder.
|- www/             # Javascripts files included in Shiny app
|- about_page.R     # Metadata content (title, author...).
|- spss_data_page.R # R shiny UI used for spss_data tabpage
|- ui.R             # R shiny main UI file
|- server.R         # R shiny main server file
|- util.R           # utility file including self defined functions 
```
### Contribution

|   |               |
| ------- | ----------------------- |
| **contribution** | @Ryan Perry @Weifan Jiang @Janet McDougall @Tina Gregor|
| **relavants**  | -  [insert our ADA wiki page link or contents?]() |

### References

- [Pandoc](http://pandoc.org/)
- [Wikipedia: Markdown](http://wikipedia.org/wiki/Markdown)





