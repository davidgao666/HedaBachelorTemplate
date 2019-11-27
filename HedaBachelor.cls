% !Mode:: "TeX:UTF-8" 
%本文档是论文格式cls文件，不可删除。非latex高手，千万不要修改任何内容！
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{HedaBachelor}[2019/11/25 Version: beta1.0. Henan University Thesis Template for Bachelor Degree]
\LoadClass[zihao=-4,a4paper,twoside]{ctexbook} %若需单面打印，[]中twoside改为oneside即可，不建议改动。
\setmainfont{Times New Roman}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
\newif\ifprint\printfalse
\DeclareOption{forprint}{\printtrue}
\ProcessOptions


%------------------------ Page layout ----------------------------------
\RequirePackage{fancyhdr,hyperref}

\hypersetup{pdfencoding=auto}  %%% 邓东升修改
 \ifprint
 \hypersetup{hidelinks}
 \else
\hypersetup{citecolor=magenta,linkcolor=blue}
\fi

\RequirePackage[top=2.8truecm,bottom=2.2truecm,left=3truecm,right=2truecm,includefoot,xetex]{geometry}    % 页面设置。根据教务处要求上边距2.8cm、下边距2.2cm、左边距3.0cm、右边距2.0cm，装订线：0cm、页眉1.8cm、页脚1.4cm、对称页边距%

\newtoks\Year               %毕业年份 2019.11.26 @gaow
\newtoks\StudentNumber       %学号
\newtoks\miji            %密级
\newtoks\Cmajor          %学科专业中文名
\newtoks\Emajor          %学科专业英文名
\newtoks\Edate           %英文日期
\newtoks\Etitle          %英文题目
\newtoks\Eauthor         %作者英文名
\newtoks\Esupervisor     %指导教师英文名
\newtoks\Csupervisor     %指导教师中文名
\newtoks\Eschoolname      %学院英文名
\newtoks\Cschoolname      %学院中文名



\pagestyle{fancyplain}
\fancyhf{}  %清除以前对页眉页脚的设置
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[C]{-\,\thepage\,-}


\fancypagestyle{plain}
{
\fancyhead{}                                    % clear all header fields
\renewcommand{\headrulewidth}{0pt}
\fancyfoot{}                                    % clear all footer fields
\fancyfoot[C]{-\,\thepage\,-}
}

%%=====封面===================== 
\def\maketitle{%
  \null
  \thispagestyle{empty}%
  %\vspace*{-2cm}
\begin{center}\leavevmode
	{\heiti \zihao{5}%
	\begin{tabular}{p{1cm}lp{9cm}l}
		 \raisebox{-0.5ex}[0pt]{\makebox[1cm][s]{编号：}} &\raisebox{-0.5ex}[0pt]{\the\StudentNumber}\hfill{} & \\ \cline{2-2}
	\end{tabular}
	}
    \par
    \vspace*{3.1cm} %插入空白
    {\heiti \zihao{-1} \makebox[12cm][s]{河南大学{\the\Year}届本科毕业论文}}
    \par
    \vspace{3.1cm}
    {\heiti \zihao{-3} \@title }%
    \par
%    \vspace{4cm}
     \vfill\vfill\vfill
    {\heiti \zihao{-3}
    \begin{tabular}{cp{5cm}c}
      \raisebox{-3ex}[0pt]{\makebox[3.8cm][s]{论文作者姓名：}} & {{}\raisebox{-3ex}[0pt]{\@author}\hfill{}} & \\ \cline{2-2}%[3ex]
      \raisebox{-3ex}[0pt]{\makebox[3.8cm][s]{作\hfill 者\hfill 学\hfill 号：}} & { {}\raisebox{-3ex}[0pt]{\the\StudentNumber}\hfill{}} & \\ \cline{2-2}%[3ex]
      \raisebox{-3ex}[0pt]{\makebox[3.8cm][s]{所\hfill 在\hfill 学\hfill 院：}} & {  {}\raisebox{-3ex}[0pt]{\the\Cschoolname}\hfill{}} & \\ \cline{2-2}%[3ex]
      \raisebox{-3ex}[0pt]{\makebox[3.8cm][s]{所\hfill 学\hfill 专\hfill 业：}} & { {}\raisebox{-3ex}[0pt]{\the\Cmajor}\hfill{}} & \\ \cline{2-2}%[3ex]
      \raisebox{-3ex}[0pt]{\makebox[3.8cm][s]{导师姓名职称：}} & { {}\raisebox{-3ex}[0pt]{\the\Csupervisor}\hfill{}} & \\ \cline{2-2}%[3ex]
      \raisebox{-3ex}[0pt]{\makebox[3.8cm][s]{论文完成时间：}} & { {}\raisebox{-3ex}[0pt]{\@date}\hfill{}} & \\ \cline{2-2}%[3ex]
     \end{tabular}
    }
    \par
    \vspace{1.6cm}
%    {
%    {\songti \zihao{3} \@date \par}%
%    }
    %\vspace*{-0.7cm}
\end{center}%
%  \null
%   \cleardoublepage 
  }

%------------------------ Abstract & Keywords -------------------------
\newcommand\cnabstractname{摘要} 
\newcommand\enabstractname{ABSTRACT}
\newcommand\cnkeywords[1]{ {\heiti\zihao{4}\cnkeywordsname: }#1}%%去掉原模板的noindent,字号改为四号，以符合河大教务处要求。
\newcommand\cnkeywordsname{关键词}
\newcommand\enkeywords[1]{ {\bfseries\zihao{4}\enkeywordsname: }#1}%%去掉原模板的noindent,字号改为四号，以符合河大教务处要求。2019.11.27
\newcommand\enkeywordsname{Key words}

\newenvironment{cnabstract}{
    \newpage
\chapter[\cnabstractname]{\ziju{1}\zihao{3}{\cnabstractname}}   %%%终于解决了书签乱码的问题 2005-04-12.huangzh %%字号改为三号字，以符合河大教务处要求。2019.11.27
    \songti\zihao{-4}
    \@afterheading}
    {\par}

\newenvironment{enabstract}{
    \newpage
    \chapter[\enabstractname]{\zihao{3}{\enabstractname}}%%字号改为三号%字，以符合河大教务处要求。2019.11.27
    \songti\zihao{-4}
    \@afterheading}
    {\par}

%%------------------------常用宏包-----------------------------------
\RequirePackage{bm}
\RequirePackage{amsmath,amssymb}
\RequirePackage[amsmath,thmmarks]{ntheorem}% AMSLaTeX宏包.
\RequirePackage{graphicx}                 % 图形
\RequirePackage{color,xcolor}             %支持彩色
%\RequirePackage{mathrsfs}   % 不同于\mathcal or \mathfrak 之类的英文花体字体
\RequirePackage{url}
\RequirePackage{enumerate}
\RequirePackage{emptypage}  %%去掉偶数空白页上的页码。2019.11.26

%%----------------------- Theorems -----------------------------------
\theoremstyle{plain}
\theoremheaderfont{\heiti}
\theorembodyfont{\songti} \theoremindent0em
\theorempreskip{0pt}
\theorempostskip{0pt}
\theoremnumbering{arabic}
%\theoremsymbol{} %定理结束时自动添加的标志
\newtheorem{theorem}{\hspace{2em}定理}[section]
\newtheorem{definition}{\hspace{2em}定义}[section]
\newtheorem{lemma}{\hspace{2em}引理}[section]
\newtheorem{corollary}{\hspace{2em}推论}[section]
\newtheorem{proposition}{\hspace{2em}性质}[section]
\newtheorem{example}{\hspace{2em}例}[section]
\newtheorem{remark}{\hspace{2em}注}[section]

\theoremstyle{nonumberplain}
\theoremheaderfont{\heiti}
\theorembodyfont{\normalfont \rm \songti}
\theoremindent0em \theoremseparator{\hspace{1em}}
\theoremsymbol{$\square$}
\newtheorem{proof}{\hspace{2em}证明}


\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}  %自定义新命令\upcite, 使参考文献引用以上标出现

%%%%%%%-------------------------------------------------
%%%===  suppress extra inter-line spacing in \list environments
\makeatletter \setlength\partopsep{0pt}
\def\@listI{\leftmargin\leftmargini
            \parsep 0pt
            \topsep \parsep
            \itemsep \parsep}
\@listI
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
\def\@listiv{\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
\def\@listv{\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
\def\@listvi{\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep
              \parsep    \z@ \@plus\z@  \@minus\z@
              \topsep    \parsep
              \itemsep   \parsep}
%
% Change default margins for \list environments
\setlength\leftmargini   {2\ccwd} \setlength\leftmarginii
{\leftmargini} \setlength\leftmarginiii {\leftmargini}
\setlength\leftmarginiv  {\leftmargini} \setlength\leftmarginv
{\ccwd} \setlength\leftmarginvi  {\ccwd} \setlength\leftmargin
{\leftmargini} \setlength\labelsep      {.5\ccwd}
\setlength\labelwidth    {\leftmargini}
%
\setlength\listparindent{2\ccwd}
% Change \listparindent to 2\ccwd in \list
\def\list#1#2{\ifnum \@listdepth >5\relax \@toodeep
     \else \global\advance\@listdepth\@ne \fi
  \rightmargin \z@ \listparindent2\ccwd \itemindent \z@
  \csname @list\romannumeral\the\@listdepth\endcsname
  \def\@itemlabel{#1}\let\makelabel\@mklab \@nmbrlistfalse #2\relax
  \@trivlist
  \parskip\parsep \parindent\listparindent
  \advance\linewidth -\rightmargin \advance\linewidth -\leftmargin
  \advance\@totalleftmargin \leftmargin
  \parshape \@ne \@totalleftmargin \linewidth
  \ignorespaces}

\makeatother
%---------------------------------------------------
\newcommand\acknowledgement{\chapter*{\ziju{1}致谢}}

%%% ---- 章节标题设置 ----- %%%%
\ctexset{chapter={format+={\zihao{-2}},%正文中章标题字号
               number={第~\arabic{chapter}~章},name={,},afterskip={30pt},beforeskip={20pt}}}
\ctexset{section={format+={\zihao{-3}\raggedright}}} %节标题
\ctexset{subsection={format+={\zihao{4}\raggedright}}} %小节(条)标题
\ctexset{subsubsection={format={\zihao{-4}\bf\raggedright}}} %小小节(款)标题

\setcounter{tocdepth}{4}
\setcounter{secnumdepth}{4}

%%% ---- 图表标题设置 ----- %%%%
\RequirePackage[labelsep=quad]{caption} %%序号之后空一格写标题
\captionsetup[table]{font={bf,small}}  %%设置表格标题字体为黑体,字号为5号。2019.11.26
\captionsetup[figure]{font={normalfont,small}}  %%设置插图标题字体默认为宋体,字号为5号.2019.11.26
\renewcommand\figurename{\zihao{5} 图}
\renewcommand\tablename{\bf\zihao{5} 表} 

%%% ------ 目录设置 ------- %%%%
\ctexset{contentsname={\ziju{1}目录}}
 
\RequirePackage{tocloft} 
\renewcommand\cftchapfont{\zihao{-4}\bf}    %%目录列表里的章标题字号小四黑体。2019.11.26
\renewcommand\cftsecfont{\zihao{-4}}    %%目录列表里的节标题字号小四宋体。2019.11.26
\renewcommand\cftsubsecfont{\zihao{5}}    %%目录列表里的小节标题字号五号宋体。2019.11.26
\renewcommand\cfttoctitlefont{\hfill\zihao{-2}\bf}  %%“目 录”二字小二黑体。2019.11.26
\renewcommand\cftaftertoctitle{\hfill}    
 
%%===参考文献===%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\bibliographystyle{abbrv}        % 参考文献样式,  plain,unsrt,alpha,abbrv,chinesebst 等等
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\graphicspath{{figures/}}        % 图片文件路径
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\allowdisplaybreaks

\endlinechar `\^^M
\endinput
