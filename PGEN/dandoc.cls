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

\newcommand{\zvec}{\underline{0}}

\newcommand{\qed}{$\blacksquare$}

