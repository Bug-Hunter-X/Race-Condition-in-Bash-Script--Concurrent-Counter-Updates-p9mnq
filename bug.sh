#!/bin/bash

# This script demonstrates a race condition bug.

# Create a file and initialize a counter to 0.
touch counter.txt
echo 0 > counter.txt

# Create two processes that increment the counter.
(while true; do let COUNTER=$(cat counter.txt); let COUNTER+=1; echo $COUNTER > counter.txt; done) &
(while true; do let COUNTER=$(cat counter.txt); let COUNTER+=1; echo $COUNTER > counter.txt; done) &

# Wait for a few seconds, then kill the processes.
sleep 5
pkill -f counter.txt

# Check the final value of the counter.  It will likely be less than 10.
cat counter.txt