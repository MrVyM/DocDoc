#!/bin/bash 

FIRST_FILE=00_Sommaire.md
OUTPUT="Documentation"

markdown: __summary
	@echo "--- Generate the markdown ---"
	@pandoc docs/*.md -o ${OUTPUT}.md \
		--toc \
		--metadata title=${OUTPUT} 

html: __summary
	@echo "--- Generate the html ---"
	@pandoc docs/*.md -o ${OUTPUT}.html \
		-s \
		-f gfm -t html \
		--metadata title=${OUTPUT} \
		--css header.css 

pdf: __summary
	@echo "--- Generate the pdf ---"
	@pandoc docs/*.md -V geometry:a4paper \
		--metadata title=${OUTPUT} \
		-H Header.tex \
		-V geometry:margin=1cm \
		-V documentclass:article \
		-t html \
		-o ${OUTPUT}.pdf

__summary:
	@echo "--- Generate the summary ---"
	@./summary.sh ${FIRST_FILE} ${OUTPUT}

all: html pdf markdown

.PHONY: clean
clean:
	$(RM) docs/${FIRST_FILE}
	$(RM) ${OUTPUT}.pdf
	$(RM) ${OUTPUT}.md
	$(RM) ${OUTPUT}.html


