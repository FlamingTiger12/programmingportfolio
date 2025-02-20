# Class
class Box:
    
# Constructor
    def __init__(self, length, width, height):
        self.length = length
        self.width = width
        self.height = height

# Methods
    def get_volume (length, width, height):
        volume = length * width * height
        return volume
    
    def get_sArea (length, width, height):
        surface_area = (2 * (length * width)) + (2 *(length * height)) + (2 * (width * height))
        return surface_area