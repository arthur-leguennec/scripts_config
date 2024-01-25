import io
import os
import nbformat

def script_post_save(model, os_path, contents_manager, **kwargs):
    """post-save hook for converting notebooks to .py scripts"""
    if model['type'] != 'notebook':
        return

    notebook_path = os_path
    directory, nb_name = os.path.split(notebook_path)
    script_path = os.path.join(directory, nb_name.replace(".ipynb", ".py"))

    # Read the notebook content
    with io.open(notebook_path, 'r', encoding='utf-8') as f:
        nb_contents = nbformat.read(f, as_version=4)

    # Filter cells that start with #export and remove '#export'
    script_content = '\n\n'.join([
        cell['source'].replace('#export', '').strip() for cell in nb_contents.cells
        if cell.cell_type == 'code' and cell.source.startswith('#export')
    ])

    with io.open(script_path, 'w', encoding='utf-8') as f:
        f.write(script_content)
