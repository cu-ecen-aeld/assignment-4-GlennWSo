{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: 
  let 
    system ="x86_64-linux";
    pkgs = import nixpkgs {
      inherit system; 
    };
  in
  {
    # packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
    # packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

    devShells.${system}.default = pkgs.mkShell {
      name = "buildroot";
      BR2_DL_DIR="/shared_ci/build_root/dl";
    };

  };
}
