# tenv Nix

This project provides a Nix derivation for the [tenv](https://github.com/tofuutils/tenv) version manager, allowing you to easily install and use `tenv` within a Nix environment.

Welcome to **tenv**, a versatile version manager for [OpenTofu](https://opentofu.org), [Terraform](https://www.terraform.io/) and [Terragrunt](https://terragrunt.gruntwork.io/), written in Go. Our tool simplifies the complexity of handling different versions of these powerful tools, ensuring developers and DevOps professionals can focus on what matters most - building and deploying efficiently.

**tenv** is a successor of [tofuenv](https://github.com/tofuutils/tofuenv) and [tfenv](https://github.com/tfutils/tfenv).

## Prerequisites

- Nix package manager installed on your system

## Usage

1. **Clone this repository:**

   ```bash
   git clone https://github.com/tofuutils/tenv-nix.git
   cd tenv-nix
   ```

2. **Build the Nix derivation:**

   ```bash
   nix-build shell.nix
   ```

3. **Enter the Nix shell environment:**

   ```bash
   nix-shell shell.nix
   ```

4. **Use tenv commands inside the Nix shell:**

   ```bash
   tenv --version
   tenv tf install <version>
   tenv use <version>
   ```

   To get more information about tenv, read [README.md](https://github.com/tofuutils/tenv/blob/main/README.md)

## Configuration

- `default.nix`: Contains the Nix derivation for tenv.
- `shell.nix`: Defines the Nix shell environment with tenv and other dependencies.
- `versions.nix`: Specifies the versions of tenv and other packages used in the project.
- `packages.nix`: Lists the common packages included in the Nix shell environment.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

## References

- [tenv](https://github.com/tofuutils/tenv) - Version manager for OpenTofu
- [OpenTofu](https://github.com/tofuutils/opentofu) - Configuration language and processor
- [Tofuenv](https://github.com/tofuutils/tofuenv) - Version manager for OpenTofu
- [tofuenv-nix](https://github.com/maddinek/tofuenv-nix) - This project provides a Nix derivation for tofuenv
