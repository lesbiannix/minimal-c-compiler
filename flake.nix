# flake.nix
{
  description = "A minimal C99 compiler implemented in Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self = nixpkgs: let
      pkgs = nixpkgs;
      compilerName = "nixc99";
      version = "0.1.0";
    in
    {
      packages.${pkgs.system}.default = pkgs.stdenv.mkDerivation {
        pname = compilerName;
        inherit version;

        src = ./.; # Use the entire project as source

        # Define the lexer derivation
        lexer = pkgs.stdenv.mkDerivation {
          pname = "nixc99-lexer";
          version = self.version;

          src = ./src/lexer;

          nativeBuildInputs = [ pkgs.flex ];
          buildInputs = [ pkgs.gcc ];

          buildPhase = ''
            echo "Generating lexer source code..."
            flex -o lexer.c lexer.l
          '';

          installPhase = ''
            echo "Compiling lexer..."
            gcc lexer.c -o $out/bin/nixc99-lexer
            chmod +x $out/bin/nixc99-lexer
          '';

          meta = {
            description = "NixC99 Lexer";
          };
        };

        # Placeholder for the main compiler package
        default = pkgs.stdenv.mkDerivation {
          pname = compilerName;
          inherit version;
          src = ./.;
          buildPhase = ''
            echo "Building NixC99 compiler..."
            mkdir -p $out/bin
            echo "echo \"NixC99 Compiler v${version}\"" > $out/bin/nixc99
            chmod +x $out/bin/nixc99
          '';
          installPhase = ''
            # The buildPhase already places the executable in $out/bin
          '';
          meta = {
            description = self.description;
            homepage = "https://github.com/yourusername/nixc99"; # Replace with actual URL
            license = pkgs.lib.licenses.mit; # Or choose an appropriate license
          };
        };
      };
    };
  };
}


        meta = {
          description = self.description;
          homepage = "https://github.com/yourusername/nixc99"; # Replace with actual URL
          license = pkgs.lib.licenses.mit; # Or choose an appropriate license
        };
      };
    };
  };
}
