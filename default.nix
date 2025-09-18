# Nix expression for NixC99 compiler

{
  description = "A minimal C99 compiler implemented in Nix";
  version = "0.1.0";

  # Define compiler stages here
  compiler = {
    lexer = {
      # Lexer implementation will go here
    };
    parser = {
      # Parser implementation will go here
    };
    # ... other stages
  };

  # Default build will be the compiler
  defaultPackage = self.compiler;
}
