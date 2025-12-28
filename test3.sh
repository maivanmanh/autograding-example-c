#!/bin/bash

# Test case 3: 10 / 0 = Invalid
output=$(echo -e "10\n0" | ./main)
expected_output="Invalid"
if [[ "$output" == "$expected_output" ]]; then
  echo "Pass: 10 / 0 = $output"
else
  echo "Fail: 10 / 0. Expected $expected_output but got $output"
  exit 1
fi

exit 0