__author__ = 'davidyurek'


def question():
    """
    You are a computer science professor at South Harmon Institute of Technology, and are in dire need of automatic
    grading! The good news is you have all of your student's assignments in an easy-to-read format, making automation
    easy! You will be given a list of unique student names, and then a list of their assignment grades. All assignments
    are based on 20 points and are scored in whole-numbers (integers). All students have received the same number of
    assignments, so you don't have to worry about managing jagged arrays[2] .

    Input Description
    On standard console input, you will be given two space-delimited integers N and M: N is the number of students
    (which ranges from 1 to 60, inclusive), and M is the number of assignments (which ranges from 4 to 100, inclusive).
    This will be followed by N lines of text, each starting with an upper-case unique string being is your students
    name. This is then followed by M integers, which are the grades ranging from 0 to 20, inclusively.

    Output Description
    On the first line of output, print the class' average grade. Then, for each student, print their name and average
    grade (up to two decimal points precision).
    """
    return None


def student_manager():
    """
    Takes a list of students and a list of their grades and outputs the students' average and the class average.
    """

    number_of_students = int(input('How many students? '))
    number_of_grades = int(input('How many graded assignments? '))
    individual = []
    students = []
    student_total = 0
    total_in_class = 0

    for stu in range(number_of_students):
        for position in range(number_of_grades+1):
            if position == 0:
                individual.append(input('Enter student ' + str(stu) + '. '))
            else:
                individual.append(int(input('Enter grade for ' + individual[0] + ' out of 20 points. ')))
                total_in_class += individual[position]
                student_total += individual[position]
        individual.append(student_total)
        students.append(individual)
        student_total = 0
        individual = []

    print('\nClass average:', round(total_in_class/(number_of_students*number_of_grades), 2))

    for final in students:
        print(final[0], "'s average is ", round(final[number_of_grades+1]/number_of_grades, 2), '.', sep='')


student_manager()
