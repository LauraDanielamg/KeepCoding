import random
from pandas import DataFrame


def avg(lst):
    return sum(lst) / len(lst)


def create_matrix(rows=random.randint(1, 20), columns=random.randint(1, 20)):
    matrix = []
    for row in range(0, rows):
        new_row = []
        for column in range(0, columns):
            item = random.randint(-100, 100)
            new_row.append(item)
        matrix.append(new_row)

    return matrix


def process_matrix(matrix):
    def process_item(row, column):
        values = []

        # CENTER
        values.append(matrix[row][column])

        # TOP
        if row - 1 >= 0:
            values.append(matrix[row - 1][column])

        # RIGHT
        if column + 1 < len(matrix[0]):
            values.append(matrix[row][column + 1])

        # BOTTOM
        if row + 1 < len(matrix):
            values.append(matrix[row + 1][column])

        # LEFT
        if column - 1 >= 0:
            values.append(matrix[row][column - 1])

        return avg(values)

    new_matrix = []
    rows = len(matrix)
    columns = len(matrix[0])

    for row in range(0, rows):
        new_row = []
        for column in range(0, columns):
            item = process_item(row, column)
            new_row.append(item)
        new_matrix.append(new_row)

    return new_matrix


def print_matrix(matrix):
    print(DataFrame(matrix))


matrix = create_matrix()
print_matrix(matrix)
print()
new_matrix = process_matrix(matrix)
print_matrix(new_matrix)
