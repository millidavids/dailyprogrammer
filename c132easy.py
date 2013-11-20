__author__ = 'davidyurek'
__question__ = """
    The Greatest Common Divisor[2] of a given set of integers is the greatest integer that can divide these integers
    without any remainder. From Wikipedia, take a look at this example: for the integers 8 and 12, the highest integer
    that divides them without remainder is 4.
    Your goal is to write a program that takes two integers, and returns the greatest common divisor. You may pick any
    algorithm or approach you prefer, though a good starting point is Euclid's algorithm[3] .

    Input Description
    You will be given two space-delimited integers on the standard console input.

    Output Description
    Simply print the GCD value for the two given integers. If no GCD exists, print one ('1').
    """


def gdc(x, y):
    """
    Get the greatest common denominator of the two numbers fed.
    """
    while y != 0:
        x, y = y, x % y
    return x


if __name__ == '__main__':
    x = int(input('Enter number: '))
    y = int(input('Enter number: '))
    print('GDC is', gdc(x, y))