#!/bin/bash

# Verificar se o LaTeX já está instalado
if ! command -v latexmk &> /dev/null; then
    echo "Instalando LaTeX e dependências..."
    apt-get update
    apt-get install -y \
        texlive-latex-base \
        texlive-latex-recommended \
        texlive-latex-extra \
        texlive-fonts-recommended \
        texlive-publishers \
        texlive-lang-portuguese \
        texlive-bibtex-extra \
        latexmk
else
    echo "LaTeX já está instalado."
fi

# Verificar se o abntex2 está disponível
if ! kpsewhich abntex2.cls &> /dev/null; then
    echo "Instalando pacotes adicionais para o abntex2..."
    apt-get install -y texlive-publishers
fi

echo "Configuração do ambiente LaTeX concluída!"
echo "Para compilar seu documento, use o comando: latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf Monografia_config.tex"
