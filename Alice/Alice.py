"""
Histograma de frecuencia de palabras en texto.
"""

##############Importamos los elementos necesarios##############
from operator import index
import string
import nltk
import contractions
from collections import Counter
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

nltk.download('punkt')
nltk.download('stopwords')
###############################################################

text = open("Alice/alice.txt", "r", encoding="utf-8").read().lower()  # Abrimos el texto, leemos, pasamos a minisculas
text = list(map(contractions.fix, text.split())) # Aplicamos el contractions para arreglar las contracciones propias del ingles como I'll, I'm...
text = " ".join(text) # Volvemos a juntar el texto
tokens = nltk.tokenize.word_tokenize(text) #Lo tokenizamos con la herramienta de nltk
# Esta herramienta además nos separa las palabras de los signos de puntuación

stopwords = nltk.corpus.stopwords.words('english') # Importarmos las stopwords de nltk

"""
Esta función nos indica que palabra NO es una stopword
"""
def is_not_stopword(word):
    return word not in stopwords

"""
Esta función nos indica que palabra no es un signo de puntación
"""
def is_not_punctuation(word):
    return word not in string.punctuation

"""
Esta función nos indica que elemento NO es una letra.
Mirar luego que hay que mejorarlo, es un poco extremo hacer esto
"""
def remove_non_alpha(word):
    return "".join(filter(str.isalpha, word))

# Hacemos una lista con todos los elementos que solo sean letras
tokens = list(map(remove_non_alpha, tokens))
#Hacemos una lista con todos los elementos restantes que no sean stopwords
tokens = list(filter(is_not_stopword, tokens))
#Hacemos una lista con los elementos restantes que no sean signos de puntación.
#Igual no es necesario dado que ya hemos quitado todos los caracteres que NO sean letras
tokens = list(filter(is_not_punctuation, tokens))


"""
Creamos la distribución con la herramienta de FreqDist de nltk
A frequency distribution records the number of times each outcome of an experiment has occurred. 
For example, a frequency distribution could be used to record the frequency of each word type in a document.
"""
distribution = nltk.FreqDist(tokens)

"""
 Comenzamos a pintar nuestro histograma con barrita de progreso
"""
count = len(tokens) #Contamos el números de tokens
items = distribution.most_common(20)
keys = list(map(lambda item: item[0], items))
max_key_len = max(list(map(len, keys))) #Calculamos cual sería la key más larga
for item in items: #Iteramos sobre las primeras 10 palabras con mayor presencia en el tecto
    key = item[0]
    remaining_spaces = max_key_len - len(key) #Calculamos cual sería la cantidad de espacios deseados
    spaces = " " * remaining_spaces #Multiplicamos space * la cantidad de espacios deseados

    item_count = item[1]
    percentage = item_count / count


    max_progress = 50 #Comenzamos a pintar nuestra barra de progreso marcando que seran 50 pararelogramos
    progress = percentage * max_progress #Calculamos cuanto seria el progreso
    fill_progress = "▰ " * int(progress) #Rellenamos cuantos parelogramos rellenos queremos

    empty_progress = "▱ " * int(max_progress - progress) #Rellenamo con paralegramos vacio lo que falte

    """
    Imprimimos nuestra palabra + los espacios deseados para que se vea cuqui +
    nuestra barra de progreso + el porcentaje calculado con el número de decimales que queramos
    """
    print(key + spaces + " " + fill_progress + empty_progress + " " + str(percentage * 100)[0:4] + "%")

"""

Hacemos un grafico de lineas horizontales con matplotlib.pyplot

"""
indexes = np.arange(len(keys))
values = list(map(lambda item: item[1], items))
plt.barh(indexes, values, 0.7)
plt.yticks(indexes, keys)
plt.show()
