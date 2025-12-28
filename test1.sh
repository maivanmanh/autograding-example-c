#!/bin/bash

# Test case 1: 6 / 2 = 3
output=$(echo -e "6\n2" | ./main)
expected_output="3.00"
if [[ "$output" == "$expected_output" || "$output" == "3.0" || "$output" == "3" ]]; then
  echo "Pass: 6 / 2 = $output"
else
  echo "Fail: 6 / 2. Expected $expected_output but got $output"
  exit 1
fi

exit 0