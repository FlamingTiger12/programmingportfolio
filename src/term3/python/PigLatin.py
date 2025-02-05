"""
This program translates words into Pig Latin.
It is able to handle words starting with vowels, consonants, and consonant clusters.
It will keep running until the user exits the program

Faults (WIP):
- Crashes if user inputs a single letter
- Function checking for numbers and symbols only runs once; it'll crash after that

Limits:
- User is only able to input one word at a time
- Compound words are separated (bedroom --> ed-bay oom-bay)
- Yet to implement a way to stop the program
"""
#___________________________________________________________________________


print("This is a Pig Latin Translator. Try typing a word!") # Intro
print("________________________________________________________")

run = True
while run == True:
    user_input = input("Your Word: ") # Recieves user input
    user_input = user_input.lower() # Turns the input to all lowercase
    prefix = user_input[0]
    if user_input.isnumeric() == True or user_input.isalpha() == False: # Checks if the input is invalid
        print("Invalid Input. This program does not accept anything but letters. Try something else.")
        user_input = input("Your Word: ")
    elif prefix == "a" or prefix == "e" or prefix == "i" or prefix == "o" or prefix == "u": # Checks if the input starts with a vowel
        vowel_prefix = True
        simple_word = False
    elif user_input[1] == "a" or user_input[1] == "e" or user_input[1] == "i" or user_input[1] == "o" or user_input[1] == "u": # Checks if the word is "simple" (No consonant clusters)
        vowel_prefix = False
        simple_word = True
    else: # Catch-all for consonant clusters.
        vowel_prefix = False
        simple_word = False

    def vowel_check():
        # Checks the word for all vowels
        where_a = user_input.find("a")
        where_e = user_input.find("e")
        where_i = user_input.find("i")
        where_o = user_input.find("o")
        where_u = user_input.find("u")
        where_y = user_input.find("y")
        # Puts all vowel instances in a list
        vowel_list = [where_a, where_e, where_i, where_o, where_u, where_y]
    
        # Searches for first vowel
        letter_search = 0
        first_vowel = len(user_input)
        while letter_search < len(user_input):
            if vowel_list[letter_search] > 0 and vowel_list[letter_search] < first_vowel:
                first_vowel = vowel_list[letter_search]
            letter_search += 1
    
        # Creates result
        suffix = "-" + user_input[0:first_vowel] + "ay"
        prefix = user_input[first_vowel:]
        result = prefix + suffix
    
        print("Result:", result) # Displays result

    if vowel_prefix == True and simple_word == False: # Vowel
        print("Result: " + user_input + "-ay")
    elif vowel_prefix == False and simple_word == True: # Simple
        print("Result: " + user_input[1:] + "-" + user_input[0] + "ay")
    elif vowel_prefix == False and simple_word == False: # Consao
        vowel_check()
        
    print("_______________________")