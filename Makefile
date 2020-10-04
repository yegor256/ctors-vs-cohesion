all: article.pdf spell qc

install:
	gem install texsc
	gem install texqc

fast:
	pdflatex --shell-escape article.tex

qc:
	texqc article

spell:
	texsc --pws aspell.en.pws \
		--ignore=setminted \
		--ignore=minted:pp \
		--ignore=tikzpicture \
		--ignore=pgfplotsset \
		--ignore=code,nospell,citet,citep \
		article.tex

clean:
	rm -rf *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.log *.run.xml *.pdf *.out
	rm -rf _minted-article

%.pdf: %.tex *.tex
	latexmk -pdf $<
