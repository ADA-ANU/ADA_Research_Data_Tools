cd 'C:/Users/wj1671/proj/anzlead/data/'.
GET FILE='aes01.sav'.
DATASET NAME aes01_datafile WINDOW=FRONT.

GET FILE='aes04.sav'.
DATASET NAME aes04_datafile WINDOW=FRONT.

GET FILE='aes87.sav'.
DATASET NAME aes87_datafile WINDOW=FRONT.

GET FILE='aes90.sav'.
DATASET NAME aes90_datafile WINDOW=FRONT.

GET FILE='aes93.sav'.
DATASET NAME aes93_datafile WINDOW=FRONT.

GET FILE='aes96.sav'.
DATASET NAME aes96_datafile WINDOW=FRONT.

GET FILE='aes98.sav'.
DATASET NAME aes98_datafile WINDOW=FRONT.

GET FILE='aes07.sav'.
DATASET NAME aes07_datafile WINDOW=FRONT.

GET FILE='aes10.sav'.
DATASET NAME aes10_datafile WINDOW=FRONT.

GET FILE='aes13.sav'.
DATASET NAME aes13_datafile WINDOW=FRONT.

GET FILE='aes16.sav'.
DATASET NAME aes16_datafile WINDOW=FRONT.

GET FILE='aes19_unrestricted.sav'.
DATASET NAME aes19_unrestricted WINDOW=FRONT.

GET FILE='aes22_unrestricted_v2.sav'.
DATASET NAME aes22_unrestricted_v2 WINDOW=FRONT.

DATASET ACTIVATE aes87_datafile.
VARIABLE LABELS id "Participant identifier at each wave".
Recode id (-1 = -1)  (ELSE = COPY).
VALUE LABELS id
-1 'Missing'.
EXECUTE.
RENAME VARIABLES (id = id).

DATASET ACTIVATE aes90_datafile.
VARIABLE LABELS id "Participant identifier at each wave".
Recode id  (ELSE = COPY).
VALUE LABELS id
-1 'Missing'.
EXECUTE.
RENAME VARIABLES (id = id).

DATASET ACTIVATE aes93_datafile.
VARIABLE LABELS id "Participant identifier at each wave".
Recode id  (ELSE = COPY).
VALUE LABELS id
-1 'Missing'.
EXECUTE.
RENAME VARIABLES (id = id).

DATASET ACTIVATE aes96_datafile.
VARIABLE LABELS caseid "Participant identifier at each wave".
Recode caseid  (ELSE = COPY).
VALUE LABELS caseid
-1 'Missing'.
EXECUTE.
RENAME VARIABLES (caseid = id).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS ID "Participant identifier at each wave".
Recode ID  (ELSE = COPY).
VALUE LABELS ID
-1 'Missing'.
EXECUTE.
RENAME VARIABLES (ID = id).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS id "Participant identifier at each wave".
Recode id  (ELSE = COPY).
VALUE LABELS id
-1 'Missing'.
EXECUTE.
RENAME VARIABLES (id = id).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS acc "Participant identifier at each wave".
Recode acc  (ELSE = COPY).
VALUE LABELS acc
-1 'Missing'.
EXECUTE.
RENAME VARIABLES (acc = id).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS accid "Participant identifier at each wave".
Recode accid  (ELSE = COPY).
VALUE LABELS accid
-1 'Missing'.
EXECUTE.
RENAME VARIABLES (accid = id).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS uniqueid "Participant identifier at each wave".
Recode uniqueid  (ELSE = COPY).
VALUE LABELS uniqueid
-1 'Missing'.
EXECUTE.
RENAME VARIABLES (uniqueid = id).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS uniqueid "Participant identifier at each wave".
Recode uniqueid  (ELSE = COPY).
VALUE LABELS uniqueid
-1 'Missing'.
EXECUTE.
RENAME VARIABLES (uniqueid = id).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS responID "Participant identifier at each wave".
Recode responID  (ELSE = COPY).
VALUE LABELS responID
-1 'Missing'.
EXECUTE.
RENAME VARIABLES (responID = id).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS ID "Participant identifier at each wave".
Recode ID  (ELSE = COPY).
VALUE LABELS ID
-1 'Missing'.
EXECUTE.
RENAME VARIABLES (ID = id).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS ID "Participant identifier at each wave".
Recode ID  (ELSE = COPY).
VALUE LABELS ID
-1 'Missing'.
EXECUTE.
RENAME VARIABLES (ID = id).

DATASET ACTIVATE aes87_datafile.
VARIABLE LABELS q71 "Sex".
Recode q71 (0 = -3) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS q71
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Male'
2 'Female'
3 'Other'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (q71 = sex).

DATASET ACTIVATE aes90_datafile.
VARIABLE LABELS j1 "Sex".
Recode j1 (0 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS j1
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Male'
2 'Female'
3 'Other'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j1 = sex).

DATASET ACTIVATE aes93_datafile.
VARIABLE LABELS j1 "Sex".
Recode j1 (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS j1
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Male'
2 'Female'
3 'Other'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j1 = sex).

DATASET ACTIVATE aes96_datafile.
VARIABLE LABELS j1 "Sex".
Recode j1 (-1 = -4) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS j1
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Male'
2 'Female'
3 'Other'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j1 = sex).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS I1 "Sex".
Recode I1 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS I1
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Male'
2 'Female'
3 'Other'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (I1 = sex).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS i1 "Sex".
Recode i1 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS i1
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Male'
2 'Female'
3 'Other'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i1 = sex).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS i1 "Sex".
Recode i1 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS i1
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Male'
2 'Female'
3 'Other'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i1 = sex).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS h1 "Sex".
Recode h1 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS h1
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Male'
2 'Female'
3 'Other'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h1 = sex).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS h1 "Sex".
Recode h1 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS h1
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Male'
2 'Female'
3 'Other'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h1 = sex).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS h1 "Sex".
Recode h1 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS h1
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Male'
2 'Female'
3 'Other'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h1 = sex).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H1 "Sex".
Recode H1 (1 = 1) (2 = 2) (999 = -2)  (ELSE = COPY).
VALUE LABELS H1
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Male'
2 'Female'
3 'Other'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H1 = sex).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS H1 "Sex".
Recode H1 (1 = 1) (2 = 2) (3 = 3) (999 = -2)  (ELSE = COPY).
VALUE LABELS H1
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Male'
2 'Female'
3 'Other'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H1 = sex).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS H1 "Sex".
Recode H1 (1 = 1) (2 = 2) (3 = 3) (999 = -2)  (ELSE = COPY).
VALUE LABELS H1
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Male'
2 'Female'
3 'Other'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H1 = sex).

DATASET ACTIVATE aes87_datafile.
VARIABLE LABELS q74 "Year of Birth".
Recode q74  (ELSE = COPY).
VALUE LABELS q74
-5 'Refused'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (q74 = yearbirth).

DATASET ACTIVATE aes90_datafile.
VARIABLE LABELS j2 "Year of Birth".
Recode j2  (ELSE = COPY).
VALUE LABELS j2
-5 'Refused'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j2 = yearbirth).

DATASET ACTIVATE aes93_datafile.
VARIABLE LABELS j2 "Year of Birth".
Recode j2  (ELSE = COPY).
VALUE LABELS j2
-5 'Refused'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j2 = yearbirth).

DATASET ACTIVATE aes96_datafile.
VARIABLE LABELS j2 "Year of Birth".
Recode j2  (ELSE = COPY).
VALUE LABELS j2
-5 'Refused'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j2 = yearbirth).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS I2 "Year of Birth".
Recode I2  (ELSE = COPY).
VALUE LABELS I2
-5 'Refused'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (I2 = yearbirth).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS i2 "Year of Birth".
Recode i2  (ELSE = COPY).
VALUE LABELS i2
-5 'Refused'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i2 = yearbirth).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS i2 "Year of Birth".
Recode i2  (ELSE = COPY).
VALUE LABELS i2
-5 'Refused'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i2 = yearbirth).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS h2 "Year of Birth".
Recode h2  (ELSE = COPY).
VALUE LABELS h2
-5 'Refused'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h2 = yearbirth).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS h2 "Year of Birth".
Recode h2  (ELSE = COPY).
VALUE LABELS h2
-5 'Refused'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h2 = yearbirth).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS h2 "Year of Birth".
Recode h2  (ELSE = COPY).
VALUE LABELS h2
-5 'Refused'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h2 = yearbirth).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H2 "Year of Birth".
Recode H2  (ELSE = COPY).
VALUE LABELS H2
-5 'Refused'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H2 = yearbirth).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS H2 "Year of Birth".
Recode H2 (999 = -2)  (ELSE = COPY).
VALUE LABELS H2
-5 'Refused'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H2 = yearbirth).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS H2 "Year of Birth".
Recode H2 (-97 = -5) (999 = -2)  (ELSE = COPY).
VALUE LABELS H2
-5 'Refused'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H2 = yearbirth).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS age "Age (derived)".
Recode age (-1 = -1)  (ELSE = COPY).
VALUE LABELS age
-1 'Missing'
1 'Yes'
2 'No'
-2 'Skipped'
-6 'Unknown'.
EXECUTE.
RENAME VARIABLES (age = age).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS age "Age (derived)".
Recode age  (ELSE = COPY).
VALUE LABELS age
-1 'Missing'
1 'Yes'
2 'No'
-2 'Skipped'
-6 'Unknown'.
EXECUTE.
RENAME VARIABLES (age = age).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS age "Age (derived)".
Recode age  (ELSE = COPY).
VALUE LABELS age
-1 'Missing'
1 'Yes'
2 'No'
-2 'Skipped'
-6 'Unknown'.
EXECUTE.
RENAME VARIABLES (age = age).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS AGE "Age (derived)".
Recode AGE (999 = -6)  (ELSE = COPY).
VALUE LABELS AGE
-1 'Missing'
1 'Yes'
2 'No'
-2 'Skipped'
-6 'Unknown'.
EXECUTE.
RENAME VARIABLES (AGE = age).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS AGE "Age (derived)".
Recode AGE (1 = 1) (2 = 2) (999 = -2)  (ELSE = COPY).
VALUE LABELS AGE
-1 'Missing'
1 'Yes'
2 'No'
-2 'Skipped'
-6 'Unknown'.
EXECUTE.
RENAME VARIABLES (AGE = age).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS ageder "Age categories (10 year groups - derived)".
Recode ageder (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6)  (ELSE = COPY).
VALUE LABELS ageder
-1 'Missing'
1 '18 to 24'
2 '25 to 34'
3 '35 to 44'
4 '45 to 54'
5 '55 to 64'
6 '65 plus'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (ageder = agecat).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS ageder "Age categories (10 year groups - derived)".
Recode ageder (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6)  (ELSE = COPY).
VALUE LABELS ageder
-1 'Missing'
1 '18 to 24'
2 '25 to 34'
3 '35 to 44'
4 '45 to 54'
5 '55 to 64'
6 '65 plus'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (ageder = agecat).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS H2_AGE_GRP2 "Age categories (10 year groups - derived)".
Recode H2_AGE_GRP2 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (999 = -2)  (ELSE = COPY).
VALUE LABELS H2_AGE_GRP2
-1 'Missing'
1 '18 to 24'
2 '25 to 34'
3 '35 to 44'
4 '45 to 54'
5 '55 to 64'
6 '65 plus'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H2_AGE_GRP2 = agecat).

DATASET ACTIVATE aes87_datafile.
VARIABLE LABELS q80 "Marital Status".
Recode q80 (0 = -3) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 4) (6 = 2)  (ELSE = COPY).
VALUE LABELS q80
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Never married'
2 'Now married OR de facto'
3 'Widowed'
4 'Divorced OR separated'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (q80 = marital).

DATASET ACTIVATE aes90_datafile.
VARIABLE LABELS j9 "Marital Status".
Recode j9 (0 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS j9
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Never married'
2 'Now married OR de facto'
3 'Widowed'
4 'Divorced OR separated'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j9 = marital).

DATASET ACTIVATE aes93_datafile.
VARIABLE LABELS j12 "Marital Status".
Recode j12 (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS j12
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Never married'
2 'Now married OR de facto'
3 'Widowed'
4 'Divorced OR separated'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j12 = marital).

DATASET ACTIVATE aes96_datafile.
VARIABLE LABELS j8 "Marital Status".
Recode j8 (-1 = -4) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS j8
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Never married'
2 'Now married OR de facto'
3 'Widowed'
4 'Divorced OR separated'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j8 = marital).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS I7 "Marital Status".
Recode I7 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS I7
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Never married'
2 'Now married OR de facto'
3 'Widowed'
4 'Divorced OR separated'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (I7 = marital).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS marital "Marital Status".
Recode marital (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS marital
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Never married'
2 'Now married OR de facto'
3 'Widowed'
4 'Divorced OR separated'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (marital = marital).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS i8 "Marital Status".
Recode i8 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS i8
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Never married'
2 'Now married OR de facto'
3 'Widowed'
4 'Divorced OR separated'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i8 = marital).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS h8 "Marital Status".
Recode h8 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS h8
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Never married'
2 'Now married OR de facto'
3 'Widowed'
4 'Divorced OR separated'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h8 = marital).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS h7 "Marital Status".
Recode h7 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS h7
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Never married'
2 'Now married OR de facto'
3 'Widowed'
4 'Divorced OR separated'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h7 = marital).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS h8 "Marital Status".
Recode h8 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS h8
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Never married'
2 'Now married OR de facto'
3 'Widowed'
4 'Divorced OR separated'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h8 = marital).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H8 "Marital Status".
Recode H8 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (999 = -2)  (ELSE = COPY).
VALUE LABELS H8
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Never married'
2 'Now married OR de facto'
3 'Widowed'
4 'Divorced OR separated'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H8 = marital).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS H8 "Marital Status".
Recode H8 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (999 = -2)  (ELSE = COPY).
VALUE LABELS H8
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Never married'
2 'Now married OR de facto'
3 'Widowed'
4 'Divorced OR separated'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H8 = marital).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS H8 "Marital Status".
Recode H8 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (999 = -2)  (ELSE = COPY).
VALUE LABELS H8
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Never married'
2 'Now married OR de facto'
3 'Widowed'
4 'Divorced OR separated'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H8 = marital).

DATASET ACTIVATE aes87_datafile.
VARIABLE LABELS q70 "Social class".
Recode q70 (0 = -3) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS q70
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Upper class'
2 'Middle class'
3 'Working class'
4 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (q70 = class).

DATASET ACTIVATE aes90_datafile.
VARIABLE LABELS i9 "Social class".
Recode i9 (0 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (6 = -1)  (ELSE = COPY).
VALUE LABELS i9
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Upper class'
2 'Middle class'
3 'Working class'
4 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i9 = class).

DATASET ACTIVATE aes93_datafile.
VARIABLE LABELS j11 "Social class".
Recode j11 (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS j11
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Upper class'
2 'Middle class'
3 'Working class'
4 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j11 = class).

DATASET ACTIVATE aes96_datafile.
VARIABLE LABELS j7 "Social class".
Recode j7 (-1 = -4) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS j7
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Upper class'
2 'Middle class'
3 'Working class'
4 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j7 = class).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS I12 "Social class".
Recode I12 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS I12
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Upper class'
2 'Middle class'
3 'Working class'
4 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (I12 = class).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS class "Social class".
Recode class (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS class
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Upper class'
2 'Middle class'
3 'Working class'
4 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (class = class).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS i16 "Social class".
Recode i16 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS i16
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Upper class'
2 'Middle class'
3 'Working class'
4 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i16 = class).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS h14 "Social class".
Recode h14 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS h14
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Upper class'
2 'Middle class'
3 'Working class'
4 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h14 = class).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS h13 "Social class".
Recode h13 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS h13
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Upper class'
2 'Middle class'
3 'Working class'
4 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h13 = class).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS h13 "Social class".
Recode h13 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS h13
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Upper class'
2 'Middle class'
3 'Working class'
4 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h13 = class).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H15 "Social class".
Recode H15 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (999 = -2)  (ELSE = COPY).
VALUE LABELS H15
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Upper class'
2 'Middle class'
3 'Working class'
4 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H15 = class).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS J4 "Social class".
Recode J4 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (999 = -2)  (ELSE = COPY).
VALUE LABELS J4
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Upper class'
2 'Middle class'
3 'Working class'
4 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J4 = class).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS J4 "Social class".
Recode J4 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (999 = -2)  (ELSE = COPY).
VALUE LABELS J4
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Upper class'
2 'Middle class'
3 'Working class'
4 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J4 = class).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS W3 "How many mobile phones".
Recode W3 (999 = -2)  (ELSE = COPY).
VALUE LABELS W3
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (W3 = mbphone).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS W3 "How many mobile phones".
Recode W3 (999 = -2)  (ELSE = COPY).
VALUE LABELS W3
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (W3 = mbphone).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS W5 "Over the last 12 months did you spend any time doing voluntary work through an organisation or group".
Recode W5 (1 = 1) (2 = 2) (999 = -2)  (ELSE = COPY).
VALUE LABELS W5
1 'Yes, did voluntary work'
2 'No, did not do voluntary work'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (W5 = volwork).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS W5 "Over the last 12 months did you spend any time doing voluntary work through an organisation or group".
Recode W5 (1 = 1) (2 = 2) (999 = -2)  (ELSE = COPY).
VALUE LABELS W5
1 'Yes, did voluntary work'
2 'No, did not do voluntary work'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (W5 = volwork).

DATASET ACTIVATE aes87_datafile.
VARIABLE LABELS q61 "Age left school".
Recode q61  (ELSE = COPY).
VALUE LABELS q61
-1 'Missing'
99 'Age given'
11 'NA'
12 'NA'
13 'NA'
94 'Still at secondary school'
14 'NA'
15 'NA'
16 'NA'
17 'NA'
18 'NA'
19 'NA'
93 'Above 19'
95 'Primary school only'
96 'No formal schooling'
97 'Went to primary school only'
98 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (q61 = leftschool).

DATASET ACTIVATE aes90_datafile.
VARIABLE LABELS i1 "Age left school".
Recode i1  (ELSE = COPY).
VALUE LABELS i1
-1 'Missing'
99 'Age given'
11 'NA'
12 'NA'
13 'NA'
94 'Still at secondary school'
14 'NA'
15 'NA'
16 'NA'
17 'NA'
18 'NA'
19 'NA'
93 'Above 19'
95 'Primary school only'
96 'No formal schooling'
97 'Went to primary school only'
98 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i1 = leftschool).

DATASET ACTIVATE aes93_datafile.
VARIABLE LABELS i1 "Age left school".
Recode i1  (ELSE = COPY).
VALUE LABELS i1
-1 'Missing'
99 'Age given'
11 'NA'
12 'NA'
13 'NA'
94 'Still at secondary school'
14 'NA'
15 'NA'
16 'NA'
17 'NA'
18 'NA'
19 'NA'
93 'Above 19'
95 'Primary school only'
96 'No formal schooling'
97 'Went to primary school only'
98 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i1 = leftschool).

DATASET ACTIVATE aes96_datafile.
VARIABLE LABELS h1 "Age left school".
Recode h1  (ELSE = COPY).
VALUE LABELS h1
-1 'Missing'
99 'Age given'
11 'NA'
12 'NA'
13 'NA'
94 'Still at secondary school'
14 'NA'
15 'NA'
16 'NA'
17 'NA'
18 'NA'
19 'NA'
93 'Above 19'
95 'Primary school only'
96 'No formal schooling'
97 'Went to primary school only'
98 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h1 = leftschool).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS H1 "Age left school".
Recode H1 (-1 = -1) (96 = 96) (97 = 97) (98 = 98)  (ELSE = COPY).
VALUE LABELS H1
-1 'Missing'
99 'Age given'
11 'NA'
12 'NA'
13 'NA'
94 'Still at secondary school'
14 'NA'
15 'NA'
16 'NA'
17 'NA'
18 'NA'
19 'NA'
93 'Above 19'
95 'Primary school only'
96 'No formal schooling'
97 'Went to primary school only'
98 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H1 = leftschool).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS leftscho "Age left school".
Recode leftscho (-1 = -1) (1 = 11) (2 = 12) (3 = 13) (4 = 14) (5 = 15) (6 = 16) (7 = 17) (8 = 18) (9 = 19) (10 = 93) (12 = 95) (11 = 96) (13 = 98)  (ELSE = COPY).
VALUE LABELS leftscho
-1 'Missing'
99 'Age given'
11 'NA'
12 'NA'
13 'NA'
94 'Still at secondary school'
14 'NA'
15 'NA'
16 'NA'
17 'NA'
18 'NA'
19 'NA'
93 'Above 19'
95 'Primary school only'
96 'No formal schooling'
97 'Went to primary school only'
98 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (leftscho = leftschool).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS h1 "Age left school".
Recode h1 (-1 = -1) (96 = 96) (97 = 97) (98 = 98)  (ELSE = COPY).
VALUE LABELS h1
-1 'Missing'
99 'Age given'
11 'NA'
12 'NA'
13 'NA'
94 'Still at secondary school'
14 'NA'
15 'NA'
16 'NA'
17 'NA'
18 'NA'
19 'NA'
93 'Above 19'
95 'Primary school only'
96 'No formal schooling'
97 'Went to primary school only'
98 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h1 = leftschool).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS g1 "Age left school".
Recode g1 (-1 = -1) (96 = 96) (97 = 97) (98 = 98)  (ELSE = COPY).
VALUE LABELS g1
-1 'Missing'
99 'Age given'
11 'NA'
12 'NA'
13 'NA'
94 'Still at secondary school'
14 'NA'
15 'NA'
16 'NA'
17 'NA'
18 'NA'
19 'NA'
93 'Above 19'
95 'Primary school only'
96 'No formal schooling'
97 'Went to primary school only'
98 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (g1 = leftschool).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS g1 "Age left school".
Recode g1 (-1 = -1) (1 = 99) (96 = 96) (97 = 97) (98 = 98)  (ELSE = COPY).
VALUE LABELS g1
-1 'Missing'
99 'Age given'
11 'NA'
12 'NA'
13 'NA'
94 'Still at secondary school'
14 'NA'
15 'NA'
16 'NA'
17 'NA'
18 'NA'
19 'NA'
93 'Above 19'
95 'Primary school only'
96 'No formal schooling'
97 'Went to primary school only'
98 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (g1 = leftschool).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS g1 "Age left school".
Recode g1 (-1 = -1) (1 = 99) (2 = 96) (3 = 97) (4 = 98)  (ELSE = COPY).
VALUE LABELS g1
-1 'Missing'
99 'Age given'
11 'NA'
12 'NA'
13 'NA'
94 'Still at secondary school'
14 'NA'
15 'NA'
16 'NA'
17 'NA'
18 'NA'
19 'NA'
93 'Above 19'
95 'Primary school only'
96 'No formal schooling'
97 'Went to primary school only'
98 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (g1 = leftschool).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS G1 "Age left school".
Recode G1 (1 = 99) (4 = 94) (2 = 96) (3 = 97) (999 = -2)  (ELSE = COPY).
VALUE LABELS G1
-1 'Missing'
99 'Age given'
11 'NA'
12 'NA'
13 'NA'
94 'Still at secondary school'
14 'NA'
15 'NA'
16 'NA'
17 'NA'
18 'NA'
19 'NA'
93 'Above 19'
95 'Primary school only'
96 'No formal schooling'
97 'Went to primary school only'
98 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (G1 = leftschool).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS G1 "Age left school".
Recode G1 (-4 = 94) (-2 = 96) (-3 = 97) (999 = -2)  (ELSE = COPY).
VALUE LABELS G1
-1 'Missing'
99 'Age given'
11 'NA'
12 'NA'
13 'NA'
94 'Still at secondary school'
14 'NA'
15 'NA'
16 'NA'
17 'NA'
18 'NA'
19 'NA'
93 'Above 19'
95 'Primary school only'
96 'No formal schooling'
97 'Went to primary school only'
98 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (G1 = leftschool).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS G1 "Age left school".
Recode G1 (-4 = 94) (-2 = 96) (-3 = 97) (999 = -2)  (ELSE = COPY).
VALUE LABELS G1
-1 'Missing'
99 'Age given'
11 'NA'
12 'NA'
13 'NA'
94 'Still at secondary school'
14 'NA'
15 'NA'
16 'NA'
17 'NA'
18 'NA'
19 'NA'
93 'Above 19'
95 'Primary school only'
96 'No formal schooling'
97 'Went to primary school only'
98 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (G1 = leftschool).

DATASET ACTIVATE aes87_datafile.
VARIABLE LABELS q62 "School sector of secondary education - public or private".
Recode q62 (0 = -3) (1 = 1) (2 = 2) (3 = 3)  (ELSE = COPY).
VALUE LABELS q62
-1 'Missing'
-3 'No response'
1 'Government school'
2 'Catholic school'
3 'Other non government school'
4 'Government and Catholic'
5 'Government and Private'
9 'No children'.
EXECUTE.
RENAME VARIABLES (q62 = schlsect).

DATASET ACTIVATE aes90_datafile.
VARIABLE LABELS i2 "School sector of secondary education - public or private".
Recode i2 (0 = -1) (1 = 1) (2 = 2) (3 = 3) (5 = 4) (6 = 5)  (ELSE = COPY).
VALUE LABELS i2
-1 'Missing'
-3 'No response'
1 'Government school'
2 'Catholic school'
3 'Other non government school'
4 'Government and Catholic'
5 'Government and Private'
9 'No children'.
EXECUTE.
RENAME VARIABLES (i2 = schlsect).

DATASET ACTIVATE aes93_datafile.
VARIABLE LABELS i2 "School sector of secondary education - public or private".
Recode i2 (1 = 1) (2 = 2) (3 = 3)  (ELSE = COPY).
VALUE LABELS i2
-1 'Missing'
-3 'No response'
1 'Government school'
2 'Catholic school'
3 'Other non government school'
4 'Government and Catholic'
5 'Government and Private'
9 'No children'.
EXECUTE.
RENAME VARIABLES (i2 = schlsect).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS h5you "School sector of secondary education - public or private".
Recode h5you (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (9 = 9)  (ELSE = COPY).
VALUE LABELS h5you
-1 'Missing'
-3 'No response'
1 'Government school'
2 'Catholic school'
3 'Other non government school'
4 'Government and Catholic'
5 'Government and Private'
9 'No children'.
EXECUTE.
RENAME VARIABLES (h5you = schlsect).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS g5you "School sector of secondary education - public or private".
Recode g5you (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (9 = 9)  (ELSE = COPY).
VALUE LABELS g5you
-1 'Missing'
-3 'No response'
1 'Government school'
2 'Catholic school'
3 'Other non government school'
4 'Government and Catholic'
5 'Government and Private'
9 'No children'.
EXECUTE.
RENAME VARIABLES (g5you = schlsect).

DATASET ACTIVATE aes87_datafile.
VARIABLE LABELS q63 "Number of years of tertiary education".
Recode q63  (ELSE = COPY).
VALUE LABELS q63
-1 'Missing'
-4 'Blank'
0 'NA'
1 'NA'
2 'NA'
3 'NA'
4 'NA'
5 'NA'
6 'NA'
7 'NA'
8 'NA'
93 '9 years or more'
-6 'Unknown'
94 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (q63 = trtedu).

DATASET ACTIVATE aes90_datafile.
VARIABLE LABELS i3 "Number of years of tertiary education".
Recode i3  (ELSE = COPY).
VALUE LABELS i3
-1 'Missing'
-4 'Blank'
0 'NA'
1 'NA'
2 'NA'
3 'NA'
4 'NA'
5 'NA'
6 'NA'
7 'NA'
8 'NA'
93 '9 years or more'
-6 'Unknown'
94 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i3 = trtedu).

DATASET ACTIVATE aes93_datafile.
VARIABLE LABELS i4 "Number of years of tertiary education".
Recode i4 (9 = 93)  (ELSE = COPY).
VALUE LABELS i4
-1 'Missing'
-4 'Blank'
0 'NA'
1 'NA'
2 'NA'
3 'NA'
4 'NA'
5 'NA'
6 'NA'
7 'NA'
8 'NA'
93 '9 years or more'
-6 'Unknown'
94 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i4 = trtedu).

DATASET ACTIVATE aes96_datafile.
VARIABLE LABELS h3 "Number of years of tertiary education".
Recode h3 (-1 = -4) (9 = 93)  (ELSE = COPY).
VALUE LABELS h3
-1 'Missing'
-4 'Blank'
0 'NA'
1 'NA'
2 'NA'
3 'NA'
4 'NA'
5 'NA'
6 'NA'
7 'NA'
8 'NA'
93 '9 years or more'
-6 'Unknown'
94 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h3 = trtedu).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS H2 "Number of years of tertiary education".
Recode H2  (ELSE = COPY).
VALUE LABELS H2
-1 'Missing'
-4 'Blank'
0 'NA'
1 'NA'
2 'NA'
3 'NA'
4 'NA'
5 'NA'
6 'NA'
7 'NA'
8 'NA'
93 '9 years or more'
-6 'Unknown'
94 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H2 = trtedu).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS terteduc "Number of years of tertiary education".
Recode terteduc (-1 = -1) (9 = 93) (13 = -6) (14 = 94)  (ELSE = COPY).
VALUE LABELS terteduc
-1 'Missing'
-4 'Blank'
0 'NA'
1 'NA'
2 'NA'
3 'NA'
4 'NA'
5 'NA'
6 'NA'
7 'NA'
8 'NA'
93 '9 years or more'
-6 'Unknown'
94 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (terteduc = trtedu).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS h2 "Number of years of tertiary education".
Recode h2 (-1 = -1) (9 = 93)  (ELSE = COPY).
VALUE LABELS h2
-1 'Missing'
-4 'Blank'
0 'NA'
1 'NA'
2 'NA'
3 'NA'
4 'NA'
5 'NA'
6 'NA'
7 'NA'
8 'NA'
93 '9 years or more'
-6 'Unknown'
94 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h2 = trtedu).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS g2 "Number of years of tertiary education".
Recode g2 (-1 = -1) (9 = 93)  (ELSE = COPY).
VALUE LABELS g2
-1 'Missing'
-4 'Blank'
0 'NA'
1 'NA'
2 'NA'
3 'NA'
4 'NA'
5 'NA'
6 'NA'
7 'NA'
8 'NA'
93 '9 years or more'
-6 'Unknown'
94 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (g2 = trtedu).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS g2 "Number of years of tertiary education".
Recode g2 (-1 = -1) (0 = 0) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (8 = 8) (9 = 93)  (ELSE = COPY).
VALUE LABELS g2
-1 'Missing'
-4 'Blank'
0 'NA'
1 'NA'
2 'NA'
3 'NA'
4 'NA'
5 'NA'
6 'NA'
7 'NA'
8 'NA'
93 '9 years or more'
-6 'Unknown'
94 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (g2 = trtedu).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS g2 "Number of years of tertiary education".
Recode g2 (-1 = -1) (0 = 0) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (8 = 8) (9 = 93)  (ELSE = COPY).
VALUE LABELS g2
-1 'Missing'
-4 'Blank'
0 'NA'
1 'NA'
2 'NA'
3 'NA'
4 'NA'
5 'NA'
6 'NA'
7 'NA'
8 'NA'
93 '9 years or more'
-6 'Unknown'
94 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (g2 = trtedu).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS G2 "Number of years of tertiary education".
Recode G2  (ELSE = COPY).
VALUE LABELS G2
-1 'Missing'
-4 'Blank'
0 'NA'
1 'NA'
2 'NA'
3 'NA'
4 'NA'
5 'NA'
6 'NA'
7 'NA'
8 'NA'
93 '9 years or more'
-6 'Unknown'
94 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (G2 = trtedu).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS G2 "Number of years of tertiary education".
Recode G2 (999 = -2)  (ELSE = COPY).
VALUE LABELS G2
-1 'Missing'
-4 'Blank'
0 'NA'
1 'NA'
2 'NA'
3 'NA'
4 'NA'
5 'NA'
6 'NA'
7 'NA'
8 'NA'
93 '9 years or more'
-6 'Unknown'
94 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (G2 = trtedu).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS G2 "Number of years of tertiary education".
Recode G2 (999 = -2)  (ELSE = COPY).
VALUE LABELS G2
-1 'Missing'
-4 'Blank'
0 'NA'
1 'NA'
2 'NA'
3 'NA'
4 'NA'
5 'NA'
6 'NA'
7 'NA'
8 'NA'
93 '9 years or more'
-6 'Unknown'
94 'Still at school'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (G2 = trtedu).

DATASET ACTIVATE aes87_datafile.
VARIABLE LABELS q64 "Highest qualification obtained since leaving school".
Recode q64 (0 = -3) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 9) (6 = 6)  (ELSE = COPY).
VALUE LABELS q64
-4 'Blank'
-1 'Missing'
-3 'No response'
8 'Still at school'
1 'No qualification since leaving school'
2 'Postgraduate Degree or Postgraduate Diploma'
3 'Bachelor Degree (including Honours)'
4 'Undergraduate Degree or Diploma'
9 'Professional qualification'
5 'Associate Diploma'
6 'Trade qualification'
7 'Non-trade qualification'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (q64 = hiqual).

DATASET ACTIVATE aes90_datafile.
VARIABLE LABELS i4 "Highest qualification obtained since leaving school".
Recode i4 (0 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 9) (6 = 6)  (ELSE = COPY).
VALUE LABELS i4
-4 'Blank'
-1 'Missing'
-3 'No response'
8 'Still at school'
1 'No qualification since leaving school'
2 'Postgraduate Degree or Postgraduate Diploma'
3 'Bachelor Degree (including Honours)'
4 'Undergraduate Degree or Diploma'
9 'Professional qualification'
5 'Associate Diploma'
6 'Trade qualification'
7 'Non-trade qualification'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i4 = hiqual).

DATASET ACTIVATE aes93_datafile.
VARIABLE LABELS i3 "Highest qualification obtained since leaving school".
Recode i3 (1 = 1) (2 = 2) (3 = 2) (4 = 3) (5 = 4) (6 = 5) (7 = 6) (8 = 7)  (ELSE = COPY).
VALUE LABELS i3
-4 'Blank'
-1 'Missing'
-3 'No response'
8 'Still at school'
1 'No qualification since leaving school'
2 'Postgraduate Degree or Postgraduate Diploma'
3 'Bachelor Degree (including Honours)'
4 'Undergraduate Degree or Diploma'
9 'Professional qualification'
5 'Associate Diploma'
6 'Trade qualification'
7 'Non-trade qualification'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i3 = hiqual).

DATASET ACTIVATE aes96_datafile.
VARIABLE LABELS h2 "Highest qualification obtained since leaving school".
Recode h2 (-1 = -4) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7)  (ELSE = COPY).
VALUE LABELS h2
-4 'Blank'
-1 'Missing'
-3 'No response'
8 'Still at school'
1 'No qualification since leaving school'
2 'Postgraduate Degree or Postgraduate Diploma'
3 'Bachelor Degree (including Honours)'
4 'Undergraduate Degree or Diploma'
9 'Professional qualification'
5 'Associate Diploma'
6 'Trade qualification'
7 'Non-trade qualification'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h2 = hiqual).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS H3 "Highest qualification obtained since leaving school".
Recode H3 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7)  (ELSE = COPY).
VALUE LABELS H3
-4 'Blank'
-1 'Missing'
-3 'No response'
8 'Still at school'
1 'No qualification since leaving school'
2 'Postgraduate Degree or Postgraduate Diploma'
3 'Bachelor Degree (including Honours)'
4 'Undergraduate Degree or Diploma'
9 'Professional qualification'
5 'Associate Diploma'
6 'Trade qualification'
7 'Non-trade qualification'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H3 = hiqual).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS highqual "Highest qualification obtained since leaving school".
Recode highqual (-1 = -1) (1 = 8) (2 = 1) (3 = 2) (4 = 3) (5 = 4) (6 = 5) (7 = 6) (8 = 7)  (ELSE = COPY).
VALUE LABELS highqual
-4 'Blank'
-1 'Missing'
-3 'No response'
8 'Still at school'
1 'No qualification since leaving school'
2 'Postgraduate Degree or Postgraduate Diploma'
3 'Bachelor Degree (including Honours)'
4 'Undergraduate Degree or Diploma'
9 'Professional qualification'
5 'Associate Diploma'
6 'Trade qualification'
7 'Non-trade qualification'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (highqual = hiqual).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS h3 "Highest qualification obtained since leaving school".
Recode h3 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7)  (ELSE = COPY).
VALUE LABELS h3
-4 'Blank'
-1 'Missing'
-3 'No response'
8 'Still at school'
1 'No qualification since leaving school'
2 'Postgraduate Degree or Postgraduate Diploma'
3 'Bachelor Degree (including Honours)'
4 'Undergraduate Degree or Diploma'
9 'Professional qualification'
5 'Associate Diploma'
6 'Trade qualification'
7 'Non-trade qualification'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h3 = hiqual).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS g3 "Highest qualification obtained since leaving school".
Recode g3 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7)  (ELSE = COPY).
VALUE LABELS g3
-4 'Blank'
-1 'Missing'
-3 'No response'
8 'Still at school'
1 'No qualification since leaving school'
2 'Postgraduate Degree or Postgraduate Diploma'
3 'Bachelor Degree (including Honours)'
4 'Undergraduate Degree or Diploma'
9 'Professional qualification'
5 'Associate Diploma'
6 'Trade qualification'
7 'Non-trade qualification'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (g3 = hiqual).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS g3 "Highest qualification obtained since leaving school".
Recode g3 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7)  (ELSE = COPY).
VALUE LABELS g3
-4 'Blank'
-1 'Missing'
-3 'No response'
8 'Still at school'
1 'No qualification since leaving school'
2 'Postgraduate Degree or Postgraduate Diploma'
3 'Bachelor Degree (including Honours)'
4 'Undergraduate Degree or Diploma'
9 'Professional qualification'
5 'Associate Diploma'
6 'Trade qualification'
7 'Non-trade qualification'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (g3 = hiqual).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS g3 "Highest qualification obtained since leaving school".
Recode g3 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7)  (ELSE = COPY).
VALUE LABELS g3
-4 'Blank'
-1 'Missing'
-3 'No response'
8 'Still at school'
1 'No qualification since leaving school'
2 'Postgraduate Degree or Postgraduate Diploma'
3 'Bachelor Degree (including Honours)'
4 'Undergraduate Degree or Diploma'
9 'Professional qualification'
5 'Associate Diploma'
6 'Trade qualification'
7 'Non-trade qualification'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (g3 = hiqual).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS G3 "Highest qualification obtained since leaving school".
Recode G3 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (999 = -2)  (ELSE = COPY).
VALUE LABELS G3
-4 'Blank'
-1 'Missing'
-3 'No response'
8 'Still at school'
1 'No qualification since leaving school'
2 'Postgraduate Degree or Postgraduate Diploma'
3 'Bachelor Degree (including Honours)'
4 'Undergraduate Degree or Diploma'
9 'Professional qualification'
5 'Associate Diploma'
6 'Trade qualification'
7 'Non-trade qualification'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (G3 = hiqual).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS G3 "Highest qualification obtained since leaving school".
Recode G3 (9999 = -3) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7)  (ELSE = COPY).
VALUE LABELS G3
-4 'Blank'
-1 'Missing'
-3 'No response'
8 'Still at school'
1 'No qualification since leaving school'
2 'Postgraduate Degree or Postgraduate Diploma'
3 'Bachelor Degree (including Honours)'
4 'Undergraduate Degree or Diploma'
9 'Professional qualification'
5 'Associate Diploma'
6 'Trade qualification'
7 'Non-trade qualification'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (G3 = hiqual).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS G3 "Highest qualification obtained since leaving school".
Recode G3 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (999 = -2)  (ELSE = COPY).
VALUE LABELS G3
-4 'Blank'
-1 'Missing'
-3 'No response'
8 'Still at school'
1 'No qualification since leaving school'
2 'Postgraduate Degree or Postgraduate Diploma'
3 'Bachelor Degree (including Honours)'
4 'Undergraduate Degree or Diploma'
9 'Professional qualification'
5 'Associate Diploma'
6 'Trade qualification'
7 'Non-trade qualification'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (G3 = hiqual).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS h5child "School sector of secondary education of child - public or private".
Recode h5child (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (9 = 9)  (ELSE = COPY).
VALUE LABELS h5child
-1 'Missing'
1 'Government'
2 'Catholic'
3 'Other non government'
9 'No children'.
EXECUTE.
RENAME VARIABLES (h5child = schsecch).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS g5child "School sector of secondary education of child - public or private".
Recode g5child (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (9 = 9)  (ELSE = COPY).
VALUE LABELS g5child
-1 'Missing'
1 'Government'
2 'Catholic'
3 'Other non government'
9 'No children'.
EXECUTE.
RENAME VARIABLES (g5child = schsecch).

DATASET ACTIVATE aes87_datafile.
VARIABLE LABELS q65 "Main activity in past week".
Recode q65 (0 = -3) (1 = 1) (2 = 2) (3 = 11) (4 = 10) (5 = 5) (6 = 6) (7 = 7)  (ELSE = COPY).
VALUE LABELS q65
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full time'
2 'Working part time'
3 'Unemployed looking for full time work'
11 'Off work'
4 'Unemployed looking for part time work'
10 'Unemployed no disambiguation'
5 'Retired'
6 'At school or university'
7 'Family or caring responsibilities'
8 'Other'
9 'Work and study'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (q65 = mainstat).

DATASET ACTIVATE aes90_datafile.
VARIABLE LABELS i5 "Main activity in past week".
Recode i5 (0 = -1) (1 = 1) (2 = 2) (3 = 10) (4 = 5) (5 = 6) (6 = 7) (7 = 8) (8 = 9)  (ELSE = COPY).
VALUE LABELS i5
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full time'
2 'Working part time'
3 'Unemployed looking for full time work'
11 'Off work'
4 'Unemployed looking for part time work'
10 'Unemployed no disambiguation'
5 'Retired'
6 'At school or university'
7 'Family or caring responsibilities'
8 'Other'
9 'Work and study'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i5 = mainstat).

DATASET ACTIVATE aes93_datafile.
VARIABLE LABELS i5 "Main activity in past week".
Recode i5 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (8 = 8)  (ELSE = COPY).
VALUE LABELS i5
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full time'
2 'Working part time'
3 'Unemployed looking for full time work'
11 'Off work'
4 'Unemployed looking for part time work'
10 'Unemployed no disambiguation'
5 'Retired'
6 'At school or university'
7 'Family or caring responsibilities'
8 'Other'
9 'Work and study'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i5 = mainstat).

DATASET ACTIVATE aes96_datafile.
VARIABLE LABELS h4 "Main activity in past week".
Recode h4 (-1 = -4) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (8 = 8)  (ELSE = COPY).
VALUE LABELS h4
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full time'
2 'Working part time'
3 'Unemployed looking for full time work'
11 'Off work'
4 'Unemployed looking for part time work'
10 'Unemployed no disambiguation'
5 'Retired'
6 'At school or university'
7 'Family or caring responsibilities'
8 'Other'
9 'Work and study'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h4 = mainstat).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS H4 "Main activity in past week".
Recode H4 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (8 = 8)  (ELSE = COPY).
VALUE LABELS H4
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full time'
2 'Working part time'
3 'Unemployed looking for full time work'
11 'Off work'
4 'Unemployed looking for part time work'
10 'Unemployed no disambiguation'
5 'Retired'
6 'At school or university'
7 'Family or caring responsibilities'
8 'Other'
9 'Work and study'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H4 = mainstat).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS workdo "Main activity in past week".
Recode workdo (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (8 = 8)  (ELSE = COPY).
VALUE LABELS workdo
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full time'
2 'Working part time'
3 'Unemployed looking for full time work'
11 'Off work'
4 'Unemployed looking for part time work'
10 'Unemployed no disambiguation'
5 'Retired'
6 'At school or university'
7 'Family or caring responsibilities'
8 'Other'
9 'Work and study'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (workdo = mainstat).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS h4 "Main activity in past week".
Recode h4 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (8 = 8)  (ELSE = COPY).
VALUE LABELS h4
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full time'
2 'Working part time'
3 'Unemployed looking for full time work'
11 'Off work'
4 'Unemployed looking for part time work'
10 'Unemployed no disambiguation'
5 'Retired'
6 'At school or university'
7 'Family or caring responsibilities'
8 'Other'
9 'Work and study'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h4 = mainstat).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS g4 "Main activity in past week".
Recode g4 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (8 = 8)  (ELSE = COPY).
VALUE LABELS g4
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full time'
2 'Working part time'
3 'Unemployed looking for full time work'
11 'Off work'
4 'Unemployed looking for part time work'
10 'Unemployed no disambiguation'
5 'Retired'
6 'At school or university'
7 'Family or caring responsibilities'
8 'Other'
9 'Work and study'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (g4 = mainstat).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS g4 "Main activity in past week".
Recode g4 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (8 = 8)  (ELSE = COPY).
VALUE LABELS g4
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full time'
2 'Working part time'
3 'Unemployed looking for full time work'
11 'Off work'
4 'Unemployed looking for part time work'
10 'Unemployed no disambiguation'
5 'Retired'
6 'At school or university'
7 'Family or caring responsibilities'
8 'Other'
9 'Work and study'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (g4 = mainstat).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS g4 "Main activity in past week".
Recode g4 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (8 = 8)  (ELSE = COPY).
VALUE LABELS g4
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full time'
2 'Working part time'
3 'Unemployed looking for full time work'
11 'Off work'
4 'Unemployed looking for part time work'
10 'Unemployed no disambiguation'
5 'Retired'
6 'At school or university'
7 'Family or caring responsibilities'
8 'Other'
9 'Work and study'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (g4 = mainstat).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS G4 "Main activity in past week".
Recode G4 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (8 = 8) (999 = -2)  (ELSE = COPY).
VALUE LABELS G4
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full time'
2 'Working part time'
3 'Unemployed looking for full time work'
11 'Off work'
4 'Unemployed looking for part time work'
10 'Unemployed no disambiguation'
5 'Retired'
6 'At school or university'
7 'Family or caring responsibilities'
8 'Other'
9 'Work and study'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (G4 = mainstat).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS G4 "Main activity in past week".
Recode G4 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (96 = 8) (999 = -3)  (ELSE = COPY).
VALUE LABELS G4
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full time'
2 'Working part time'
3 'Unemployed looking for full time work'
11 'Off work'
4 'Unemployed looking for part time work'
10 'Unemployed no disambiguation'
5 'Retired'
6 'At school or university'
7 'Family or caring responsibilities'
8 'Other'
9 'Work and study'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (G4 = mainstat).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS G4 "Main activity in past week".
Recode G4 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (96 = 8) (999 = -2)  (ELSE = COPY).
VALUE LABELS G4
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full time'
2 'Working part time'
3 'Unemployed looking for full time work'
11 'Off work'
4 'Unemployed looking for part time work'
10 'Unemployed no disambiguation'
5 'Retired'
6 'At school or university'
7 'Family or caring responsibilities'
8 'Other'
9 'Work and study'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (G4 = mainstat).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS G4_other "Last week, what were you mainly doing? (other specify)".
Recode G4_other (995 = -3)  (ELSE = COPY).
VALUE LABELS G4_other
-3 'no response'.
EXECUTE.
RENAME VARIABLES (G4_other = mainstot).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS G4_other "Last week, what were you mainly doing? (other specify)".
Recode G4_other  (ELSE = COPY).
VALUE LABELS G4_other
-3 'no response'.
EXECUTE.
RENAME VARIABLES (G4_other = mainstot).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS G4_other "Last week, what were you mainly doing? (other specify)".
Recode G4_other  (ELSE = COPY).
VALUE LABELS G4_other
-3 'no response'.
EXECUTE.
RENAME VARIABLES (G4_other = mainstot).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS G5_Work "Do you currently or have you ever worked for pay?".
Recode G5_Work (1 = 1) (2 = 2) (999 = -2)  (ELSE = COPY).
VALUE LABELS G5_Work
1 'Worked for pay'
2 'Never worked for pay'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (G5_Work = work4pay).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS G5_Work "Do you currently or have you ever worked for pay?".
Recode G5_Work (1 = 1) (2 = 2) (999 = -2)  (ELSE = COPY).
VALUE LABELS G5_Work
1 'Worked for pay'
2 'Never worked for pay'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (G5_Work = work4pay).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS G5_Work "Do you currently or have you ever worked for pay?".
Recode G5_Work (1 = 1) (2 = 2) (999 = -2)  (ELSE = COPY).
VALUE LABELS G5_Work
1 'Worked for pay'
2 'Never worked for pay'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (G5_Work = work4pay).

DATASET ACTIVATE aes96_datafile.
VARIABLE LABELS h5pos "Position in organisation".
Recode h5pos (-1 = -4) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5)  (ELSE = COPY).
VALUE LABELS h5pos
-1 'Missing'
-4 'Blank'
1 'Upper managerial'
2 'Middle managerial'
3 'Lower managerial'
4 'Supervisory'
5 'Non-supervisory'
-7 'Not sure'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h5pos = opos).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS H5POS "Position in organisation".
Recode H5POS (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5)  (ELSE = COPY).
VALUE LABELS H5POS
-1 'Missing'
-4 'Blank'
1 'Upper managerial'
2 'Middle managerial'
3 'Lower managerial'
4 'Supervisory'
5 'Non-supervisory'
-7 'Not sure'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H5POS = opos).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS occupat "Position in organisation".
Recode occupat (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = -7)  (ELSE = COPY).
VALUE LABELS occupat
-1 'Missing'
-4 'Blank'
1 'Upper managerial'
2 'Middle managerial'
3 'Lower managerial'
4 'Supervisory'
5 'Non-supervisory'
-7 'Not sure'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (occupat = opos).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS h6pos "Position in organisation".
Recode h6pos (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5)  (ELSE = COPY).
VALUE LABELS h6pos
-1 'Missing'
-4 'Blank'
1 'Upper managerial'
2 'Middle managerial'
3 'Lower managerial'
4 'Supervisory'
5 'Non-supervisory'
-7 'Not sure'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h6pos = opos).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS g6pos "Position in organisation".
Recode g6pos (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5)  (ELSE = COPY).
VALUE LABELS g6pos
-1 'Missing'
-4 'Blank'
1 'Upper managerial'
2 'Middle managerial'
3 'Lower managerial'
4 'Supervisory'
5 'Non-supervisory'
-7 'Not sure'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (g6pos = opos).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS g5pos "Position in organisation".
Recode g5pos (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5)  (ELSE = COPY).
VALUE LABELS g5pos
-1 'Missing'
-4 'Blank'
1 'Upper managerial'
2 'Middle managerial'
3 'Lower managerial'
4 'Supervisory'
5 'Non-supervisory'
-7 'Not sure'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (g5pos = opos).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS g5pos "Position in organisation".
Recode g5pos (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5)  (ELSE = COPY).
VALUE LABELS g5pos
-1 'Missing'
-4 'Blank'
1 'Upper managerial'
2 'Middle managerial'
3 'Lower managerial'
4 'Supervisory'
5 'Non-supervisory'
-7 'Not sure'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (g5pos = opos).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS G5_D "Position in organisation".
Recode G5_D (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (997 = -8) (999 = -2)  (ELSE = COPY).
VALUE LABELS G5_D
-1 'Missing'
-4 'Blank'
1 'Upper managerial'
2 'Middle managerial'
3 'Lower managerial'
4 'Supervisory'
5 'Non-supervisory'
-7 'Not sure'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (G5_D = opos).

DATASET ACTIVATE aes87_datafile.
VARIABLE LABELS q66d "Employer sector".
Recode q66d (0 = -3) (6 = 1) (1 = 2) (2 = 5) (5 = 4) (3 = 6) (4 = 7) (9 = -2)  (ELSE = COPY).
VALUE LABELS q66d
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Self-employed'
2 'Employee in private company or business'
3 'Employee of Federal/State/Local Government'
5 'Federal Government'
4 'Employee in family business or farm'
6 'State Government'
7 'Local Government'
-2 'Skipped'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (q66d = empsect).

DATASET ACTIVATE aes90_datafile.
VARIABLE LABELS i6d "Employer sector".
Recode i6d (0 = -1) (1 = 1) (2 = 2) (3 = 5) (4 = 6) (5 = 7)  (ELSE = COPY).
VALUE LABELS i6d
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Self-employed'
2 'Employee in private company or business'
3 'Employee of Federal/State/Local Government'
5 'Federal Government'
4 'Employee in family business or farm'
6 'State Government'
7 'Local Government'
-2 'Skipped'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (i6d = empsect).

DATASET ACTIVATE aes93_datafile.
VARIABLE LABELS i6d "Employer sector".
Recode i6d (1 = 1) (2 = 2) (3 = 5) (6 = 4) (4 = 6) (5 = 7)  (ELSE = COPY).
VALUE LABELS i6d
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Self-employed'
2 'Employee in private company or business'
3 'Employee of Federal/State/Local Government'
5 'Federal Government'
4 'Employee in family business or farm'
6 'State Government'
7 'Local Government'
-2 'Skipped'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (i6d = empsect).

DATASET ACTIVATE aes96_datafile.
VARIABLE LABELS h5employ "Employer sector".
Recode h5employ (-1 = -4) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS h5employ
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Self-employed'
2 'Employee in private company or business'
3 'Employee of Federal/State/Local Government'
5 'Federal Government'
4 'Employee in family business or farm'
6 'State Government'
7 'Local Government'
-2 'Skipped'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (h5employ = empsect).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS H5EMPLOY "Employer sector".
Recode H5EMPLOY (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS H5EMPLOY
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Self-employed'
2 'Employee in private company or business'
3 'Employee of Federal/State/Local Government'
5 'Federal Government'
4 'Employee in family business or farm'
6 'State Government'
7 'Local Government'
-2 'Skipped'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (H5EMPLOY = empsect).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS workwho "Employer sector".
Recode workwho (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS workwho
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Self-employed'
2 'Employee in private company or business'
3 'Employee of Federal/State/Local Government'
5 'Federal Government'
4 'Employee in family business or farm'
6 'State Government'
7 'Local Government'
-2 'Skipped'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (workwho = empsect).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS h6employ "Employer sector".
Recode h6employ (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS h6employ
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Self-employed'
2 'Employee in private company or business'
3 'Employee of Federal/State/Local Government'
5 'Federal Government'
4 'Employee in family business or farm'
6 'State Government'
7 'Local Government'
-2 'Skipped'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (h6employ = empsect).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS g6employ "Employer sector".
Recode g6employ (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS g6employ
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Self-employed'
2 'Employee in private company or business'
3 'Employee of Federal/State/Local Government'
5 'Federal Government'
4 'Employee in family business or farm'
6 'State Government'
7 'Local Government'
-2 'Skipped'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (g6employ = empsect).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS g5employ "Employer sector".
Recode g5employ (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS g5employ
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Self-employed'
2 'Employee in private company or business'
3 'Employee of Federal/State/Local Government'
5 'Federal Government'
4 'Employee in family business or farm'
6 'State Government'
7 'Local Government'
-2 'Skipped'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (g5employ = empsect).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS g5employ "Employer sector".
Recode g5employ (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS g5employ
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Self-employed'
2 'Employee in private company or business'
3 'Employee of Federal/State/Local Government'
5 'Federal Government'
4 'Employee in family business or farm'
6 'State Government'
7 'Local Government'
-2 'Skipped'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (g5employ = empsect).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS G5_E "Employer sector".
Recode G5_E (1 = 1) (2 = 2) (3 = 3) (4 = 4) (999 = -2) (997 = -8)  (ELSE = COPY).
VALUE LABELS G5_E
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Self-employed'
2 'Employee in private company or business'
3 'Employee of Federal/State/Local Government'
5 'Federal Government'
4 'Employee in family business or farm'
6 'State Government'
7 'Local Government'
-2 'Skipped'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (G5_E = empsect).

DATASET ACTIVATE aes87_datafile.
VARIABLE LABELS q67 "Supervisory responsibility".
Recode q67 (0 = -3) (1 = 1) (2 = 2) (9 = -2)  (ELSE = COPY).
VALUE LABELS q67
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Yes'
2 'No'
-2 'Skipped'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (q67 = supother).

DATASET ACTIVATE aes90_datafile.
VARIABLE LABELS i7 "Supervisory responsibility".
Recode i7 (0 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS i7
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Yes'
2 'No'
-2 'Skipped'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (i7 = supother).

DATASET ACTIVATE aes93_datafile.
VARIABLE LABELS i7p1 "Supervisory responsibility".
Recode i7p1 (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS i7p1
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Yes'
2 'No'
-2 'Skipped'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (i7p1 = supother).

DATASET ACTIVATE aes96_datafile.
VARIABLE LABELS h5superv "Supervisory responsibility".
Recode h5superv (-1 = -4) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS h5superv
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Yes'
2 'No'
-2 'Skipped'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (h5superv = supother).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS H5SUPERV "Supervisory responsibility".
Recode H5SUPERV (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS H5SUPERV
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Yes'
2 'No'
-2 'Skipped'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (H5SUPERV = supother).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS supervis "Supervisory responsibility".
Recode supervis (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS supervis
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Yes'
2 'No'
-2 'Skipped'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (supervis = supother).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS h6superv "Supervisory responsibility".
Recode h6superv (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS h6superv
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Yes'
2 'No'
-2 'Skipped'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (h6superv = supother).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS g6superv "Supervisory responsibility".
Recode g6superv (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS g6superv
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Yes'
2 'No'
-2 'Skipped'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (g6superv = supother).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS g5superv "Supervisory responsibility".
Recode g5superv (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS g5superv
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Yes'
2 'No'
-2 'Skipped'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (g5superv = supother).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS g5superv "Supervisory responsibility".
Recode g5superv (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS g5superv
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Yes'
2 'No'
-2 'Skipped'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (g5superv = supother).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS G5_F "Supervisory responsibility".
Recode G5_F (1 = 1) (2 = 2) (999 = -2) (997 = -8)  (ELSE = COPY).
VALUE LABELS G5_F
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Yes'
2 'No'
-2 'Skipped'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (G5_F = supother).

DATASET ACTIVATE aes87_datafile.
VARIABLE LABELS q68 "Belong to a trade union or staff association".
Recode q68 (0 = -3) (1 = 1) (2 = 2) (9 = -2)  (ELSE = COPY).
VALUE LABELS q68
-4 'Blank'
-1 'Missing'
-3 'No response'
99 'Yes, trade union'
1 'Yes'
98 'Yes, staff association'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (q68 = unionmem).

DATASET ACTIVATE aes90_datafile.
VARIABLE LABELS i8 "Belong to a trade union or staff association".
Recode i8 (0 = -1) (1 = 99) (1 = 1) (2 = 98) (3 = 2)  (ELSE = COPY).
VALUE LABELS i8
-4 'Blank'
-1 'Missing'
-3 'No response'
99 'Yes, trade union'
1 'Yes'
98 'Yes, staff association'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i8 = unionmem).

DATASET ACTIVATE aes96_datafile.
VARIABLE LABELS h6 "Belong to a trade union or staff association".
Recode h6 (-1 = -4) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS h6
-4 'Blank'
-1 'Missing'
-3 'No response'
99 'Yes, trade union'
1 'Yes'
98 'Yes, staff association'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h6 = unionmem).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS H6 "Belong to a trade union or staff association".
Recode H6 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS H6
-4 'Blank'
-1 'Missing'
-3 'No response'
99 'Yes, trade union'
1 'Yes'
98 'Yes, staff association'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H6 = unionmem).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS union "Belong to a trade union or staff association".
Recode union (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS union
-4 'Blank'
-1 'Missing'
-3 'No response'
99 'Yes, trade union'
1 'Yes'
98 'Yes, staff association'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (union = unionmem).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS h7 "Belong to a trade union or staff association".
Recode h7 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS h7
-4 'Blank'
-1 'Missing'
-3 'No response'
99 'Yes, trade union'
1 'Yes'
98 'Yes, staff association'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h7 = unionmem).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS g7 "Belong to a trade union or staff association".
Recode g7 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS g7
-4 'Blank'
-1 'Missing'
-3 'No response'
99 'Yes, trade union'
1 'Yes'
98 'Yes, staff association'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (g7 = unionmem).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS g6 "Belong to a trade union or staff association".
Recode g6 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS g6
-4 'Blank'
-1 'Missing'
-3 'No response'
99 'Yes, trade union'
1 'Yes'
98 'Yes, staff association'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (g6 = unionmem).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS g6 "Belong to a trade union or staff association".
Recode g6 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS g6
-4 'Blank'
-1 'Missing'
-3 'No response'
99 'Yes, trade union'
1 'Yes'
98 'Yes, staff association'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (g6 = unionmem).

DATASET ACTIVATE aes87_datafile.
VARIABLE LABELS q79f "Fathers political preference at R Age 14".
Recode q79f (0 = -3) (1 = 1) (2 = 2) (3 = 3) (5 = 4) (4 = 5) (6 = 6) (8 = 9)  (ELSE = COPY).
VALUE LABELS q79f
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
7 'Greens'
6 'Other parties'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (q79f = faptid14).

DATASET ACTIVATE aes90_datafile.
VARIABLE LABELS j6dad "Fathers political preference at R Age 14".
Recode j6dad (0 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 6)  (ELSE = COPY).
VALUE LABELS j6dad
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
7 'Greens'
6 'Other parties'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j6dad = faptid14).

DATASET ACTIVATE aes93_datafile.
VARIABLE LABELS j5dad "Fathers political preference at R Age 14".
Recode j5dad (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 6)  (ELSE = COPY).
VALUE LABELS j5dad
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
7 'Greens'
6 'Other parties'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j5dad = faptid14).

DATASET ACTIVATE aes96_datafile.
VARIABLE LABELS j4dad "Fathers political preference at R Age 14".
Recode j4dad (-1 = -4) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = -7)  (ELSE = COPY).
VALUE LABELS j4dad
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
7 'Greens'
6 'Other parties'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j4dad = faptid14).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS I4DAD "Fathers political preference at R Age 14".
Recode I4DAD (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = -7)  (ELSE = COPY).
VALUE LABELS I4DAD
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
7 'Greens'
6 'Other parties'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (I4DAD = faptid14).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS partyfa "Fathers political preference at R Age 14".
Recode partyfa (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 5) (5 = 7) (7 = 6) (6 = 8) (8 = -7)  (ELSE = COPY).
VALUE LABELS partyfa
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
7 'Greens'
6 'Other parties'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (partyfa = faptid14).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS i5dad "Fathers political preference at R Age 14".
Recode i5dad (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = -7)  (ELSE = COPY).
VALUE LABELS i5dad
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
7 'Greens'
6 'Other parties'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i5dad = faptid14).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS h5dad "Fathers political preference at R Age 14".
Recode h5dad (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = -7)  (ELSE = COPY).
VALUE LABELS h5dad
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
7 'Greens'
6 'Other parties'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h5dad = faptid14).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS h4dad "Fathers political preference at R Age 14".
Recode h4dad (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = -7)  (ELSE = COPY).
VALUE LABELS h4dad
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
7 'Greens'
6 'Other parties'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h4dad = faptid14).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS h5dad "Fathers political preference at R Age 14".
Recode h5dad (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = -7)  (ELSE = COPY).
VALUE LABELS h5dad
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
7 'Greens'
6 'Other parties'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h5dad = faptid14).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H5_1 "Fathers political preference at R Age 14".
Recode H5_1 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (998 = -7) (999 = -2)  (ELSE = COPY).
VALUE LABELS H5_1
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
7 'Greens'
6 'Other parties'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H5_1 = faptid14).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS H5_1 "Fathers political preference at R Age 14".
Recode H5_1 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (7 = 7) (6 = 6) (998 = -7) (999 = -2)  (ELSE = COPY).
VALUE LABELS H5_1
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
7 'Greens'
6 'Other parties'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H5_1 = faptid14).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS H5_1 "Fathers political preference at R Age 14".
Recode H5_1 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (7 = 7) (6 = 6) (998 = -7) (999 = -2)  (ELSE = COPY).
VALUE LABELS H5_1
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
7 'Greens'
6 'Other parties'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H5_1 = faptid14).

DATASET ACTIVATE aes87_datafile.
VARIABLE LABELS q79m "Mothers political preference at R Age 14".
Recode q79m (0 = -3) (1 = 1) (2 = 2) (3 = 3) (5 = 4) (4 = 5) (6 = 6) (8 = 9)  (ELSE = COPY).
VALUE LABELS q79m
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
6 'Other parties'
7 'Greens'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (q79m = moptid14).

DATASET ACTIVATE aes90_datafile.
VARIABLE LABELS j6mum "Mothers political preference at R Age 14".
Recode j6mum (0 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 6)  (ELSE = COPY).
VALUE LABELS j6mum
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
6 'Other parties'
7 'Greens'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j6mum = moptid14).

DATASET ACTIVATE aes93_datafile.
VARIABLE LABELS j5mum "Mothers political preference at R Age 14".
Recode j5mum (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 6)  (ELSE = COPY).
VALUE LABELS j5mum
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
6 'Other parties'
7 'Greens'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j5mum = moptid14).

DATASET ACTIVATE aes96_datafile.
VARIABLE LABELS j4mum "Mothers political preference at R Age 14".
Recode j4mum (-1 = -4) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = -7)  (ELSE = COPY).
VALUE LABELS j4mum
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
6 'Other parties'
7 'Greens'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j4mum = moptid14).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS I4MUM "Mothers political preference at R Age 14".
Recode I4MUM (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = -7)  (ELSE = COPY).
VALUE LABELS I4MUM
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
6 'Other parties'
7 'Greens'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (I4MUM = moptid14).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS partymo "Mothers political preference at R Age 14".
Recode partymo (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 5) (7 = 6) (5 = 7) (6 = 8) (8 = -7)  (ELSE = COPY).
VALUE LABELS partymo
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
6 'Other parties'
7 'Greens'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (partymo = moptid14).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS i5mum "Mothers political preference at R Age 14".
Recode i5mum (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = -7)  (ELSE = COPY).
VALUE LABELS i5mum
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
6 'Other parties'
7 'Greens'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i5mum = moptid14).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS h5mum "Mothers political preference at R Age 14".
Recode h5mum (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = -7)  (ELSE = COPY).
VALUE LABELS h5mum
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
6 'Other parties'
7 'Greens'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h5mum = moptid14).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS h4mum "Mothers political preference at R Age 14".
Recode h4mum (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = -7)  (ELSE = COPY).
VALUE LABELS h4mum
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
6 'Other parties'
7 'Greens'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h4mum = moptid14).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS h5mum "Mothers political preference at R Age 14".
Recode h5mum (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = -7)  (ELSE = COPY).
VALUE LABELS h5mum
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
6 'Other parties'
7 'Greens'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h5mum = moptid14).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H5_2 "Mothers political preference at R Age 14".
Recode H5_2 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (998 = -7) (999 = -2)  (ELSE = COPY).
VALUE LABELS H5_2
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
6 'Other parties'
7 'Greens'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H5_2 = moptid14).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS H5_2 "Mothers political preference at R Age 14".
Recode H5_2 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (998 = -7) (999 = -2)  (ELSE = COPY).
VALUE LABELS H5_2
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
6 'Other parties'
7 'Greens'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H5_2 = moptid14).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS H5_2 "Mothers political preference at R Age 14".
Recode H5_2 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (998 = -7) (999 = -2)  (ELSE = COPY).
VALUE LABELS H5_2
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
4 'Democratic Labor (DLP)'
5 'Australian Democrats'
6 'Other parties'
7 'Greens'
8 'One Nation'
-7 'Not sure'
9 'None'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H5_2 = moptid14).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS h3 "Aboriginal or Torres Strait Islander self-identification".
Recode h3 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS h3
-1 'Missing'
1 'Yes'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h3 = indigsid).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H4 "Aboriginal or Torres Strait Islander self-identification".
Recode H4 (1 = 1) (2 = 2) (999 = -2)  (ELSE = COPY).
VALUE LABELS H4
-1 'Missing'
1 'Yes'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H4 = indigsid).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS H4 "Aboriginal or Torres Strait Islander self-identification".
Recode H4 (1 = 1) (2 = 2) (999 = -2)  (ELSE = COPY).
VALUE LABELS H4
-1 'Missing'
1 'Yes'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H4 = indigsid).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS H4 "Aboriginal or Torres Strait Islander self-identification".
Recode H4 (1 = 1) (2 = 2) (999 = -2)  (ELSE = COPY).
VALUE LABELS H4
-1 'Missing'
1 'Yes'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H4 = indigsid).

DATASET ACTIVATE aes87_datafile.
VARIABLE LABELS q89 "Religion".
Recode q89 (0 = -3) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 3) (7 = 7) (8 = 18) (9 = 22)  (ELSE = COPY).
VALUE LABELS q89
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Roman Catholic'
2 'Anglican/Church of England'
3 'Uniting Church/Methodist'
4 'Orthodox Church'
5 'Presbyterian'
6 'Other'
7 'No religion'
8 'Catholic (not Roman)'
18 'Other Christian'
9 'Armenian Apostolic'
22 'Other Non-Christian'
10 'Baptist'
11 'Brethren'
12 'Churches of Christ'
13 'Latter Day Saints'
14 'Lutheran'
15 'Salvation Army'
16 'Seventh Day Adventist'
17 'Other Protestant'
19 'Buddhist'
20 'Hebrew/Jewish'
21 'Muslim'
23 'Hindu'
24 'Pentecostalism'
96 'Christian (Specified)'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (q89 = religion).

DATASET ACTIVATE aes90_datafile.
VARIABLE LABELS j7 "Religion".
Recode j7 (0 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (9 = 7)  (ELSE = COPY).
VALUE LABELS j7
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Roman Catholic'
2 'Anglican/Church of England'
3 'Uniting Church/Methodist'
4 'Orthodox Church'
5 'Presbyterian'
6 'Other'
7 'No religion'
8 'Catholic (not Roman)'
18 'Other Christian'
9 'Armenian Apostolic'
22 'Other Non-Christian'
10 'Baptist'
11 'Brethren'
12 'Churches of Christ'
13 'Latter Day Saints'
14 'Lutheran'
15 'Salvation Army'
16 'Seventh Day Adventist'
17 'Other Protestant'
19 'Buddhist'
20 'Hebrew/Jewish'
21 'Muslim'
23 'Hindu'
24 'Pentecostalism'
96 'Christian (Specified)'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j7 = religion).

DATASET ACTIVATE aes93_datafile.
VARIABLE LABELS j8 "Religion".
Recode j8 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (9 = 7)  (ELSE = COPY).
VALUE LABELS j8
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Roman Catholic'
2 'Anglican/Church of England'
3 'Uniting Church/Methodist'
4 'Orthodox Church'
5 'Presbyterian'
6 'Other'
7 'No religion'
8 'Catholic (not Roman)'
18 'Other Christian'
9 'Armenian Apostolic'
22 'Other Non-Christian'
10 'Baptist'
11 'Brethren'
12 'Churches of Christ'
13 'Latter Day Saints'
14 'Lutheran'
15 'Salvation Army'
16 'Seventh Day Adventist'
17 'Other Protestant'
19 'Buddhist'
20 'Hebrew/Jewish'
21 'Muslim'
23 'Hindu'
24 'Pentecostalism'
96 'Christian (Specified)'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j8 = religion).

DATASET ACTIVATE aes96_datafile.
VARIABLE LABELS j5 "Religion".
Recode j5 (-1 = -4) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (9 = 7)  (ELSE = COPY).
VALUE LABELS j5
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Roman Catholic'
2 'Anglican/Church of England'
3 'Uniting Church/Methodist'
4 'Orthodox Church'
5 'Presbyterian'
6 'Other'
7 'No religion'
8 'Catholic (not Roman)'
18 'Other Christian'
9 'Armenian Apostolic'
22 'Other Non-Christian'
10 'Baptist'
11 'Brethren'
12 'Churches of Christ'
13 'Latter Day Saints'
14 'Lutheran'
15 'Salvation Army'
16 'Seventh Day Adventist'
17 'Other Protestant'
19 'Buddhist'
20 'Hebrew/Jewish'
21 'Muslim'
23 'Hindu'
24 'Pentecostalism'
96 'Christian (Specified)'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j5 = religion).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS I5 "Religion".
Recode I5 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (9 = 7)  (ELSE = COPY).
VALUE LABELS I5
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Roman Catholic'
2 'Anglican/Church of England'
3 'Uniting Church/Methodist'
4 'Orthodox Church'
5 'Presbyterian'
6 'Other'
7 'No religion'
8 'Catholic (not Roman)'
18 'Other Christian'
9 'Armenian Apostolic'
22 'Other Non-Christian'
10 'Baptist'
11 'Brethren'
12 'Churches of Christ'
13 'Latter Day Saints'
14 'Lutheran'
15 'Salvation Army'
16 'Seventh Day Adventist'
17 'Other Protestant'
19 'Buddhist'
20 'Hebrew/Jewish'
21 'Muslim'
23 'Hindu'
24 'Pentecostalism'
96 'Christian (Specified)'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (I5 = religion).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS religion "Religion".
Recode religion (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7)  (ELSE = COPY).
VALUE LABELS religion
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Roman Catholic'
2 'Anglican/Church of England'
3 'Uniting Church/Methodist'
4 'Orthodox Church'
5 'Presbyterian'
6 'Other'
7 'No religion'
8 'Catholic (not Roman)'
18 'Other Christian'
9 'Armenian Apostolic'
22 'Other Non-Christian'
10 'Baptist'
11 'Brethren'
12 'Churches of Christ'
13 'Latter Day Saints'
14 'Lutheran'
15 'Salvation Army'
16 'Seventh Day Adventist'
17 'Other Protestant'
19 'Buddhist'
20 'Hebrew/Jewish'
21 'Muslim'
23 'Hindu'
24 'Pentecostalism'
96 'Christian (Specified)'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (religion = religion).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS i6 "Religion".
Recode i6 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (9 = 7)  (ELSE = COPY).
VALUE LABELS i6
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Roman Catholic'
2 'Anglican/Church of England'
3 'Uniting Church/Methodist'
4 'Orthodox Church'
5 'Presbyterian'
6 'Other'
7 'No religion'
8 'Catholic (not Roman)'
18 'Other Christian'
9 'Armenian Apostolic'
22 'Other Non-Christian'
10 'Baptist'
11 'Brethren'
12 'Churches of Christ'
13 'Latter Day Saints'
14 'Lutheran'
15 'Salvation Army'
16 'Seventh Day Adventist'
17 'Other Protestant'
19 'Buddhist'
20 'Hebrew/Jewish'
21 'Muslim'
23 'Hindu'
24 'Pentecostalism'
96 'Christian (Specified)'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i6 = religion).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS h6 "Religion".
Recode h6 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (9 = 7)  (ELSE = COPY).
VALUE LABELS h6
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Roman Catholic'
2 'Anglican/Church of England'
3 'Uniting Church/Methodist'
4 'Orthodox Church'
5 'Presbyterian'
6 'Other'
7 'No religion'
8 'Catholic (not Roman)'
18 'Other Christian'
9 'Armenian Apostolic'
22 'Other Non-Christian'
10 'Baptist'
11 'Brethren'
12 'Churches of Christ'
13 'Latter Day Saints'
14 'Lutheran'
15 'Salvation Army'
16 'Seventh Day Adventist'
17 'Other Protestant'
19 'Buddhist'
20 'Hebrew/Jewish'
21 'Muslim'
23 'Hindu'
24 'Pentecostalism'
96 'Christian (Specified)'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h6 = religion).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS h5 "Religion".
Recode h5 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7)  (ELSE = COPY).
VALUE LABELS h5
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Roman Catholic'
2 'Anglican/Church of England'
3 'Uniting Church/Methodist'
4 'Orthodox Church'
5 'Presbyterian'
6 'Other'
7 'No religion'
8 'Catholic (not Roman)'
18 'Other Christian'
9 'Armenian Apostolic'
22 'Other Non-Christian'
10 'Baptist'
11 'Brethren'
12 'Churches of Christ'
13 'Latter Day Saints'
14 'Lutheran'
15 'Salvation Army'
16 'Seventh Day Adventist'
17 'Other Protestant'
19 'Buddhist'
20 'Hebrew/Jewish'
21 'Muslim'
23 'Hindu'
24 'Pentecostalism'
96 'Christian (Specified)'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h5 = religion).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS h6 "Religion".
Recode h6 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7)  (ELSE = COPY).
VALUE LABELS h6
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Roman Catholic'
2 'Anglican/Church of England'
3 'Uniting Church/Methodist'
4 'Orthodox Church'
5 'Presbyterian'
6 'Other'
7 'No religion'
8 'Catholic (not Roman)'
18 'Other Christian'
9 'Armenian Apostolic'
22 'Other Non-Christian'
10 'Baptist'
11 'Brethren'
12 'Churches of Christ'
13 'Latter Day Saints'
14 'Lutheran'
15 'Salvation Army'
16 'Seventh Day Adventist'
17 'Other Protestant'
19 'Buddhist'
20 'Hebrew/Jewish'
21 'Muslim'
23 'Hindu'
24 'Pentecostalism'
96 'Christian (Specified)'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h6 = religion).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H6 "Religion".
Recode H6 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (8 = 8) (18 = 18) (9 = 9) (22 = 22) (10 = 10) (11 = 11) (12 = 12) (13 = 13) (14 = 14) (15 = 15) (16 = 16) (17 = 17) (19 = 19) (20 = 20) (21 = 21) (23 = 23) (24 = 24) (96 = 96) (999 = -2)  (ELSE = COPY).
VALUE LABELS H6
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Roman Catholic'
2 'Anglican/Church of England'
3 'Uniting Church/Methodist'
4 'Orthodox Church'
5 'Presbyterian'
6 'Other'
7 'No religion'
8 'Catholic (not Roman)'
18 'Other Christian'
9 'Armenian Apostolic'
22 'Other Non-Christian'
10 'Baptist'
11 'Brethren'
12 'Churches of Christ'
13 'Latter Day Saints'
14 'Lutheran'
15 'Salvation Army'
16 'Seventh Day Adventist'
17 'Other Protestant'
19 'Buddhist'
20 'Hebrew/Jewish'
21 'Muslim'
23 'Hindu'
24 'Pentecostalism'
96 'Christian (Specified)'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H6 = religion).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS H6 "Religion".
Recode H6 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (8 = 8) (18 = 18) (9 = 9) (22 = 22) (10 = 10) (11 = 11) (12 = 12) (13 = 13) (14 = 14) (15 = 15) (16 = 16) (17 = 17) (19 = 19) (20 = 20) (21 = 21) (23 = 23) (24 = 24) (96 = 96) (999 = -2)  (ELSE = COPY).
VALUE LABELS H6
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Roman Catholic'
2 'Anglican/Church of England'
3 'Uniting Church/Methodist'
4 'Orthodox Church'
5 'Presbyterian'
6 'Other'
7 'No religion'
8 'Catholic (not Roman)'
18 'Other Christian'
9 'Armenian Apostolic'
22 'Other Non-Christian'
10 'Baptist'
11 'Brethren'
12 'Churches of Christ'
13 'Latter Day Saints'
14 'Lutheran'
15 'Salvation Army'
16 'Seventh Day Adventist'
17 'Other Protestant'
19 'Buddhist'
20 'Hebrew/Jewish'
21 'Muslim'
23 'Hindu'
24 'Pentecostalism'
96 'Christian (Specified)'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H6 = religion).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS H6 "Religion".
Recode H6 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (8 = 8) (18 = 18) (9 = 9) (22 = 22) (10 = 10) (11 = 11) (12 = 12) (13 = 13) (14 = 14) (15 = 15) (16 = 16) (17 = 17) (19 = 19) (20 = 20) (21 = 21) (23 = 23) (24 = 24) (96 = 96) (999 = -2)  (ELSE = COPY).
VALUE LABELS H6
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Roman Catholic'
2 'Anglican/Church of England'
3 'Uniting Church/Methodist'
4 'Orthodox Church'
5 'Presbyterian'
6 'Other'
7 'No religion'
8 'Catholic (not Roman)'
18 'Other Christian'
9 'Armenian Apostolic'
22 'Other Non-Christian'
10 'Baptist'
11 'Brethren'
12 'Churches of Christ'
13 'Latter Day Saints'
14 'Lutheran'
15 'Salvation Army'
16 'Seventh Day Adventist'
17 'Other Protestant'
19 'Buddhist'
20 'Hebrew/Jewish'
21 'Muslim'
23 'Hindu'
24 'Pentecostalism'
96 'Christian (Specified)'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H6 = religion).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS XI5 "EXTENDED:Religion".
Recode XI5 (-1 = -1) (1 = 1) (2 = 8) (3 = 2) (5 = 4) (6 = 5) (4 = 3) (7 = 3) (8 = 9) (9 = 10) (10 = 11) (11 = 12) (13 = 13) (14 = 13) (15 = 14) (17 = 15) (18 = 16) (19 = 17) (20 = 18) (21 = 19) (22 = 20) (23 = 21) (24 = 22) (25 = 23) (97 = 97) (98 = 7)  (ELSE = COPY).
VALUE LABELS XI5
-1 'Missing'
1 'Roman Catholic'
8 'Catholic (not Roman)'
2 'Anglican/Church of England'
4 'Orthodox Church'
5 'Presbyterian'
6 'Other (Please specify)'
3 'Uniting Church/Methodist'
9 'Armenian Apostolic'
10 'Baptist'
11 'Brethren'
12 'Churches of Christ'
13 'Jehovahs Witness/Latter Day Saints'
14 'Lutheran'
15 'Salvation Army'
16 'Seventh Day Adventist'
17 'Other Protestant'
18 'Other Christian'
19 'Buddhist'
20 'Hebrew/Jewish'
21 'Muslim'
22 'Other Non-Christian'
24 'Pentecostalism'
23 'Hindu'
96 'Christian (Specified)'
97 'Other (Not Specified)'
7 'No religion'
-3 'No response'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (XI5 = xreligio).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS xi5 "EXTENDED:Religion".
Recode xi5 (-1 = -1) (1 = 1) (2 = 8) (3 = 2) (5 = 4) (6 = 5) (4 = 3) (7 = 3) (8 = 9) (9 = 10) (10 = 11) (11 = 12) (13 = 13) (14 = 13) (15 = 14) (17 = 15) (18 = 16) (19 = 17) (20 = 18) (21 = 19) (22 = 20) (23 = 21) (24 = 22) (25 = 23) (97 = 97) (98 = 7)  (ELSE = COPY).
VALUE LABELS xi5
-1 'Missing'
1 'Roman Catholic'
8 'Catholic (not Roman)'
2 'Anglican/Church of England'
4 'Orthodox Church'
5 'Presbyterian'
6 'Other (Please specify)'
3 'Uniting Church/Methodist'
9 'Armenian Apostolic'
10 'Baptist'
11 'Brethren'
12 'Churches of Christ'
13 'Jehovahs Witness/Latter Day Saints'
14 'Lutheran'
15 'Salvation Army'
16 'Seventh Day Adventist'
17 'Other Protestant'
18 'Other Christian'
19 'Buddhist'
20 'Hebrew/Jewish'
21 'Muslim'
22 'Other Non-Christian'
24 'Pentecostalism'
23 'Hindu'
96 'Christian (Specified)'
97 'Other (Not Specified)'
7 'No religion'
-3 'No response'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (xi5 = xreligio).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS xi6 "EXTENDED:Religion".
Recode xi6 (-1 = -1) (1 = 1) (2 = 8) (3 = 2) (5 = 4) (6 = 5) (7 = 3) (8 = 9) (9 = 10) (10 = 11) (11 = 12) (13 = 13) (14 = 13) (15 = 14) (17 = 15) (18 = 16) (19 = 17) (20 = 18) (21 = 19) (22 = 20) (23 = 21) (24 = 22) (25 = 23) (97 = 97) (98 = 7)  (ELSE = COPY).
VALUE LABELS xi6
-1 'Missing'
1 'Roman Catholic'
8 'Catholic (not Roman)'
2 'Anglican/Church of England'
4 'Orthodox Church'
5 'Presbyterian'
6 'Other (Please specify)'
3 'Uniting Church/Methodist'
9 'Armenian Apostolic'
10 'Baptist'
11 'Brethren'
12 'Churches of Christ'
13 'Jehovahs Witness/Latter Day Saints'
14 'Lutheran'
15 'Salvation Army'
16 'Seventh Day Adventist'
17 'Other Protestant'
18 'Other Christian'
19 'Buddhist'
20 'Hebrew/Jewish'
21 'Muslim'
22 'Other Non-Christian'
24 'Pentecostalism'
23 'Hindu'
96 'Christian (Specified)'
97 'Other (Not Specified)'
7 'No religion'
-3 'No response'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (xi6 = xreligio).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS xh6 "EXTENDED:Religion".
Recode xh6 (-1 = -1) (1 = 1) (2 = 8) (3 = 2) (5 = 4) (6 = 5) (7 = 3) (8 = 9) (9 = 10) (10 = 11) (11 = 12) (13 = 13) (14 = 13) (15 = 14) (17 = 15) (18 = 16) (19 = 17) (20 = 18) (21 = 19) (22 = 20) (23 = 21) (24 = 22) (25 = 23) (96 = 96) (97 = 97) (98 = 7)  (ELSE = COPY).
VALUE LABELS xh6
-1 'Missing'
1 'Roman Catholic'
8 'Catholic (not Roman)'
2 'Anglican/Church of England'
4 'Orthodox Church'
5 'Presbyterian'
6 'Other (Please specify)'
3 'Uniting Church/Methodist'
9 'Armenian Apostolic'
10 'Baptist'
11 'Brethren'
12 'Churches of Christ'
13 'Jehovahs Witness/Latter Day Saints'
14 'Lutheran'
15 'Salvation Army'
16 'Seventh Day Adventist'
17 'Other Protestant'
18 'Other Christian'
19 'Buddhist'
20 'Hebrew/Jewish'
21 'Muslim'
22 'Other Non-Christian'
24 'Pentecostalism'
23 'Hindu'
96 'Christian (Specified)'
97 'Other (Not Specified)'
7 'No religion'
-3 'No response'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (xh6 = xreligio).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS xh5 "EXTENDED:Religion".
Recode xh5 (-1 = -1) (1 = 1) (2 = 8) (3 = 2) (5 = 4) (6 = 5) (7 = 3) (8 = 9) (9 = 10) (10 = 11) (11 = 12) (14 = 13) (14 = 13) (15 = 14) (17 = 15) (18 = 16) (19 = 17) (20 = 18) (21 = 19) (22 = 20) (23 = 21) (24 = 22) (25 = 23) (96 = 96) (97 = 97) (98 = 7)  (ELSE = COPY).
VALUE LABELS xh5
-1 'Missing'
1 'Roman Catholic'
8 'Catholic (not Roman)'
2 'Anglican/Church of England'
4 'Orthodox Church'
5 'Presbyterian'
6 'Other (Please specify)'
3 'Uniting Church/Methodist'
9 'Armenian Apostolic'
10 'Baptist'
11 'Brethren'
12 'Churches of Christ'
13 'Jehovahs Witness/Latter Day Saints'
14 'Lutheran'
15 'Salvation Army'
16 'Seventh Day Adventist'
17 'Other Protestant'
18 'Other Christian'
19 'Buddhist'
20 'Hebrew/Jewish'
21 'Muslim'
22 'Other Non-Christian'
24 'Pentecostalism'
23 'Hindu'
96 'Christian (Specified)'
97 'Other (Not Specified)'
7 'No religion'
-3 'No response'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (xh5 = xreligio).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS xh6 "EXTENDED:Religion".
Recode xh6 (-1 = -1) (1 = 1) (8 = 8) (2 = 2) (4 = 4) (5 = 5) (6 = 6) (3 = 3) (9 = 9) (10 = 10) (11 = 11) (12 = 12) (13 = 13) (13 = 13) (14 = 14) (15 = 15) (16 = 16) (17 = 17) (18 = 18) (19 = 19) (20 = 20) (21 = 21) (22 = 22) (24 = 24) (23 = 23) (96 = 96) (97 = 97) (7 = 7)  (ELSE = COPY).
VALUE LABELS xh6
-1 'Missing'
1 'Roman Catholic'
8 'Catholic (not Roman)'
2 'Anglican/Church of England'
4 'Orthodox Church'
5 'Presbyterian'
6 'Other (Please specify)'
3 'Uniting Church/Methodist'
9 'Armenian Apostolic'
10 'Baptist'
11 'Brethren'
12 'Churches of Christ'
13 'Jehovahs Witness/Latter Day Saints'
14 'Lutheran'
15 'Salvation Army'
16 'Seventh Day Adventist'
17 'Other Protestant'
18 'Other Christian'
19 'Buddhist'
20 'Hebrew/Jewish'
21 'Muslim'
22 'Other Non-Christian'
24 'Pentecostalism'
23 'Hindu'
96 'Christian (Specified)'
97 'Other (Not Specified)'
7 'No religion'
-3 'No response'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (xh6 = xreligio).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H6_other "EXTENDED:Religion".
Recode H6_other (995 = -3)  (ELSE = COPY).
VALUE LABELS H6_other
-1 'Missing'
1 'Roman Catholic'
8 'Catholic (not Roman)'
2 'Anglican/Church of England'
4 'Orthodox Church'
5 'Presbyterian'
6 'Other (Please specify)'
3 'Uniting Church/Methodist'
9 'Armenian Apostolic'
10 'Baptist'
11 'Brethren'
12 'Churches of Christ'
13 'Jehovahs Witness/Latter Day Saints'
14 'Lutheran'
15 'Salvation Army'
16 'Seventh Day Adventist'
17 'Other Protestant'
18 'Other Christian'
19 'Buddhist'
20 'Hebrew/Jewish'
21 'Muslim'
22 'Other Non-Christian'
24 'Pentecostalism'
23 'Hindu'
96 'Christian (Specified)'
97 'Other (Not Specified)'
7 'No religion'
-3 'No response'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H6_other = xreligio).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS H6_other "EXTENDED:Religion".
Recode H6_other  (ELSE = COPY).
VALUE LABELS H6_other
-1 'Missing'
1 'Roman Catholic'
8 'Catholic (not Roman)'
2 'Anglican/Church of England'
4 'Orthodox Church'
5 'Presbyterian'
6 'Other (Please specify)'
3 'Uniting Church/Methodist'
9 'Armenian Apostolic'
10 'Baptist'
11 'Brethren'
12 'Churches of Christ'
13 'Jehovahs Witness/Latter Day Saints'
14 'Lutheran'
15 'Salvation Army'
16 'Seventh Day Adventist'
17 'Other Protestant'
18 'Other Christian'
19 'Buddhist'
20 'Hebrew/Jewish'
21 'Muslim'
22 'Other Non-Christian'
24 'Pentecostalism'
23 'Hindu'
96 'Christian (Specified)'
97 'Other (Not Specified)'
7 'No religion'
-3 'No response'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H6_other = xreligio).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS H6_other "EXTENDED:Religion".
Recode H6_other (999 = -2)  (ELSE = COPY).
VALUE LABELS H6_other
-1 'Missing'
1 'Roman Catholic'
8 'Catholic (not Roman)'
2 'Anglican/Church of England'
4 'Orthodox Church'
5 'Presbyterian'
6 'Other (Please specify)'
3 'Uniting Church/Methodist'
9 'Armenian Apostolic'
10 'Baptist'
11 'Brethren'
12 'Churches of Christ'
13 'Jehovahs Witness/Latter Day Saints'
14 'Lutheran'
15 'Salvation Army'
16 'Seventh Day Adventist'
17 'Other Protestant'
18 'Other Christian'
19 'Buddhist'
20 'Hebrew/Jewish'
21 'Muslim'
22 'Other Non-Christian'
24 'Pentecostalism'
23 'Hindu'
96 'Christian (Specified)'
97 'Other (Not Specified)'
7 'No religion'
-3 'No response'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H6_other = xreligio).

DATASET ACTIVATE aes87_datafile.
VARIABLE LABELS q90 "Religious attendance".
Recode q90 (0 = -3) (1 = 1) (4 = 2) (2 = 1) (3 = 3) (6 = 4) (7 = 5) (5 = 3) (8 = 6)  (ELSE = COPY).
VALUE LABELS q90
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'At least once a week'
2 'At least once a month'
3 'Several times a year'
4 'At least once a year'
5 'Less than once a year'
6 'Never'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (q90 = rlgatten).

DATASET ACTIVATE aes90_datafile.
VARIABLE LABELS j8 "Religious attendance".
Recode j8 (0 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6)  (ELSE = COPY).
VALUE LABELS j8
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'At least once a week'
2 'At least once a month'
3 'Several times a year'
4 'At least once a year'
5 'Less than once a year'
6 'Never'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (j8 = rlgatten).

DATASET ACTIVATE aes93_datafile.
VARIABLE LABELS j9 "Religious attendance".
Recode j9 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6)  (ELSE = COPY).
VALUE LABELS j9
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'At least once a week'
2 'At least once a month'
3 'Several times a year'
4 'At least once a year'
5 'Less than once a year'
6 'Never'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (j9 = rlgatten).

DATASET ACTIVATE aes96_datafile.
VARIABLE LABELS j6 "Religious attendance".
Recode j6 (-1 = -4) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6)  (ELSE = COPY).
VALUE LABELS j6
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'At least once a week'
2 'At least once a month'
3 'Several times a year'
4 'At least once a year'
5 'Less than once a year'
6 'Never'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (j6 = rlgatten).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS I6 "Religious attendance".
Recode I6 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6)  (ELSE = COPY).
VALUE LABELS I6
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'At least once a week'
2 'At least once a month'
3 'Several times a year'
4 'At least once a year'
5 'Less than once a year'
6 'Never'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (I6 = rlgatten).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS relattnd "Religious attendance".
Recode relattnd (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6)  (ELSE = COPY).
VALUE LABELS relattnd
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'At least once a week'
2 'At least once a month'
3 'Several times a year'
4 'At least once a year'
5 'Less than once a year'
6 'Never'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (relattnd = rlgatten).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS i7 "Religious attendance".
Recode i7 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6)  (ELSE = COPY).
VALUE LABELS i7
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'At least once a week'
2 'At least once a month'
3 'Several times a year'
4 'At least once a year'
5 'Less than once a year'
6 'Never'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (i7 = rlgatten).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS h7 "Religious attendance".
Recode h7 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6)  (ELSE = COPY).
VALUE LABELS h7
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'At least once a week'
2 'At least once a month'
3 'Several times a year'
4 'At least once a year'
5 'Less than once a year'
6 'Never'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (h7 = rlgatten).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS h6 "Religious attendance".
Recode h6 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6)  (ELSE = COPY).
VALUE LABELS h6
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'At least once a week'
2 'At least once a month'
3 'Several times a year'
4 'At least once a year'
5 'Less than once a year'
6 'Never'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (h6 = rlgatten).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS h7 "Religious attendance".
Recode h7 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6)  (ELSE = COPY).
VALUE LABELS h7
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'At least once a week'
2 'At least once a month'
3 'Several times a year'
4 'At least once a year'
5 'Less than once a year'
6 'Never'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (h7 = rlgatten).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H7 "Religious attendance".
Recode H7 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (999 = -2)  (ELSE = COPY).
VALUE LABELS H7
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'At least once a week'
2 'At least once a month'
3 'Several times a year'
4 'At least once a year'
5 'Less than once a year'
6 'Never'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (H7 = rlgatten).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS H7 "Religious attendance".
Recode H7 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (999 = -2)  (ELSE = COPY).
VALUE LABELS H7
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'At least once a week'
2 'At least once a month'
3 'Several times a year'
4 'At least once a year'
5 'Less than once a year'
6 'Never'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (H7 = rlgatten).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS H7 "Religious attendance".
Recode H7 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (999 = -2)  (ELSE = COPY).
VALUE LABELS H7
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'At least once a week'
2 'At least once a month'
3 'Several times a year'
4 'At least once a year'
5 'Less than once a year'
6 'Never'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (H7 = rlgatten).

DATASET ACTIVATE aes96_datafile.
VARIABLE LABELS j9 "Own, buying or rent home".
Recode j9 (-1 = -4) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5)  (ELSE = COPY).
VALUE LABELS j9
-1 'Missing'
-4 'Blank'
1 'Own outright'
2 'Own, paying off mortgage'
3 'Rent from private landlord or real estate agent'
4 'Rent from public housing authority'
5 'Other (boarding, living at home, etc.)'
-5 'Refused'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j9 = ownhome).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS I8 "Own, buying or rent home".
Recode I8 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5)  (ELSE = COPY).
VALUE LABELS I8
-1 'Missing'
-4 'Blank'
1 'Own outright'
2 'Own, paying off mortgage'
3 'Rent from private landlord or real estate agent'
4 'Rent from public housing authority'
5 'Other (boarding, living at home, etc.)'
-5 'Refused'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (I8 = ownhome).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS home "Own, buying or rent home".
Recode home (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (7 = -5)  (ELSE = COPY).
VALUE LABELS home
-1 'Missing'
-4 'Blank'
1 'Own outright'
2 'Own, paying off mortgage'
3 'Rent from private landlord or real estate agent'
4 'Rent from public housing authority'
5 'Other (boarding, living at home, etc.)'
-5 'Refused'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (home = ownhome).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS i9 "Own, buying or rent home".
Recode i9 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5)  (ELSE = COPY).
VALUE LABELS i9
-1 'Missing'
-4 'Blank'
1 'Own outright'
2 'Own, paying off mortgage'
3 'Rent from private landlord or real estate agent'
4 'Rent from public housing authority'
5 'Other (boarding, living at home, etc.)'
-5 'Refused'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i9 = ownhome).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS h9 "Own, buying or rent home".
Recode h9 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5)  (ELSE = COPY).
VALUE LABELS h9
-1 'Missing'
-4 'Blank'
1 'Own outright'
2 'Own, paying off mortgage'
3 'Rent from private landlord or real estate agent'
4 'Rent from public housing authority'
5 'Other (boarding, living at home, etc.)'
-5 'Refused'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h9 = ownhome).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS h9 "Own, buying or rent home".
Recode h9 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5)  (ELSE = COPY).
VALUE LABELS h9
-1 'Missing'
-4 'Blank'
1 'Own outright'
2 'Own, paying off mortgage'
3 'Rent from private landlord or real estate agent'
4 'Rent from public housing authority'
5 'Other (boarding, living at home, etc.)'
-5 'Refused'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h9 = ownhome).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS h9 "Own, buying or rent home".
Recode h9 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5)  (ELSE = COPY).
VALUE LABELS h9
-1 'Missing'
-4 'Blank'
1 'Own outright'
2 'Own, paying off mortgage'
3 'Rent from private landlord or real estate agent'
4 'Rent from public housing authority'
5 'Other (boarding, living at home, etc.)'
-5 'Refused'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h9 = ownhome).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H9 "Own, buying or rent home".
Recode H9 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (999 = -2)  (ELSE = COPY).
VALUE LABELS H9
-1 'Missing'
-4 'Blank'
1 'Own outright'
2 'Own, paying off mortgage'
3 'Rent from private landlord or real estate agent'
4 'Rent from public housing authority'
5 'Other (boarding, living at home, etc.)'
-5 'Refused'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H9 = ownhome).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS J1 "Own, buying or rent home".
Recode J1 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (999 = -2)  (ELSE = COPY).
VALUE LABELS J1
-1 'Missing'
-4 'Blank'
1 'Own outright'
2 'Own, paying off mortgage'
3 'Rent from private landlord or real estate agent'
4 'Rent from public housing authority'
5 'Other (boarding, living at home, etc.)'
-5 'Refused'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J1 = ownhome).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS J1 "Own, buying or rent home".
Recode J1 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (999 = -2)  (ELSE = COPY).
VALUE LABELS J1
-1 'Missing'
-4 'Blank'
1 'Own outright'
2 'Own, paying off mortgage'
3 'Rent from private landlord or real estate agent'
4 'Rent from public housing authority'
5 'Other (boarding, living at home, etc.)'
-5 'Refused'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J1 = ownhome).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H10 "Do you have a self-managed superannuation fund".
Recode H10 (1 = 1) (2 = 2) (999 = -2)  (ELSE = COPY).
VALUE LABELS H10
1 'Yes'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H10 = smsuper).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS J2 "Do you have a self-managed superannuation fund".
Recode J2 (1 = 1) (2 = 2) (999 = -2)  (ELSE = COPY).
VALUE LABELS J2
1 'Yes'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J2 = smsuper).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS J2 "Do you have a self-managed superannuation fund".
Recode J2 (1 = 1) (2 = 2) (999 = -2)  (ELSE = COPY).
VALUE LABELS J2
1 'Yes'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J2 = smsuper).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS I9 "Own a personal computer".
Recode I9 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS I9
-1 'Missing'
1 'Yes'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (I9 = ownpc).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS i10 "Own a personal computer".
Recode i10 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS i10
-1 'Missing'
1 'Yes'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i10 = ownpc).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS i11 "Own a personal computer".
Recode i11 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS i11
-1 'Missing'
1 'Yes'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i11 = ownpc).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H11 "Own a personal computer".
Recode H11 (1 = 1) (2 = 2) (999 = -2)  (ELSE = COPY).
VALUE LABELS H11
-1 'Missing'
1 'Yes'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H11 = ownpc).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS J3 "Own a personal computer".
Recode J3 (1 = 1) (2 = 2) (999 = -2)  (ELSE = COPY).
VALUE LABELS J3
-1 'Missing'
1 'Yes'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J3 = ownpc).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS J3 "Own a personal computer".
Recode J3 (1 = 1) (2 = 2) (999 = -2)  (ELSE = COPY).
VALUE LABELS J3
-1 'Missing'
1 'Yes'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J3 = ownpc).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS I11 "Own a firearm".
Recode I11 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS I11
-1 'Missing'
1 'Yes'
2 'No'
-6 'Unknown'.
EXECUTE.
RENAME VARIABLES (I11 = firearm).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS ownfirea "Own a firearm".
Recode ownfirea (-1 = -1) (1 = 1) (2 = 2) (3 = -6)  (ELSE = COPY).
VALUE LABELS ownfirea
-1 'Missing'
1 'Yes'
2 'No'
-6 'Unknown'.
EXECUTE.
RENAME VARIABLES (ownfirea = firearm).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS i10 "Own a firearm".
Recode i10 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS i10
-1 'Missing'
1 'Yes'
2 'No'
-6 'Unknown'.
EXECUTE.
RENAME VARIABLES (i10 = firearm).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS g14 "Own shares in Australian Stock Exchange".
Recode g14 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5)  (ELSE = COPY).
VALUE LABELS g14
-1 'Missing'
1 'No do not own any shares'
-6 'Unknown'
98 'Yes'
2 'Yes in one company'
3 'Yes in two to five companies'
4 'Yes in six to 10 companies'
5 'Yes in more than 10 companies'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (g14 = ownshare).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS f20 "Own shares in Australian Stock Exchange".
Recode f20 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5)  (ELSE = COPY).
VALUE LABELS f20
-1 'Missing'
1 'No do not own any shares'
-6 'Unknown'
98 'Yes'
2 'Yes in one company'
3 'Yes in two to five companies'
4 'Yes in six to 10 companies'
5 'Yes in more than 10 companies'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (f20 = ownshare).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS f12 "Own shares in Australian Stock Exchange".
Recode f12 (1 = -6) (2 = 2) (3 = 3) (4 = 4) (5 = 5)  (ELSE = COPY).
VALUE LABELS f12
-1 'Missing'
1 'No do not own any shares'
-6 'Unknown'
98 'Yes'
2 'Yes in one company'
3 'Yes in two to five companies'
4 'Yes in six to 10 companies'
5 'Yes in more than 10 companies'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (f12 = ownshare).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS h4p3 "Own shares in Australian Stock Exchange".
Recode h4p3 (-1 = -1) (2 = 1) (1 = 98)  (ELSE = COPY).
VALUE LABELS h4p3
-1 'Missing'
1 'No do not own any shares'
-6 'Unknown'
98 'Yes'
2 'Yes in one company'
3 'Yes in two to five companies'
4 'Yes in six to 10 companies'
5 'Yes in more than 10 companies'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h4p3 = ownshare).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H18 "Own shares in Australian Stock Exchange".
Recode H18 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (999 = -2)  (ELSE = COPY).
VALUE LABELS H18
-1 'Missing'
1 'No do not own any shares'
-6 'Unknown'
98 'Yes'
2 'Yes in one company'
3 'Yes in two to five companies'
4 'Yes in six to 10 companies'
5 'Yes in more than 10 companies'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H18 = ownshare).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS J7 "Own shares in Australian Stock Exchange".
Recode J7 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (999 = -2)  (ELSE = COPY).
VALUE LABELS J7
-1 'Missing'
1 'No do not own any shares'
-6 'Unknown'
98 'Yes'
2 'Yes in one company'
3 'Yes in two to five companies'
4 'Yes in six to 10 companies'
5 'Yes in more than 10 companies'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J7 = ownshare).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS J7 "Own shares in Australian Stock Exchange".
Recode J7 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (999 = -2)  (ELSE = COPY).
VALUE LABELS J7
-1 'Missing'
1 'No do not own any shares'
-6 'Unknown'
98 'Yes'
2 'Yes in one company'
3 'Yes in two to five companies'
4 'Yes in six to 10 companies'
5 'Yes in more than 10 companies'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J7 = ownshare).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS netuse "How often use internet".
Recode netuse (-9 = -2) (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6)  (ELSE = COPY).
VALUE LABELS netuse
-2 'Skipped'
-1 'Missing'
1 'Several times a day'
2 'About once a day'
3 'Three to five days a week'
4 'One to two days a week'
5 'Every few weeks'
6 'Less often'
7 'Do not use the internet'.
EXECUTE.
RENAME VARIABLES (netuse = netfreq).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS i12 "How often use internet".
Recode i12 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7)  (ELSE = COPY).
VALUE LABELS i12
-2 'Skipped'
-1 'Missing'
1 'Several times a day'
2 'About once a day'
3 'Three to five days a week'
4 'One to two days a week'
5 'Every few weeks'
6 'Less often'
7 'Do not use the internet'.
EXECUTE.
RENAME VARIABLES (i12 = netfreq).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS h10 "How often use internet".
Recode h10 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7)  (ELSE = COPY).
VALUE LABELS h10
-2 'Skipped'
-1 'Missing'
1 'Several times a day'
2 'About once a day'
3 'Three to five days a week'
4 'One to two days a week'
5 'Every few weeks'
6 'Less often'
7 'Do not use the internet'.
EXECUTE.
RENAME VARIABLES (h10 = netfreq).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS h10 "How often use internet".
Recode h10 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7)  (ELSE = COPY).
VALUE LABELS h10
-2 'Skipped'
-1 'Missing'
1 'Several times a day'
2 'About once a day'
3 'Three to five days a week'
4 'One to two days a week'
5 'Every few weeks'
6 'Less often'
7 'Do not use the internet'.
EXECUTE.
RENAME VARIABLES (h10 = netfreq).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS h10 "How often use internet".
Recode h10 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7)  (ELSE = COPY).
VALUE LABELS h10
-2 'Skipped'
-1 'Missing'
1 'Several times a day'
2 'About once a day'
3 'Three to five days a week'
4 'One to two days a week'
5 'Every few weeks'
6 'Less often'
7 'Do not use the internet'.
EXECUTE.
RENAME VARIABLES (h10 = netfreq).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H12 "How often use internet".
Recode H12 (999 = -2) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7)  (ELSE = COPY).
VALUE LABELS H12
-2 'Skipped'
-1 'Missing'
1 'Several times a day'
2 'About once a day'
3 'Three to five days a week'
4 'One to two days a week'
5 'Every few weeks'
6 'Less often'
7 'Do not use the internet'.
EXECUTE.
RENAME VARIABLES (H12 = netfreq).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS netwhen "When start using internet".
Recode netwhen (-9 = -2) (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS netwhen
-2 'Skipped'
-1 'Missing'
0 'Do not use the internet'
1 'Within the last six months'
2 'About a year ago'
3 'Two or three years ago'
4 'More than three years ago'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (netwhen = stt).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS i13 "When start using internet".
Recode i13 (-1 = -1) (1 = 0) (2 = 1) (3 = 2) (4 = 3) (5 = 4)  (ELSE = COPY).
VALUE LABELS i13
-2 'Skipped'
-1 'Missing'
0 'Do not use the internet'
1 'Within the last six months'
2 'About a year ago'
3 'Two or three years ago'
4 'More than three years ago'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (i13 = stt).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS h11 "When start using internet".
Recode h11 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS h11
-2 'Skipped'
-1 'Missing'
0 'Do not use the internet'
1 'Within the last six months'
2 'About a year ago'
3 'Two or three years ago'
4 'More than three years ago'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (h11 = stt).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS h11 "When start using internet".
Recode h11 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS h11
-2 'Skipped'
-1 'Missing'
0 'Do not use the internet'
1 'Within the last six months'
2 'About a year ago'
3 'Two or three years ago'
4 'More than three years ago'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (h11 = stt).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS h11 "When start using internet".
Recode h11 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS h11
-2 'Skipped'
-1 'Missing'
0 'Do not use the internet'
1 'Within the last six months'
2 'About a year ago'
3 'Two or three years ago'
4 'More than three years ago'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (h11 = stt).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H13 "When start using internet".
Recode H13 (999 = -2) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (997 = -8)  (ELSE = COPY).
VALUE LABELS H13
-2 'Skipped'
-1 'Missing'
0 'Do not use the internet'
1 'Within the last six months'
2 'About a year ago'
3 'Two or three years ago'
4 'More than three years ago'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (H13 = stt).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS h12attch "Sent an attachment with an email".
Recode h12attch (-1 = -1) (1 = 1)  (ELSE = COPY).
VALUE LABELS h12attch
-1 'Missing'
0 'No'
1 'Yes'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (h12attch = emlatt).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS h12attch "Sent an attachment with an email".
Recode h12attch (-1 = -1) (0 = 0) (1 = 1)  (ELSE = COPY).
VALUE LABELS h12attch
-1 'Missing'
0 'No'
1 'Yes'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (h12attch = emlatt).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H14_1 "Sent an attachment with an email".
Recode H14_1 (0 = 0) (1 = 1) (997 = -8)  (ELSE = COPY).
VALUE LABELS H14_1
-1 'Missing'
0 'No'
1 'Yes'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (H14_1 = emlatt).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS h12mlmed "Posted audio, video or image files".
Recode h12mlmed (-1 = -1) (1 = 1)  (ELSE = COPY).
VALUE LABELS h12mlmed
-1 'Missing'
0 'No'
1 'Yes'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (h12mlmed = post).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS h12mlmed "Posted audio, video or image files".
Recode h12mlmed (-1 = -1) (0 = 0) (1 = 1)  (ELSE = COPY).
VALUE LABELS h12mlmed
-1 'Missing'
0 'No'
1 'Yes'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (h12mlmed = post).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H14_2 "Posted audio, video or image files".
Recode H14_2 (0 = 0) (1 = 1) (997 = -8)  (ELSE = COPY).
VALUE LABELS H14_2
-1 'Missing'
0 'No'
1 'Yes'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (H14_2 = post).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS h12wpblg "Personally designed a webpage or blog".
Recode h12wpblg (-1 = -1) (1 = 1)  (ELSE = COPY).
VALUE LABELS h12wpblg
-1 'Missing'
0 'No'
1 'Yes'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (h12wpblg = dsnweb).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS h12wpblg "Personally designed a webpage or blog".
Recode h12wpblg (-1 = -1) (0 = 0) (1 = 1)  (ELSE = COPY).
VALUE LABELS h12wpblg
-1 'Missing'
0 'No'
1 'Yes'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (h12wpblg = dsnweb).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H14_3 "Personally designed a webpage or blog".
Recode H14_3 (0 = 0) (1 = 1) (997 = -8)  (ELSE = COPY).
VALUE LABELS H14_3
-1 'Missing'
0 'No'
1 'Yes'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (H14_3 = dsnweb).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS h12dwld "Downloaded a software program to your computer".
Recode h12dwld (-1 = -1) (1 = 1)  (ELSE = COPY).
VALUE LABELS h12dwld
-1 'Missing'
0 'No'
1 'Yes'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (h12dwld = dnld).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS h12dwld "Downloaded a software program to your computer".
Recode h12dwld (-1 = -1) (0 = 0) (1 = 1)  (ELSE = COPY).
VALUE LABELS h12dwld
-1 'Missing'
0 'No'
1 'Yes'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (h12dwld = dnld).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H14_4 "Downloaded a software program to your computer".
Recode H14_4 (0 = 0) (1 = 1) (997 = -8)  (ELSE = COPY).
VALUE LABELS H14_4
-1 'Missing'
0 'No'
1 'Yes'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (H14_4 = dnld).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS i13 "You get cable or satellite television".
Recode i13 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS i13
-1 'Missing'
1 'Yes either cable or satellite or both'
2 'No neither'.
EXECUTE.
RENAME VARIABLES (i13 = cabsattv).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS i14 "You get cable or satellite television".
Recode i14 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS i14
-1 'Missing'
1 'Yes either cable or satellite or both'
2 'No neither'.
EXECUTE.
RENAME VARIABLES (i14 = cabsattv).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS J8_1 "Family payments (Family Tax Benefit A and B) - receive gov benefit".
Recode J8_1 (0 = 0) (1 = 1)  (ELSE = COPY).
VALUE LABELS J8_1
0 'Not selected'
1 'Selected'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J8_1 = benfampy).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS J8_1 "Family payments (Family Tax Benefit A and B) - receive gov benefit".
Recode J8_1 (0 = 0) (1 = 1) (999 = -2)  (ELSE = COPY).
VALUE LABELS J8_1
0 'Not selected'
1 'Selected'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J8_1 = benfampy).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS J8_2 "Child Care Benefit - receive gov benefit".
Recode J8_2 (0 = 0) (1 = 1)  (ELSE = COPY).
VALUE LABELS J8_2
0 'Not selected'
1 'Selected'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J8_2 = bencldcr).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS J8_2 "Child Care Benefit - receive gov benefit".
Recode J8_2 (0 = 0) (1 = 1) (999 = -2)  (ELSE = COPY).
VALUE LABELS J8_2
0 'Not selected'
1 'Selected'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J8_2 = bencldcr).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS J8_3 "Unemployment benefits - receive gov benefit".
Recode J8_3 (0 = 0) (1 = 1)  (ELSE = COPY).
VALUE LABELS J8_3
0 'Not selected'
1 'Selected'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J8_3 = benunemp).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS J8_3 "Unemployment benefits - receive gov benefit".
Recode J8_3 (0 = 0) (1 = 1) (999 = -2)  (ELSE = COPY).
VALUE LABELS J8_3
0 'Not selected'
1 'Selected'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J8_3 = benunemp).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS J8_4 "Aged Pension - receive gov benefit".
Recode J8_4 (0 = 0) (1 = 1)  (ELSE = COPY).
VALUE LABELS J8_4
0 'Not selected'
1 'Selected'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J8_4 = benagep).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS J8_4 "Aged Pension - receive gov benefit".
Recode J8_4 (0 = 0) (1 = 1) (999 = -2)  (ELSE = COPY).
VALUE LABELS J8_4
0 'Not selected'
1 'Selected'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J8_4 = benagep).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS J8_5 "Disability Support Pension - receive gov benefit".
Recode J8_5 (0 = 0) (1 = 1)  (ELSE = COPY).
VALUE LABELS J8_5
0 'Not selected'
1 'Selected'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J8_5 = bendisab).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS J8_5 "Disability Support Pension - receive gov benefit".
Recode J8_5 (0 = 0) (1 = 1) (999 = -2)  (ELSE = COPY).
VALUE LABELS J8_5
0 'Not selected'
1 'Selected'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J8_5 = bendisab).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS J8_6 "Veterans Pension - receive gov benefit".
Recode J8_6 (0 = 0) (1 = 1)  (ELSE = COPY).
VALUE LABELS J8_6
0 'Not selected'
1 'Selected'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J8_6 = benvetpn).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS J8_6 "Veterans Pension - receive gov benefit".
Recode J8_6 (0 = 0) (1 = 1) (999 = -2)  (ELSE = COPY).
VALUE LABELS J8_6
0 'Not selected'
1 'Selected'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J8_6 = benvetpn).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS J8_7 "None of the above - receive gov benefit".
Recode J8_7 (0 = 0) (1 = 1)  (ELSE = COPY).
VALUE LABELS J8_7
0 'Not selected'
1 'Selected'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J8_7 = bennone).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS J8_7 "None of the above - receive gov benefit".
Recode J8_7 (0 = 0) (1 = 1) (999 = -2)  (ELSE = COPY).
VALUE LABELS J8_7
0 'Not selected'
1 'Selected'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J8_7 = bennone).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H26 "Are you currently enrolled to vote in Australia".
Recode H26 (1 = 1) (2 = 2) (998 = 3) (999 = -2)  (ELSE = COPY).
VALUE LABELS H26
1 'Yes I am enrolled to vote'
2 'No I am not enrolled to vote'
3 'I don’t know whether I am enrolled'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H26 = enrvote).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS J9 "Are you currently enrolled to vote in Australia".
Recode J9 (1 = 1) (2 = 2) (3 = 3) (999 = -2)  (ELSE = COPY).
VALUE LABELS J9
1 'Yes I am enrolled to vote'
2 'No I am not enrolled to vote'
3 'I don’t know whether I am enrolled'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J9 = enrvote).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS J9 "Are you currently enrolled to vote in Australia".
Recode J9 (1 = 1) (2 = 2) (3 = 3) (999 = -2)  (ELSE = COPY).
VALUE LABELS J9
1 'Yes I am enrolled to vote'
2 'No I am not enrolled to vote'
3 'I don’t know whether I am enrolled'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J9 = enrvote).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS J8_8 "Item skipped - receive gov benefit".
Recode J8_8 (0 = 0) (1 = 1)  (ELSE = COPY).
VALUE LABELS J8_8
0 'Not selected'
1 'Selected'.
EXECUTE.
RENAME VARIABLES (J8_8 = benskip).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS J8_8 "Item skipped - receive gov benefit".
Recode J8_8 (0 = 0) (1 = 1)  (ELSE = COPY).
VALUE LABELS J8_8
0 'Not selected'
1 'Selected'.
EXECUTE.
RENAME VARIABLES (J8_8 = benskip).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS W0 "Were you enrolled to vote in Australia at the previous federal election".
Recode W0 (1 = 1) (2 = 2) (3 = 3) (999 = -2)  (ELSE = COPY).
VALUE LABELS W0
1 'Yes I was enrolled to vote'
2 'No I was not enrolled to vote'
3 'Not sure'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (W0 = enrvotpr).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS W0 "Were you enrolled to vote in Australia at the previous federal election".
Recode W0 (1 = 1) (2 = 2) (3 = 3) (999 = -2)  (ELSE = COPY).
VALUE LABELS W0
1 'Yes I was enrolled to vote'
2 'No I was not enrolled to vote'
3 'Not sure'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (W0 = enrvotpr).

DATASET ACTIVATE aes87_datafile.
VARIABLE LABELS q83 "Main activity in past week - partner".
Recode q83 (0 = -3) (1 = 1) (2 = 2) (4 = 5) (5 = 97) (5 = 6) (6 = 98) (3 = 7) (8 = -8)  (ELSE = COPY).
VALUE LABELS q83
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full-time for pay'
96 'Working full time or part time'
2 'Working part-time for pay'
3 'Unemployed - looking for full-time work'
4 'Unemployed - looking for part-time work'
5 'Retired from paid work'
97 'Working for no pay'
6 'A full-time school or university student'
98 'Unemployed'
7 'Family or caring responsibilities'
8 'Other'
-8 'Not applicable'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (q83 = mainstrap).

DATASET ACTIVATE aes90_datafile.
VARIABLE LABELS j10 "Main activity in past week - partner".
Recode j10 (0 = -1) (1 = 96) (3 = 5) (2 = 7) (4 = 8)  (ELSE = COPY).
VALUE LABELS j10
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full-time for pay'
96 'Working full time or part time'
2 'Working part-time for pay'
3 'Unemployed - looking for full-time work'
4 'Unemployed - looking for part-time work'
5 'Retired from paid work'
97 'Working for no pay'
6 'A full-time school or university student'
98 'Unemployed'
7 'Family or caring responsibilities'
8 'Other'
-8 'Not applicable'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (j10 = mainstrap).

DATASET ACTIVATE aes93_datafile.
VARIABLE LABELS j15 "Main activity in past week - partner".
Recode j15 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (8 = 8)  (ELSE = COPY).
VALUE LABELS j15
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full-time for pay'
96 'Working full time or part time'
2 'Working part-time for pay'
3 'Unemployed - looking for full-time work'
4 'Unemployed - looking for part-time work'
5 'Retired from paid work'
97 'Working for no pay'
6 'A full-time school or university student'
98 'Unemployed'
7 'Family or caring responsibilities'
8 'Other'
-8 'Not applicable'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (j15 = mainstrap).

DATASET ACTIVATE aes96_datafile.
VARIABLE LABELS j13 "Main activity in past week - partner".
Recode j13 (-1 = -4) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (8 = 8)  (ELSE = COPY).
VALUE LABELS j13
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full-time for pay'
96 'Working full time or part time'
2 'Working part-time for pay'
3 'Unemployed - looking for full-time work'
4 'Unemployed - looking for part-time work'
5 'Retired from paid work'
97 'Working for no pay'
6 'A full-time school or university student'
98 'Unemployed'
7 'Family or caring responsibilities'
8 'Other'
-8 'Not applicable'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (j13 = mainstrap).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS I15 "Main activity in past week - partner".
Recode I15 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (8 = 8)  (ELSE = COPY).
VALUE LABELS I15
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full-time for pay'
96 'Working full time or part time'
2 'Working part-time for pay'
3 'Unemployed - looking for full-time work'
4 'Unemployed - looking for part-time work'
5 'Retired from paid work'
97 'Working for no pay'
6 'A full-time school or university student'
98 'Unemployed'
7 'Family or caring responsibilities'
8 'Other'
-8 'Not applicable'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (I15 = mainstrap).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS spwork "Main activity in past week - partner".
Recode spwork (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (8 = 8) (9 = -8)  (ELSE = COPY).
VALUE LABELS spwork
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full-time for pay'
96 'Working full time or part time'
2 'Working part-time for pay'
3 'Unemployed - looking for full-time work'
4 'Unemployed - looking for part-time work'
5 'Retired from paid work'
97 'Working for no pay'
6 'A full-time school or university student'
98 'Unemployed'
7 'Family or caring responsibilities'
8 'Other'
-8 'Not applicable'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (spwork = mainstrap).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS i19 "Main activity in past week - partner".
Recode i19 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (8 = 8)  (ELSE = COPY).
VALUE LABELS i19
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full-time for pay'
96 'Working full time or part time'
2 'Working part-time for pay'
3 'Unemployed - looking for full-time work'
4 'Unemployed - looking for part-time work'
5 'Retired from paid work'
97 'Working for no pay'
6 'A full-time school or university student'
98 'Unemployed'
7 'Family or caring responsibilities'
8 'Other'
-8 'Not applicable'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (i19 = mainstrap).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS h17 "Main activity in past week - partner".
Recode h17 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (8 = 8)  (ELSE = COPY).
VALUE LABELS h17
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full-time for pay'
96 'Working full time or part time'
2 'Working part-time for pay'
3 'Unemployed - looking for full-time work'
4 'Unemployed - looking for part-time work'
5 'Retired from paid work'
97 'Working for no pay'
6 'A full-time school or university student'
98 'Unemployed'
7 'Family or caring responsibilities'
8 'Other'
-8 'Not applicable'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (h17 = mainstrap).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS h16 "Main activity in past week - partner".
Recode h16 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (8 = 8)  (ELSE = COPY).
VALUE LABELS h16
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full-time for pay'
96 'Working full time or part time'
2 'Working part-time for pay'
3 'Unemployed - looking for full-time work'
4 'Unemployed - looking for part-time work'
5 'Retired from paid work'
97 'Working for no pay'
6 'A full-time school or university student'
98 'Unemployed'
7 'Family or caring responsibilities'
8 'Other'
-8 'Not applicable'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (h16 = mainstrap).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS h17 "Main activity in past week - partner".
Recode h17 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (8 = 8)  (ELSE = COPY).
VALUE LABELS h17
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full-time for pay'
96 'Working full time or part time'
2 'Working part-time for pay'
3 'Unemployed - looking for full-time work'
4 'Unemployed - looking for part-time work'
5 'Retired from paid work'
97 'Working for no pay'
6 'A full-time school or university student'
98 'Unemployed'
7 'Family or caring responsibilities'
8 'Other'
-8 'Not applicable'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (h17 = mainstrap).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H20 "Main activity in past week - partner".
Recode H20 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (8 = 8) (997 = -8) (999 = -2)  (ELSE = COPY).
VALUE LABELS H20
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full-time for pay'
96 'Working full time or part time'
2 'Working part-time for pay'
3 'Unemployed - looking for full-time work'
4 'Unemployed - looking for part-time work'
5 'Retired from paid work'
97 'Working for no pay'
6 'A full-time school or university student'
98 'Unemployed'
7 'Family or caring responsibilities'
8 'Other'
-8 'Not applicable'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (H20 = mainstrap).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS I1 "Main activity in past week - partner".
Recode I1 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (96 = 8) (999 = -2)  (ELSE = COPY).
VALUE LABELS I1
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full-time for pay'
96 'Working full time or part time'
2 'Working part-time for pay'
3 'Unemployed - looking for full-time work'
4 'Unemployed - looking for part-time work'
5 'Retired from paid work'
97 'Working for no pay'
6 'A full-time school or university student'
98 'Unemployed'
7 'Family or caring responsibilities'
8 'Other'
-8 'Not applicable'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (I1 = mainstrap).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS I1 "Main activity in past week - partner".
Recode I1 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (6 = 6) (7 = 7) (96 = 8) (999 = -2)  (ELSE = COPY).
VALUE LABELS I1
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Working full-time for pay'
96 'Working full time or part time'
2 'Working part-time for pay'
3 'Unemployed - looking for full-time work'
4 'Unemployed - looking for part-time work'
5 'Retired from paid work'
97 'Working for no pay'
6 'A full-time school or university student'
98 'Unemployed'
7 'Family or caring responsibilities'
8 'Other'
-8 'Not applicable'
-2 'Item skipped'.
EXECUTE.
RENAME VARIABLES (I1 = mainstrap).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H21_Work "Partner - ever worked for pay".
Recode H21_Work (1 = 1) (2 = 2) (997 = -8) (999 = -2)  (ELSE = COPY).
VALUE LABELS H21_Work
1 'Worked for pay'
2 'Never worked for pay'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H21_Work = ptnwkpay).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS I2_Work "Partner - ever worked for pay".
Recode I2_Work (1 = 1) (2 = 2) (999 = -2)  (ELSE = COPY).
VALUE LABELS I2_Work
1 'Worked for pay'
2 'Never worked for pay'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (I2_Work = ptnwkpay).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS I2_Work "Partner - ever worked for pay".
Recode I2_Work (999 = -2)  (ELSE = COPY).
VALUE LABELS I2_Work
1 'Worked for pay'
2 'Never worked for pay'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (I2_Work = ptnwkpay).

DATASET ACTIVATE aes87_datafile.
VARIABLE LABELS q85 "Partner employer".
Recode q85 (0 = -3) (6 = 1) (1 = 2) (2 = 5) (5 = 4) (3 = 6) (4 = 7) (9 = -2) (8 = -8)  (ELSE = COPY).
VALUE LABELS q85
-4 'Blank'
-2 'Missing'
-3 'No response'
1 'Self-employed'
2 'Employee in private company or business'
3 'Employee of Federal/State/Local Government'
5 'Federal Government'
4 'Employee in family business or farm'
6 'State Government'
97 'Home duties'
7 'Local Government'
98 'Partner never worked for pay'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (q85 = ptnemp).

DATASET ACTIVATE aes90_datafile.
VARIABLE LABELS j12 "Partner employer".
Recode j12 (0 = -2) (1 = 1) (2 = 2) (3 = 3) (4 = 97)  (ELSE = COPY).
VALUE LABELS j12
-4 'Blank'
-2 'Missing'
-3 'No response'
1 'Self-employed'
2 'Employee in private company or business'
3 'Employee of Federal/State/Local Government'
5 'Federal Government'
4 'Employee in family business or farm'
6 'State Government'
97 'Home duties'
7 'Local Government'
98 'Partner never worked for pay'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (j12 = ptnemp).

DATASET ACTIVATE aes93_datafile.
VARIABLE LABELS j17 "Partner employer".
Recode j17 (1 = 1) (2 = 2) (3 = 5) (6 = 4) (4 = 6) (5 = 7)  (ELSE = COPY).
VALUE LABELS j17
-4 'Blank'
-2 'Missing'
-3 'No response'
1 'Self-employed'
2 'Employee in private company or business'
3 'Employee of Federal/State/Local Government'
5 'Federal Government'
4 'Employee in family business or farm'
6 'State Government'
97 'Home duties'
7 'Local Government'
98 'Partner never worked for pay'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (j17 = ptnemp).

DATASET ACTIVATE aes96_datafile.
VARIABLE LABELS j15 "Partner employer".
Recode j15 (-1 = -4) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS j15
-4 'Blank'
-2 'Missing'
-3 'No response'
1 'Self-employed'
2 'Employee in private company or business'
3 'Employee of Federal/State/Local Government'
5 'Federal Government'
4 'Employee in family business or farm'
6 'State Government'
97 'Home duties'
7 'Local Government'
98 'Partner never worked for pay'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (j15 = ptnemp).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS I17 "Partner employer".
Recode I17 (-1 = -2) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS I17
-4 'Blank'
-2 'Missing'
-3 'No response'
1 'Self-employed'
2 'Employee in private company or business'
3 'Employee of Federal/State/Local Government'
5 'Federal Government'
4 'Employee in family business or farm'
6 'State Government'
97 'Home duties'
7 'Local Government'
98 'Partner never worked for pay'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (I17 = ptnemp).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS spworkwh "Partner employer".
Recode spworkwh (-1 = -2) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = -8)  (ELSE = COPY).
VALUE LABELS spworkwh
-4 'Blank'
-2 'Missing'
-3 'No response'
1 'Self-employed'
2 'Employee in private company or business'
3 'Employee of Federal/State/Local Government'
5 'Federal Government'
4 'Employee in family business or farm'
6 'State Government'
97 'Home duties'
7 'Local Government'
98 'Partner never worked for pay'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (spworkwh = ptnemp).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS i21 "Partner employer".
Recode i21 (-1 = -2) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS i21
-4 'Blank'
-2 'Missing'
-3 'No response'
1 'Self-employed'
2 'Employee in private company or business'
3 'Employee of Federal/State/Local Government'
5 'Federal Government'
4 'Employee in family business or farm'
6 'State Government'
97 'Home duties'
7 'Local Government'
98 'Partner never worked for pay'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (i21 = ptnemp).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS h19 "Partner employer".
Recode h19 (-1 = -2) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS h19
-4 'Blank'
-2 'Missing'
-3 'No response'
1 'Self-employed'
2 'Employee in private company or business'
3 'Employee of Federal/State/Local Government'
5 'Federal Government'
4 'Employee in family business or farm'
6 'State Government'
97 'Home duties'
7 'Local Government'
98 'Partner never worked for pay'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (h19 = ptnemp).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS h18 "Partner employer".
Recode h18 (-1 = -2) (1 = 1) (2 = 2) (3 = 3) (4 = 4)  (ELSE = COPY).
VALUE LABELS h18
-4 'Blank'
-2 'Missing'
-3 'No response'
1 'Self-employed'
2 'Employee in private company or business'
3 'Employee of Federal/State/Local Government'
5 'Federal Government'
4 'Employee in family business or farm'
6 'State Government'
97 'Home duties'
7 'Local Government'
98 'Partner never worked for pay'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (h18 = ptnemp).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS h19 "Partner employer".
Recode h19 (-1 = -2) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 98)  (ELSE = COPY).
VALUE LABELS h19
-4 'Blank'
-2 'Missing'
-3 'No response'
1 'Self-employed'
2 'Employee in private company or business'
3 'Employee of Federal/State/Local Government'
5 'Federal Government'
4 'Employee in family business or farm'
6 'State Government'
97 'Home duties'
7 'Local Government'
98 'Partner never worked for pay'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (h19 = ptnemp).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H22 "Partner employer".
Recode H22 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (999 = -2) (997 = -8)  (ELSE = COPY).
VALUE LABELS H22
-4 'Blank'
-2 'Missing'
-3 'No response'
1 'Self-employed'
2 'Employee in private company or business'
3 'Employee of Federal/State/Local Government'
5 'Federal Government'
4 'Employee in family business or farm'
6 'State Government'
97 'Home duties'
7 'Local Government'
98 'Partner never worked for pay'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (H22 = ptnemp).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS I3 "Partner employer".
Recode I3 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (999 = -2)  (ELSE = COPY).
VALUE LABELS I3
-4 'Blank'
-2 'Missing'
-3 'No response'
1 'Self-employed'
2 'Employee in private company or business'
3 'Employee of Federal/State/Local Government'
5 'Federal Government'
4 'Employee in family business or farm'
6 'State Government'
97 'Home duties'
7 'Local Government'
98 'Partner never worked for pay'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (I3 = ptnemp).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS I3 "Partner employer".
Recode I3 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (999 = -2)  (ELSE = COPY).
VALUE LABELS I3
-4 'Blank'
-2 'Missing'
-3 'No response'
1 'Self-employed'
2 'Employee in private company or business'
3 'Employee of Federal/State/Local Government'
5 'Federal Government'
4 'Employee in family business or farm'
6 'State Government'
97 'Home duties'
7 'Local Government'
98 'Partner never worked for pay'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (I3 = ptnemp).

DATASET ACTIVATE aes87_datafile.
VARIABLE LABELS q86 "Does partner supervise people at work".
Recode q86 (0 = -3) (1 = 1) (2 = 2) (8 = -8) (9 = -2)  (ELSE = COPY).
VALUE LABELS q86
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Yes'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (q86 = ptnspv).

DATASET ACTIVATE aes90_datafile.
VARIABLE LABELS j13 "Does partner supervise people at work".
Recode j13 (0 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS j13
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Yes'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j13 = ptnspv).

DATASET ACTIVATE aes93_datafile.
VARIABLE LABELS j18 "Does partner supervise people at work".
Recode j18 (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS j18
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Yes'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j18 = ptnspv).

DATASET ACTIVATE aes96_datafile.
VARIABLE LABELS j16 "Does partner supervise people at work".
Recode j16 (-1 = -4) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS j16
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Yes'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j16 = ptnspv).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS I18 "Does partner supervise people at work".
Recode I18 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS I18
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Yes'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (I18 = ptnspv).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS spsuperv "Does partner supervise people at work".
Recode spsuperv (-1 = -1) (1 = 1) (2 = 2) (3 = -8)  (ELSE = COPY).
VALUE LABELS spsuperv
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Yes'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (spsuperv = ptnspv).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS i22 "Does partner supervise people at work".
Recode i22 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS i22
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Yes'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i22 = ptnspv).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS h20 "Does partner supervise people at work".
Recode h20 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS h20
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Yes'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h20 = ptnspv).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS h19 "Does partner supervise people at work".
Recode h19 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS h19
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Yes'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h19 = ptnspv).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS h20 "Does partner supervise people at work".
Recode h20 (-1 = -1) (1 = 1) (2 = 2) (3 = -8)  (ELSE = COPY).
VALUE LABELS h20
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Yes'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h20 = ptnspv).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H23 "Does partner supervise people at work".
Recode H23 (1 = 1) (2 = 2) (997 = -8) (999 = -2)  (ELSE = COPY).
VALUE LABELS H23
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Yes'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H23 = ptnspv).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS I4 "Does partner supervise people at work".
Recode I4 (1 = 1) (2 = 2) (999 = -2)  (ELSE = COPY).
VALUE LABELS I4
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Yes'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (I4 = ptnspv).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS I4 "Does partner supervise people at work".
Recode I4 (1 = 1) (2 = 2) (999 = -2)  (ELSE = COPY).
VALUE LABELS I4
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Yes'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (I4 = ptnspv).

DATASET ACTIVATE aes87_datafile.
VARIABLE LABELS q87 "Partner member of trade union".
Recode q87 (0 = -3) (1 = 1) (2 = 2) (8 = -8) (9 = -2)  (ELSE = COPY).
VALUE LABELS q87
-4 'Blank'
-1 'Missing'
-3 'No response'
99 'Yes, trade union'
1 'Yes'
98 'Yes, staff association'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (q87 = ptntru).

DATASET ACTIVATE aes90_datafile.
VARIABLE LABELS j14 "Partner member of trade union".
Recode j14 (0 = -1) (1 = 99) (2 = 98) (3 = 2)  (ELSE = COPY).
VALUE LABELS j14
-4 'Blank'
-1 'Missing'
-3 'No response'
99 'Yes, trade union'
1 'Yes'
98 'Yes, staff association'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j14 = ptntru).

DATASET ACTIVATE aes93_datafile.
VARIABLE LABELS j19 "Partner member of trade union".
Recode j19 (1 = 99) (2 = 98) (3 = 2)  (ELSE = COPY).
VALUE LABELS j19
-4 'Blank'
-1 'Missing'
-3 'No response'
99 'Yes, trade union'
1 'Yes'
98 'Yes, staff association'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j19 = ptntru).

DATASET ACTIVATE aes96_datafile.
VARIABLE LABELS j17 "Partner member of trade union".
Recode j17 (-1 = -4) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS j17
-4 'Blank'
-1 'Missing'
-3 'No response'
99 'Yes, trade union'
1 'Yes'
98 'Yes, staff association'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j17 = ptntru).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS I19 "Partner member of trade union".
Recode I19 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS I19
-4 'Blank'
-1 'Missing'
-3 'No response'
99 'Yes, trade union'
1 'Yes'
98 'Yes, staff association'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (I19 = ptntru).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS spunion "Partner member of trade union".
Recode spunion (-1 = -1) (1 = 1) (2 = 2) (3 = -8)  (ELSE = COPY).
VALUE LABELS spunion
-4 'Blank'
-1 'Missing'
-3 'No response'
99 'Yes, trade union'
1 'Yes'
98 'Yes, staff association'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (spunion = ptntru).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS i23 "Partner member of trade union".
Recode i23 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS i23
-4 'Blank'
-1 'Missing'
-3 'No response'
99 'Yes, trade union'
1 'Yes'
98 'Yes, staff association'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i23 = ptntru).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS h21 "Partner member of trade union".
Recode h21 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS h21
-4 'Blank'
-1 'Missing'
-3 'No response'
99 'Yes, trade union'
1 'Yes'
98 'Yes, staff association'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h21 = ptntru).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS h20 "Partner member of trade union".
Recode h20 (-1 = -1) (1 = 1) (2 = 2)  (ELSE = COPY).
VALUE LABELS h20
-4 'Blank'
-1 'Missing'
-3 'No response'
99 'Yes, trade union'
1 'Yes'
98 'Yes, staff association'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h20 = ptntru).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS h21 "Partner member of trade union".
Recode h21 (-1 = -1) (1 = 1) (2 = 2) (3 = -8)  (ELSE = COPY).
VALUE LABELS h21
-4 'Blank'
-1 'Missing'
-3 'No response'
99 'Yes, trade union'
1 'Yes'
98 'Yes, staff association'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h21 = ptntru).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H24 "Partner member of trade union".
Recode H24 (1 = 1) (2 = 2) (997 = -8) (999 = -2)  (ELSE = COPY).
VALUE LABELS H24
-4 'Blank'
-1 'Missing'
-3 'No response'
99 'Yes, trade union'
1 'Yes'
98 'Yes, staff association'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H24 = ptntru).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS I5 "Partner member of trade union".
Recode I5 (1 = 1) (2 = 2) (999 = -2)  (ELSE = COPY).
VALUE LABELS I5
-4 'Blank'
-1 'Missing'
-3 'No response'
99 'Yes, trade union'
1 'Yes'
98 'Yes, staff association'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (I5 = ptntru).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS I5 "Partner member of trade union".
Recode I5 (1 = 1) (2 = 2) (999 = -2)  (ELSE = COPY).
VALUE LABELS I5
-4 'Blank'
-1 'Missing'
-3 'No response'
99 'Yes, trade union'
1 'Yes'
98 'Yes, staff association'
2 'No'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (I5 = ptntru).

DATASET ACTIVATE aes87_datafile.
VARIABLE LABELS q88 "Partner party identification".
Recode q88 (0 = -3) (1 = 1) (2 = 2) (3 = 3) (4 = 5) (5 = 94) (6 = 6) (7 = 9) (8 = -8)  (ELSE = COPY).
VALUE LABELS q88
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
5 'Australian Democrats'
7 'Greens'
94 'New Nationals'
6 'Other party'
8 'One Nation'
9 'None'
93 'Christian Democratic Party'
-7 'Not sure'
92 'Citizens Electoral Council'
10 'Family First Party'
12 'Republican Party (replaced by Republican Party of Australia)'
13 'Shooters, Fishers and Farmers Party'
14 'Fishing Party'
15 'United Australia Party'
16 'Katter's Australia Party'
17 'Liberal Democrats'
18 'Motoring Enthusiasts Party'
19 'Australian Sports Party'
20 'Reason Party'
21 'The Wikileaks Party (dissolved in 2015)'
22 'Australian Christians'
23 'Derryn Hinch's Justice Party'
24 'Centre Alliance'
25 'Rise Up Australia'
26 'Science Party'
27 'Australian Liberty Alliance'
28 'Pirate Party'
30 'Jacquie Lambie Network'
31 'Arts Party'
32 'Animal Justice Party'
33 'Australian Cyclists Party'
34 'Health Australia Party'
35 'Affordable Housing Party'
36 'Australia First Party'
37 'Australian Better Families'
38 'Australian Conservatives'
39 'Australian People's Party'
40 'Australian Progressives'
41 'Australian Workers Party'
42 'Child Protection Party'
43 'Climate Action! Immigration Action! Accountable Politicians!'
44 'Country Liberals (NT)'
45 'Democratic Labour Party'
46 'Fraser Anning'S Conservative National Party'
47 'Help End Marijuana Prohibition (HEMP) Party'
48 'Independents For Climate Action Now'
49 'Involuntary Medication Objectors (Vaccination/Fluoride) Party'
50 'Labour DLP'
51 'Liberal National Party of Queensland'
52 'Love Australia or Leave'
53 'Non-Custodial Parents Party (Equal Parenting)'
54 'Secular Party of Australia'
55 'Seniors United Party of Australia'
56 'Socialist Alliance'
57 'Socialist Equality Party'
58 'Sustainable Australia'
59 'The Australian Mental Health Party'
60 'The Great Australian Party'
61 'The Small Business Party'
62 'The Together Party'
63 'Victorian Socialists'
64 'VOTEFLUX.ORG | Upgrade Democracy!'
65 'WESTERN AUSTRALIA PARTY'
66 'Yellow Vest Australia'
67 'Australian Citizens Party'
68 'Australian Federation Party'
69 'Australian Values Party'
70 'David Pocock'
71 'Drew Pavlou Democratic Alliance'
72 'FUSION: Science, Pirate, Secular, Climate Emergency'
73 'Federal ICAC Now'
74 'Indigenous - Aboriginal Party of Australia'
75 'Informed Medical Options Party'
76 'Rex Patrick Team'
77 'TNL'
78 'The Local Party of Australia'
95 'Swing Voter'
96 'Independent'
97 'Other party (not specified)'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (q88 = ptnprtid).

DATASET ACTIVATE aes90_datafile.
VARIABLE LABELS j15 "Partner party identification".
Recode j15 (0 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 5) (5 = 6)  (ELSE = COPY).
VALUE LABELS j15
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
5 'Australian Democrats'
7 'Greens'
94 'New Nationals'
6 'Other party'
8 'One Nation'
9 'None'
93 'Christian Democratic Party'
-7 'Not sure'
92 'Citizens Electoral Council'
10 'Family First Party'
12 'Republican Party (replaced by Republican Party of Australia)'
13 'Shooters, Fishers and Farmers Party'
14 'Fishing Party'
15 'United Australia Party'
16 'Katter's Australia Party'
17 'Liberal Democrats'
18 'Motoring Enthusiasts Party'
19 'Australian Sports Party'
20 'Reason Party'
21 'The Wikileaks Party (dissolved in 2015)'
22 'Australian Christians'
23 'Derryn Hinch's Justice Party'
24 'Centre Alliance'
25 'Rise Up Australia'
26 'Science Party'
27 'Australian Liberty Alliance'
28 'Pirate Party'
30 'Jacquie Lambie Network'
31 'Arts Party'
32 'Animal Justice Party'
33 'Australian Cyclists Party'
34 'Health Australia Party'
35 'Affordable Housing Party'
36 'Australia First Party'
37 'Australian Better Families'
38 'Australian Conservatives'
39 'Australian People's Party'
40 'Australian Progressives'
41 'Australian Workers Party'
42 'Child Protection Party'
43 'Climate Action! Immigration Action! Accountable Politicians!'
44 'Country Liberals (NT)'
45 'Democratic Labour Party'
46 'Fraser Anning'S Conservative National Party'
47 'Help End Marijuana Prohibition (HEMP) Party'
48 'Independents For Climate Action Now'
49 'Involuntary Medication Objectors (Vaccination/Fluoride) Party'
50 'Labour DLP'
51 'Liberal National Party of Queensland'
52 'Love Australia or Leave'
53 'Non-Custodial Parents Party (Equal Parenting)'
54 'Secular Party of Australia'
55 'Seniors United Party of Australia'
56 'Socialist Alliance'
57 'Socialist Equality Party'
58 'Sustainable Australia'
59 'The Australian Mental Health Party'
60 'The Great Australian Party'
61 'The Small Business Party'
62 'The Together Party'
63 'Victorian Socialists'
64 'VOTEFLUX.ORG | Upgrade Democracy!'
65 'WESTERN AUSTRALIA PARTY'
66 'Yellow Vest Australia'
67 'Australian Citizens Party'
68 'Australian Federation Party'
69 'Australian Values Party'
70 'David Pocock'
71 'Drew Pavlou Democratic Alliance'
72 'FUSION: Science, Pirate, Secular, Climate Emergency'
73 'Federal ICAC Now'
74 'Indigenous - Aboriginal Party of Australia'
75 'Informed Medical Options Party'
76 'Rex Patrick Team'
77 'TNL'
78 'The Local Party of Australia'
95 'Swing Voter'
96 'Independent'
97 'Other party (not specified)'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j15 = ptnprtid).

DATASET ACTIVATE aes93_datafile.
VARIABLE LABELS j20 "Partner party identification".
Recode j20 (1 = 1) (2 = 2) (3 = 3) (4 = 5) (5 = 6)  (ELSE = COPY).
VALUE LABELS j20
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
5 'Australian Democrats'
7 'Greens'
94 'New Nationals'
6 'Other party'
8 'One Nation'
9 'None'
93 'Christian Democratic Party'
-7 'Not sure'
92 'Citizens Electoral Council'
10 'Family First Party'
12 'Republican Party (replaced by Republican Party of Australia)'
13 'Shooters, Fishers and Farmers Party'
14 'Fishing Party'
15 'United Australia Party'
16 'Katter's Australia Party'
17 'Liberal Democrats'
18 'Motoring Enthusiasts Party'
19 'Australian Sports Party'
20 'Reason Party'
21 'The Wikileaks Party (dissolved in 2015)'
22 'Australian Christians'
23 'Derryn Hinch's Justice Party'
24 'Centre Alliance'
25 'Rise Up Australia'
26 'Science Party'
27 'Australian Liberty Alliance'
28 'Pirate Party'
30 'Jacquie Lambie Network'
31 'Arts Party'
32 'Animal Justice Party'
33 'Australian Cyclists Party'
34 'Health Australia Party'
35 'Affordable Housing Party'
36 'Australia First Party'
37 'Australian Better Families'
38 'Australian Conservatives'
39 'Australian People's Party'
40 'Australian Progressives'
41 'Australian Workers Party'
42 'Child Protection Party'
43 'Climate Action! Immigration Action! Accountable Politicians!'
44 'Country Liberals (NT)'
45 'Democratic Labour Party'
46 'Fraser Anning'S Conservative National Party'
47 'Help End Marijuana Prohibition (HEMP) Party'
48 'Independents For Climate Action Now'
49 'Involuntary Medication Objectors (Vaccination/Fluoride) Party'
50 'Labour DLP'
51 'Liberal National Party of Queensland'
52 'Love Australia or Leave'
53 'Non-Custodial Parents Party (Equal Parenting)'
54 'Secular Party of Australia'
55 'Seniors United Party of Australia'
56 'Socialist Alliance'
57 'Socialist Equality Party'
58 'Sustainable Australia'
59 'The Australian Mental Health Party'
60 'The Great Australian Party'
61 'The Small Business Party'
62 'The Together Party'
63 'Victorian Socialists'
64 'VOTEFLUX.ORG | Upgrade Democracy!'
65 'WESTERN AUSTRALIA PARTY'
66 'Yellow Vest Australia'
67 'Australian Citizens Party'
68 'Australian Federation Party'
69 'Australian Values Party'
70 'David Pocock'
71 'Drew Pavlou Democratic Alliance'
72 'FUSION: Science, Pirate, Secular, Climate Emergency'
73 'Federal ICAC Now'
74 'Indigenous - Aboriginal Party of Australia'
75 'Informed Medical Options Party'
76 'Rex Patrick Team'
77 'TNL'
78 'The Local Party of Australia'
95 'Swing Voter'
96 'Independent'
97 'Other party (not specified)'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j20 = ptnprtid).

DATASET ACTIVATE aes96_datafile.
VARIABLE LABELS j18 "Partner party identification".
Recode j18 (-1 = -4) (1 = 1) (2 = 2) (3 = 3) (4 = 5) (5 = 7) (6 = 6) (7 = 9)  (ELSE = COPY).
VALUE LABELS j18
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
5 'Australian Democrats'
7 'Greens'
94 'New Nationals'
6 'Other party'
8 'One Nation'
9 'None'
93 'Christian Democratic Party'
-7 'Not sure'
92 'Citizens Electoral Council'
10 'Family First Party'
12 'Republican Party (replaced by Republican Party of Australia)'
13 'Shooters, Fishers and Farmers Party'
14 'Fishing Party'
15 'United Australia Party'
16 'Katter's Australia Party'
17 'Liberal Democrats'
18 'Motoring Enthusiasts Party'
19 'Australian Sports Party'
20 'Reason Party'
21 'The Wikileaks Party (dissolved in 2015)'
22 'Australian Christians'
23 'Derryn Hinch's Justice Party'
24 'Centre Alliance'
25 'Rise Up Australia'
26 'Science Party'
27 'Australian Liberty Alliance'
28 'Pirate Party'
30 'Jacquie Lambie Network'
31 'Arts Party'
32 'Animal Justice Party'
33 'Australian Cyclists Party'
34 'Health Australia Party'
35 'Affordable Housing Party'
36 'Australia First Party'
37 'Australian Better Families'
38 'Australian Conservatives'
39 'Australian People's Party'
40 'Australian Progressives'
41 'Australian Workers Party'
42 'Child Protection Party'
43 'Climate Action! Immigration Action! Accountable Politicians!'
44 'Country Liberals (NT)'
45 'Democratic Labour Party'
46 'Fraser Anning'S Conservative National Party'
47 'Help End Marijuana Prohibition (HEMP) Party'
48 'Independents For Climate Action Now'
49 'Involuntary Medication Objectors (Vaccination/Fluoride) Party'
50 'Labour DLP'
51 'Liberal National Party of Queensland'
52 'Love Australia or Leave'
53 'Non-Custodial Parents Party (Equal Parenting)'
54 'Secular Party of Australia'
55 'Seniors United Party of Australia'
56 'Socialist Alliance'
57 'Socialist Equality Party'
58 'Sustainable Australia'
59 'The Australian Mental Health Party'
60 'The Great Australian Party'
61 'The Small Business Party'
62 'The Together Party'
63 'Victorian Socialists'
64 'VOTEFLUX.ORG | Upgrade Democracy!'
65 'WESTERN AUSTRALIA PARTY'
66 'Yellow Vest Australia'
67 'Australian Citizens Party'
68 'Australian Federation Party'
69 'Australian Values Party'
70 'David Pocock'
71 'Drew Pavlou Democratic Alliance'
72 'FUSION: Science, Pirate, Secular, Climate Emergency'
73 'Federal ICAC Now'
74 'Indigenous - Aboriginal Party of Australia'
75 'Informed Medical Options Party'
76 'Rex Patrick Team'
77 'TNL'
78 'The Local Party of Australia'
95 'Swing Voter'
96 'Independent'
97 'Other party (not specified)'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j18 = ptnprtid).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS I20 "Partner party identification".
Recode I20 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 5) (5 = 7) (7 = 6) (6 = 8) (8 = 9)  (ELSE = COPY).
VALUE LABELS I20
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
5 'Australian Democrats'
7 'Greens'
94 'New Nationals'
6 'Other party'
8 'One Nation'
9 'None'
93 'Christian Democratic Party'
-7 'Not sure'
92 'Citizens Electoral Council'
10 'Family First Party'
12 'Republican Party (replaced by Republican Party of Australia)'
13 'Shooters, Fishers and Farmers Party'
14 'Fishing Party'
15 'United Australia Party'
16 'Katter's Australia Party'
17 'Liberal Democrats'
18 'Motoring Enthusiasts Party'
19 'Australian Sports Party'
20 'Reason Party'
21 'The Wikileaks Party (dissolved in 2015)'
22 'Australian Christians'
23 'Derryn Hinch's Justice Party'
24 'Centre Alliance'
25 'Rise Up Australia'
26 'Science Party'
27 'Australian Liberty Alliance'
28 'Pirate Party'
30 'Jacquie Lambie Network'
31 'Arts Party'
32 'Animal Justice Party'
33 'Australian Cyclists Party'
34 'Health Australia Party'
35 'Affordable Housing Party'
36 'Australia First Party'
37 'Australian Better Families'
38 'Australian Conservatives'
39 'Australian People's Party'
40 'Australian Progressives'
41 'Australian Workers Party'
42 'Child Protection Party'
43 'Climate Action! Immigration Action! Accountable Politicians!'
44 'Country Liberals (NT)'
45 'Democratic Labour Party'
46 'Fraser Anning'S Conservative National Party'
47 'Help End Marijuana Prohibition (HEMP) Party'
48 'Independents For Climate Action Now'
49 'Involuntary Medication Objectors (Vaccination/Fluoride) Party'
50 'Labour DLP'
51 'Liberal National Party of Queensland'
52 'Love Australia or Leave'
53 'Non-Custodial Parents Party (Equal Parenting)'
54 'Secular Party of Australia'
55 'Seniors United Party of Australia'
56 'Socialist Alliance'
57 'Socialist Equality Party'
58 'Sustainable Australia'
59 'The Australian Mental Health Party'
60 'The Great Australian Party'
61 'The Small Business Party'
62 'The Together Party'
63 'Victorian Socialists'
64 'VOTEFLUX.ORG | Upgrade Democracy!'
65 'WESTERN AUSTRALIA PARTY'
66 'Yellow Vest Australia'
67 'Australian Citizens Party'
68 'Australian Federation Party'
69 'Australian Values Party'
70 'David Pocock'
71 'Drew Pavlou Democratic Alliance'
72 'FUSION: Science, Pirate, Secular, Climate Emergency'
73 'Federal ICAC Now'
74 'Indigenous - Aboriginal Party of Australia'
75 'Informed Medical Options Party'
76 'Rex Patrick Team'
77 'TNL'
78 'The Local Party of Australia'
95 'Swing Voter'
96 'Independent'
97 'Other party (not specified)'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (I20 = ptnprtid).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS spparty "Partner party identification".
Recode spparty (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 5) (5 = 7) (7 = 6) (6 = 8) (0 = 9) (8 = -7) (9 = -8) (0 = NA)  (ELSE = COPY).
VALUE LABELS spparty
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
5 'Australian Democrats'
7 'Greens'
94 'New Nationals'
6 'Other party'
8 'One Nation'
9 'None'
93 'Christian Democratic Party'
-7 'Not sure'
92 'Citizens Electoral Council'
10 'Family First Party'
12 'Republican Party (replaced by Republican Party of Australia)'
13 'Shooters, Fishers and Farmers Party'
14 'Fishing Party'
15 'United Australia Party'
16 'Katter's Australia Party'
17 'Liberal Democrats'
18 'Motoring Enthusiasts Party'
19 'Australian Sports Party'
20 'Reason Party'
21 'The Wikileaks Party (dissolved in 2015)'
22 'Australian Christians'
23 'Derryn Hinch's Justice Party'
24 'Centre Alliance'
25 'Rise Up Australia'
26 'Science Party'
27 'Australian Liberty Alliance'
28 'Pirate Party'
30 'Jacquie Lambie Network'
31 'Arts Party'
32 'Animal Justice Party'
33 'Australian Cyclists Party'
34 'Health Australia Party'
35 'Affordable Housing Party'
36 'Australia First Party'
37 'Australian Better Families'
38 'Australian Conservatives'
39 'Australian People's Party'
40 'Australian Progressives'
41 'Australian Workers Party'
42 'Child Protection Party'
43 'Climate Action! Immigration Action! Accountable Politicians!'
44 'Country Liberals (NT)'
45 'Democratic Labour Party'
46 'Fraser Anning'S Conservative National Party'
47 'Help End Marijuana Prohibition (HEMP) Party'
48 'Independents For Climate Action Now'
49 'Involuntary Medication Objectors (Vaccination/Fluoride) Party'
50 'Labour DLP'
51 'Liberal National Party of Queensland'
52 'Love Australia or Leave'
53 'Non-Custodial Parents Party (Equal Parenting)'
54 'Secular Party of Australia'
55 'Seniors United Party of Australia'
56 'Socialist Alliance'
57 'Socialist Equality Party'
58 'Sustainable Australia'
59 'The Australian Mental Health Party'
60 'The Great Australian Party'
61 'The Small Business Party'
62 'The Together Party'
63 'Victorian Socialists'
64 'VOTEFLUX.ORG | Upgrade Democracy!'
65 'WESTERN AUSTRALIA PARTY'
66 'Yellow Vest Australia'
67 'Australian Citizens Party'
68 'Australian Federation Party'
69 'Australian Values Party'
70 'David Pocock'
71 'Drew Pavlou Democratic Alliance'
72 'FUSION: Science, Pirate, Secular, Climate Emergency'
73 'Federal ICAC Now'
74 'Indigenous - Aboriginal Party of Australia'
75 'Informed Medical Options Party'
76 'Rex Patrick Team'
77 'TNL'
78 'The Local Party of Australia'
95 'Swing Voter'
96 'Independent'
97 'Other party (not specified)'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (spparty = ptnprtid).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS i24 "Partner party identification".
Recode i24 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 5) (5 = 7) (6 = 8) (8 = 9)  (ELSE = COPY).
VALUE LABELS i24
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
5 'Australian Democrats'
7 'Greens'
94 'New Nationals'
6 'Other party'
8 'One Nation'
9 'None'
93 'Christian Democratic Party'
-7 'Not sure'
92 'Citizens Electoral Council'
10 'Family First Party'
12 'Republican Party (replaced by Republican Party of Australia)'
13 'Shooters, Fishers and Farmers Party'
14 'Fishing Party'
15 'United Australia Party'
16 'Katter's Australia Party'
17 'Liberal Democrats'
18 'Motoring Enthusiasts Party'
19 'Australian Sports Party'
20 'Reason Party'
21 'The Wikileaks Party (dissolved in 2015)'
22 'Australian Christians'
23 'Derryn Hinch's Justice Party'
24 'Centre Alliance'
25 'Rise Up Australia'
26 'Science Party'
27 'Australian Liberty Alliance'
28 'Pirate Party'
30 'Jacquie Lambie Network'
31 'Arts Party'
32 'Animal Justice Party'
33 'Australian Cyclists Party'
34 'Health Australia Party'
35 'Affordable Housing Party'
36 'Australia First Party'
37 'Australian Better Families'
38 'Australian Conservatives'
39 'Australian People's Party'
40 'Australian Progressives'
41 'Australian Workers Party'
42 'Child Protection Party'
43 'Climate Action! Immigration Action! Accountable Politicians!'
44 'Country Liberals (NT)'
45 'Democratic Labour Party'
46 'Fraser Anning'S Conservative National Party'
47 'Help End Marijuana Prohibition (HEMP) Party'
48 'Independents For Climate Action Now'
49 'Involuntary Medication Objectors (Vaccination/Fluoride) Party'
50 'Labour DLP'
51 'Liberal National Party of Queensland'
52 'Love Australia or Leave'
53 'Non-Custodial Parents Party (Equal Parenting)'
54 'Secular Party of Australia'
55 'Seniors United Party of Australia'
56 'Socialist Alliance'
57 'Socialist Equality Party'
58 'Sustainable Australia'
59 'The Australian Mental Health Party'
60 'The Great Australian Party'
61 'The Small Business Party'
62 'The Together Party'
63 'Victorian Socialists'
64 'VOTEFLUX.ORG | Upgrade Democracy!'
65 'WESTERN AUSTRALIA PARTY'
66 'Yellow Vest Australia'
67 'Australian Citizens Party'
68 'Australian Federation Party'
69 'Australian Values Party'
70 'David Pocock'
71 'Drew Pavlou Democratic Alliance'
72 'FUSION: Science, Pirate, Secular, Climate Emergency'
73 'Federal ICAC Now'
74 'Indigenous - Aboriginal Party of Australia'
75 'Informed Medical Options Party'
76 'Rex Patrick Team'
77 'TNL'
78 'The Local Party of Australia'
95 'Swing Voter'
96 'Independent'
97 'Other party (not specified)'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i24 = ptnprtid).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS h22 "Partner party identification".
Recode h22 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 7) (6 = 9)  (ELSE = COPY).
VALUE LABELS h22
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
5 'Australian Democrats'
7 'Greens'
94 'New Nationals'
6 'Other party'
8 'One Nation'
9 'None'
93 'Christian Democratic Party'
-7 'Not sure'
92 'Citizens Electoral Council'
10 'Family First Party'
12 'Republican Party (replaced by Republican Party of Australia)'
13 'Shooters, Fishers and Farmers Party'
14 'Fishing Party'
15 'United Australia Party'
16 'Katter's Australia Party'
17 'Liberal Democrats'
18 'Motoring Enthusiasts Party'
19 'Australian Sports Party'
20 'Reason Party'
21 'The Wikileaks Party (dissolved in 2015)'
22 'Australian Christians'
23 'Derryn Hinch's Justice Party'
24 'Centre Alliance'
25 'Rise Up Australia'
26 'Science Party'
27 'Australian Liberty Alliance'
28 'Pirate Party'
30 'Jacquie Lambie Network'
31 'Arts Party'
32 'Animal Justice Party'
33 'Australian Cyclists Party'
34 'Health Australia Party'
35 'Affordable Housing Party'
36 'Australia First Party'
37 'Australian Better Families'
38 'Australian Conservatives'
39 'Australian People's Party'
40 'Australian Progressives'
41 'Australian Workers Party'
42 'Child Protection Party'
43 'Climate Action! Immigration Action! Accountable Politicians!'
44 'Country Liberals (NT)'
45 'Democratic Labour Party'
46 'Fraser Anning'S Conservative National Party'
47 'Help End Marijuana Prohibition (HEMP) Party'
48 'Independents For Climate Action Now'
49 'Involuntary Medication Objectors (Vaccination/Fluoride) Party'
50 'Labour DLP'
51 'Liberal National Party of Queensland'
52 'Love Australia or Leave'
53 'Non-Custodial Parents Party (Equal Parenting)'
54 'Secular Party of Australia'
55 'Seniors United Party of Australia'
56 'Socialist Alliance'
57 'Socialist Equality Party'
58 'Sustainable Australia'
59 'The Australian Mental Health Party'
60 'The Great Australian Party'
61 'The Small Business Party'
62 'The Together Party'
63 'Victorian Socialists'
64 'VOTEFLUX.ORG | Upgrade Democracy!'
65 'WESTERN AUSTRALIA PARTY'
66 'Yellow Vest Australia'
67 'Australian Citizens Party'
68 'Australian Federation Party'
69 'Australian Values Party'
70 'David Pocock'
71 'Drew Pavlou Democratic Alliance'
72 'FUSION: Science, Pirate, Secular, Climate Emergency'
73 'Federal ICAC Now'
74 'Indigenous - Aboriginal Party of Australia'
75 'Informed Medical Options Party'
76 'Rex Patrick Team'
77 'TNL'
78 'The Local Party of Australia'
95 'Swing Voter'
96 'Independent'
97 'Other party (not specified)'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h22 = ptnprtid).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS h21 "Partner party identification".
Recode h21 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 7) (5 = 6) (6 = 9)  (ELSE = COPY).
VALUE LABELS h21
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
5 'Australian Democrats'
7 'Greens'
94 'New Nationals'
6 'Other party'
8 'One Nation'
9 'None'
93 'Christian Democratic Party'
-7 'Not sure'
92 'Citizens Electoral Council'
10 'Family First Party'
12 'Republican Party (replaced by Republican Party of Australia)'
13 'Shooters, Fishers and Farmers Party'
14 'Fishing Party'
15 'United Australia Party'
16 'Katter's Australia Party'
17 'Liberal Democrats'
18 'Motoring Enthusiasts Party'
19 'Australian Sports Party'
20 'Reason Party'
21 'The Wikileaks Party (dissolved in 2015)'
22 'Australian Christians'
23 'Derryn Hinch's Justice Party'
24 'Centre Alliance'
25 'Rise Up Australia'
26 'Science Party'
27 'Australian Liberty Alliance'
28 'Pirate Party'
30 'Jacquie Lambie Network'
31 'Arts Party'
32 'Animal Justice Party'
33 'Australian Cyclists Party'
34 'Health Australia Party'
35 'Affordable Housing Party'
36 'Australia First Party'
37 'Australian Better Families'
38 'Australian Conservatives'
39 'Australian People's Party'
40 'Australian Progressives'
41 'Australian Workers Party'
42 'Child Protection Party'
43 'Climate Action! Immigration Action! Accountable Politicians!'
44 'Country Liberals (NT)'
45 'Democratic Labour Party'
46 'Fraser Anning'S Conservative National Party'
47 'Help End Marijuana Prohibition (HEMP) Party'
48 'Independents For Climate Action Now'
49 'Involuntary Medication Objectors (Vaccination/Fluoride) Party'
50 'Labour DLP'
51 'Liberal National Party of Queensland'
52 'Love Australia or Leave'
53 'Non-Custodial Parents Party (Equal Parenting)'
54 'Secular Party of Australia'
55 'Seniors United Party of Australia'
56 'Socialist Alliance'
57 'Socialist Equality Party'
58 'Sustainable Australia'
59 'The Australian Mental Health Party'
60 'The Great Australian Party'
61 'The Small Business Party'
62 'The Together Party'
63 'Victorian Socialists'
64 'VOTEFLUX.ORG | Upgrade Democracy!'
65 'WESTERN AUSTRALIA PARTY'
66 'Yellow Vest Australia'
67 'Australian Citizens Party'
68 'Australian Federation Party'
69 'Australian Values Party'
70 'David Pocock'
71 'Drew Pavlou Democratic Alliance'
72 'FUSION: Science, Pirate, Secular, Climate Emergency'
73 'Federal ICAC Now'
74 'Indigenous - Aboriginal Party of Australia'
75 'Informed Medical Options Party'
76 'Rex Patrick Team'
77 'TNL'
78 'The Local Party of Australia'
95 'Swing Voter'
96 'Independent'
97 'Other party (not specified)'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h21 = ptnprtid).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS h22 "Partner party identification".
Recode h22 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 7) (5 = 6) (6 = 9)  (ELSE = COPY).
VALUE LABELS h22
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
5 'Australian Democrats'
7 'Greens'
94 'New Nationals'
6 'Other party'
8 'One Nation'
9 'None'
93 'Christian Democratic Party'
-7 'Not sure'
92 'Citizens Electoral Council'
10 'Family First Party'
12 'Republican Party (replaced by Republican Party of Australia)'
13 'Shooters, Fishers and Farmers Party'
14 'Fishing Party'
15 'United Australia Party'
16 'Katter's Australia Party'
17 'Liberal Democrats'
18 'Motoring Enthusiasts Party'
19 'Australian Sports Party'
20 'Reason Party'
21 'The Wikileaks Party (dissolved in 2015)'
22 'Australian Christians'
23 'Derryn Hinch's Justice Party'
24 'Centre Alliance'
25 'Rise Up Australia'
26 'Science Party'
27 'Australian Liberty Alliance'
28 'Pirate Party'
30 'Jacquie Lambie Network'
31 'Arts Party'
32 'Animal Justice Party'
33 'Australian Cyclists Party'
34 'Health Australia Party'
35 'Affordable Housing Party'
36 'Australia First Party'
37 'Australian Better Families'
38 'Australian Conservatives'
39 'Australian People's Party'
40 'Australian Progressives'
41 'Australian Workers Party'
42 'Child Protection Party'
43 'Climate Action! Immigration Action! Accountable Politicians!'
44 'Country Liberals (NT)'
45 'Democratic Labour Party'
46 'Fraser Anning'S Conservative National Party'
47 'Help End Marijuana Prohibition (HEMP) Party'
48 'Independents For Climate Action Now'
49 'Involuntary Medication Objectors (Vaccination/Fluoride) Party'
50 'Labour DLP'
51 'Liberal National Party of Queensland'
52 'Love Australia or Leave'
53 'Non-Custodial Parents Party (Equal Parenting)'
54 'Secular Party of Australia'
55 'Seniors United Party of Australia'
56 'Socialist Alliance'
57 'Socialist Equality Party'
58 'Sustainable Australia'
59 'The Australian Mental Health Party'
60 'The Great Australian Party'
61 'The Small Business Party'
62 'The Together Party'
63 'Victorian Socialists'
64 'VOTEFLUX.ORG | Upgrade Democracy!'
65 'WESTERN AUSTRALIA PARTY'
66 'Yellow Vest Australia'
67 'Australian Citizens Party'
68 'Australian Federation Party'
69 'Australian Values Party'
70 'David Pocock'
71 'Drew Pavlou Democratic Alliance'
72 'FUSION: Science, Pirate, Secular, Climate Emergency'
73 'Federal ICAC Now'
74 'Indigenous - Aboriginal Party of Australia'
75 'Informed Medical Options Party'
76 'Rex Patrick Team'
77 'TNL'
78 'The Local Party of Australia'
95 'Swing Voter'
96 'Independent'
97 'Other party (not specified)'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h22 = ptnprtid).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H25 "Partner party identification".
Recode H25 (1 = 1) (2 = 2) (3 = 3) (7 = 5) (4 = 7) (5 = 6) (11 = 8) (6 = 9) (8 = 93) (9 = 92) (10 = 10) (12 = 12) (13 = 13) (14 = 14) (15 = 15) (16 = 16) (17 = 17) (18 = 18) (19 = 19) (20 = 20) (21 = 21) (22 = 22) (23 = 23) (24 = 24) (25 = 25) (26 = 26) (27 = 27) (28 = 28) (30 = 30) (31 = 31) (32 = 32) (33 = 33) (34 = 34) (95 = 95) (96 = 96) (97 = 97) (997 = -8) (999 = -2)  (ELSE = COPY).
VALUE LABELS H25
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
5 'Australian Democrats'
7 'Greens'
94 'New Nationals'
6 'Other party'
8 'One Nation'
9 'None'
93 'Christian Democratic Party'
-7 'Not sure'
92 'Citizens Electoral Council'
10 'Family First Party'
12 'Republican Party (replaced by Republican Party of Australia)'
13 'Shooters, Fishers and Farmers Party'
14 'Fishing Party'
15 'United Australia Party'
16 'Katter's Australia Party'
17 'Liberal Democrats'
18 'Motoring Enthusiasts Party'
19 'Australian Sports Party'
20 'Reason Party'
21 'The Wikileaks Party (dissolved in 2015)'
22 'Australian Christians'
23 'Derryn Hinch's Justice Party'
24 'Centre Alliance'
25 'Rise Up Australia'
26 'Science Party'
27 'Australian Liberty Alliance'
28 'Pirate Party'
30 'Jacquie Lambie Network'
31 'Arts Party'
32 'Animal Justice Party'
33 'Australian Cyclists Party'
34 'Health Australia Party'
35 'Affordable Housing Party'
36 'Australia First Party'
37 'Australian Better Families'
38 'Australian Conservatives'
39 'Australian People's Party'
40 'Australian Progressives'
41 'Australian Workers Party'
42 'Child Protection Party'
43 'Climate Action! Immigration Action! Accountable Politicians!'
44 'Country Liberals (NT)'
45 'Democratic Labour Party'
46 'Fraser Anning'S Conservative National Party'
47 'Help End Marijuana Prohibition (HEMP) Party'
48 'Independents For Climate Action Now'
49 'Involuntary Medication Objectors (Vaccination/Fluoride) Party'
50 'Labour DLP'
51 'Liberal National Party of Queensland'
52 'Love Australia or Leave'
53 'Non-Custodial Parents Party (Equal Parenting)'
54 'Secular Party of Australia'
55 'Seniors United Party of Australia'
56 'Socialist Alliance'
57 'Socialist Equality Party'
58 'Sustainable Australia'
59 'The Australian Mental Health Party'
60 'The Great Australian Party'
61 'The Small Business Party'
62 'The Together Party'
63 'Victorian Socialists'
64 'VOTEFLUX.ORG | Upgrade Democracy!'
65 'WESTERN AUSTRALIA PARTY'
66 'Yellow Vest Australia'
67 'Australian Citizens Party'
68 'Australian Federation Party'
69 'Australian Values Party'
70 'David Pocock'
71 'Drew Pavlou Democratic Alliance'
72 'FUSION: Science, Pirate, Secular, Climate Emergency'
73 'Federal ICAC Now'
74 'Indigenous - Aboriginal Party of Australia'
75 'Informed Medical Options Party'
76 'Rex Patrick Team'
77 'TNL'
78 'The Local Party of Australia'
95 'Swing Voter'
96 'Independent'
97 'Other party (not specified)'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H25 = ptnprtid).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS I6 "Partner party identification".
Recode I6 (1 = 1) (2 = 2) (3 = 3) (7 = 5) (4 = 7) (5 = 6) (11 = 8) (6 = 9) (8 = 93) (9 = 92) (10 = 10) (12 = 12) (13 = 13) (14 = 14) (15 = 15) (16 = 16) (17 = 17) (18 = 18) (19 = 19) (20 = 20) (21 = 21) (22 = 22) (23 = 23) (24 = 24) (25 = 25) (26 = 26) (27 = 27) (28 = 28) (30 = 30) (31 = 31) (32 = 32) (33 = 33) (34 = 34) (35 = 35) (36 = 36) (37 = 37) (38 = 38) (39 = 39) (40 = 40) (41 = 41) (42 = 42) (43 = 43) (44 = 44) (45 = 45) (46 = 46) (47 = 47) (48 = 48) (49 = 49) (50 = 50) (51 = 51) (52 = 52) (53 = 53) (54 = 54) (55 = 55) (56 = 56) (57 = 57) (58 = 58) (59 = 59) (60 = 60) (61 = 61) (62 = 62) (63 = 63) (64 = 64) (65 = 65) (66 = 66) (95 = 95) (96 = 96) (97 = 97) (997 = -8) (999 = -2)  (ELSE = COPY).
VALUE LABELS I6
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
5 'Australian Democrats'
7 'Greens'
94 'New Nationals'
6 'Other party'
8 'One Nation'
9 'None'
93 'Christian Democratic Party'
-7 'Not sure'
92 'Citizens Electoral Council'
10 'Family First Party'
12 'Republican Party (replaced by Republican Party of Australia)'
13 'Shooters, Fishers and Farmers Party'
14 'Fishing Party'
15 'United Australia Party'
16 'Katter's Australia Party'
17 'Liberal Democrats'
18 'Motoring Enthusiasts Party'
19 'Australian Sports Party'
20 'Reason Party'
21 'The Wikileaks Party (dissolved in 2015)'
22 'Australian Christians'
23 'Derryn Hinch's Justice Party'
24 'Centre Alliance'
25 'Rise Up Australia'
26 'Science Party'
27 'Australian Liberty Alliance'
28 'Pirate Party'
30 'Jacquie Lambie Network'
31 'Arts Party'
32 'Animal Justice Party'
33 'Australian Cyclists Party'
34 'Health Australia Party'
35 'Affordable Housing Party'
36 'Australia First Party'
37 'Australian Better Families'
38 'Australian Conservatives'
39 'Australian People's Party'
40 'Australian Progressives'
41 'Australian Workers Party'
42 'Child Protection Party'
43 'Climate Action! Immigration Action! Accountable Politicians!'
44 'Country Liberals (NT)'
45 'Democratic Labour Party'
46 'Fraser Anning'S Conservative National Party'
47 'Help End Marijuana Prohibition (HEMP) Party'
48 'Independents For Climate Action Now'
49 'Involuntary Medication Objectors (Vaccination/Fluoride) Party'
50 'Labour DLP'
51 'Liberal National Party of Queensland'
52 'Love Australia or Leave'
53 'Non-Custodial Parents Party (Equal Parenting)'
54 'Secular Party of Australia'
55 'Seniors United Party of Australia'
56 'Socialist Alliance'
57 'Socialist Equality Party'
58 'Sustainable Australia'
59 'The Australian Mental Health Party'
60 'The Great Australian Party'
61 'The Small Business Party'
62 'The Together Party'
63 'Victorian Socialists'
64 'VOTEFLUX.ORG | Upgrade Democracy!'
65 'WESTERN AUSTRALIA PARTY'
66 'Yellow Vest Australia'
67 'Australian Citizens Party'
68 'Australian Federation Party'
69 'Australian Values Party'
70 'David Pocock'
71 'Drew Pavlou Democratic Alliance'
72 'FUSION: Science, Pirate, Secular, Climate Emergency'
73 'Federal ICAC Now'
74 'Indigenous - Aboriginal Party of Australia'
75 'Informed Medical Options Party'
76 'Rex Patrick Team'
77 'TNL'
78 'The Local Party of Australia'
95 'Swing Voter'
96 'Independent'
97 'Other party (not specified)'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (I6 = ptnprtid).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS I6 "Partner party identification".
Recode I6 (1 = 1) (2 = 2) (3 = 3) (7 = 5) (4 = 7) (5 = 6) (11 = 8) (6 = 9) (8 = 93) (9 = 92) (10 = 10) (12 = 12) (13 = 13) (14 = 14) (15 = 15) (16 = 16) (17 = 17) (18 = 18) (19 = 19) (20 = 20) (21 = 21) (22 = 22) (23 = 23) (24 = 24) (25 = 25) (26 = 26) (27 = 27) (28 = 28) (30 = 30) (31 = 31) (32 = 32) (33 = 33) (34 = 34) (35 = 35) (36 = 36) (37 = 37) (38 = 38) (39 = 39) (40 = 40) (41 = 41) (42 = 42) (43 = 43) (44 = 44) (45 = 45) (46 = 46) (47 = 47) (48 = 48) (49 = 49) (50 = 50) (51 = 51) (52 = 52) (53 = 53) (54 = 54) (55 = 55) (56 = 56) (57 = 57) (58 = 58) (59 = 59) (60 = 60) (61 = 61) (62 = 62) (63 = 63) (64 = 64) (65 = 65) (66 = 66) (67 = 67) (68 = 68) (69 = 69) (70 = 70) (71 = 71) (72 = 72) (73 = 73) (74 = 74) (75 = 75) (76 = 76) (77 = 77) (78 = 78) (95 = 95) (96 = 96) (97 = 97) (997 = -8) (999 = -2)  (ELSE = COPY).
VALUE LABELS I6
-4 'Blank'
-1 'Missing'
-3 'No response'
1 'Liberal'
2 'Labor'
3 'National/Country'
5 'Australian Democrats'
7 'Greens'
94 'New Nationals'
6 'Other party'
8 'One Nation'
9 'None'
93 'Christian Democratic Party'
-7 'Not sure'
92 'Citizens Electoral Council'
10 'Family First Party'
12 'Republican Party (replaced by Republican Party of Australia)'
13 'Shooters, Fishers and Farmers Party'
14 'Fishing Party'
15 'United Australia Party'
16 'Katter's Australia Party'
17 'Liberal Democrats'
18 'Motoring Enthusiasts Party'
19 'Australian Sports Party'
20 'Reason Party'
21 'The Wikileaks Party (dissolved in 2015)'
22 'Australian Christians'
23 'Derryn Hinch's Justice Party'
24 'Centre Alliance'
25 'Rise Up Australia'
26 'Science Party'
27 'Australian Liberty Alliance'
28 'Pirate Party'
30 'Jacquie Lambie Network'
31 'Arts Party'
32 'Animal Justice Party'
33 'Australian Cyclists Party'
34 'Health Australia Party'
35 'Affordable Housing Party'
36 'Australia First Party'
37 'Australian Better Families'
38 'Australian Conservatives'
39 'Australian People's Party'
40 'Australian Progressives'
41 'Australian Workers Party'
42 'Child Protection Party'
43 'Climate Action! Immigration Action! Accountable Politicians!'
44 'Country Liberals (NT)'
45 'Democratic Labour Party'
46 'Fraser Anning'S Conservative National Party'
47 'Help End Marijuana Prohibition (HEMP) Party'
48 'Independents For Climate Action Now'
49 'Involuntary Medication Objectors (Vaccination/Fluoride) Party'
50 'Labour DLP'
51 'Liberal National Party of Queensland'
52 'Love Australia or Leave'
53 'Non-Custodial Parents Party (Equal Parenting)'
54 'Secular Party of Australia'
55 'Seniors United Party of Australia'
56 'Socialist Alliance'
57 'Socialist Equality Party'
58 'Sustainable Australia'
59 'The Australian Mental Health Party'
60 'The Great Australian Party'
61 'The Small Business Party'
62 'The Together Party'
63 'Victorian Socialists'
64 'VOTEFLUX.ORG | Upgrade Democracy!'
65 'WESTERN AUSTRALIA PARTY'
66 'Yellow Vest Australia'
67 'Australian Citizens Party'
68 'Australian Federation Party'
69 'Australian Values Party'
70 'David Pocock'
71 'Drew Pavlou Democratic Alliance'
72 'FUSION: Science, Pirate, Secular, Climate Emergency'
73 'Federal ICAC Now'
74 'Indigenous - Aboriginal Party of Australia'
75 'Informed Medical Options Party'
76 'Rex Patrick Team'
77 'TNL'
78 'The Local Party of Australia'
95 'Swing Voter'
96 'Independent'
97 'Other party (not specified)'
-8 'Not applicable'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (I6 = ptnprtid).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS xi24 "Extended - partner party identification".
Recode xi24 (-1 = -1) (2 = 7) (3 = 4) (5 = 2) (8 = 8) (12 = 92) (14 = 10) (18 = 1) (20 = 3) (27 = 11) (32 = 93) (38 = 94) (96 = 96) (97 = 97) (98 = 6)  (ELSE = COPY).
VALUE LABELS xi24
-1 'Missing'
7 'Australian Democrats'
4 'Greens'
2 'Labor'
5 'Other'
8 'Christian Democratic Party'
9 'Citizens Electoral Council'
92 'Democratic Labor Party (DLP)'
10 'Family First Party'
15 'Palmer's United Party'
16 'Katter's Australia Party'
17 'Liberal Democrats'
1 'Liberal'
18 'Motoring Enthusiasts Party'
19 'Australian Sports Party'
3 'National Party'
20 'The Australian Sex Party'
21 'The Wikileaks Party'
22 'Australian Christians'
11 'One Nation'
12 'Republican Party'
93 'Socialist Alliance'
94 'Young National Party of Australia'
13 'Shooters Party'
14 'Fishing Party'
95 'Swing Voter'
96 'Independent'
97 'Other party (not specified)'
6 'No party'
-3 'No response'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (xi24 = xptnprtid).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS xh22 "Extended - partner party identification".
Recode xh22 (-1 = -1) (2 = 7) (3 = 4) (5 = 2) (8 = 8) (9 = 9) (12 = 92) (14 = 10) (18 = 1) (20 = 3) (27 = 11) (32 = 93) (38 = 94) (96 = 96) (97 = 97) (98 = 6)  (ELSE = COPY).
VALUE LABELS xh22
-1 'Missing'
7 'Australian Democrats'
4 'Greens'
2 'Labor'
5 'Other'
8 'Christian Democratic Party'
9 'Citizens Electoral Council'
92 'Democratic Labor Party (DLP)'
10 'Family First Party'
15 'Palmer's United Party'
16 'Katter's Australia Party'
17 'Liberal Democrats'
1 'Liberal'
18 'Motoring Enthusiasts Party'
19 'Australian Sports Party'
3 'National Party'
20 'The Australian Sex Party'
21 'The Wikileaks Party'
22 'Australian Christians'
11 'One Nation'
12 'Republican Party'
93 'Socialist Alliance'
94 'Young National Party of Australia'
13 'Shooters Party'
14 'Fishing Party'
95 'Swing Voter'
96 'Independent'
97 'Other party (not specified)'
6 'No party'
-3 'No response'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (xh22 = xptnprtid).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS xh21 "Extended - partner party identification".
Recode xh21 (-1 = -1) (2 = 7) (3 = 4) (5 = 2) (8 = 8) (9 = 9) (14 = 10) (18 = 1) (20 = 3) (27 = 11) (30 = 12) (39 = 13) (40 = 14) (96 = 96) (97 = 97) (98 = 6)  (ELSE = COPY).
VALUE LABELS xh21
-1 'Missing'
7 'Australian Democrats'
4 'Greens'
2 'Labor'
5 'Other'
8 'Christian Democratic Party'
9 'Citizens Electoral Council'
92 'Democratic Labor Party (DLP)'
10 'Family First Party'
15 'Palmer's United Party'
16 'Katter's Australia Party'
17 'Liberal Democrats'
1 'Liberal'
18 'Motoring Enthusiasts Party'
19 'Australian Sports Party'
3 'National Party'
20 'The Australian Sex Party'
21 'The Wikileaks Party'
22 'Australian Christians'
11 'One Nation'
12 'Republican Party'
93 'Socialist Alliance'
94 'Young National Party of Australia'
13 'Shooters Party'
14 'Fishing Party'
95 'Swing Voter'
96 'Independent'
97 'Other party (not specified)'
6 'No party'
-3 'No response'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (xh21 = xptnprtid).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS xh22 "Extended - partner party identification".
Recode xh22 (-1 = -1) (7 = 7) (4 = 4) (2 = 2) (5 = 5) (8 = 8) (9 = 9) (10 = 10) (15 = 15) (16 = 16) (17 = 17) (1 = 1) (18 = 18) (19 = 19) (3 = 3) (20 = 20) (21 = 21) (22 = 22) (11 = 11) (12 = 12) (13 = 13) (14 = 14) (95 = 95) (96 = 96) (97 = 97) (6 = 6)  (ELSE = COPY).
VALUE LABELS xh22
-1 'Missing'
7 'Australian Democrats'
4 'Greens'
2 'Labor'
5 'Other'
8 'Christian Democratic Party'
9 'Citizens Electoral Council'
92 'Democratic Labor Party (DLP)'
10 'Family First Party'
15 'Palmer's United Party'
16 'Katter's Australia Party'
17 'Liberal Democrats'
1 'Liberal'
18 'Motoring Enthusiasts Party'
19 'Australian Sports Party'
3 'National Party'
20 'The Australian Sex Party'
21 'The Wikileaks Party'
22 'Australian Christians'
11 'One Nation'
12 'Republican Party'
93 'Socialist Alliance'
94 'Young National Party of Australia'
13 'Shooters Party'
14 'Fishing Party'
95 'Swing Voter'
96 'Independent'
97 'Other party (not specified)'
6 'No party'
-3 'No response'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (xh22 = xptnprtid).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H25_oth "Extended - partner party identification".
Recode H25_oth (995 = -3) (997 = -8)  (ELSE = COPY).
VALUE LABELS H25_oth
-1 'Missing'
7 'Australian Democrats'
4 'Greens'
2 'Labor'
5 'Other'
8 'Christian Democratic Party'
9 'Citizens Electoral Council'
92 'Democratic Labor Party (DLP)'
10 'Family First Party'
15 'Palmer's United Party'
16 'Katter's Australia Party'
17 'Liberal Democrats'
1 'Liberal'
18 'Motoring Enthusiasts Party'
19 'Australian Sports Party'
3 'National Party'
20 'The Australian Sex Party'
21 'The Wikileaks Party'
22 'Australian Christians'
11 'One Nation'
12 'Republican Party'
93 'Socialist Alliance'
94 'Young National Party of Australia'
13 'Shooters Party'
14 'Fishing Party'
95 'Swing Voter'
96 'Independent'
97 'Other party (not specified)'
6 'No party'
-3 'No response'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (H25_oth = xptnprtid).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS I6_other "Extended - partner party identification".
Recode I6_other (999 = -3)  (ELSE = COPY).
VALUE LABELS I6_other
-1 'Missing'
7 'Australian Democrats'
4 'Greens'
2 'Labor'
5 'Other'
8 'Christian Democratic Party'
9 'Citizens Electoral Council'
92 'Democratic Labor Party (DLP)'
10 'Family First Party'
15 'Palmer's United Party'
16 'Katter's Australia Party'
17 'Liberal Democrats'
1 'Liberal'
18 'Motoring Enthusiasts Party'
19 'Australian Sports Party'
3 'National Party'
20 'The Australian Sex Party'
21 'The Wikileaks Party'
22 'Australian Christians'
11 'One Nation'
12 'Republican Party'
93 'Socialist Alliance'
94 'Young National Party of Australia'
13 'Shooters Party'
14 'Fishing Party'
95 'Swing Voter'
96 'Independent'
97 'Other party (not specified)'
6 'No party'
-3 'No response'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (I6_other = xptnprtid).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS I6_other "Extended - partner party identification".
Recode I6_other  (ELSE = COPY).
VALUE LABELS I6_other
-1 'Missing'
7 'Australian Democrats'
4 'Greens'
2 'Labor'
5 'Other'
8 'Christian Democratic Party'
9 'Citizens Electoral Council'
92 'Democratic Labor Party (DLP)'
10 'Family First Party'
15 'Palmer's United Party'
16 'Katter's Australia Party'
17 'Liberal Democrats'
1 'Liberal'
18 'Motoring Enthusiasts Party'
19 'Australian Sports Party'
3 'National Party'
20 'The Australian Sex Party'
21 'The Wikileaks Party'
22 'Australian Christians'
11 'One Nation'
12 'Republican Party'
93 'Socialist Alliance'
94 'Young National Party of Australia'
13 'Shooters Party'
14 'Fishing Party'
95 'Swing Voter'
96 'Independent'
97 'Other party (not specified)'
6 'No party'
-3 'No response'
-8 'Not applicable'.
EXECUTE.
RENAME VARIABLES (I6_other = xptnprtid).

DATASET ACTIVATE aes96_datafile.
VARIABLE LABELS j11 "Live rural or urban".
Recode j11 (-1 = -4) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5)  (ELSE = COPY).
VALUE LABELS j11
-1 'Missing'
-4 'Blank'
1 'A rural area or village'
2 'A small country town (under 10,000 people)'
3 'A larger country town (over 10,000 people)'
4 'A large town (over 25,000 people)'
5 'A major city (over 100,000 people)'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (j11 = rururbn).

DATASET ACTIVATE aes98_datafile.
VARIABLE LABELS I13 "Live rural or urban".
Recode I13 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5)  (ELSE = COPY).
VALUE LABELS I13
-1 'Missing'
-4 'Blank'
1 'A rural area or village'
2 'A small country town (under 10,000 people)'
3 'A larger country town (over 10,000 people)'
4 'A large town (over 25,000 people)'
5 'A major city (over 100,000 people)'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (I13 = rururbn).

DATASET ACTIVATE aes01_datafile.
VARIABLE LABELS liveurb "Live rural or urban".
Recode liveurb (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5)  (ELSE = COPY).
VALUE LABELS liveurb
-1 'Missing'
-4 'Blank'
1 'A rural area or village'
2 'A small country town (under 10,000 people)'
3 'A larger country town (over 10,000 people)'
4 'A large town (over 25,000 people)'
5 'A major city (over 100,000 people)'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (liveurb = rururbn).

DATASET ACTIVATE aes04_datafile.
VARIABLE LABELS i17 "Live rural or urban".
Recode i17 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5)  (ELSE = COPY).
VALUE LABELS i17
-1 'Missing'
-4 'Blank'
1 'A rural area or village'
2 'A small country town (under 10,000 people)'
3 'A larger country town (over 10,000 people)'
4 'A large town (over 25,000 people)'
5 'A major city (over 100,000 people)'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (i17 = rururbn).

DATASET ACTIVATE aes07_datafile.
VARIABLE LABELS h15 "Live rural or urban".
Recode h15 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5)  (ELSE = COPY).
VALUE LABELS h15
-1 'Missing'
-4 'Blank'
1 'A rural area or village'
2 'A small country town (under 10,000 people)'
3 'A larger country town (over 10,000 people)'
4 'A large town (over 25,000 people)'
5 'A major city (over 100,000 people)'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h15 = rururbn).

DATASET ACTIVATE aes10_datafile.
VARIABLE LABELS h14 "Live rural or urban".
Recode h14 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5)  (ELSE = COPY).
VALUE LABELS h14
-1 'Missing'
-4 'Blank'
1 'A rural area or village'
2 'A small country town (under 10,000 people)'
3 'A larger country town (over 10,000 people)'
4 'A large town (over 25,000 people)'
5 'A major city (over 100,000 people)'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h14 = rururbn).

DATASET ACTIVATE aes13_datafile.
VARIABLE LABELS h14 "Live rural or urban".
Recode h14 (-1 = -1) (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5)  (ELSE = COPY).
VALUE LABELS h14
-1 'Missing'
-4 'Blank'
1 'A rural area or village'
2 'A small country town (under 10,000 people)'
3 'A larger country town (over 10,000 people)'
4 'A large town (over 25,000 people)'
5 'A major city (over 100,000 people)'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (h14 = rururbn).

DATASET ACTIVATE aes16_datafile.
VARIABLE LABELS H16 "Live rural or urban".
Recode H16 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (999 = -2)  (ELSE = COPY).
VALUE LABELS H16
-1 'Missing'
-4 'Blank'
1 'A rural area or village'
2 'A small country town (under 10,000 people)'
3 'A larger country town (over 10,000 people)'
4 'A large town (over 25,000 people)'
5 'A major city (over 100,000 people)'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (H16 = rururbn).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS J5 "Live rural or urban".
Recode J5 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (999 = -2)  (ELSE = COPY).
VALUE LABELS J5
-1 'Missing'
-4 'Blank'
1 'A rural area or village'
2 'A small country town (under 10,000 people)'
3 'A larger country town (over 10,000 people)'
4 'A large town (over 25,000 people)'
5 'A major city (over 100,000 people)'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J5 = rururbn).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS J5 "Live rural or urban".
Recode J5 (1 = 1) (2 = 2) (3 = 3) (4 = 4) (5 = 5) (999 = -2)  (ELSE = COPY).
VALUE LABELS J5
-1 'Missing'
-4 'Blank'
1 'A rural area or village'
2 'A small country town (under 10,000 people)'
3 'A larger country town (over 10,000 people)'
4 'A large town (over 25,000 people)'
5 'A major city (over 100,000 people)'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (J5 = rururbn).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS W1 "How many people aged 18 years or older live in your household including yourself".
Recode W1 (999 = -2)  (ELSE = COPY).
VALUE LABELS W1
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (W1 = hh18plus).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS W1 "How many people aged 18 years or older live in your household including yourself".
Recode W1 (999 = -2)  (ELSE = COPY).
VALUE LABELS W1
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (W1 = hh18plus).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS W2 "Is there a fixed line telephone that is used".
Recode W2 (1 = 1) (2 = 2) (999 = -2)  (ELSE = COPY).
VALUE LABELS W2
1 'Yes'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (W2 = hhlandph).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS W2 "Is there a fixed line telephone that is used".
Recode W2 (1 = 1) (2 = 2) (999 = -2)  (ELSE = COPY).
VALUE LABELS W2
1 'Yes'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (W2 = hhlandph).

DATASET ACTIVATE aes19_unrestricted.
VARIABLE LABELS W4 "Does any member of your household access the internet from home".
Recode W4 (1 = 1) (2 = 2) (999 = -2)  (ELSE = COPY).
VALUE LABELS W4
1 'Yes'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (W4 = hhintnet).

DATASET ACTIVATE aes22_unrestricted_v2.
VARIABLE LABELS W4 "Does any member of your household access the internet from home".
Recode W4 (1 = 1) (2 = 2) (999 = -2)  (ELSE = COPY).
VALUE LABELS W4
1 'Yes'
2 'No'
-2 'Skipped'.
EXECUTE.
RENAME VARIABLES (W4 = hhintnet).

DATASET ACTIVATE aes01_datafile.
MATCH FILES
FILE = *
/keep
id
sex
yearbirth
age
marital
class
leftschool
trtedu
hiqual
mainstat
opos
empsect
supother
unionmem
faptid14
moptid14
religion
xreligio
rlgatten
ownhome
ownpc
firearm
netfreq
stt
cabsattv
mainstrap
ptnemp
ptnspv
ptntru
ptnprtid
rururbn
.
SAVE OUTFILE='aes01_harmonized.sav'.

DATASET ACTIVATE aes04_datafile.
MATCH FILES
FILE = *
/keep
id
sex
yearbirth
marital
class
leftschool
schlsect
trtedu
hiqual
schsecch
mainstat
opos
empsect
supother
unionmem
faptid14
moptid14
religion
xreligio
rlgatten
ownhome
ownpc
firearm
ownshare
netfreq
stt
cabsattv
mainstrap
ptnemp
ptnspv
ptntru
ptnprtid
xptnprtid
rururbn
.
SAVE OUTFILE='aes04_harmonized.sav'.

DATASET ACTIVATE aes87_datafile.
MATCH FILES
FILE = *
/keep
id
sex
yearbirth
marital
class
leftschool
schlsect
trtedu
hiqual
mainstat
empsect
supother
unionmem
faptid14
moptid14
religion
rlgatten
mainstrap
ptnemp
ptnspv
ptntru
ptnprtid
.
SAVE OUTFILE='aes87_harmonized.sav'.

DATASET ACTIVATE aes90_datafile.
MATCH FILES
FILE = *
/keep
id
sex
yearbirth
marital
class
leftschool
schlsect
trtedu
hiqual
mainstat
empsect
supother
unionmem
faptid14
moptid14
religion
rlgatten
mainstrap
ptnemp
ptnspv
ptntru
ptnprtid
.
SAVE OUTFILE='aes90_harmonized.sav'.

DATASET ACTIVATE aes93_datafile.
MATCH FILES
FILE = *
/keep
id
sex
yearbirth
marital
class
leftschool
schlsect
trtedu
hiqual
mainstat
empsect
supother
faptid14
moptid14
religion
rlgatten
mainstrap
ptnemp
ptnspv
ptntru
ptnprtid
.
SAVE OUTFILE='aes93_harmonized.sav'.

DATASET ACTIVATE aes96_datafile.
MATCH FILES
FILE = *
/keep
id
sex
yearbirth
marital
class
leftschool
trtedu
hiqual
mainstat
opos
empsect
supother
unionmem
faptid14
moptid14
religion
rlgatten
ownhome
mainstrap
ptnemp
ptnspv
ptntru
ptnprtid
rururbn
.
SAVE OUTFILE='aes96_harmonized.sav'.

DATASET ACTIVATE aes98_datafile.
MATCH FILES
FILE = *
/keep
id
sex
yearbirth
marital
class
leftschool
trtedu
hiqual
mainstat
opos
empsect
supother
unionmem
faptid14
moptid14
religion
xreligio
rlgatten
ownhome
ownpc
firearm
mainstrap
ptnemp
ptnspv
ptntru
ptnprtid
rururbn
.
SAVE OUTFILE='aes98_harmonized.sav'.

DATASET ACTIVATE aes07_datafile.
MATCH FILES
FILE = *
/keep
id
sex
yearbirth
marital
class
leftschool
schlsect
trtedu
hiqual
schsecch
mainstat
opos
empsect
supother
unionmem
faptid14
moptid14
religion
xreligio
rlgatten
ownhome
ownshare
netfreq
stt
mainstrap
ptnemp
ptnspv
ptntru
ptnprtid
xptnprtid
rururbn
.
SAVE OUTFILE='aes07_harmonized.sav'.

DATASET ACTIVATE aes10_datafile.
MATCH FILES
FILE = *
/keep
id
sex
yearbirth
age
agecat
marital
class
leftschool
trtedu
hiqual
mainstat
opos
empsect
supother
unionmem
faptid14
moptid14
religion
xreligio
rlgatten
ownhome
ownshare
netfreq
stt
emlatt
post
dsnweb
dnld
mainstrap
ptnemp
ptnspv
ptntru
ptnprtid
xptnprtid
rururbn
.
SAVE OUTFILE='aes10_harmonized.sav'.

DATASET ACTIVATE aes13_datafile.
MATCH FILES
FILE = *
/keep
id
sex
yearbirth
age
agecat
marital
class
leftschool
trtedu
hiqual
mainstat
opos
empsect
supother
unionmem
faptid14
moptid14
indigsid
religion
xreligio
rlgatten
ownhome
ownshare
netfreq
stt
emlatt
post
dsnweb
dnld
mainstrap
ptnemp
ptnspv
ptntru
ptnprtid
xptnprtid
rururbn
.
SAVE OUTFILE='aes13_harmonized.sav'.

DATASET ACTIVATE aes16_datafile.
MATCH FILES
FILE = *
/keep
id
sex
yearbirth
marital
class
leftschool
trtedu
hiqual
mainstat
mainstot
work4pay
opos
empsect
supother
faptid14
moptid14
indigsid
religion
xreligio
rlgatten
ownhome
smsuper
ownpc
ownshare
netfreq
stt
emlatt
post
dsnweb
dnld
enrvote
mainstrap
ptnwkpay
ptnemp
ptnspv
ptntru
ptnprtid
xptnprtid
rururbn
.
SAVE OUTFILE='aes16_harmonized.sav'.

DATASET ACTIVATE aes19_unrestricted.
MATCH FILES
FILE = *
/keep
id
sex
yearbirth
age
marital
class
mbphone
volwork
leftschool
trtedu
hiqual
mainstat
mainstot
work4pay
faptid14
moptid14
indigsid
religion
xreligio
rlgatten
ownhome
smsuper
ownpc
ownshare
benfampy
bencldcr
benunemp
benagep
bendisab
benvetpn
bennone
enrvote
benskip
enrvotpr
mainstrap
ptnwkpay
ptnemp
ptnspv
ptntru
ptnprtid
xptnprtid
rururbn
hh18plus
hhlandph
hhintnet
.
SAVE OUTFILE='aes19_harmonized.sav'.

DATASET ACTIVATE aes22_unrestricted_v2.
MATCH FILES
FILE = *
/keep
id
sex
yearbirth
age
agecat
marital
class
mbphone
volwork
leftschool
trtedu
hiqual
mainstat
mainstot
work4pay
faptid14
moptid14
indigsid
religion
xreligio
rlgatten
ownhome
smsuper
ownpc
ownshare
benfampy
bencldcr
benunemp
benagep
bendisab
benvetpn
bennone
enrvote
benskip
enrvotpr
mainstrap
ptnwkpay
ptnemp
ptnspv
ptntru
ptnprtid
xptnprtid
rururbn
hh18plus
hhlandph
hhintnet
.
SAVE OUTFILE='aes22_harmonized.sav'.


