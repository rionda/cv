LATEX = pdflatex
MAINFILE = MatteoRiondato-cv
UPLOADHOST = riondabsd.net
UPLOADURI = /usr/local/www/rionda.to/matteo_riondato_cv.pdf

.PHONY: all check clean osx pdf upload view

all : upload

$(MAINFILE).pdf: $(MAINFILE).tex
	pdflatex $(MAINFILE).tex

check: *.tex
	($(LATEX) $(MAINFILE).tex | grep -s -e "multiply" -e "undefined") || echo "all OK"

clean:
	-/bin/rm -f $(MAINFILE).pdf $(MAINFILE).tar.bz2 *.dvi *.aux *.ps *~
	-/bin/rm -f *.log *.lot *.lof *.toc *.blg *.bbl *.idx *.out 

pdf: $(MAINFILE).pdf

osx: pdf
	open $(MAINFILE).pdf

upload: pdf
	rsync -e ssh --perms --chmod=F644 $(MAINFILE).pdf $(UPLOADHOST):$(UPLOADURI)

view: pdf
	acroread  -geometry 1000x1000 $(MAINFILE).pdf

