#!/bin/bash
#
# Access to this file is granted under the SCONE SOURCE CODE LICENSE V1.0 
#
# Commercial use of any product using this file requires a commercial 
# license from scontain UG, www.scontain.com.
#
# also see https://sconedocs.github.io
#
# Copyright (C) 2019 Scontain UG



# Clean log file
echo "" > log-memory.txt

# Get PID of sqrt process
pid=`ps -ef | grep sqrt | grep -v grep | awk -F " " '{print $2}'`

# Dump the  memory of the python process
/usr/bin/python dump-memory.py $pid  &> content-memory

# Extract secret in the memory
result=`cat content-memory | grep "Karate" | awk -F "." '{print $1}'`

# Add result to a log file
if [ -z "$result" ]; then 
    tail -n 10 content-memory &> log-memory.txt;
    cat log-memory.txt; 
else
    echo $result >> log-memory.txt;
    cat log-memory.txt;
fi
