I am using conda to manage my python environment, and poetry to manage my python packages.
# Create a new conda environment
conda create -n sailraceiq python=3.13
# Activate the conda environment
conda activate sailraceiq

# Install poetry
pipx install poetry

# Ensure poetry does not create a virtual environment
poetry config virtualenvs.create false

# Install the dependencies
poetry install

