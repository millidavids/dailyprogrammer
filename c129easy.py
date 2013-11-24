__author__ = 'davidyurek'
__question__ = """
    This programming challenge is a classic[2] interview question for software engineers: given a string, find the
    longest sub-string that contains, at most, two characters.

    Input Description
    Through standard console input, you will be given a string to search, which only contains lower-case alphabet
    letters.

    Output Description
    Simply print the longest sub-string of the given string that contains, at most, two unique characters. If you find
    multiple sub-strings that match the description, print the last sub-string (furthest to the right).
    """


def longest_two_char_substring(string):
    """
    Finds the largest two character substring in the string fed.
    """
    substring, longest = '', 0
    for index in range(-1, - len(string), -1):
        substring = string[index]
        first_letter_counter = index
        while first_letter_counter >= - len(string) and string[first_letter_counter] in substring:
            if first_letter_counter == index:
                first_letter_counter -= 1
            else:
                substring = string[first_letter_counter] + substring
                first_letter_counter -= 1
        second_letter_counter = first_letter_counter
        if second_letter_counter >= - len(string):
            substring = string[second_letter_counter] + substring
        while second_letter_counter >= - len(string) and string[second_letter_counter] in substring:
            if second_letter_counter == first_letter_counter:
                second_letter_counter -= 1
            else:
                substring = string[second_letter_counter] + substring
                second_letter_counter -= 1
        if len(substring) > longest:
            longest = len(substring)
            longest_substring = substring
    return longest_substring

if __name__ == '__main__':
    print(longest_two_char_substring(input('Enter string to find the largest two letter substring: ')))
