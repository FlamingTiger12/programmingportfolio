print("This is a Pig Latin Translator. Try typing a word!") # Intro
print("________________________________________________________")

user_input = input("Your Word: ") # Recieves user input
user_input = user_input.lower() # Turns the input to all lowercase

prefix = user_input[0]
if prefix == "a" or prefix == "e" or prefix == "i" or prefix == "o" or prefix == "u":
    vowel_prefix = True
else:
    vowel_prefix = False

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

if vowel_prefix == True: # Checks if input starts with a vowel
    print("Result: " + user_input + "-ay")
elif vowel_prefix == False: # Checks if input starts with a consonant
    vowel_check()