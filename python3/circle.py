from math import sin, cos, pi
import sys


def polar_to_point(radius, angle):
    x = radius * sin(angle)
    y = radius * cos(angle)
    return round(x)+radius, round(y)+radius


def circle_string(radius):
    dots = [[False]*(radius*2+1) for _ in range(radius*2+1)]

    angle = 0.0
    while angle <= 2*pi:
        x, y = polar_to_point(radius, angle)
        dots[x][y] = True
        angle += pi/(radius*4)

    dots = [['xx' if x else '  ' for x in dotline] for dotline in dots]

    return '\n'.join([''.join(dotline) for dotline in dots])


def main():
    if len(sys.argv) <= 1:
        print("Usage: python3 circle.py radius")
        sys.exit()

    r = int(sys.argv[1])
    if r < 1:
        print("Radius must be greater than 0")
        sys.exit()

    print(circle_string(r))

if __name__ == '__main__':
    main()
