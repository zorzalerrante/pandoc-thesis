# pandoc-thesis

Write your PhD thesis using pandoc (Markdown, LaTeX).

This is a small set of scripts/templates I prepared to start writing my PhD thesis using Markdown through pandoc. 

## Requirements / Credits

  * [pandoc](http://johnmacfarlane.net/pandoc)
  * python with [jinja2](http://jinja.pocoo.org/) installed
  * the [classicthesis](http://www.ctan.org/tex-archive/macros/latex/contrib/classicthesis/) LaTeX package
  * a thesis to write :)
    
## How to

  1. Write your content in markdown files (.md).
  2. Edit the `Makefile` and run `make`.
  3. ???
  4. Profit!
    
The Makefile contains the following code:

```
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
```

### Explanation
 
As you can see, I have several .tex files in the folder `frontback`. The names of those files are self-describing. They need to be in LaTeX instead of Markdown because
pandoc does not process them. The exception is the appendix.tex file: actually, you have an appendix.md file, which is converted previously by make to LaTeX.

All chapters and parts of the thesis should be in .md files. I name them with numbers, like 01_introduction.md, 02_background.md, and thus I'm able to use a wildcard *.md to 
read the files.

You need to edit the -V attributes in the Makefile to suit your needs.

And that's it! You are done with your thesis. At least with the preparation of the code structure. Now you can worry about the content only :)

 
## Note

Edit the `ClassicThesis.tex` template according to your needs. In my case, the title page is formatted according to the requirements of my university. 
You can also edit the `template_gen.py` script to change some options
of the main LaTeX template.
