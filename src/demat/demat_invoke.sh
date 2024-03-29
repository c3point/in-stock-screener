#!/bin/sh

DEBUG_LEVEL=1

CONFIG_PROFILE_DATA_LOC=`python -m config profile_data`
CONFIG_PROFILE_REPORTS_LOC=`python -m config profile_reports`

IN_FILE_TXN=$CONFIG_PROFILE_DATA_LOC/demat-data/icicidirect/demat-txn-data.csv
IN_FILE_SUMMARY=$CONFIG_PROFILE_DATA_LOC/demat-data/icicidirect/demat-summary-data.csv
OUT_FILE_1=$CONFIG_PROFILE_REPORTS_LOC/demat-reports/portfolio-phase-1.csv
OUT_FILE_2=$CONFIG_PROFILE_REPORTS_LOC/demat-reports/portfolio-phase-2.csv
OUT_FILE_3=$CONFIG_PROFILE_REPORTS_LOC/demat-reports/portfolio-phase-3.csv
OUT_FILE_4=$CONFIG_PROFILE_REPORTS_LOC/demat-reports/portfolio-phase-4.csv

demat_invoke.py ${DEBUG_LEVEL} ${IN_FILE_TXN} ${IN_FILE_SUMMARY} ${OUT_FILE_1} ${OUT_FILE_2} ${OUT_FILE_3} ${OUT_FILE_4} 

# gather stats
OUT_FILE_YEAR=$CONFIG_PROFILE_REPORTS_LOC/demat-reports/stats_year_output.csv
OUT_FILE_QTR=$CONFIG_PROFILE_REPORTS_LOC/demat-reports/stats_qtr_output.csv

./demat_txn_stats/icici_direct_stats.sh ${IN_FILE} year_company all all year > ${OUT_FILE_YEAR}
./demat_txn_stats/icici_direct_stats.sh ${IN_FILE} year_company all all quarter > ${OUT_FILE_QTR}


OUT_FILE_PLOT=$CONFIG_PROFILE_REPORTS_LOC/demat-reports/stats_year_output.png
# draw plots

# demat_plot.py online ${OUT_FILE_YEAR}

#demat_plot.py offline ${OUT_FILE_YEAR} ${OUT_FILE_PLOT}
