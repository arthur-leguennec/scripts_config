#!/bin/bash

# Chemin vers le répertoire de configuration de Jupyter
JUPYTER_CONFIG_DIR=~/.jupyter
SCRIPT_DIR=$(dirname "$0")

# Vérifie si le répertoire de configuration de Jupyter existe
if [ ! -d "$JUPYTER_CONFIG_DIR" ]; then
    echo "Création du répertoire de configuration de Jupyter..."
    mkdir -p $JUPYTER_CONFIG_DIR
fi

# Copie le fichier post_save.py dans le répertoire de configuration de Jupyter
echo "Copie de post_save.py dans le répertoire de configuration de Jupyter..."
cp "$SCRIPT_DIR/post_save.py" $JUPYTER_CONFIG_DIR

# Génération du fichier de configuration de Jupyter si nécessaire
if [ ! -f "$JUPYTER_CONFIG_DIR/jupyter_notebook_config.py" ]; then
    echo "Génération du fichier de configuration de Jupyter..."
    jupyter notebook --generate-config
fi

# Ajout de configurations personnalisées au fichier de configuration
echo "Ajout de configurations personnalisées..."

# Exemple : Définition d'un hook de post-save pour les notebooks
cat <<EOT >> $JUPYTER_CONFIG_DIR/jupyter_notebook_config.py

# Hook de post-save personnalisé pour Jupyter
c.FileContentsManager.post_save_hook = 'post_save.script_post_save'
EOT

echo "Configuration de Jupyter terminée."
