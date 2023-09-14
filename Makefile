#!/bin/bash 

FIRST_FILE=00_Sommaire.md
OUTPUT=Wiki

markdown: __summary
	@echo "--- Generate the markdown ---"
	@pandoc *.md -o ${OUTPUT}.md

html: __summary
	@echo "--- Generate the html ---"
	@pandoc *.md -o ${OUTPUT}.html

pdf: __summary
	@echo "--- Generate the pdf ---"
	@pandoc *.md -V geometry:a4paper \
		-V geometry:margin=1cm \
		-V documentclass:article \
		-o ${OUTPUT}.pdf

__summary:
	@echo "--- Generate the summary ---"
	@./summary.sh ${FIRST_FILE} ${OUTPUT}

all: html pdf markdown

.PHONY: clean
clean:
	$(RM) ${FIRST_FILE}
	$(RM) ${OUTPUT}.pdf
	$(RM) ${OUTPUT}.md
	$(RM) ${OUTPUT}.html


