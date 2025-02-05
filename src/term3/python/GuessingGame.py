"""
This program selects a random number from 0-100 and allows the user to try to guess it.
The user is told whether their guess was too high or too low after every attempt.
After they successfully guess the number, they are congratualated.
The number of attempts they used is also displayed on the screen.

Faults:
- Crashes if the user guesses anything other than a number

Limits:
- No way to restart the program (yet)
"""
#___________________________________________________________________________


print('Welcome to a Guessing Game! I have a random number from 1-100, see if you can guess it!')
print('______________________')
import random

rand = random.choice(range(0,100))
attempts = 0

num = 10
guess = input("Your Guess: ")
while num == 10:
    if int(guess) != rand:
        print(guess, 'was incorrect.')
        attempts += 1
        if int(guess) < 0 or int(guess) > 100:
            print('Actually, it was not even in the range. Try again?')
            guess = input("Your Guess: ")
        elif int(guess) < rand:
            print('Try guessing higher!')
            print('______________________')
            guess = input("Your Guess: ")
        else:
            print('Try guessing lower!')
            print('______________________')
            guess = input("Your Guess: ")
    else:
        print('Whoa, you got it! Good job!')
        print('Attempts: ', attempts)
        break