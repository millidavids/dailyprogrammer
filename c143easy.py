__author__ = 'davidyurek'
__question__ = """Braille[2] is a writing system based on a series of raised / lowered bumps on a material, for the
    purpose of being read through touch rather than sight. It's an incredibly powerful reading & writing system for
    those who are blind / visually impaired. Though the letter system has up to 64 unique glyph, 26 are used in English
    Braille[3] for letters. The rest are used for numbers, words, accents, ligatures, etc.
    Your goal is to read in a string of Braille characters (using standard English Braille defined here[4]) and print
    off the word in standard English letters. You only have to support the 26 English letters.

    Input Description
    Input will consistent of an array of 2x6 space-delimited Braille characters. This array is always on the same line,
    so regardless of how long the text is, it will always be on 3-rows of text. A lowered bump is a dot character '.',
    while a raised bump is an upper-case 'O' character.

    Output Description
    Print the transcribed Braille.
    """

from string import ascii_lowercase

BRAILLE_LIST = ["O.....", "O.O...", "OO....", "OO.O..", "O..O..", "OOO...", "OOOO..", "O.OO..", ".OO...",
                ".OOO..", "O...O.", "O.O.O.", "OO..O.", "OO.OO.", "O..OO.", "OOO.O.", "OOOOO.", "O.OOO.",
                ".OO.O.", ".OOOO.", "O...OO", "O.O.OO", ".OOO.O", "OO..OO", "OO.OOO", "O..OOO"]

BRAILLE_DICT = {key: value for key, value in zip(BRAILLE_LIST, ascii_lowercase)}


def get_data(file_name):
    """
    Retrieve the file from the file name.
    """
    file = open(file_name, 'r')
    raw_data = file.read()
    file.close()
    return raw_data


def get_braille_data(raw_data):
    """
    Get the braille letters from the raw data.
    """
    line_list = raw_data.split('\n')
    braille_data_list = []
    for sp in range(len(line_list)):
        line_list[sp] = line_list[sp].split()
    for index in range(len(line_list[0])):
        braille_data_list.append(line_list[0][index] + line_list[1][index] + line_list[2][index])
    return braille_data_list


def translate_braille(braille_data_list):
    """
    Translate the braille letters in to english letters.
    """
    final_string = ''
    for letter in braille_data_list:
        final_string += BRAILLE_DICT.get(letter)
    return final_string


if __name__ == '__main__':
    file_name = 'trinitrophenylmethylnitramine.txt'
    raw_data = get_data(file_name)
    braille_data_list = get_braille_data(raw_data)
    print(translate_braille(braille_data_list))
