__author__ = 'davidyurek'
__question__ = """
    Unit Testing[2] is one of the more basic, but effective, tools for software testing[3] / quality assurance. Your
    job, as an expert test-engineer, is to double-check someone else's test data, and make sure that the expected output
    is indeed correct. The two functions you are testing is string-reversal and string-to-upper functions.
    For each line of input, there are three space-delimited values: the first being the test index (as either 0 or 1),
    then the test input string, and finally the "expected" output. You must take the test input string, run it through
    your implementation of the appropriate function based on the test index, and then finally compare it to the
    "expected" output. If you are confident your code is correct and that the strings match, then the "expected" output
    is indeed good! Otherwise, the "expected" output is bad (and thus invalid for unit-testing).

    Input Description
    You will be given an integer N on the first line of input: it represents the following N lines of input. For each
    line, you will be given an integer T and then two strings A and B. If the integer T is zero (0), then you must
    reverse the string A. If the integer T is one (1), then you must upper-case (capitalize) the entire string A. At the
    end of either of these operations, you must test if the expected result (string B) and the result of the function
    (string A) match.

    Output Description
    If string A, after the above described functions are executed, and B match, then print "Good test data". Else, print
    "Mismatch! Bad test data". "Matching" is defined as two strings being letter-for-letter, equivalent case, and of the
    same length.
    """


def reverse_check(forward, reverse):
    """
    Check if the reverse parameter is the same as the reverse of the forward parameter.
    """
    newword = ''
    for x in forward:
        newword = x + newword
    if reverse == newword:
        result = 'Good test data'
    else:
        result = 'Mismatch! Bad test data'
    return result


def upper_check(lower, upper):
    """
    Check to see if the upper parameter is the same as the uppercase of the lower parameter.
    """
    if upper == lower.upper():
        result = 'Good test data'
    else:
        result = 'Mismatch! Bad test data'
    return result


if __name__ == '__main__':
    check = int(input('Enter 0 for reverse check and 1 for upper check: '))
    first = input('Enter first word: ')
    second = input('Enter second word: ')
    print(reverse_check(first, second) if check == 0 else upper_check(first, second))
