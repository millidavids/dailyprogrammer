__author__ = 'davidyurek'
__question__ = """
    It can be helpful sometimes to rotate a string 90-degrees, like a big vertical "SALES" poster or your business name
    on vertical neon lights, like this image from Las Vegas [2] . Your goal is to write a program that does this, but
    for multiples lines of text. This is very similar to a Matrix Transposition[3] , since the order we want returned is
    not a true 90-degree rotation of text.

    Input Description
    You will first be given an integer N which is the number of strings that follows. N will range inclusively from 1 to
    16. Each line of text will have at most 256 characters, including the new-line (so at most 255 printable-characters,
    with the last being the new-line or carriage-return).

    Output Description
    Simply print the given lines top-to-bottom. The first given line should be the left-most vertical line.
    """


def stringtrans():
    """
    Inverts the given strings from horizontal to vertical, even for multiple lines, and sets them in columns side by
    side.
    """

    number_of_strings = int(input('How many strings? '))
    str_list = []

    for str_compound in range(number_of_strings):
        str_number = 'String ' + str(str_compound) + '? '
        str_iteration = input(str_number)
        str_list.append(str_iteration)

    for line in range(len(max(str_list, key=len))):
        for column in str_list:
            try:
                print(column[line], end='')
            except:
                print(' ', end='')
        print()


stringtrans()