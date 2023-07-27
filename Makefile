manuscript = report
latexopt   = -halt-on-error -file-line-error

all: $(manuscript).pdf

$(manuscript).pdf: $(manuscript).tex *.bib *.tex figs/* *.sty
	pdflatex $(latexopt) $<
	bibtex $(manuscript).aux
	pdflatex $(latexopt) $<
	pdflatex $(latexopt) $<

pdf: *.tex
	pdflatex $(latexopt) $(manuscript)

.PHONY : clean all
clean :
	@rm -f *.aux *.bbl *.blg *.log *.out *.spl *.toc *.lof *.lot $(manuscript).pdf

