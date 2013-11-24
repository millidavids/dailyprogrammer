__author__ = 'davidyurek'
__question__ = """
    Given a well-formed (non-empty, fully valid) string of digits, let the integer N be the sum of digits. Then, given
    this integer N, turn it into a string of digits. Repeat this process until you only have one digit left. Simple,
    clean, and easy: focus on writing this as cleanly as possible in your preferred programming language. This challenge
    is particularly easy, so don't worry about looking for crazy corner-cases or weird exceptions. This challenge is as
    up-front as it gets :-) Good luck, have fun!

    Input Description
    On standard console input, you will be given a string of digits. This string will not be of zero-length and will be
    guaranteed well-formed (will always have digits, and nothing else, in the string).

    Output Description
    You must take the given string, sum the digits, and then convert this sum to a string and print it out onto standard
    console. Then, you must repeat this process again and again until you only have one digit left.
    """


def digit_sum_to_one_digit(numstring):
    """
    Circumvents the challenge to continually add the digits by modding by 9.
    """
    return int(numstring) % 9

if __name__ == '__main__':
    print(digit_sum_to_one_digit(input('Enter a string of digits: ')))