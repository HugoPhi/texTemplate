# MCM Thesis LaTeX 模板

这是一个用于编写美国大学生数学建模竞赛（MCM/ICM）论文的 LaTeX 模板。该模板提供了一个结构化的框架，帮助您高效地组织论文内容、插入图片、引用文献，并确保最终文档符合竞赛要求。

## 项目结构

```
.
├── build
│   └── main.pdf              # 编译后的 PDF 文件
├── code
│   ├── main.cpp              # MATLAB / C++ 代码文件
│   └── python.py             # Python 代码文件
├── figures
│   └── example.eps           # 图片文件夹，用于存放图形文件
├── main.tex                  # 主 LaTeX 文件，包含文档的主要结构和内容
├── Makefile                  # 自动化编译脚本
├── mcmthsis.cls              # 自定义 LaTeX 类文件，定义文档格式
├── README.md                 # 项目的说明文件
├── ref.bib                   # 参考文献文件
├── src
│   ├── 0_introduction.tex    # 引言章节
│   ├── 1_analysis_of_the_problem.tex  # 问题分析章节
│   ├── 2_calculating_and_simplifying_the_model.tex  # 模型简化与计算章节
│   ├── 3_the_model_results.tex  # 模型结果章节
│   ├── 4_validating_the_model.tex  # 模型验证章节
│   ├── 5_conclusion.tex     # 结论章节
│   ├── 6_summary.tex        # 总结章节
│   ├── 7_evaluate_of_the_mode.tex  # 模型评估章节
│   └── 8_strengths_and_weaknesses.tex  # 强项与弱项章节
└── template.tex              # LaTeX 模板文件，用于文档的其他设置和参考
```

## 如何编译项目

### 1. 编译环境要求

为了编译这个 LaTeX 项目，您需要以下软件和环境支持：

- **TeX Live**：用于 LaTeX 编译。请确保安装了最新版本的 TeX Live。
  
  安装方式：
  - **Ubuntu/Debian**：
    ```bash
    sudo apt update
    sudo apt install texlive-full
    ```
  - **macOS**：
    使用 Homebrew 安装：
    ```bash
    brew install --cask mactex
    ```
  - **Windows**：
    下载并安装 [TeX Live](https://www.tug.org/texlive/).

- **Biber**：用于文献管理，`biblatex` 宏包依赖 `Biber` 来处理参考文献。
  
  安装方式：
  - **Ubuntu/Debian**：
    ```bash
    sudo apt install biber
    ```
  - **macOS**：
    使用 Homebrew 安装：
    ```bash
    brew install biber
    ```
  - **Windows**：
    下载并安装 [Biber](https://sourceforge.net/projects/biblatex-biber/).

### 2. 使用 `Makefile` 编译项目

该项目包含一个自动化编译脚本 `Makefile`，可以帮助您轻松地编译整个文档。您只需要在终端中运行以下命令：

```bash
make
```

`Makefile` 会自动执行以下步骤：

1. 使用 `pdflatex` 编译 LaTeX 主文件 `main.tex`。
2. 使用 `biber` 处理文献引用。
3. 再次运行 `pdflatex` 更新引用，并生成最终的 PDF 文件。

### 3. 手动编译

如果您不想使用 `Makefile`，可以手动编译：

1. 运行 `pdflatex main.tex`。
2. 运行 `biber main` 处理参考文献。
3. 再次运行 `pdflatex main.tex` 两次，更新文献引用并生成最终 PDF。

### 4. 清理编译文件

运行 `make clean` 可以删除中间文件（如 `.aux`、`.log`、`.bbl` 等）。

```bash
make clean
```

如果您希望删除所有编译生成的文件，包括 PDF，可以运行：

```bash
make cleanall
```

## 文件和文件夹用途

### 1. `main.tex`

主 LaTeX 文件，包含文档的主要结构和内容。您可以在此文件中设置文档的标题、作者、目录、引用等，并通过 `\include{}` 引入各个章节文件。

### 2. `src/` 目录

存放各章节的 LaTeX 文件，每个文件包含论文的一个部分或章节。您可以在此目录下修改或新增章节。

- `0_introduction.tex`：引言章节
- `1_analysis_of_the_problem.tex`：问题分析章节
- `2_calculating_and_simplifying_the_model.tex`：模型简化与计算章节
- `3_the_model_results.tex`：模型结果章节
- `4_validating_the_model.tex`：模型验证章节
- `5_conclusion.tex`：结论章节
- `6_summary.tex`：总结章节
- `7_evaluate_of_the_mode.tex`：模型评估章节
- `8_strengths_and_weaknesses.tex`：强项与弱项章节

### 3. `figures/` 目录

用于存放图片文件。在 LaTeX 文档中引用图片时，图片文件应存放在此目录。

### 4. `code/` 目录

存放代码文件，如 `main.cpp` 和 `python.py`，可以在论文的附录中引用这些代码文件。

### 5. `ref.bib`

参考文献文件，存放所有引用的文献条目。您可以在此文件中添加新的参考文献，并在文档中使用 `\cite{}` 命令引用。

### 6. `mcmthsis.cls`

自定义的 LaTeX 类文件，定义了 MCM 论文的格式和排版规则。用户无需修改此文件，除非需要修改文档格式。

### 7. `Makefile`

用于自动化编译 LaTeX 项目的脚本。它简化了编译过程，并自动运行所需的编译命令。您只需要运行 `make` 命令即可完成所有编译步骤。

### 8. `template.tex`

提供一些 LaTeX 模板设置和配置的文件，供参考或用于项目的其他部分。

## 注意事项

- **文件路径**：确保文件路径正确，特别是在引用图片或其他资源时，使用相对路径来避免错误。
- **修改文档格式**：如果需要修改文档格式，可以编辑 `mcmthsis.cls` 或 `main.tex` 中的相关设置。

## 故障排除

- 如果编译失败，请查看 `build/` 文件夹中的 `.log` 文件以获取详细的错误信息。
- 如果文献引用未显示，确保在编译过程中运行了 `biber`，并且 `ref.bib` 文件中的文献条目正确。
- 确保图片文件已正确放置在 `figures/` 目录中，并且路径无误。

## 贡献

如果您有任何改进建议或发现问题，欢迎提交 issue 或 pull request。

## 许可

本项目使用 MIT 许可证进行开源
