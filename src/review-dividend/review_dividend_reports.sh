#!/bin/sh

CONFIG_DATA_LOC=`python -m config data`
CONFIG_REPORTS_LOC=`python -m config reports`
CONFIG_PROFILE_DATA_LOC=`python -m config profile_data`
CONFIG_PROFILE_REPORTS_LOC=`python -m config profile_reports`

# Usage
# Requires plan file and dividend data

PLAN_NAME=${CONFIG_PROFILE_REPORTS_LOC}/plan-reports/plan-reports-ticker-only.csv

mkdir -p ${CONFIG_PROFILE_REPORTS_LOC}/review-dividend-reports

for DIV_YEAR in fy1516 fy1617 fy1718 fy1819 all
do

	DIV_NAME=${CONFIG_PROFILE_REPORTS_LOC}/dividend-reports/${DIV_YEAR}/${DIV_YEAR}-name_only.csv

	comm -13 ${DIV_NAME} ${PLAN_NAME} > ${CONFIG_PROFILE_REPORTS_LOC}/review-dividend-reports/plan_plus_divid_none-${DIV_YEAR}.txt
done

# should be done later
# comm -23 ${DIV_NAME} ${PLAN_NAME} > ${CONFIG_PROFILE_REPORTS_LOC}/review-dividend-reports/review_plan_none_dividend_plus.txt

# comm -13 ${CONFIG_REPORTS_LOC}/dividends/all/all-name_only.csv ${CONFIG_REPORTS_LOC}/targets/all/all-company_name_only.txt > $CONFIG_REPORTS_LOC/decisions/all/decision_holdings_plus_dividend_zero.txt

# comm -23 ${CONFIG_REPORTS_LOC}/dividends/all/all-name_only.csv ${CONFIG_REPORTS_LOC}/targets/all/all-company_name_only.txt > $CONFIG_REPORTS_LOC/decisions/all/decision_dividend_plus_holdings_zero.txt
