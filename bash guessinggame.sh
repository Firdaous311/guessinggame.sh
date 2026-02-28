#!/usr/bin/env bash

# Function to count files in current directory
count_files() {
    echo $(ls -1 | wc -l)
}

# Main game function
play_game() {

    local correct_answer=$(count_files)
    local guess=0

    echo "Welcome to the Guessing Game!"
    echo "How many files are in the current directory?"

    while [[ $guess -ne $correct_answer ]]
    do
        read -p "Enter your guess: " guess

        # Check if input is a number
        if ! [[ "$guess" =~ ^[0-9]+$ ]]
        then
            echo "Please enter a valid number."
        elif [[ $guess -lt $correct_answer ]]
        then
            echo "Too low! Try again."
        elif [[ $guess -gt $correct_answer ]]
        then
            echo "Too high! Try again."
        else
            echo "Congratulations! You guessed correctly!"
        fi
    done
}

# Execute the game
play_game
