#!/bin/bash

# This script demonstrates the solution to the race condition bug using flock.

# Create a file and initialize a counter to 0.
touch counter.txt
echo 0 > counter.txt

# Create a lock file.
LOCKFILE="counter.lock"

# Function to increment the counter safely.
increment_counter() {
  flock $LOCKFILE
  let COUNTER=$(cat counter.txt)
  let COUNTER+=1
  echo $COUNTER > counter.txt
  flock -u $LOCKFILE
}

# Create two processes that increment the counter using the function.
(while true; do increment_counter; done) &
(while true; do increment_counter; done) &

# Wait for a few seconds, then kill the processes.
sleep 5
pkill -f counter.txt

# Check the final value of the counter. It should be close to 10.
cat counter.txt