UNAME := $(shell uname)
# Define the Python version and virtual environment name
VENV_NAME = myenv

# Define the command for creating a virtual environment
VENV = python -m venv

# Target to create a virtual environment and install packages
setup: 
	$(VENV) $(VENV_NAME)&& $(VENV_NAME)\Scripts\activate.bat && python -m pip install pip&&pip install pandas

# Target to deactivate the virtual environment
deactivate:
	deactivate

# Target to clean up the virtual environment
clean:
	rm -rf $(VENV_NAME)

all:
	setup







