PDF=pdflatex --shell-escape
BUILD_DIR=--output-directory=./build

all:
	mkdir -p build/sections
	${PDF} ${BUILD_DIR} paper.tex
	cp sources.bib build/sources.bib
	(cd build && bibtex paper.aux)
	rm build/sources.bib
	${PDF} ${BUILD_DIR} paper.tex
	${PDF} ${BUILD_DIR} paper.tex
	mv build/paper.pdf ./paper.pdf
