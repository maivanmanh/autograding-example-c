#!/bin/bash

echo "Running tests..."
echo

# Test case 1: 6 / 2 = 3
output=$(echo -e "6\n2" | ./main)
expected_output="3.00"
if [[ "$output" == "$expected_output" || "$output" == "3.0" || "$output" == "3" ]]; then
  echo "Pass: 6 / 2 = $output"
else
  echo "Fail: 6 / 2. Expected $expected_output but got $output"
  exit 1
fi

# Test case 2: 2.5 / 2 = 1.25
output=$(echo -e "2.5\n2" | ./main)
expected_output="1.25"
if [[ "$output" == "$expected_output" ]]; then
  echo "Pass: 2.5 / 2 = $output"
else
  echo "Fail: 2.5 / 2. Expected $expected_output but got $output"
  exit 1
fi

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
