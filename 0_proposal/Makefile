FILE=proposal
SHELL=/bin/bash
TIMEDATESTR=`date +%Y-%m-%d--%H%M`

copy:
	pdflatex $(FILE).tex
	mv $(FILE).pdf "$(TIMEDATESTR)-$(FILE)".pdf

pdf:$(FILE).tex
	pdflatex $<
clean:
	rm -f *.aux *.nav $(FILE)*.log

pristine:
	rm -f $(FILE)*.pdf
	rm -f *.aux *.nav $(FILE)*.log
