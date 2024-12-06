# Race Condition in Bash Script

This repository demonstrates a common race condition bug that can occur in shell scripts when multiple processes try to update the same file simultaneously. The script creates two processes that increment a counter stored in a file. Due to the race condition, the final counter value is often less than the expected value.

The solution shows how to use file locking to prevent the race condition and ensure the counter is incremented correctly.

## Bug
The `bug.sh` file contains the script with the race condition.

## Solution
The `bugSolution.sh` file contains the solution using file locking to prevent the race condition.