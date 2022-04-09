Feature: print hello world feature

  Scenario: Hello World scenario
    * print 'Hello World'
    * print 'Hello RJ'

  Scenario: Declare and print varibales
    * def balance = 200
    * def fee = 20
    * def tax = 10
    * print 'total amount -> ' + (balance + fee + tax)

  Scenario: Calculator scenario
    * def a = 200
    * def b = 20
    * print 'mul -> ' + (a * b)
