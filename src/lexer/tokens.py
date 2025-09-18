# Define token types for basic arithmetic operations and C99 keywords

import enum

class TokenType(enum.Enum):
    # Literals
    INTEGER = 1
    FLOAT = 2
    IDENTIFIER = 3

    # Keywords
    IF = 10
    ELSE = 11
    WHILE = 12
    FOR = 13
    RETURN = 14
    INT = 15
    FLOAT_TYPE = 16 # Renamed from FLOAT to avoid conflict with literal type
    VOID = 17

    # Operators
    PLUS = 20
    MINUS = 21
    MULTIPLY = 22
    DIVIDE = 23
    ASSIGN = 24
    EQUAL = 25 # ==
    NOT_EQUAL = 26 # !=
    LESS_THAN = 27 # <
    GREATER_THAN = 28 # >
    LESS_EQUAL = 29 # <=
    GREATER_EQUAL = 30 # >=
    LOGICAL_AND = 31 # &&
    LOGICAL_OR = 32 # ||
    INCREMENT = 33 # ++
    DECREMENT = 34 # --

    # Delimiters
    LPAREN = 40
    RPAREN = 41
    LBRACE = 42
    RBRACE = 43
    SEMICOLON = 44
    COMMA = 45

    # Special tokens
    EOF = 50 # End of file
    UNKNOWN = 51 # Unknown token
