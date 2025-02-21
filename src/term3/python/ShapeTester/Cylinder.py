# Class
import math
class Cylinder:
    
# Constructor
    def __init__(self, radius, height):
        self.radius = radius
        self.height = height

# Methods
    def get_volume (radius, height):
        volume = math.pi * math.pow(radius, 2) * height
        return volume
    
    def get_sArea (radius, height):
        surface_area = (2 * (math.pi*radius*height)) + (2 * (math.pi * math.pow(radius, 2)))
        return surface_area