# Class
import math
class Pyramid:

# Constructor
    def __init__(self, length, width, height):
        self.length = length
        self.width = width
        self.height = height

# Methods
    def get_volume (length, width, height):
        volume = (length * width * height) / 3.0
        return volume
        # v = (lwh)/3

    def get_sArea (length, width, height):
        surface_area = (length * width) + (length * math.sqrt(math.pow(width / 2, 2) + math.pow(height, 2))) + (width * math.sqrt(math.pow((1.0 / 2.0), 2) + math.pow(height , 2)))
        return surface_area