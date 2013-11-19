__author__ = 'davidyurek'

from string import ascii_lowercase


def question():
    """
    Wikipedia[2] has a great definition for Pangrams: "A pangram or holoalphabetic sentence for a given alphabet is a
    sentence using every letter of the alphabet at least once." A good example is the English-language sentence "The
    quick brown fox jumps over the lazy dog[3] "; note how all 26 English-language letters are used in the sentence.
    Your goal is to implement a program that takes a series of strings (one per line) and prints either True (the given
    string is a pangram), or False (it is not). Bonus: On the same line as the "True" or "False" result, print the
    number of letters used, starting from 'A' to 'Z'. The format should match the following example based on the above
    sentence:
    a: 1, b: 1, c: 1, d: 1, e: 3, f: 1, g: 1, h: 2, i: 1, j: 1, k: 1, l: 1, m: 1, n: 1, o: 4, p: 1, q: 1, r: 2, s: 1,
    t: 2, u: 2, v: 1, w: 1, x: 1, y: 1, z: 1

    Input Description
    On standard console input, you will be given a single integer on the first line of input. This integer represents
    the number of lines you will then receive, each being a string of alpha-numeric characters
    ('a'-'z', 'A'-'Z', '0'-'9') as well as spaces and period[4].

    Output Description
    For each line of input, print either "True" if the given line was a pangram, or "False" if not.
    """


def pangrams():
    """
    First, the user will input an integer. This integer will be the number of strings to check for a pangram. The user
    then inputs the designated number of strings. The program will then check for each letter of the alphabet. If it
    succeeds, the output will be True and as a bonus it will print the number of times each letter was found.
    """

    num_strings = int(input('How many strings? '))
    string_list = []

    for list in range(num_strings):
        string_list.append(input('String #' + str(list+1) + '? '))

    for check_string in string_list:
        string = True
        alpha_list = []
        for check_letter in range(26):
            letter = 0
            for check_position in range(len(check_string)):
                if check_string[check_position] == ascii_lowercase[check_letter]:
                    letter += 1
            if letter == 0:
                string = False
            alpha_list.append(ascii_lowercase[check_letter] + ': ' + str(letter))
        if string:
            print(True, alpha_list)
        else:
            print(False, alpha_list)


pangrams()