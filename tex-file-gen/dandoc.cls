\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dandoc}[2022/01/14 Dan's Document Class]

\LoadClass[11pt]{article}
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{enumerate}
\RequirePackage{fancyhdr}
\RequirePackage{bm}
\RequirePackage{polynom}
\RequirePackage{tcolorbox}
\RequirePackage{listings}

\textwidth 15cm 
\textheight 21.3cm
\evensidemargin 6mm
\oddsidemargin 6mm
\topmargin -1.1cm
\setlength{\parskip}{1.5ex}

\newcommand{\claim}{\underline{Claim:}}
\newcommand{\proof}{\underline{Proof:}}

\newcommand{\pnum}[1]{\underline{\textbf{Problem #1}}.}
\newcommand{\pind}[1]{\textbf{#1)}}

\newcommand{\R}{\mathbb{R}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\F}{\mathbb{F}}

\newcommand{\nen}{n \in \N}
\newcommand{\Nen}{N \in \N}
\newcommand{\xen}{x \in \N}
\newcommand{\ien}{i \in \N}
\newcommand{\jen}{j \in \N}

\newcommand{\nez}{n \in \Z}
\newcommand{\Nez}{N \in \Z}
\newcommand{\xez}{x \in \Z}
\newcommand{\iez}{i \in \Z}
\newcommand{\jez}{j \in \Z}
\newcommand{\pez}{p \in \Z}
\newcommand{\qez}{q \in \Z}

\newcommand{\ner}{n \in \R}
\newcommand{\xer}{x \in \R}

\newcommand{\zec}{z \in \C}

\newcommand{\xef}{x \in \F}

\newcommand{\labelmat}[3]{
\underbrace{
\begin{bmatrix}
#1
\end{bmatrix}}_{\displaystyle #2}
\left.\vphantom{\begin{bmatrix}
#1
\end{bmatrix}}\right\}#3
}

\newcommand{\ibp}[4]{
\begin{bmatrix}
&\textbf{IBP:} & &\\
&\displaystyle #1 &&& \displaystyle #3 &\\
&&&&\\
&\displaystyle #2 &&& \displaystyle #4 &
\end{bmatrix}
}

\newenvironment{apmatrix}[1]{%
  \left(\begin{array}{@{}*{#1}{c}|c@{}}
}{%
  \end{array}\right)
}

\newenvironment{abmatrix}[1]{%
  \left[\begin{array}{@{}*{#1}{c}|c@{}}
}{%
  \end{array}\right]
}

\NewDocumentEnvironment{mapmatrix}{>{\SplitArgument{1}{|}}m}
 {\left(\makeamatrix#1}
 {\end{array}\right)}
\NewDocumentCommand{\makeamatrix}{mm}{%
  \IfNoValueTF{#2}
    {\begin{array}{@{}*{#1}{c}@{}}}
    {\begin{array}{@{}*{#1}{c}|*{#2}{c}@{}}}%
}

\newcommand\bsl{\text{\textbackslash}}

\newcommand\hdiv[1]{\noindent\rule{#1}{0.4pt}}

\newcommand\mateq{\sim{~}}

\newcommand{\zvec}{\underline{0}}

\newcommand{\qed}{$\blacksquare$}

\newcommand{\dsum}{\displaystyle\sum}

\newcommand{\dlim}{\displaystyle\lim}
\newcommand{\ds}{\displaystyle}
\newcommand{\limpar}[2]{\displaystyle\lim_{#1 \rightarrow #2}}

\newcommand{\parth}[1]{\left( #1 \right)}
\newcommand{\brak}[1]{\left[ #1 \right]}
\newcommand{\bigabs}[1]{\left| #1 \right|}

\newcommand{\lemma}[1]{\underline{Lemma #1:}}

\newcommand{\btmp}{\underline{Back to main proof:}}

\newcommand{\iffr}{\underline{($\Longrightarrow$)}}

\newcommand{\iffl}{\underline{($\Longleftarrow$)}}
\newcommand{\set}[1]{\{#1\}}

% Handy dandy CS251 stuff
% \makeatletter
% \renewcommand*\thelstnumber{\the\numexpr 2*\c@lstnumber\relax}
% \lstset{numbers=left, 
%         numberstyle=\normalsize, 
%         breaklines=true,
%         backgroundcolor=\color{white},
%         numbersep=3pt,
%         xleftmargin=.25in,
%         xrightmargin=.25in,
%         basicstyle=\normalsize\ttfamily
%         } 

% Usage:
% \begin{lstlisting}[firstnumber=100]
%   for i:=maxint to 0 do
%   begin
%   { do nothing }
%   end;
%   \end{lstlisting}
