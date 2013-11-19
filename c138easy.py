__author__ = 'davidyurek'
__question__ = """
    Colomb's Law[2] describes the repulsion force for two electrically charged particles. In very general terms, it
    describes the rate at which particles move away from each-other based on each particle's mass and distance from one
    another. Your goal is to compute the repulsion force for two electrons in 2D space. Assume that the two particles
    have the same mass and charge. The function that computes force is as follows:
    Force = (Particle 1's mass x Particle 2's mass) / Distance^2 Note that Colomb's Law uses a constant, but we choose
    to omit that for the sake of simplicity. For those not familiar with vector math, you can compute the distance
    between two pints in 2D space using the following formula:
    deltaX = (Particle 1's x-position - Particle 2's x-position)
    deltaY = (Particle 1's y-position - Particle 2's y-position)
    Distance = Square-root( deltaX * deltaX + deltaY * deltaY )

    Input Description
    On standard console input, you will be given two rows of numbers: first row represents the first particle, with the
    second row representing the second particle. Each row will have three space-delimited real-numbers (floats),
    representing mass, x-position, and y-position. The mass will range, inclusively, from 0.001 to 100.0. The x and y
    positions will range inclusively from -100.0 to 100.0.

    Output Description
    Print the force as a float at a minimum three decimal places precision.
    """


def colombcalc():
    """
    Calculates the repulsion force acted on two electrically charged particles based on the particles mass and the
    the distance away from one another. Only works for two electrons in 2D space that have the same mass and charge.
    """

    first_particle = [float(x) for x in input("Input specs for first particle (mass, x, y): ").split(' ')]
    second_particle = [float(x) for x in input("Input specs for second particle (mass, x, y): ").split(' ')]

    distance_squared = (first_particle[1]-second_particle[1])**2 + (first_particle[2]-second_particle[2])**2
    force = (first_particle[0] * second_particle[0]) / distance_squared

    force = round(force, 3)

    print(force)

colombcalc()