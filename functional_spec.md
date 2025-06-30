# Functional Specification for Bet CLI

## 1. Introduction
 A simple but somewhat zesty terminal game where the user bets on the parity (even/odd) of rolling two dice.

## 2. User story
 As a CLI user, I want to play a repetitious game where I aimlessly bet against the odds of a randomly generated dice roll, so that I can achieve the satisfaction of gambling without the embarassment of blowing through my savings. 

## 3. Scope
- Only supports a single player per run  
- Rolls two six-sided dice and sums them  
- Only “even” vs. “odd” bets

## 4. Functionality

When the user runs `ruby bet.rb`, the program shall prompt: 

1: "Wanna make a bet?"

2: If the user says 'no' 
    -The program will display a decline message.
    -Then exit the program

3: If the user enters 'yes'
    -The program will display an agree message.
    -Then prompt: 
        Even or Odd?
    -The user enters 'even' or 'odd'

4: After recieving the guess
    -The program will roll two dice, sum them, and display:
        "You rolled a (sum)"
    -Then display either a win message, or lose message depending on the outcome.

5: After displaying the win/lose message
    -Prompt 
        "Roll again? yes or no?"
            -yes repeats from step 3 
            -no displays a farewell message, and exits the program.

  

