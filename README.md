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
- 参考文献数据库的编写
- 致谢与附录
- 正文格式的设定

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

> 为什么不使用`titlepage`是摘要自动占1页？\
> 因为使用了`titlepage`之后摘要就不顶格了
