#!/bin/bash

target="$1"
maxtime=""
if [ -z "$2" ]
  then
    echo "No max time set"
else
    echo "max time set to $2"
    maxtime="-maxtime $2"
fi
wordListName='directory-list-2.3-big.txt'



# Add /FUZZ if it is missing in the target
echo "Target URL: $target"
if [[ $target != *"FUZZ"* ]]; then
    echo $target | grep '/$'
    if [ $? -eq 1 ]; then
        target="${target}/"
    fi
    target="${target}FUZZ"
    echo "Changed target URL to: $target"
fi

set -x

# Scan
ffuf -w $wordListName \
    -ic \
    -u $target \
    -H "X-Scanner: FFUF" \
    -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:96.0) Gecko/20100101 Firefox/96.0" \
    -of csv \
    -o /var/reports/ffuf_scan.csv \
    -ac \
    -mc 200 \
    $maxtime \
    ${@:3} \

# Parse the report
python3 ffuf_qt.py
