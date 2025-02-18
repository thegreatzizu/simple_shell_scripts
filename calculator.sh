#!/bin/bash

# Function to perform calculations
calculate() {
    case $2 in
        +) result=$(echo "$1 + $3" | bc);;
        -) result=$(echo "$1 - $3" | bc);;
        \*) result=$(echo "$1 * $3" | bc);;
        /) 
            if [[ $3 -eq 0 ]]; then
                echo "Error: Division by zero is not allowed."
                exit 1
            fi
            result=$(echo "scale=2; $1 / $3" | bc);;
        *) 
            echo "Invalid operator! Please use +, -, *, or /."
            exit 1
            ;;
    esac
    echo "Result: $result"
}

# Get user input
read -p "Enter the first number: " num1
read -p "Enter an operator (+, -, *, /): " operator
read -p "Enter the second number: " num2

# Call function
calculate "$num1" "$operator" "$num2"
