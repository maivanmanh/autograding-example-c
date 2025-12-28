#!/bin/bash

# Test case 2: 2.5 / 2 = 1.25
output=$(echo -e "2.5\n2" | ./main)
expected_output="1.25"
if [[ "$output" == "$expected_output" ]]; then
  echo "Pass: 2.5 / 2 = $output"
else
  echo "Fail: 2.5 / 2. Expected $expected_output but got $output"
  exit 1
fi

exit 0