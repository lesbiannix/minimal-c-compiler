
{
  description = "A minimal C compiler";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.minimal-c-compiler = nixpkgs.stdenv.mkDerivation {
      pname = "minimal-c-compiler";
      version = "0.1.0";

      src = ./.; # Assuming the compiler source will be in the same directory

      # Add build inputs if your compiler needs them (e.g., flex, bison)
      # buildInputs = [ nixpkgs.flex nixpkgs.bison ];

      # Define build and install phases if necessary
      # buildPhase = ''
      #   make
      # '';
      #
      # installPhase = ''
      #   mkdir -p $out/bin
      #   cp compiler $out/bin/minimal-c
      # '';

      meta = {
        description = "A minimal C compiler";
        homepage = "https://example.com/minimal-c-compiler";
        license = nixpkgs.lib.licenses.mit; # Choose an appropriate license
      };
    };

    devShells.x86_64-linux.default = nixpkgs.mkShell {
      packages = [
        self.packages.x86_64-linux.minimal-c-compiler
        # Add any development tools you might need, e.g.:
        # nixpkgs.gcc
        # nixpkgs.gdb
      ];
    };
  };
}
