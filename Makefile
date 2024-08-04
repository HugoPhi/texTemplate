MAIN = main
TEXFILE = $(MAIN).tex
BIBFILE = references.bib
PDFFILE = $(MAIN).pdf
BUILD_DIR = build
SRC_DIR = src

LATEX = xelatex # LaTeX 编译器
BIBER = biber # 参考文献处理工具

LATEX_FLAGS = -shell-escape -interaction=nonstopmode -synctex=1 -output-directory=$(BUILD_DIR)
# LATEX_FLAGS = -shell-escape -interaction=nonstopmode # LaTeX 编译选项

SRC_FILES = $(wildcard $(SRC_DIR)/*.tex) # 获取所有源文件
CHAPTER_NAMES = $(notdir $(basename $(SRC_FILES))) # 提取章节名称
BUILD_CHAPTER_DIRS = $(addprefix $(BUILD_DIR)/$(SRC_DIR)/, $(CHAPTER_NAMES)) # 构建章节目录

all: $(PDFFILE) # 默认目标

$(BUILD_DIR) $(BUILD_CHAPTER_DIRS): # 创建构建目录
	mkdir -p $@

$(PDFFILE): $(TEXFILE) $(BIBFILE) $(SRC_FILES) | $(BUILD_DIR) $(BUILD_CHAPTER_DIRS) # 编译 PDF
	$(LATEX) $(LATEX_FLAGS) -output-directory=$(BUILD_DIR) $(TEXFILE)
	cp $(BIBFILE) $(BUILD_DIR)/
	cd $(BUILD_DIR) && $(BIBER) $(MAIN)
	$(LATEX) $(LATEX_FLAGS) -output-directory=$(BUILD_DIR) $(TEXFILE)
	$(LATEX) $(LATEX_FLAGS) -output-directory=$(BUILD_DIR) $(TEXFILE)
	mv $(BUILD_DIR)/$(PDFFILE) ./
	@echo "Moving intermediate files to their respective directories..."
	@for chapter in $(CHAPTER_NAMES); do \
		mv $(BUILD_DIR)/$$chapter.aux $(BUILD_DIR)/$(SRC_DIR)/$$chapter/ 2>/dev/null || true; \
	done

clean: # 清理中间文件
	rm -rf $(BUILD_DIR)

cleanall: clean # 完全清理，包括 PDF
	rm -f $(PDFFILE)

rebuild: cleanall all # 重新编译

.PHONY: all clean cleanall rebuild
