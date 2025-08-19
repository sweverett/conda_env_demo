# A Simple make file that will regenerate a conda-lock file from a
# conda env file, and install the environment from the conda lock file

# these are defaults, but you can override from command line
# e.g. make install ENV=myenv
ENV        ?= conda_demo
YML        ?= environment_from_history.yaml # this one is cross-platform
LOCK       ?= conda-lock.yml
PLATFORMS  ?= osx-64 osx-arm64 linux-64

.PHONY: lock install clean

# Create a lockfile for macOS Intel, macOS Apple Silicon, and Linux x86_64
# (NOTE: can add a --mamba flag if you have it installed)
lock:
	@conda-lock lock -f $(YML) $(addprefix --platform ,$(PLATFORMS))

# Install (recreate) the env exactly as pinned for the *current* platform
# (NOTE: can add a --mamba flag if you have it installed)
install:
	@conda-lock install -n $(ENV) $(LOCK)
	@conda run -n $(ENV) pip install --editable .

clean:
	@rm -f $(LOCK) conda-*.lock*.yml

test:
	@conda run -n $(ENV) python -m unittest discover -s tests/ -p "test_*.py"
