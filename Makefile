#!/bin/bash 

SUMMARY_FILE=01_Sommaire.md
OUTPUT="Readme"

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
	@pandoc docs/*.md --metadata title=${OUTPUT} \
		--css header.css \
		--pdf-engine=wkhtmltopdf \
		-f gfm -t pdf \
		-o ${OUTPUT}.pdf

__summary:
	@echo "--- Generate the summary ---"
	@./summary.sh ${SUMMARY_FILE} ${OUTPUT}

all: html pdf markdown

.PHONY: clean
clean:
	$(RM) docs/${SUMMARY_FILE}
	$(RM) ${OUTPUT}.pdf
	$(RM) ${OUTPUT}.md
	$(RM) ${OUTPUT}.html


