__author__ = 'davidyurek'
__question__ = """
    In many board games, you have to roll multiple multi-faces dies[2] .jpg) to generate random numbers as part of the
    game mechanics. A classic die used is the d20 (die of 20 faces) in the game Dungeons & Dragons. This notation, often
    called the Dice Notation[3] , is where you write NdM, where N is a positive integer representing the number of dies
    to roll, while M is a positive integer equal to or grater than two (2), representing the number of faces on the die.
    Thus, the string "2d20" simply means to roll the 20-faced die twice. On the other hand "20d2" means to roll a
    two-sided die 20 times.
    Your goal is to write a program that takes in one of these Dice Notation commands and correctly generates the
    appropriate random numbers. Note that it does not matter how you seed your random number generation[4] , but you
    should try to as good programming practice.

    Input Description
    You will be given a string of the for NdM, where N and M are describe above in the challenge description.
    Essentially N is the number of times to roll the die, while M is the number of faces of this die. N will range from
    1 to 100, while M will range from 2 to 100, both inclusively. This string will be given through standard console
    input.

    Output Description
    You must simulate the die rolls N times, where if there is more than one roll you must space-delimit (not print each
    result on a separate line). Note that the range of the random numbers must be inclusive of 1 to M, meaning that a
    die with 6 faces could possibly choose face 1, 2, 3, 4, 5, or 6.
    """

from random import randrange


def roll_the_dice(die_string):
    die_list = die_string.split('d')
    number_of_die = int(die_list[0])
    face_of_die = int(die_list[1])
    total = 0
    for i in range(number_of_die):
        total += randrange(face_of_die)
    return total


if __name__ == '__main__':
    print(roll_the_dice(input('Enter multiple multi-faced die: ')))