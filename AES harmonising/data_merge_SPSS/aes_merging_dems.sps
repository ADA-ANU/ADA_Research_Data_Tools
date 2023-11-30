* Encoding: UTF-8.

*save 1987 data as a new file to merge all other waves to.
cd 'Z:/assda/publish/ANU/Archivists/RyanPerry/02. OTHER PROJECTS/Anzlead value mapping/data/'.
GET FILE='aes01_harmonized.sav'.
DATASET NAME aes01_datafile WINDOW=FRONT.

GET FILE='aes04_harmonized.sav'.
DATASET NAME aes04_datafile WINDOW=FRONT.

GET FILE='aes87_harmonized.sav'.
DATASET NAME aes87_datafile WINDOW=FRONT.

GET FILE='aes90_harmonized.sav'.
DATASET NAME aes90_datafile WINDOW=FRONT.

GET FILE='aes93_harmonized.sav'.
DATASET NAME aes93_datafile WINDOW=FRONT.

GET FILE='aes96_harmonized.sav'.
DATASET NAME aes96_datafile WINDOW=FRONT.

GET FILE='aes98_harmonized.sav'.
DATASET NAME aes98_datafile WINDOW=FRONT.

GET FILE='aes07_harmonized.sav'.
DATASET NAME aes07_datafile WINDOW=FRONT.

GET FILE='aes10_harmonized.sav'.
DATASET NAME aes10_datafile WINDOW=FRONT.

GET FILE='aes13_harmonized.sav'.
DATASET NAME aes13_datafile WINDOW=FRONT.

GET FILE='aes16_harmonized.sav'.
DATASET NAME aes16_datafile WINDOW=FRONT.

GET FILE='aes19_harmonized.sav'.
DATASET NAME aes19_datafile WINDOW=FRONT.

GET FILE='aes22_harmonized.sav'.
DATASET NAME aes22_datafile WINDOW=FRONT.

DATASET ACTIVATE aes87_datafile.
SAVE OUTFILE='Z:\assda\publish\ANU\Archivists\RyanPerry\02. OTHER PROJECTS\Anzlead value mapping\data\aes87to22_harmonized_dems.sav'
  /COMPRESSED.


DATASET ACTIVATE aes87_datafile.
ADD FILES /FILE=*
  /FILE='aes90_datafile'
  /IN=AES1990.
VARIABLE LABELS 
 AES1990 'Case source is aes90_datafile'.
EXECUTE.
DATASET ACTIVATE aes87_datafile.
ADD FILES /FILE=*
  /FILE='aes93_datafile'
  /IN=AES1993.
VARIABLE LABELS 
 AES1993 'Case source is aes93_datafile'.
EXECUTE.
DATASET ACTIVATE aes87_datafile.
ADD FILES /FILE=*
  /FILE='aes96_datafile'
  /IN=AES1996.
VARIABLE LABELS 
 AES1996 'Case source is aes96_datafile'.
EXECUTE.
DATASET ACTIVATE aes87_datafile.
ADD FILES /FILE=*
  /FILE='aes98_datafile'
  /IN=AES1998.
VARIABLE LABELS 
 AES1998 'Case source is aes98_datafile'.
EXECUTE.
DATASET ACTIVATE aes87_datafile.
ADD FILES /FILE=*
  /FILE='aes01_datafile'
  /IN=AES2001.
VARIABLE LABELS 
 AES2001 'Case source is aes01_datafile'.
EXECUTE.
DATASET ACTIVATE aes87_datafile.
ADD FILES /FILE=*
  /FILE='aes04_datafile'
  /IN=AES2004.
VARIABLE LABELS 
 AES2004 'Case source is aes04_datafile'.
EXECUTE.
DATASET ACTIVATE aes87_datafile.
ADD FILES /FILE=*
  /FILE='aes07_datafile'
  /IN=AES2007.
VARIABLE LABELS 
 AES2007 'Case source is aes07_datafile'.
EXECUTE.
DATASET ACTIVATE aes87_datafile.
ADD FILES /FILE=*
  /FILE='aes10_datafile'
  /IN=AES2010.
VARIABLE LABELS 
 AES2010 'Case source is aes10_datafile'.
EXECUTE.
DATASET ACTIVATE aes87_datafile.
ADD FILES /FILE=*
  /FILE='aes13_datafile'
  /IN=AES2013.
VARIABLE LABELS 
 AES2013 'Case source is aes13_datafile'.
EXECUTE.
DATASET ACTIVATE aes87_datafile.
ADD FILES /FILE=*
  /FILE='aes16_datafile'
  /IN=AES2016.
VARIABLE LABELS 
 AES2016 'Case source is aes16_datafile'.
EXECUTE.
DATASET ACTIVATE aes87_datafile.
ADD FILES /FILE=*
  /FILE='aes19_datafile'
  /IN=AES2019.
VARIABLE LABELS 
 AES2019 'Case source is aes19_datafile'.
EXECUTE.
DATASET ACTIVATE aes87_datafile.
ADD FILES /FILE=*
  /FILE='aes22_datafile'
  /IN=AES2022.
VARIABLE LABELS 
 AES2022 'Case source is aes22_datafile'.
EXECUTE.

DATASET ACTIVATE aes87_datafile.
COMPUTE AES_wave=1.
IF (aes1990 = 1) AES_wave=2.
IF (aes1993 = 1) AES_wave=3.
IF (aes1996 = 1) AES_wave=4.
IF (aes1998 = 1) AES_wave=5.
IF (aes2001 = 1) AES_wave=6.
IF (aes2004 = 1) AES_wave=7.
IF (aes2007 = 1) AES_wave=8.
IF (aes2010 = 1) AES_wave=9.
IF (aes2013 = 1) AES_wave=10.
IF (aes2016 = 1) AES_wave=11.
IF (aes2019 = 1) AES_wave=12.
IF (aes2022 = 1) AES_wave=13.
EXECUTE.
VARIABLE LABELS AES_wave
'AES wave'.
ADD VALUE LABELS AES_wave
1 'AES1987'
2 'AES1990'
3 'AES1993'
4 'AES1996'
5 'AES1998'
6 'AES2001'
7 'AES2004'
8 'AES2007'
9 'AES2010'
10 'AES2013'
11 'AES2016'
12 'AES2019'
13 'AES2022'.
EXECUTE.

DATASET ACTIVATE aes87_datafile.
DELETE VARIABLES
AES1990
AES1993
AES1996
AES1998
AES2001
AES2004
AES2007
AES2010
AES2013
AES2016
AES2019
AES2022.
EXECUTE.

