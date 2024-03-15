#!/bin/bash

# Radix Sort implementation in Bash

# Function to find the maximum number in the array
find_max() {
	local -n arr=$1
	local max=${arr[0]}
	for num in "${arr[@]}"; do
		if ((num > max)); then
			max=$num
		fi
	done
	echo "$max"
}

# Function to perform Counting Sort for a specific digit (exp)
counting_sort() {
	local -n arr=$1
	local -n output=$2
	local n=${#arr[@]}
	local exp=$3
	local count=(0 0 0 0 0 0 0 0 0 0)

	# Count occurrences of digits at the specified position (exp)
	for ((i = 0; i < n; i++)); do
		index=$((arr[i] / exp % 10))
		((count[index]++))
	done

	# Cumulative count
	for ((i = 1; i < 10; i++)); do
		((count[i] += count[i - 1]))
	done

	# Build the output array
	for ((i = n - 1; i >= 0; i--)); do
		index=$((arr[i] / exp % 10))
		output[count[index] - 1]=${arr[i]}
		((count[index]--))
	done
}

# Function to perform Radix Sort
radix_sort() {
	local -n arr=$1
	local n=${#arr[@]}
	local max=$2
	local -a output=()

	# Perform counting sort for each digit, starting from the least significant digit
	for ((exp = 1; max / exp > 0; exp *= 10)); do
		output=()
		counting_sort arr output exp
		arr=("${output[@]}")
	done
}

# Main program

# Define an array
declare -a numbers=(170 45 75 90 802 24 2 66)

echo "Unsorted array: ${numbers[@]}"

# Find the maximum number in the array
max=$(find_max numbers)

# Call the radix_sort function
radix_sort numbers max

echo "Sorted array: ${numbers[@]}"
