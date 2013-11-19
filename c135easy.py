__author__ = 'davidyurek'
__question__ = """
    Unix[2] , the famous multitasking and multi-user operating system, has several standards that defines Unix commands,
    system calls, subroutines, files, etc. Specifically within Version 7[3] (though this is included in many other Unix
    standards), there is a game called "arithmetic". To quote the Man Page[4] :Arithmetic types out simple arithmetic
    problems, and waits for an answer to be typed in. If the answer is correct, it types back "Right!", and a new
    problem. If the answer is wrong, it replies "What?", and waits for another answer. Every twenty problems, it
    publishes statistics on correctness and the time required to answer.
    Your goal is to implement this game, with some slight changes, to make this an [Easy]-level challenge. You will only
    have to use three arithmetic operators (addition, subtraction, multiplication) with four integers. An example
    equation you are to generate is "2 x 4 + 2 - 5".

    Input Description
    The first line of input will always be two integers representing an inclusive range of integers you are to pick from
    when filling out the constants of your equation. After that, you are to print off a single equation and wait for
    the user to respond. The user may either try to solve the equation by writing the integer result into the console,
    or the user may type the letters 'q' or 'Q' to quit the application.

    Output Description
    If the user's answer is correct, print "Correct!" and randomly generate another equation to show to the user.
    Otherwise print "Try Again" and ask the same equation again. Note that all equations must randomly pick and place
    the operators, as well as randomly pick the equation's constants (integers) from the given range. You are allowed
    to repeat constants and operators. You may use either the star '*' or the letter 'x' characters to represent
    multiplication.
    """

from random import randrange


def arithmetic_equation():
    """
    The user will input two integers. These integers will be the inclusive range of numbers that the arithmetic
    equation will use. The arithmetic equation will generate random simple math equations that it will try to have
    the user answer. If the user is correct, it outputs "Correct!" and if they are wrong it will output "Wrong!" and
    will have the user try again. If the user inputs 'q' or 'Q' the program will quit.
    """

    bottom_range, top_range = input('Input the range of integers separated by a single space. ').split(' ')
    bottom_range = int(bottom_range)
    top_range = int(top_range)
    operators = ['+', '-', '*']
    user_answer = 'lol'
    print("You can quit at any time by typing in an upper or lower case 'q'.")
    while user_answer.lower() != 'q':
        exit = False
        equation = ''
        for eq in range(4):
            equation += str(randrange(bottom_range, top_range+1)) + ' ' + operators[randrange(3)] + ' '
        equation = equation[:-2]
        equation_answer = eval(equation)
        while not exit:
            user_answer = input('What is the answer of: ' + equation + ' ')
            if user_answer.lower() == 'q':
                exit = True
            elif int(user_answer) == equation_answer:
                print('Correct!')
                exit = True
            else:
                print('Incorrect')


arithmetic_equation()
