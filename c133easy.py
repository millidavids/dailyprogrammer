__author__ = 'davidyurek'
__question__ = """
    The world's most prestigious art gallery in the world needs your help! Management wants to figure out
    how many people visit each room in the gallery, and for how long: this is to help improve the quality of the overall
    gallery in the future.
    Your goal is to write a program that takes a formatted log file that describes the overall gallery's foot-traffic on
    a minute-to-minute basis. From this data you must compute the average time spent in each room, and how many visitors
    there were in each room.

    Input Description
    You will be first given an integer N which represents the following N-number of lines of text. Each line represents
    either a visitor entering or leaving a room: it starts with an integer, representing a visitor's unique identifier.
    Next on this line is another integer, representing the room index. Note that there are at most 100 rooms, starting
    at index 0, and at most 1,024 visitors, starting at index 0. Next is a single character, either 'I' (for "In") for
    this visitor entering the room, or 'O' (for "out") for the visitor leaving the room. Finally, at the end of this
    line, there is a time-stamp integer: it is an integer representing the minute the event occurred during the day.
    This integer will range from 0 to 1439 (inclusive). All of these elements are space-delimited.
    You may assume that all input is logically well-formed: for each person entering a room, he or she will always leave
    it at some point in the future. A visitor will only be in one room at a time.
    Note that the order of events in the log are not sorted in any way; it shouldn't matter, as you can solve this
    problem without sorting given data. Your output (see details below) must be sorted by room index, ascending.

    Output Description
    For each room that had log data associated with it, print the room index (starting at 0), then print the average
    length of time visitors have stayed as an integer (round down), and then finally print the total number of visitors
    in the room. All of this should be on the same line and be space delimited; you may optionally include labels on
    this text, like in our sample output 1.
    """
