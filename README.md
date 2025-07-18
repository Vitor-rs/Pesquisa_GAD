
# Template TCC IFMS TADS

Template LaTeX para TCC do curso de Tecnologia em Análise e Desenvolvimento de Sistemas (IFMS), conforme normas ABNT.

## Como usar

1. Clone o repositório e abra no VS Code.
2. Recomenda-se usar DevContainer (VS Code + Docker) para ambiente pronto.
   - Alternativamente, instale os pacotes LaTeX manualmente:
     ```bash
     sudo apt-get update
     sudo apt-get install -y texlive-latex-base texlive-latex-extra texlive-lang-portuguese texlive-bibtex-extra texlive-science texlive-fonts-recommended texlive-publishers texlive-fonts-extra latexmk texlive-base abntex2
     ```
3. Compile o documento principal:
   - Pelo VS Code: `Ctrl+Shift+P` → "Tasks: Run Task" → "LaTeX: Compilar TCC"
   - Ou manualmente:
     ```bash
     cd IFMS_TADS_TCC
     latexmk -pdf -interaction=nonstopmode -file-line-error Monografia_config.tex
     ```

## Estrutura

- `IFMS_TADS_TCC/src/Capitulos/` — capítulos do TCC
- `IFMS_TADS_TCC/src/Pre_textual/` — elementos pré-textuais
- `IFMS_TADS_TCC/src/Pos_textual/` — anexos/apêndices
- `IFMS_TADS_TCC/src/imagens/` — imagens
- `IFMS_TADS_TCC/src/referencias.bib` — referências

## Dicas

- Edite os capítulos em `Capitulos/`
- Adicione referências em `referencias.bib` e cite com `\cite{chave}`
- Imagens: coloque em `imagens/` e use `\includegraphics{imagens/nome-da-imagem}`

## Extensões VS Code recomendadas

- LaTeX Workshop
- LaTeX Utilities
- Code Spell Checker (Portuguese)