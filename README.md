![image](https://github.com/user-attachments/assets/92967fd5-8d74-4bed-ae3b-9e4cf549e874)


# 美赛论文LaTeX模板

## 1. 序列号

方便查找，队伍序列号为：

```
你们的队伍号
```

指导教师号：

```
你们的指导教师号
```

## 2. 论文如何构建

> - 模板文档类参考自mcmthesis，[repository link](https://github.com/latexstudio-org/mcmthesis).
> - 整个项目开发环境是基于Ubuntu22.04的，其它操作系统出现问题欢迎提Issue，也欢迎贡献开发环境搭建指导。

### 2.1. 工具版本

- LaTeX: ```pdfTeX 3.141592653-2.6-1.40.26 (TeX Live 2024)```
- Make: ```GNU Make 4.3```

### 2.2. 如何构建

支持在根目录或者在`\src`目录下运行`make`命令： 

- `make`: 编译生成论文的pdf文件到`build/main.pdf`，并查找编译问题，具体问题放在`build/main.log`里面。
- `make clean`: 删除中间文件，但是不会删除`build/`下面的`main.pdf`。
- `make log`: 检查编译日志。

### 2.3. 关于`src/`

为了更加整洁的开发环境，我们把文章的各个章节分别卸载`src/`目录下，并使用`input{}`在主文件`main.tex`中进行引入，以免造成新的分页。另外，各个章节需要写的东西如下：

#### 2.3.1. **Abstruct & Content**

被包含在`main.tex`中，摘要在美赛评审中十分重要，用来在第一轮筛选中淘汰不能获奖的论文，用于：

- 向评委指出我们对于问题的回答情况，就是你的结果。
- 阐述每个问题的思路，体现整体思路。
- 说明我们的工作有哪些两点。

这个部分通常放在最后写，需要十分重视。通常：

- 通过抄写拼凑Introduction的内容。
- 抄写拼凑每个模型第一段的内容。
- 语法错误，语言粗糙，逻辑混乱。
- 没有明确指出自己对于每个问题的回答情况。
- 对于建模思路表述不清楚。

的摘要都是不合格的。

目录将自动生成。

#### 2.3.2. **Introduction**

![image](https://github.com/user-attachments/assets/f326f1cc-f296-4e48-a076-5ea717f1ef53)

这个部分主要是关于问题的一些理解，以及对于建模过程的引入。这部分放在`1_introduction.tex`中，通常包含以下4个部分中的2~3个：

- Background
- Problem Restatement and Analysis
- Literature Review
- Overview of our work \[选做]

#### 2.3.3. **Assumptions & Notaions** 

放在`2_assumption_and_notaions.tex`中，包含以下两个部分：

- Notaions：是对于文章中用到的符号的列举和说明，是一张表格。
- Assumptions：对于文章中用到的假设的整理，以及对于他的解释。

#### 2.3.4. **Models**

分别放在`3_model_i.tex`，`4_model_ii.tex`，`5_model_iii.tex`中，是对于每个模型的详细阐述。

#### 2.3.5. **Sensitivity Analysis**

![image](https://github.com/user-attachments/assets/981f0839-64cf-494f-ab16-fa3f2ecc226a)

敏感度分析，对于某个参数发生变化的情况下，模型的结果的变化，由此可以得到一些关于模型在鲁棒性方面的结论。  

这个部分是必要的，而且最好在关键词中也要提到，而且必须用这个名字。  

放在`6_sensitivity_analysis.tex`中。

#### 2.3.6. **Model Evaluation and Further Discussion**

![image](https://github.com/user-attachments/assets/70501e91-3674-4144-ae77-d803f8b884bd)

关于每个模型的优缺点，以及对于模型的改进。放在`7_strengths_and_weaknesses.tex`。包含：

- Strengths
- Weaknesses
- Further Discussion

三个部分。

#### 2.3.7. **Memo or Letter or Articles...**

![image](https://github.com/user-attachments/assets/1c887b95-7fc2-4015-968b-19a0050137e1)

这个部分是文章特色展示部分，主要是根据结果对问题相关机构或者政府的一些建议。形式上可以相对丰富多彩一些，不用过于学术，但是一定要足够充分说明结果。  

#### 2.3.8. AI使用说明（不计入总页数）

2024年之后的特色部分。详细可以看美赛官网文件。  

#### 2.3.9. **特别提醒**

另外特别提醒以下部分是必须包含的： 

![image](https://github.com/user-attachments/assets/7aa26f99-026d-4fc1-a73f-72f4b28474e1)

还有以下要点： 

![image](https://github.com/user-attachments/assets/3ad9ad85-247f-455a-8dcf-a62c1429029a)
![image](https://github.com/user-attachments/assets/dd204261-66be-4d61-9275-6354f400ef79)


## 2.4. 关于`figures/`

为了清晰的代码架构，所有的文件必须要放在`figures/`目录下，所有图片文件处在同一级。图片必须：

- 以“文中编号-用途简述-贡献者”命名。
- 不能单独出现子图，就是这个文件夹所有的图片都会直接以一张图的形式加入到文章中，而不会使用子图排版，以在保持美观的同时提升效率。
- 如果是多张子图拼成的，在每张子图下面标注好编号，通常是“(A),(B),(C)”或者“(I),(II),(III),(IV)”
- 字体必须使用`Times New Roman`。

## 2.5. 关于`code/`

所有的代码放在相关贡献者对应的子文件夹下，可以自己建子仓库。这样做的目地是便于管理，文件结构如下：

```cpp
code
├── ly // contributor 1
│   └── python.py
└── zt // contributor 2
    └── main.cpp
```

## LISENCE 

> This project is licensed under the terms of the **Apache License 2.0**. See [LICENSE](./LICENSE) for more details.

## References

[1] 数学建模清风，在B站的博客，关于[论文写作方法教程(国赛和美赛)](https://www.bilibili.com/opus/685217123907141700).    
[2] @latexstudio-org， LaTeX2e Template designed for MCM/ICM，[repository link](https://github.com/latexstudio-org/mcmthesis).   
[3] 小嗷犬，美国大学生数学建模竞赛（MCM/ICM）论文模板，[overleaf link](https://www.overleaf.com/latex/templates/mei-guo-da-xue-sheng-shu-xue-jian-mo-jing-sai-mcm-slash-icm-lun-wen-mo-ban/tmzfgynjcqfc).  
[4] 重庆大学，MCM-ICM赛前培训PPT。
