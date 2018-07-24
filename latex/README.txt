10 July 2001 - Aaron Nielsen - anielsen@mailaps.org

thesis/latex/  -  contains latex files for generating the thesis

I found and fixed several bugs in the umd-thesis.cls file. The corrected file
can be found here. However, the graduate school told me they are changing the
requirements very soon, so it may not matter anyway. 

I've tried hard to preserve the directory structure, but you may not be able
to re-run LaTeX without some effort. 

This directory structure is organized as follows. Most of the work was done
using LaTeX on FreeBSD. But some of the figures came from Windows programs,
so there are special directories here for those.

*.xcf files are created by the program GIMP an opensource image editor available
for UNIX type machine.

text			  - main thesis directory, contains thesis.tex file chapter files
text/bibliography	  - BiBTeX files for the thesis
text/figs		  - figures for the thesis
text/figs/appendixA	  - figures for appendix A
text/figs/appendixA/win	  - figure sources from MS Windows
text/figs/appendixB	  - figures for appendix B
text/figs/appendixB/win	  - figure sources from MS Windows
text/figs/appendixC	  - figures for appendix C
text/figs/appendixC/win   - figure sources from MS windows
text/figs/jjarray	  - figure for jjarray chapter
text/figs/jjarray/win	  - figure sources from MS Windows
text/figs/magpen	  - figures for magpen chapter
text/figs/magpen/win	  - figures from windows sources
text/figs/pme_exp	  - figures for pme chapter
text/figs/pme_exp/win	  - ffigures from windows sources
text/figs/pme_theory	  - figures for PME theory chapter
text/figs/pme_theory/win  - figures from windows
text/figs/prospective	  - figures for prospective chapter
text/figs/prospective/win - figures from windows
text/ssm		  - appendix source files
