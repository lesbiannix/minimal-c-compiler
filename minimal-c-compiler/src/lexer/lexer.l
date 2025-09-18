#%options: -i
%%
<letter>[a-zA-Z_]
<digit>[0-9]
<whitespace>[ \t\n]

%{ 
# Python code to be executed in the lexer
import sys

def error(msg):
    sys.stderr.write(f"Lexer error: {msg}\n")
    sys.exit(1)
%}

%% 
    # Ignore whitespace
    {whitespace}      ;

    "int"             return 'INT'
    "return"          return 'RETURN'
    "if"              return 'IF'
    "else"            return 'ELSE'

    {letter}+         return 'ID' # Identifier
    {digit}+          return 'NUMBER' # Integer literal

    "+"               return 'PLUS'
    "-"               return 'MINUS'
    "*"               return 'MULTIPLY'
    "/"               return 'DIVIDE'
    "="               return 'ASSIGN'
    "=="              return 'EQ'
    "!="              return 'NEQ'
    "<"               return 'LT'
    ">"               return 'GT'
    "<="              return 'LTE'
    ">="              return 'GTE'
    "("               return 'LPAREN'
    ")"               return 'RPAREN'
    "{{"              return 'LBRACE'
    "}}"              return 'RBRACE'
    ";"               return 'SEMICOLON'

    .                 error(f"Unexpected character: {{value}}")
%% 

def lex(input_string):
    import re
    from io import StringIO

    # Use StringIO to simulate a file object for lexer
    lexer_input = StringIO(input_string)
    lexer = re.lex(module=sys.modules[__name__])
    lexer.input(input_string)

    tokens = []
    while True:
        tok = lexer.token()
        if not tok:
            break
        tokens.append((tok.type, tok.value))
    return tokens

if __name__ == "__main__":
    # Example usage:
    code = "int main() { return 1; }"
    tokens = lex(code)
    print(tokens)
