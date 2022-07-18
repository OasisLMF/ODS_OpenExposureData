"""
This file defines the custom exceptions. Custom exceptions should be used when we raise an error based on the
behavour of our program. For instance, if we raise a ValueError because a value is out of our accepted range,
but we want to accept it in some instance, we could let through other errors that are value errors making our code
unsafe.
"""


class PandasValueException(Exception):

    def __init__(self, message: str) -> None:
        super().__init__(message)
