#!/bin/bash

red='\033[0;31m'
noColor='\033[0m'

#define paths to log files
accessLogs="/var/log/nginx/LRaccess.log"
errorLogs="/var/log/nginx/LRerror.log"

#grab the previous log files as a number (how many .gz files there are)
zipErrors="$(ls -dq $errorLogs.* | wc -l)"
zipAccess="$(ls -dq $accessLogs.* | wc -l)"

#start dates oldest .gz file and newest .log file
totalStartDateAccess="$(zcat $accessLogs.$zipAccess.gz | head -1 | cut -d"[" -f2 | cut -d"+" -f1)"
endDateAccess="$(tail -1 $accessLogs | cut -d"[" -f2 | cut -d"+" -f1)"

#start and end date error logs oldest .gz and newest .log file
totalStartDateError="$(zcat $errorLogs.$zipErrors.gz| head -1 | cut -d"[" -f1)"
endDateError="$(tail -1 $errorLogs | cut -d"[" -f1)"


#stats for access logs
# Grabbing HTTP actions
accessLogStat="$(cat $accessLogs | cut -d'"' -f2 | cut -d' ' -f1 | sort | uniq -c)"

# Grabbing IPs

accessLogIP="$(cat $accessLogs | cut -d'"' -f1 | cut -d' ' -f1 | sort | uniq -c)"

# need status codes to
# cat LRaccess.log | cut -d'"' -f3
accessLogStatusCode="$(cat $accessLogs | cut -d'"' -f3 | cut -d' ' -f2 | sort | uniq -c)"

# Pulling out the requested paths
accessRequestURI="$(cat $accessLogs | cut -d']' -f2 | cut -d'(' -f1 | cut -d' ' -f3 | sort | uniq -c)"

# Stats ERROR Logs
errorLevels="$(cat $errorLogs | cut -d'[' -f2 | cut -d']' -f1 | sort | uniq -c)"


errorMessage="$(cat $errorLogs | cut -d'[' -f2 | cut -d',' -f1 | cut -d'*' -f2 | cut -d' ' -f2 | sort | uniq -c)"

errorClient="$(cat $errorLogs | cut -d'[' -f2 | cut -d'[' -f2 | cut -d',' -f2 | sort | uniq -c)"

errorServer="$(cat $errorLogs | cut -d'[' -f2 | cut -d'[' -f2 | cut -d',' -f3 | sort | uniq -c)"

# gives us error code and the whole line minus date and time
# cat LRerror.log | cut -d'[' -f2
#Getting just the error code **
# cat LRerror.log | cut -d'[' -f2 | cut -d']' -f1

# getting everything else to pull the client and host information
# cat LRerror.log | cut -d'[' -f2 | cut -d']' -f2
#then you need to grab the client information
# cat LRerror.log |cut -d'[' -f2 | cut -d']' -f2 | cut -d',' -f2
# for the host you can cut at the comma and use -f5
# If the request is needed you can cut at the comman and use -f4








#display stats for number of zip files, start and end dates and times for error and access logs
echo " "
echo "There are currently $zipAccess total LRaccess files"
echo "Start of Access Logs: $totalStartDateAccess"
echo "Most Recent Access Log from: $endDateAccess"
echo " "
echo "There are currently $zipErrors total LRerror files"
echo "Start of Error Logs: $totalStartDateError"
echo "Most Recent Error Log from: $endDateError"
echo " "
echo -e "${red}Brief of most recent access logs:${noColor}"
echo "$accessLogStat"
echo " "
echo "IP visit breakdown"
echo "$accessLogIP"
echo " "
echo "Status Codes"
echo "$accessLogStatusCode"
echo " "
echo "Paths Requested"
echo "$accessRequestURI"
echo " "
echo -e "${red}Brief of most recent error logs${noColor}"
echo "$errorLevels"
echo " "
echo "Error Messages"
echo "$errorMessage"
echo " "
echo "Error Log Clients"
echo "$errorClient"
echo " "
echo "Error Log Server"
echo "$errorServer"
echo " "
