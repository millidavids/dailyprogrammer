__author__ = 'davidyurek'
__question__ = """Falling-sand Games[2] are particle-simulation games that focus on the interaction between particles in
    a 2D-world. Sand, as an example, might fall to the ground forming a pile. Other particles might be much more
    complex, like fire, that might spread depending on adjacent particle types.
    Your goal is to implement a mini falling-sand simulation for just sand and stone. The simulation is in 2D-space on a
    uniform grid, where we are viewing this grid from the side. Each type's simulation properties are as follows:
    Stone always stays where it was originally placed. It never moves.
    Sand keeps moving down through air, one step at a time, until it either hits the bottom of the grid, other sand, or
    stone.

    Input Description
    On standard console input, you will be given an integer N which represents the N x N grid of ASCII characters. This
    means there will be N-lines of N-characters long. This is the starting grid of your simulated world: the character
    ' ' (space) means an empty space, while '.' (dot) means sand, and '#' (hash or pound) means stone. Once you parse
    this input, simulate the world until all particles are settled (e.g. the sand has fallen and either settled on the
    ground or on stone). "Ground" is defined as the solid surface right below the last row.

    Output Description
    Print the end result of all particle positions using the input format for particles.
    """
from sys import stdin


def assemble_sandbox(grid):
    grid = grid * (grid + 1) - 1
    print('Enter sandbox.')
    sandbox_list = stdin.readlines(grid)
    for index in range(len(sandbox_list)):
        sandbox_list[index] = sandbox_list[index].strip('\n')
    return sandbox_list


def settle_sand(sandbox_list, grid):
    sandbox_string = ''
    for i in range(grid - 1):
        for string_index in range(len(sandbox_list) - 1, 0, -1):
            for char_index in range(len(sandbox_list[string_index])):
                if sandbox_list[string_index][char_index] == ' ' and sandbox_list[string_index - 1][char_index] == '.':
                    bottom_string_list = list(sandbox_list[string_index])
                    top_string_list = list(sandbox_list[string_index - 1])
                    bottom_string_list[char_index] = '.'
                    top_string_list[char_index] = ' '
                    sandbox_list[string_index] = ''.join(bottom_string_list)
                    sandbox_list[string_index - 1] = ''.join(top_string_list)
    for assemble in range(grid):
        sandbox_string += sandbox_list[assemble] + '\n'
    return sandbox_string


if __name__ == '__main__':
    grid = int(input('Enter grid size: '))
    sandbox_list = assemble_sandbox(grid)
    sandbox_string = settle_sand(sandbox_list, grid)
    print(sandbox_string)
