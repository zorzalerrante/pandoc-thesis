
all: thesis_skeleton.latex appendix.tex
	pandoc *.md \
	--include-before-body=frontback/dedication.tex \
	--include-before-body=frontback/acknowledgements.tex \
	--include-before-body=frontback/abstract.tex \
	--include-after-body=appendix.tex \
	--filter pandoc-citeproc --atx-headers --listings \
	--latex-engine=pdflatex --template=thesis_skeleton.latex \
	--bibliography=thesis.bib -V biblio-title='Bibliography' --natbib --csl=acm-sigchi-proceedings-extended-abstract-format.csl \
	-V documentclass='scrbook' \
	-V fontfamily='libertine' \
	-V author='Eduardo Graells-Garrido' \
	-V year='2015' \
	-V department='DTIC' \
	-V university='Universitat Pompeu Fabra' \
	-V title='Biased Behavior on Web Activities: From Understanding to Unbiased Visual Exploration' \
	-V supervisor='Dr. Ricardo Baeza-Yates, Universitat Pompeu Fabra \\ Dr. Mounia Lalmas, Yahoo Labs' \
	-V university_logo='img/logo_upf.png' \
	-f markdown -o thesis.pdf
	rm thesis_skeleton.latex appendix.tex
	
appendix.tex: appendix.md
	pandoc -f markdown -t latex appendix.md -o appendix.tex
	
thesis_skeleton.latex: ClassicThesis.tex
	python template_gen.py