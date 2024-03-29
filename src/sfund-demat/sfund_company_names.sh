#!/bin/sh

CONFIG_DATA_LOC=`python -m config data`
CONFIG_REPORTS_LOC=`python -m config reports`
CONFIG_PROFILE_DATA_LOC=`python -m config profile_data`
CONFIG_PROFILE_REPORTS_LOC=`python -m config profile_reports`

DATA_SFUND_FILE=$CONFIG_PROFILE_DATA_LOC/sfund-data/sfund-data.csv
REPORTS_SFUND_FILE=$CONFIG_PROFILE_REPORTS_LOC/sfund-demat-reports/sfund-names.csv
 
awk -F "," '
{ if (start_printing) { for (i=4; i<=NF;i++) {print $i} } }
/Category/ { if ($1 == "Category") {start_printing=1} } 
' ${DATA_SFUND_FILE} | tr '[a-z]' '[A-Z]' | sort -u | grep -v -e '#'  | sed '/^$/d' | sed -e 's/ INDIA//g' -e 's/LIMITED//g' -e 's/LTD//g' -e 's/ OF / /g' -e 's/ & / /g' -e 's/&//g' -e 's/The / /g' > ${REPORTS_SFUND_FILE}

