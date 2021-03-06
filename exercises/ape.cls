% http://ctan.mirrors.hoobly.com/macros/latex/doc/clsguide.pdf

% Rule of thumb: in class if specific to the class
%                in package if it can be in different class

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eplbase}[2017/02/14 APE class]

% relax is needed since \ProcessOptions* exists too
\ProcessOptions\relax

\LoadClass[a4paper,notitlepage,1Opt]{article}

\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}

\RequirePackage[lmargin=2.3cm, rmargin=2.3cm,bottom=3.15cm,top=3cm]{geometry}

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{eurosym}
\RequirePackage{url}
\RequirePackage{ifthen}
\RequirePackage{enumitem}
\RequirePackage{caption}

\setlength{\parindent}{0pt}
\setlength{\parskip}{1ex plus 0.5ex minus 0.2ex}

% Color
% cfr http://en.wikibooks.org/wiki/LaTeX/Colors
\RequirePackage{color}
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\definecolor{dkgreen}{rgb}{0.25,0.7,0.35}
\definecolor{dkred}{rgb}{0.7,0,0}

\RequirePackage{psfrag}
\RequirePackage[process=auto,crop=pdfcrop]{pstool}
\RequirePackage{tikz}
\RequirePackage{tikzpagenodes}
\usetikzlibrary{positioning, calc, arrows}
\usepackage{mathtools}
\def\nudge{.3}
%\tikzset{axis/.style={ultra thick, Red!75!black, -latex, shorten <=-\nudge cm, shorten >=-2*\nudge cm}}
\tikzset{axis/.style={thick, Black!75!black, -latex, shorten <=-0.5*\nudge cm, shorten >=-\nudge cm}}
\tikzset{ineq1/.style={thick,Green}}
\tikzset{ineq2/.style={thick,Red}}
\tikzset{eq/.style={thick,Blue}}
\tikzset{obj/.style={thick,Red}}
\tikzset{hash/.style={pattern=north west lines, pattern color=blue}}
\tikzstyle{noeud-std}=[draw,fill=black,circle,inner sep=0pt,minimum size=7pt]

% For multirow in tabular
\RequirePackage{multirow}
% For multiple columns like in beamer
\RequirePackage{multicol}

\RequirePackage{fancybox}
\RequirePackage{titlesec}
\titleformat
{\section} % command
[hang] % shape
{\bfseries} % format
{\shadowbox{~\thesection~}} % label
{0.5ex} % sep
{} % before-code

\newcommand{\session}[2]{\hspace{-.5cm}\Large{\textbf{Session #1 -- #2}}}
\newcommand{\thex}{\section{(Theoretical exercise.)}}

\newcommand{\QAlabel}{Exercise}
\newcommand{\theQA}{\thesection}

\newcommand{\SolutionLabel}{Solution to \QAlabel~\theQA}

\usepackage[framemethod=tikz]{mdframed}
\input{../greyarrow.tex}

\RequirePackage{verbatim}
\ifthenelse{\isundefined{\Sol}}{\def\Sol{true}}{}
\ifthenelse{\equal{\Sol}{false}}
{
  \newenvironment{solution}{\expandafter\comment}{\expandafter\endcomment}
}
{
  \newmdenv[style=mysquare]{solution}
}

\NewDocumentEnvironment{solfig}{mm}
{\begin{center}\begin{minipage}{\textwidth}\centering\hspace{1em}}
{\hspace{1em}\captionof{figure}{#2}\label{fig:#1}\end{minipage}\end{center}}

% \comment and \endcomment of the environment solution
% does not work with newcomment
\ifthenelse{\equal{\Sol}{false}}
{\newcommand{\nosolution}{}}
{
\newcommand{\nosolution}{
\begin{solution}
Sadly,
\QAlabel~\theQA{}
does not yet have a solution.
You are encouraged to submit one to the following address
\begin{center}
  \url{https://github.com/blegat/LINMA2345}
\end{center}
\end{solution}
}
}

\endinput
