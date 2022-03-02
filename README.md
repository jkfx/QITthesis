# QITthesis 青岛工学院本科毕业论文LaTeX模板

本文基于[青岛工学院毕业论文（设计）撰写（范例）.docx](https://github.com/jkfx/QITthesis/blob/master/%E9%9D%92%E5%B2%9B%E5%B7%A5%E5%AD%A6%E9%99%A2%E6%AF%95%E4%B8%9A%E8%AE%BA%E6%96%87%EF%BC%88%E8%AE%BE%E8%AE%A1%EF%BC%89%E6%92%B0%E5%86%99%EF%BC%88%E8%8C%83%E4%BE%8B%EF%BC%89.docx)word模板所撰写的LaTeX模板，由于本人LaTeX编写经验较少，与其说是模板，实际上只是一个基于`ctex`宏包的样式集，由于时间关系，笔者并没有充裕的时间阅读`clsguide`文档，即*LaTeX2ε for class and package writers*并实践，所以只基于了`ctex`宏包的一些设置实现了符合青岛工学院毕业论文（设计）撰写（范例）样式。

## 使用说明

### 加载`QITthesis`文档类

将tex源码文件与QITthesis.sty放在同一目录下，在文件的开头调用文档类`\documentclass{QITthesis}`即可实现以下样式：

- a4页面，上下2.5厘米，左右2.8厘米
- 参考文献格式为`gb7714-2015`
- 脚注样式为圆圈数字
- 三线表
- 一级、二级、三级标题格式设定以符合撰写规范

未能实现样式与功能，需要在源码中自行插入代码：

- 摘要环境的样式设定
- 页眉（需要手动填写自己的论文题目）
- 正文格式的样式设定
- 参考文献数据库编写与样式设定
- 致谢与附录

### 摘要环境样式设定

在`\begin{abstract}`之上加入设置页眉、页脚的代码，在之下加入代码设置字号与行距，并且在摘要内容结束后加入命令填写关键词：

```latex
\fancyhf{}
\fancyfoot[C]{\zihao{-5}\tnr\thepage}
\renewcommand{\headrulewidth}{0pt}
\pagenumbering{Roman}
\begin{abstract}
    \zihao{-4}
    \setlength{\baselineskip}{20pt}
    摘要内容...

    \vspace{\baselineskip}\bfseries\heiti 关键词：
    \normalfont\heiti 关键词1；关键词2；...
\end{abstract}
```

英文摘要环境如下，在开始摘要之前需要修改摘要名并另起一页：

```latex
\newpage
\ctexset{abstractname=\zihao{3}\tnr\bfseries\centering Abstract\vspace{.75\baselineskip}}
\begin{abstract}
    \zihao{-4}
    \tnr
    \setlength{\baselineskip}{20pt}
    the contends of english abstract ...

    \vspace{\baselineskip}\zihao{-4}\tnr\bfseries Keywords:
    \zihao{-4}\tnr\normalfont keyword1; ketword2; ...
\end{abstract}
```

> 为什么不使用`titlepage`使摘要独占1页？\
> 因为使用了`titlepage`之后摘要就不顶格了，使得摘要标题开头在页面中间位置

### 页眉页脚样式设定

由于模板规范为摘要、英文摘要、目录无页眉并且页脚页码为大写罗马字体，之后的正文才加上页眉标题、将页脚页码改为阿拉伯数字格式，所以在第一章节—即第一个`section`—下方需要编写代码并且将毕业论文题目修改成自己的题目：

```latex
\fancyhf{}
\renewcommand{\headrulewidth}{0.5pt}
\fancyhead[C]{\zihao{-5}毕业论文（设计）题目}
\fancyfoot[C]{\zihao{-5}\tnr\thepage}
\pagenumbering{arabic}
```

### 正文格式的样式设定

在摘要与目录之后，第一个`\section`一级标题之下加入如下代码，即可修改为模板所需的样式格式与页眉页脚：

```latex
\zihao{-4}
\setlength{\baselineskip}{20pt}
\fancyhf{}
\renewcommand{\headrulewidth}{0.5pt}
\fancyhead[C]{\zihao{-5}毕业论文（设计）题目}
\fancyfoot[C]{\zihao{-5}\tnr\thepage}
\pagenumbering{arabic}
```

### 参考文献数据库编写与样式设定

在与源代码同一目录下创建名为`citation.bib`的参考文献数据库文件，将需要引用的参考文献以`BibTex`的格式放到`bib`文件中，在论文需要放置参考文献的位置插入如下代码（先修改了标题样式）：

```latex
\ctexset{
    section={
        numbering=false,
        format=\zihao{3}\heiti\centering,
        beforeskip=.7\baselineskip,
        afterskip=.7\baselineskip,
        fixskip=true,
        break=\newpage
    }
}
\printbibliography
```

### 致谢与附录

在上文的参考文献代码中，修改了一级标题的格式，所以在添加致谢与附录的时候只需要使用`\section`的一级标题即可：

```latex
\section{致\hspace{.5\ccwd}谢}

致谢内容...
```

开启附录，需要在`\section`命令上分使用`\appendix`命令：

```latex
\appendix
\section{}
附录A的内容
\section{}
附录B的内容
```

## 使用样例

在当前目录下有一个`example.tex`文档以及对应的`example.pdf`的文档，此文档基于模板文件中的内容所写的一个样例，可以查看[example.pdf](https://github.com/jkfx/QITthesis/blob/master/example.pdf)文件查看效果。

> 注意：\
> 此LaTeX模板并没有编写`titlepage`标题页，所以仍需要在word中填写标题页的信息，将两个文件合并或在LaTeX中插入文档即可得到最终完整毕业论文。
