# Quick conda-forge & python package demo

## Install miniforge3
1. Go to the [miniforge github page](https://github.com/conda-forge/miniforge)
2. Pick the right installer filename for your OS/arch (under Requirements & Installers)
- MacOS w/ Apple silicon: `Miniforge3-MacOSX-arm64.sh`
- Linux w/ intel chip: `Miniforge3-Linux-x86_64.sh`
- Get your architecture with `uname -m` on terminal
3. Download the right installer:
`curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"`
4. Set a few env variables:
`> INSTALLER=Miniforge3-<your-OS-arch>.sh`
`> PREFIX="$HOME/miniforge3-tutorial"`
5. Run the miniforge3 installer
`> sh "$INSTALLER" -b -p "$PREFIX"`
- **IMPORTANT**: If you already have an Anaconda or miniforge install and are doing this just for a demo, do not run `conda init`! Don’t want to alter your existing dotfiles.
- If you do on accident, simply run:
`> "$PREFIX/bin/conda" init --reverse`
6. Deactivate any current conda  (if it’s already running in your shell)
`conda deactivate`
7. Initialize our new miniforge3 installation, not any pre-existing one (won’t affect any dotfiles)
`source "$PREFIX/etc/profile.d/conda.sh"`
8. Activate conda base env of our new install (just for this shell)
`conda activate`

## Install conda-lock in your base env

We will need this later on, and is one of the few packages you will likely want in your `base` environment (as well as a basic `python`, `git`, etc.)

`conda install -n base conda-lock`

## Installing a conda env from a YAML file

If you want to inherit the env name from the YAML file:
`conda create -f {environment_file}.yaml

If you want to give it your own env name:
`conda create -n {my_env_name} -f {environment_file}.yaml

## Generating conda env files

The below commands are how to *generate* `conda` env files given an existing env on your machine, not hwo to install one:

1. For maximal information (only guaranteed to be buildable on the same system & architecture):

`conda env export -f environment.yaml`

2. For all dependency versions specified (reproducible, but not portable for multiple OS's):

`conda env export -f --no-builds environment_no_builds.yaml`

3. For core, user-specified dependency list (*usually* portable for most systems, but not guaranteed to be reproducible):

`conda env export -f --no-builds --from-history environment_from_history.yaml`

4. For full dependency specification, portability, and reproducibility across multiple systems:
   
`conda env export -f --no-builds --from-history environment_from_history.yaml`
`conda-lock ...`

