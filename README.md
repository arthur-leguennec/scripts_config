
# Jupyter Configuration Scripts

This repository contains scripts to automate the configuration of a Jupyter environment with a custom post-save hook for Jupyter notebooks.

## Files

- `config_jupyter.sh`: This shell script sets up the Jupyter Notebook configuration including the post-save hook.
- `post_save.py`: This Python script contains the code for the post-save hook that will be triggered after saving a Jupyter notebook.

## Setup Instructions

### Step 1: Clone the Repository

Clone the repository to your local machine or download the scripts directly.

```sh
git clone https://github.com/your-username/jupyter-config-scripts.git
cd jupyter-config-scripts
```

### Step 2: Run the Configuration Script

Make the `config_jupyter.sh` script executable and run it to configure your Jupyter environment.

```sh
chmod +x config_jupyter.sh
./config_jupyter.sh
```

### Step 3: Verify the Configuration

After running the script, a post-save hook should be added to your Jupyter configuration file.
You can verify this by checking the contents of the `~/.jupyter/jupyter_notebook_config.py` file.

### Step 4: Using the Post-Save Hook

With the post-save hook in place, every time you save a Jupyter notebook, the actions defined in `post_save.py` will be executed.
This could include tasks such as converting the notebook to a different format, running tests, or any other custom actions you define.

## Customizing the Post-Save Action

To customize what the post-save hook does, edit the `post_save.py` script.
