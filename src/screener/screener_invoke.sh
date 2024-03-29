#!/bin/sh

DEBUG_LEVEL=0

CONFIG_DATA_LOC=`python -m config data`
CONFIG_REPORTS_LOC=`python -m config reports`
CONFIG_PROFILE_DATA_LOC=`python -m config profile_data`
CONFIG_PROFILE_REPORTS_LOC=`python -m config profile_reports`

IN_FILE_BSE=$CONFIG_DATA_LOC/isin-data/isin-bse-500.csv
IN_FILE_NSE=$CONFIG_DATA_LOC/isin-data/isin-nse-500.csv

IN_FILE_AMFI=$CONFIG_DATA_LOC/amfi-data/amfi-data-mcap.csv

IN_FILE_SC_NAME_ALIASES=$CONFIG_DATA_LOC/screener-data/screener-name-aliases.csv
IN_FILE_SC_DATA_1=$CONFIG_DATA_LOC/screener-data/screener-data-account1.csv
IN_FILE_SC_DATA_2=$CONFIG_DATA_LOC/screener-data/screener-data-account2.csv

OUT_FILE_1=$CONFIG_REPORTS_LOC/screener-reports/screener-reports-phase-1.csv
OUT_FILE_2=$CONFIG_REPORTS_LOC/screener-reports/screener-reports-phase-2.csv

screener_invoke.py ${DEBUG_LEVEL} ${IN_FILE_BSE} ${IN_FILE_NSE} ${IN_FILE_AMFI} ${IN_FILE_SC_NAME_ALIASES} ${IN_FILE_SC_DATA_1} ${IN_FILE_SC_DATA_2} ${OUT_FILE_1} ${OUT_FILE_2}
