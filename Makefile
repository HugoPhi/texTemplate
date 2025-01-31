# Makefile for LaTeX Project with included sections

# 文件名（不带扩展名）
TEXFILE = main

# 目标文件夹
BUILDDIR = build

# 输入文件夹
FIGURESDIR = figures
CODEDIR = code
SRC = src  # 存放子章节的目录

# 编译命令
LATEX = pdflatex -shell-escape -interaction=nonstopmode
BIBTEX = biber

# 输出文件
PDF = $(BUILDDIR)/$(TEXFILE).pdf
LOG = $(BUILDDIR)/$(TEXFILE).log
AUX = $(BUILDDIR)/$(TEXFILE).aux
BIB = $(BUILDDIR)/ref.bib

# 创建build目录
$(shell mkdir -p $(BUILDDIR)/src)

# 默认目标
all: $(PDF)

# 生成PDF
$(PDF): $(TEXFILE).tex $(BUILDDIR)/$(TEXFILE).bib
	@echo "Compiling LaTeX file..."
	$(LATEX) -output-directory=$(BUILDDIR) $(TEXFILE).tex
	$(BIBTEX) $(BUILDDIR)/$(TEXFILE)
	$(LATEX) -output-directory=$(BUILDDIR) $(TEXFILE).tex
	$(LATEX) -output-directory=$(BUILDDIR) $(TEXFILE).tex
	@echo "Build finished. Output: $(PDF)"

# 拷贝.bib文件到build目录
$(BUILDDIR)/$(TEXFILE).bib: ref.bib
	@echo "Copying bib file..."
	cp ref.bib $(BUILDDIR)

# 拷贝src中的文件到build目录
$(BUILDDIR)/src/introduction.tex: $(SRC)/introduction.tex
	@echo "Copying introduction.tex to build directory..."
	cp $(SRC)/introduction.tex $(BUILDDIR)/src

# 清理目标
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
		$(FIGURESDIR)/*.pdf \
		# $(BUILDDIR)/*.pdf

# 伪目标
.PHONY: all clean
