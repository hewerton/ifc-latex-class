\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{IFCExams}

%%%%%%%%%%%%%%%%%% Basic Packages %%%%%%%%%%%%%%%%%%
\RequirePackage{ifthen}
\RequirePackage[utf8x]{inputenc}
\RequirePackage[T1]{fontenc}

%% Define options
\DeclareOption{exam}{
  \newcommand{\doc@type}{exam}
  \newcommand{\doc@name}{Prova}
}

\DeclareOption{list}{
  \newcommand{\doc@type}{list}
  \newcommand{\doc@name}{Lista de Exercícios}
}

\DeclareOption{challenge}{
  \newcommand{\doc@type}{challenge}
  \newcommand{\doc@name}{Desafio}
}

\DeclareOption{task}{
  \newcommand{\doc@type}{task}
  \newcommand{\doc@name}{Tarefa}
}


\ProcessOptions
\LoadClass[a4paper,11pt]{article}

%%% Load default arguments if empty
\ifthenelse{\isundefined{\doc@type}}{\ExecuteOptions{exam}}{}

%%%%%%%%%%%%%%%%%% Packages and Settings %%%%%%%%%%%%%%%%%%
% Page layout
\RequirePackage[a4paper, top=2cm, left=2cm, right=2cm, footskip=0.5cm, includehead, includefoot]{geometry}
\setlength{\parindent}{0cm}

% Default packages
\RequirePackage[brazilian]{babel}
\RequirePackage{graphicx}

% Default page style
\RequirePackage{fancyhdr}
\pagestyle{fancy}


% algorithm2e package settings
\RequirePackage[portuguese, boxed, titlenumbered]{algorithm2e}
\setlength{\algomargin}{2em}
\SetKw{Declare}{Declare}
\SetKw{Real}{Real}
\SetKw{Int}{Inteiro}
\SetKw{String}{String}
\SetKw{Char}{Caractere}
\SetKw{Leia}{Leia}
\SetKw{Escreva}{Escreva}
\SetKwComment{Comentario}{// }{} 

%%% Preamble commands (as title, author, ...)
\newcommand{\class}[1]{\newcommand{\doc@class}{#1}}
\newcommand{\subject}[1]{\newcommand{\doc@subject}{#1}}
\newcommand{\order}[1]{\newcommand{\doc@order}{#1}}


%% Exercises counter
\newcounter{exes}
\setcounter{exes}{0}

\newenvironment{exeenv}[1]
{
  \addtocounter{exes}{1}
  \noindent
  
  \textbf{Exercício \arabic{exes} ({#1} pts)}
  
}
{
  \newline
}

\newcommand{\question}[2]{
  \addtocounter{exes}{1}
  \textbf{Questão \arabic{exes} ({#1} pts) - }{#2} ~\newline
}

\newcommand{\exe}[1]{
  
  \addtocounter{exes}{1}
  \textbf{Exercício \arabic{exes} - }{#1} \hfill \newline
}

% Put indentification fields at the beginning of the document
% This command is executed if the document is an exam, with a 'exam' option
\newcommand{\identification}{
  {\large Nome: \hrulefill  ~Matrícula: \rule{4cm}{.1mm}}%
  \par%
  \vskip 2ex%

}



% Header configuration
\fancyhead[R]{
  \@author \\
  \ifthenelse{\isundefined{\doc@class}}{}{\doc@class} \\
  \doc@name~\ifthenelse{\isundefined{\doc@order}}{}{\doc@order} \\
  \doc@subject \\
  \@date}
\fancyhead[L]{\includegraphics[width=5cm]{logo-ifc-parcial-nova-concordia.pdf}}
\setlength{\headheight}{2.5cm}
\renewcommand{\headrulewidth}{1pt}

\fancyfoot[C] {}
\fancyfoot[R] {\thepage}
\renewcommand{\footrulewidth}{0.4pt}


\AtBeginDocument{
  \maketitle
 
}

\renewcommand{\maketitle}{
  \ifthenelse{\equal{\doc@type}{exam}}{\identification}{}
  \ifthenelse{\equal{\doc@type}{task}}{
    \begin{center}
     \Huge\textbf{\doc@name~\ifthenelse{\isundefined{\doc@order}}{}{\doc@order}}
     \vspace{1cm}
    \end{center}

  }{}
}
\renewcommand{\@maketitle}{}