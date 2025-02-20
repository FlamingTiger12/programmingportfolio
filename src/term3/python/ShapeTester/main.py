"""
This program allows the user to choose from several shapes and input its dimensions.
It then spit
"""
from Box import Box
from Pyramid import Pyramid
from Sphere import Sphere

def check_num (var):
    global passed2
    if (var.isnumeric() == True and float(var) > 0):
            passed2 = True
    else:
        print("Invalid input. Try again.\nRemember, no decimals and no units!")
        passed2 = False
    return passed2

print("Welcome to Shape Tester!")
play = True
while (play == True):
    print("Which shape do you want to calculate the volume and surface area for:\nRectangular Prism (1), Sphere (2) or Pyramid (3)?")
    print("-----------------------------------------------")

    passed1 = False
    passed2 = False

    while (passed1 == False):
        shape = input("Your Choice: ")
        if (shape.isnumeric() == True and 0 < float(shape) < 4):
            passed1 = True
        elif (shape.isnumeric() == False or float(shape) >= 4 or float(shape) <= 0):
            print("Invalid input. Try again.")
            print("Which shape do you want to calculate the volume and surface area for:\nRectangular Prism, Sphere or Pyramid?")
    print("-----------------------------------------------")

    if (shape == "1"):
        while (passed2 == False):
            length = input("Length: ")
            check_num(length)
        passed2 = False
        while (passed2 == False):
            width = input("Width: ")
            check_num(width)
        passed2 = False
        while (passed2 == False):
            height = input("Height: ")
            check_num(height)
        passed2 = False
        box_one = Box(float(length), float(width), float(height))
        print("-----------------------------------------------")
        print("Volume =", Box.get_volume(float(length), float(width), float(height)))
        print("Surface Area =", Box.get_sArea(float(length), float(width), float(height)))
    
    elif (shape == "2"):
        while (passed2 == False):
            length = input("Length: ")
            check_num(length)
        passed2 = False
        while (passed2 == False):
            width = input("Width: ")
            check_num(width)
        passed2 = False
        while (passed2 == False):
            height = input("Height: ")
            check_num(height)
        passed2 = False
        pyramid_one = Pyramid(float(length), float(width), float(height))
        print("-----------------------------------------------")
        print("Volume =", Pyramid.get_volume(float(length), float(width), float(height)))
        print("Surface Area =", Pyramid.get_sArea(float(length), float(width), float(height)))

    elif (shape == "3"):
        while (passed2 == False):
            radius = input("Radius: ")
            check_num(radius)
        passed2 = False
        sphere_one = Sphere(float(radius))
        print("-----------------------------------------------")
        print("Volume =", Sphere.get_volume(float(radius)))
        print("Surface Area =", Sphere.get_sArea(float(radius)))
        print("-----------------------------------------------")
    
    while (play == True):
        print("Would you like to test another shape?")
        replay = input("Y/N: ")
        if replay == "N" or replay == "n":
            play = False
        elif replay == "Y" or replay == "y":
            play = True
            break