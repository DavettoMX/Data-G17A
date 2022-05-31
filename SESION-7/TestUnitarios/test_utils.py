import primos
import unittest

class TestPrimos(unittest.TestCase):
    def test_es_primo(self):
        self.assertTrue(primos.es_primo(7))
        self.assertFalse(primos.es_primo(8))
        self.assertTrue(primos.es_primo(11))
        self.assertFalse(primos.es_primo(10))
        self.assertTrue(primos.es_primo(13))
        self.assertFalse(primos.es_primo(12))
        self.assertTrue(primos.es_primo(17))
        self.assertFalse(primos.es_primo(18))

    def test_factorial(self):
        self.assertTrue(primos.factorial(5) == 120)
        self.assertTrue(primos.factorial(0) == 1)
        self.assertTrue(primos.factorial(1) == 1)

if __name__ == '__main__':
    unittest.main()