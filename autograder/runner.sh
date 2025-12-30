#!/usr/bin/env bash

PROGRAM=./main
DATA_DIR=data
TIMEOUT=2

# -------------------------
# Detect timeout command
# -------------------------
if command -v timeout >/dev/null 2>&1; then
  TIMEOUT_CMD="timeout ${TIMEOUT}s"
elif command -v gtimeout >/dev/null 2>&1; then
  TIMEOUT_CMD="gtimeout ${TIMEOUT}s"
else
  echo "WARNING: no timeout command found (program may hang)"
  TIMEOUT_CMD=""
fi

# -------------------------
# Run a single test file
# -------------------------
run_test() {
  local file="$1"

  if [[ ! -f "$file" ]]; then
    echo "FAIL ($file): test file not found"
    return 1
  fi

  input=$(sed '/^---$/,$d' "$file")
  expected=$(sed '1,/^---$/d' "$file")

  output=$(
    $TIMEOUT_CMD bash -c \
      "printf \"%s\n\" \"$input\" | $PROGRAM"
  )
  status=$?

  if [[ $status -eq 124 ]]; then
    echo "FAIL ($file): timeout"
    return 1
  fi

  if [[ $status -ne 0 ]]; then
    echo "FAIL ($file): runtime error"
    return 1
  fi

  # Normalize trailing whitespace
  expected_norm=$(echo "$expected" | sed 's/[[:space:]]*$//')
  output_norm=$(echo "$output" | sed 's/[[:space:]]*$//')

  if diff -q <(echo "$output_norm") <(echo "$expected_norm") >/dev/null; then
    echo "PASS ($file)"
    return 0
  else
    # Count lines
    expected_lines=$(echo "$expected_norm" | wc -l)
    output_lines=$(echo "$output_norm" | wc -l)

    if [[ $expected_lines -eq 1 && $output_lines -eq 1 ]]; then
      echo "FAIL ($file) - Expected: \"$expected_norm\" but got: \"$output_norm\""
    else
      echo "FAIL ($file)"
      echo "Expected:"
      echo "$expected_norm"
      echo "Got:"
      echo "$output_norm"
    fi
    return 1
  fi
}

# -------------------------
# Main logic
# -------------------------
if [[ $# -eq 0 ]]; then
  failed=0
  for f in "$DATA_DIR"/*.txt; do
    run_test "$f" || failed=1
  done
  exit $failed
else
  run_test "$DATA_DIR/$1.txt"
  exit $?
fi
