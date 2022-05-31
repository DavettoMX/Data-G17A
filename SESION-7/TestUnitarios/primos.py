# Escribe una función para comprobar si un número es primo.
import re


def es_primo(n):
    if n < 2:
        return False
    for i in range(2, n):
        if n % i == 0:
            return False
    return True

# Escribe una función para el factorial de un número.
def factorial(n):
    if n == 0:
        return 1
    else:
        return n * factorial(n-1)