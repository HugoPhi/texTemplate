#######################################################################
########## Makefile for LaTeX Project with included sections ##########
#######################################################################
##########   Copyright © 2025 胡芸铭. All rights reserved.   ##########
#######################################################################

TEXFILE = main
BUILDDIR = build
IMAGEDIR = images
SRC = src
BIB = ref

# 编译工具以及选项
LATEX = xelatex -shell-escape -interaction=nonstopmode
BIBTEX = biber

PDF = $(BUILDDIR)/$(TEXFILE).pdf
LOG = $(BUILDDIR)/$(TEXFILE).log

$(shell mkdir -p $(BUILDDIR)/src)

all: $(PDF) log

$(PDF): $(TEXFILE).tex $(BUILDDIR)/$(TEXFILE).bib $(wildcard $(SRC)/*.tex)
	@echo "Compiling LaTeX file..."
	-$(LATEX) -output-directory=$(BUILDDIR) $(TEXFILE).tex
	-$(BIBTEX) $(BUILDDIR)/$(TEXFILE)
	-$(LATEX) -output-directory=$(BUILDDIR) $(TEXFILE).tex
	-$(LATEX) -output-directory=$(BUILDDIR) $(TEXFILE).tex
	@echo "Build finished. Output: $(PDF)"

$(BUILDDIR)/$(TEXFILE).bib: $(BIB).bib
	@echo "Copying bib file..."
	cp $(BIB).bib $(BUILDDIR)/$(TEXFILE).bib

# 显示错误和警告
log:
	@echo ""
	@echo "🔍 Displaying errors and warnings from $(LOG):" | lolcat
	@echo ""
	@grep -n -e "Error" $(BUILDDIR)/$(TEXFILE).log | sed 's/Error/\x1b[31m&\x1b[0m/'
	@grep -n -e "Warning" $(BUILDDIR)/$(TEXFILE).log | grep -v "Package fancyhdr Warning" | sed 's/Warning/\x1b[33m&\x1b[0m/'
	@if ! grep -v "Package fancyhdr Warning" $(BUILDDIR)/$(TEXFILE).log | grep -q -e "Error" -e "Warning" ; then \
		echo "✨ Compile Passed!!!"; \
	fi 
	@echo ""

clean:
	@echo "Cleaning build files..."
	rm -rf \
		$(BUILDDIR)/src/ \
		$(BUILDDIR)/*.aux \
		$(BUILDDIR)/*.bbl \
		$(BUILDDIR)/*.blg \
		$(BUILDDIR)/*.log \
		$(BUILDDIR)/*.out \
		$(BUILDDIR)/*.bcf \
		$(BUILDDIR)/*.xml \
		$(BUILDDIR)/*.toc \
		$(BUILDDIR)/*.bib \
		$(IMAGEDIR)/*.pdf

.PHONY: all clean log
