# Configuração do latexmk para IFMS_TADS_TCC
$pdf_mode = 1;
$pdflatex = "pdflatex -synctex=1 -interaction=nonstopmode -file-line-error";
$out_dir = "../build";
$aux_dir = "../build";
$bibtex_use = 2;
$clean_ext = "aux bbl blg idx ilg ind lof lot out toc fls fdb_latexmk synctex.gz brf nav snm vrb";

# Arquivo raiz do projeto
@default_files = ('Monografia_config.tex');
