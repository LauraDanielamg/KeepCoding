import random
from pandas import DataFrame
import matplotlib.pyplot as pyplot
import matplotlib.pyplot as plt
from matplotlib import cm

def avg(lst):
    """
    Define que es el promedio
    """
    return sum(lst) / len(lst)


def create_matrix(rows=random.randint(1, 20), columns=random.randint(1, 20)):
    """
    Crea una matriz con un número de columnas random y un numero de filas random
    Esto para comprobar que sirve con cualquier matrix
    """
    matrix = [] #Creo una matriz vacia
    for row in range(0, rows): #Itero en el número de filas
        new_row = [] #Inicializo una variable para almacenar mis filas
        for column in range(0, columns): #Itero en el numero de columnas
            item = random.randint(0, 100) #Genero mi primer item
            new_row.append(item) #Lo anexo a mi fila
        matrix.append(new_row) #Una vez que se complete la fila, se anexa a "new row"

    return matrix #Una vez que esta completa devuelve la matriz 


def process_matrix(matrix):
    """
    Función que procesa una matriz para cambiar cada número por el promedio de el mismo y sus vecinos
    """
    def process_item(row, column):
        """
        Función que procesa cada item para poder construir la nueva matriz
        """
        values = [] 

        # CENTER
        values.append(matrix[row][column]) #Para poder agregar el valor del elemento en el centro

        # TOP
        if row - 1 >= 0: #Para las normas generales cuando esta arriba. Si se sale de nuestro rango, no se agrega
            values.append(matrix[row - 1][column])

        # RIGHT
        if column + 1 < len(matrix[0]):#Para las normas generales cuando está a la derecha. Si se sale de nuestro rango, no se agrega
            values.append(matrix[row][column + 1])

        # BOTTOM
        if row + 1 < len(matrix): #Para las normas generales cuando está abajo. Si se sale de nuestro rango, no se agrega
            values.append(matrix[row + 1][column])

        # LEFT
        if column - 1 >= 0:#Para las normas generales cuando está a la izquierda. Si se sale de nuestro rango, no se agrega
            values.append(matrix[row][column - 1])

        return avg(values) # Devuelve el promedio de todos los valores válidos

    # Formamos nuestra nueva matriz
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


def display_matrix(matrix, new_matrix):
    """
    Muestra la representación en colorines de la matriz random antes y despues de ser procesada
    """

    cmap = cm.get_cmap('RdPu')

    plt.subplot(211).set_ylabel("Random Matrix")
    pyplot.imshow(matrix, cmap=cmap)
    plt.subplot(212).set_ylabel("Random Matrix after processing")
    pyplot.imshow(new_matrix, cmap=cmap)
   

    plt.subplots_adjust(bottom=0.1, right=0.8, top=0.9)
    cax = plt.axes([0.85, 0.1, 0.075, 0.8])
    plt.colorbar(cax=cax, cmap=cmap)  

    pyplot.show()


def print_matrix(matrix):
    """
    Función que imprime nuestra matrix usando el DataFrame de Pandas para que nos quede mas lindo
    """
    print(DataFrame(matrix))

def run_matrix():
    """
    Función para imprimir nuestra matriz inicial + nuestra matriz procesada
    """
    matrix = create_matrix()
    print_matrix(matrix)
    print()
    new_matrix = process_matrix(matrix)
    print_matrix(new_matrix)
    display_matrix(matrix, new_matrix)
   

if __name__ == "__main__":
    run_matrix()