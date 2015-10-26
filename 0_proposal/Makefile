FILE=proposal
SHELL=/bin/bash
TIMEDATESTR=`date +%Y-%m-%d--%H%M`

pdf:$(FILE).tex
	pdflatex $<
	bibtex $(FILE)
	pdflatex $<

copy:
	pdflatex $(FILE).tex
	mv $(FILE).pdf "$(TIMEDATESTR)-$(FILE)".pdf

clean:
	rm -f *.aux *.nav $(FILE)*.log

pristine:
	rm -f $(FILE)*.pdf
	rm -f *.aux *.nav $(FILE)*.log
