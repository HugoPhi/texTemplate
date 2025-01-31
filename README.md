# LaTeX 深度学习论文模板

这是一个用于编写深度学习相关论文的 LaTeX 模板，特别适用于多层感知器（MLP）等主题。本模板提供了一个结构化的框架，便于组织内容、添加图片和参考文献。

## 如何使用这个模板

### 1. 添加新章节

1. 在 `src/` 目录下创建新的 `.tex` 文件（如 `chapter3.tex`）。
2. 在 `main.tex` 文件中使用 `\include{src/chapter3}` 来包含新章节。
3. 修改 Makefile：在 `SRC_FILES` 变量中添加新文件。

### 2. 添加图片

1. 将图片文件放入 `images/` 目录。
2. 在 LaTeX 文件中使用以下代码引用图片：

   ```latex
   \begin{figure}
     \centering
     \includegraphics[width=0.8\textwidth]{your_image_name.jpg}
     \caption{Your image caption}
     \label{fig:your_label}
   \end{figure}
   ```

3. 使用 `\ref{fig:your_label}` 在文中引用图片。

### 3. 添加参考文献

1. 在 `references.bib` 文件中添加新的参考文献条目。
2. 在文中使用 `\cite{citation_key}` 来引用文献。

### 4. 编译项目

#### 使用 Makefile：

在项目根目录打开终端，运行：

```bash
make
```

这将编译项目并在根目录生成 PDF 文件。

#### 使用 Kile：

1. 打开 Kile 并加载 `main.tex`。
2. 使用 Kile 的编译功能（通常是点击工具栏上的 "Build" 或 "QuickBuild" 按钮）。

### 5. 清理编译文件

运行 `make clean` 删除所有中间文件，或 `make cleanall` 删除中间文件和最终 PDF。

## 自定义模板

### 修改文档类和包

编辑 `main.tex` 文件开头的 `\documentclass` 和 `\usepackage` 命令来更改文档类型或添加新的 LaTeX 包。

### 更改页面布局

在 `main.tex` 中调整 `\geometry` 命令参数来修改页面大小、边距等。

### 自定义章节样式

使用 `titlesec` 包在 `main.tex` 中自定义章节标题的外观。

## 注意事项

- 确保所有文件名不包含空格。
- 使用相对路径引用图片和其他文件。
- 定期备份您的工作。

## 故障排除

- 如果编译失败，检查 `build/` 目录中的 `.log` 文件以获取错误信息。
- 确保所有引用的文件（图片、章节文件等）都存在且路径正确。

## 贡献

如果您有改进这个模板的建议，请开 issue 或提交 pull request。

## LISENCE 

> This project is licensed under the terms of the **MIT**. See [LICENSE](./LICENSE) for more details.

