# Pesquisa GAD - Template TCC IFMS TADS

Este repositório contém um template LaTeX para Trabalhos de Conclusão de Curso (TCC) do curso de Tecnologia em Análise e Desenvolvimento de Sistemas (TADS) do Instituto Federal de Mato Grosso do Sul (IFMS), seguindo as normas ABNT.

## Configuração do Ambiente

### Opção 1: Utilizando DevContainer (Recomendado)

Para facilitar o desenvolvimento, este projeto está configurado para ser utilizado com DevContainers no VS Code, que automaticamente configura o ambiente LaTeX necessário.

**Requisitos:**
- [Visual Studio Code](https://code.visualstudio.com/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- Extensão [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) no VS Code

**Passos:**
1. Clone este repositório
2. Abra a pasta no VS Code
3. Quando solicitado, clique em "Reopen in Container" ou use o comando "Remote-Containers: Reopen in Container" da paleta de comandos (F1)
4. Aguarde o ambiente ser configurado automaticamente (pode demorar alguns minutos na primeira execução)

### Opção 2: Instalação Manual

Se preferir não usar DevContainer, instale os seguintes pacotes no seu sistema:

```bash
sudo apt-get update
sudo apt-get install -y texlive-latex-base texlive-latex-extra texlive-lang-portuguese texlive-bibtex-extra texlive-science texlive-fonts-recommended texlive-publishers texlive-fonts-extra latexmk
sudo apt-get install -y texlive-base abntex2
```

## Compilando seu Documento

### Utilizando Tarefas do VS Code

O projeto inclui tarefas pré-configuradas:

1. Pressione `Ctrl+Shift+P` (ou `Cmd+Shift+P` no Mac)
2. Selecione "Tasks: Run Task"
3. Escolha uma das opções:
   - "LaTeX: Compilar TCC" - Para compilar o documento principal
   - "LaTeX: Limpar Arquivos Temporários" - Para remover arquivos temporários

### Compilando Manualmente

Execute o seguinte comando no terminal:

```bash
cd Template_de_TCC_IFMS_TADS
latexmk -pdf -interaction=nonstopmode -file-line-error Monografia_config.tex
```

## Estrutura do Projeto

O template segue a estrutura padrão de TCC conforme normas ABNT:

- **Capitulos/** - Contém os capítulos do TCC
- **Pre_textual/** - Elementos pré-textuais (Resumo, Abstract, Agradecimentos, etc.)
- **Pos_textual/** - Elementos pós-textuais (Anexos e Apêndices)
- **imagens/** - Diretório para armazenar as imagens utilizadas
- **referencias.bib** - Arquivo de referências bibliográficas

## Dicas de Uso

- Edite os arquivos em `Capitulos/` para desenvolver seu TCC
- Adicione suas referências no arquivo `referencias.bib`
- Use o formato `\cite{chave}` para citar referências
- Coloque suas imagens na pasta `imagens/` e referencie-as com `\includegraphics{imagens/nome-da-imagem}`

## Extensões Recomendadas do VS Code

- LaTeX Workshop
- LaTeX Utilities
- Code Spell Checker
- Portuguese - Code Spell Checker