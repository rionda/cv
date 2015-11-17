MAINFILE = MatteoRiondato-CV
UPLOADHOST = rionda.to
UPLOADURI = rionda.to/$(MAINFILE).pdf

.PHONY: osx upload uploadpers

all: upload

osx:
	open $(MAINFILE).pdf

upload:
	rsync -e ssh --perms --chmod=F644 $(MAINFILE).pdf $(UPLOADHOST):$(UPLOADURI)

uploadpers:
	rsync -e ssh --perms --chmod=F644 $(MAINFILE)-pers.pdf $(UPLOADHOST):$(UPLOADURI)
