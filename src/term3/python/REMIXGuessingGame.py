"""
This program is an alteration of the Guessing Game program.
Most of the original functionality is still there.
Unlike the original, this program allows you to set your own range.
It stops you if... a) your range is too small or b) the minimum is higher than the maximum.
The program also warns you if your range is larger than 100.

Limits:
- Can no longer accept negatives or decimals
    - This was necessary to prevent the program from crashing when letters are entered.
- Yet to implement a way to restart the game
"""
#___________________________________________________________________________


import random
print('Welcome to a Guessing Game!')
print('______________________')

print('Please set the limits.')
passed = False
min = input("Minimum: ")
max = input("Maximum: ")

while passed == False:
    if min.isnumeric() == False or max.isnumeric() == False:
        print('Please input positive whole numbers.')
        min = input("Minimum: ")
        max = input("Maximum: ")
    elif int(min) > int(max):
        print('Whoops, your minimum is bigger than your maximum! Please reselect.')
        min = input("Minimum: ")
        max = input("Maximum: ")
    elif (int(max) - int(min)) < 2:
        print('That range is too small. Please reselect.')
        min = input("Minimum: ")
        max = input("Maximum: ")
    elif (int(max) - int(min)) > 100:
        print('That is a pretty big range. Are you sure?')
        answer = input("Y/N: ")
        if answer == "N" or answer == "n":
            print("Please reselect.")
            min = input("Minimum: ")
            max = input("Maximum: ")
        elif answer == "Y" or answer == "y":
            passed = True
    else:
        passed = True
        
print('______________________')
print('Excellent! Now, I will pick a number between the two. See if you can guess my number!')

rand = random.choice(range(int(min),int(max)))
attempts = 0

num = 10
guess = input("Your Guess: ")
while num == 10:
    if int(guess) != rand:
        print(guess, 'was incorrect.')
        attempts += 1
        if int(guess) < int(min) or int(guess) > int(max):
            print('Actually, it was not even in the range. Try again?')
            print('______________________')
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