\ProvidesClass{QITthesis}
% 加载ctex宏包的ctexart类
\LoadClass[fontset=fandol]{ctexart}
% 浮动环境宏包
\RequirePackage{float}
% 插图宏包
\RequirePackage{graphicx}
% 字体宏包
\RequirePackage{fontspec}
% 页面设置宏包
\RequirePackage{geometry}
% 目录样式设置宏包
\RequirePackage{titletoc}
% 代码块的高亮
\RequirePackage{listings}
% 图、表题样式宏包
% 设置图、表后面分隔符为空格
% 设置图、表与其标题间距
\RequirePackage[labelsep=space,skip=.5\baselineskip]{caption}
% 页眉、页脚宏包
\RequirePackage{fancyhdr}
% 三线表宏包
\RequirePackage{booktabs}
% 引用链接宏包
\RequirePackage[hidelinks]{hyperref}
% 数学公式宏包
\RequirePackage{amsmath}
\RequirePackage{amssymb}
% 参考文献样式
% 设置为gb7714-2015格式
\RequirePackage[style=gb7714-2015]{biblatex}
\addbibresource{citation.bib}
% 设置页眉、页脚
\pagestyle{fancy}
% 设置三线表线条的粗细
\setlength{\heavyrulewidth}{1.5pt}
\setlength{\lightrulewidth}{0.75pt}
% 设置脚注格式为圆圈数字
\RequirePackage{pifont}
\makeatletter
\newcommand*{\circnum}[1]{
  \expandafter\@circnum\csname c@#1\endcsname
}
\newcommand*{\@circnum}[1]{
  \ifnum#1<1
    \@ctrerr
  \else
    \ifnum#1>20
      \@ctrerr
    \else
      \ding{\the\numexpr 171+(#1)\relax}
    \fi
  \fi
}
\makeatother
\renewcommand*{\thefootnote}{\circnum{footnote}}
\renewcommand{\footnotesize}{\fangsong\zihao{-5}}
% 设置页面格式：a4纸、左右2.8cm、上下2.5cm
\geometry{a4paper,left=2.8cm,right=2.8cm,top=2.5cm,bottom=2.5cm}
% 设置文章字体族
\newfontfamily\tnr{Times New Roman}
\setmainfont{Times New Roman}
% 定义图、表题格式
\renewcommand\thefigure{\thesection-\arabic{figure}}
\renewcommand\thetable{\thesection-\arabic{table}}
\renewcommand\theequation{\thesection-\arabic{equation}}
% 设置目录样式
\titlecontents{section}[0pt]{\zihao{4}}{\thecontentslabel\hspace{.5\ccwd}}{\thecontentslabel}{\zihao{-4}\titlerule*{.}\contentspage}
\titlecontents{subsection}[1.5\ccwd]{\zihao{-4}}{\thecontentslabel\hspace{.5\ccwd}}{}{\zihao{-4}\titlerule*{.}\contentspage}
\titlecontents{subsubsection}[2.5\ccwd]{\zihao{-4}}{\thecontentslabel\hspace{.5\ccwd}}{}{\zihao{-4}\titlerule*{.}\contentspage}
% 正文标题样式设定
\ctexset{
    punct=quanjiao,
    abstractname=\zihao{3}\heiti\bfseries 摘\hspace{.5\ccwd}要\vspace{.75\baselineskip},
    section={
        number=\arabic{section},
        format=\raggedright\zihao{3},
        numberformat=\tnr,
        titleformat=\heiti,
        aftername=\ ,
        beforeskip=.7\baselineskip,
        afterskip=.7\baselineskip,
        fixskip=true,
        break=\newpage
    },
    subsection={
        number=\arabic{section}.\arabic{subsection},
        format=\raggedright\zihao{4},
        numberformat=\tnr,
        titleformat=\heiti,
        aftername=\ ,
        beforeskip=.7\baselineskip,
        afterskip=.7\baselineskip,
        fixskip=true
    },
    subsubsection={
        number=\arabic{section}.\arabic{subsection}.\arabic{subsubsection},
        format=\raggedright\zihao{-4},
        numberformat=\tnr,
        titleformat=\heiti,
        aftername=\ ,
        beforeskip=.7\baselineskip,
        afterskip=.7\baselineskip,
        fixskip=true
    },
    appendix={
        numbering=true,
        name={附\hspace{.5\ccwd}录},
        number=\Alph{section},
    },
    bibname= {\vspace{.75\baselineskip}\zihao{3}\heiti\centering 参考文献},
    contentsname=\zihao{3}\heiti\bfseries\centering 目\hspace{.5\ccwd}录
    }
