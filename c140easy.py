__author__ = 'davidyurek'


def question():
    """
    When writing code, it can be helpful to have a standard (Identifier naming convention[2] ) that describes how to
    define all your variables and object names. This is to keep code easy to read and maintain. Sometimes the standard
    can help describe the type (such as in Hungarian notation[3] ) or make the variables visually easy to read
    (CamcelCase notation[4] or snake_case[5]).
    Your goal is to implement a program that takes an english-language series of words and converts them to a specific
    variable notation format. Your code must support CamcelCase, snake_case, and capitalized snake_case.

    Input Description
    On standard console input, you will be given an integer one the first line of input, which describes the notation
    you want to convert to. If this integer is zero ('0'), then use CamcelCase. If it is one ('1'), use snake_case. If
    it is two ('2'), use capitalized snake_case. The line after this will be a space-delimited series of words, which
    will only be lower-case alpha-numeric characters (letters and digits).

    Output Description
    Simply print the given string in the appropriate notation.
    """


def camel_case_convert(string):
    """
    Convert the string fed into the proper camelCase notation.
    """

    string_list = string.split()
    for i in string_list:
        if string_list.index(i) == 0:
            string_list[string_list.index(i)] = i
        else:
            string_list[string_list.index(i)] = i.capitalize()
    string = ''.join(string_list)
    return string


def snake_case_convert(string):
    """
    Convert the string fed into the proper snake_case notation.
    """
    string = string.lower()
    string = string.replace(' ', '_')
    return string


def upper_snake_case_convert(string):
    """
    Convert the string fed into the proper UPPER_SNAKE_CASE notation.
    """
    string = string.upper()
    string = string.replace(' ', '_')
    return string


def variable_notation():
    """
    Get user input and call appropriate conversion function for the string.
    """

    naming_convention = int(input('0 = CamelCase, 1 = snake_case, 2 = UPPER_SNAKE_CASE: '))
    string = input('Enter string to convert: ')

    if naming_convention == 0:
        print(camel_case_convert(string))
    elif naming_convention == 1:
        print(snake_case_convert(string))
    else:
        print(upper_snake_case_convert(string))


variable_notation()
