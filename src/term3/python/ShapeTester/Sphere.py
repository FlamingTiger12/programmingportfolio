# Class
import math
class Sphere:

# Constructor
    def __init__(self, radius):
        self.radius = radius

# Methods
    def get_volume (radius):
        volume = (4.0 / 3.0) * math.pi * math.pow(radius, 3)
        return volume
        # v = (4/3)πr^3

    def get_sArea (radius):
        surface_area = 4.0 * math.pi * math.pow(radius, 2)
        return surface_area
        # v = 4πr^2