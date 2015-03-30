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


\ProcessOptions
\LoadClass[a4paper,11pt]{article}

%%% Load default arguments if empty
\ifthenelse{\isundefined{\doc@type}}{\ExecuteOptions{exam}}{}

%%%%%%%%%%%%%%%%%% Packages and Settings %%%%%%%%%%%%%%%%%%
% Page layout
\RequirePackage[top=2cm,bottom=2cm, left=2.5cm, right=2.5cm]{geometry}

% Default packages
\RequirePackage[brazilian]{babel}
\RequirePackage{graphicx}

% Default page style
\RequirePackage{fancyhdr}
\pagestyle{fancy}


% algorithm2e package settings
\RequirePackage[portuguese, boxed, titlenumbered, linesnumbered]{algorithm2e}
\SetKw{Declare}{Declare}
\SetKw{Real}{Real}
\SetKw{Int}{Inteiro}
\SetKw{String}{String}
\SetKw{Char}{Caractere}
\SetKw{Leia}{Leia}
\SetKw{Escreva}{Escreva}
\SetKwComment{Comentario}{// }{} 

%%% Preamble commands (as title, author, ...)
\newcommand{\subject}[1]{\newcommand{\doc@subject}{#1}}
\newcommand{\order}[1]{\newcommand{\doc@order}{#1}}



\newcounter{exes}
\setcounter{exes}{0}
\newenvironment{exeenv}[1]
{
  \addtocounter{exes}{1}
  \noindent
  
  \textbf{Exercício \arabic{exes} ({#1} pts)}
  \parskip
  
}
{
  \newline
}

\newcommand{\question}[2]{
  \addtocounter{exes}{1}
  \noindent
  \textbf{Exercício \arabic{exes} ({#1} pts) - }{#2} ~\newline
}

% Put indentification fields at the beginning of the document
% This command is executed if the document is an exam, with a 'exam' option
\newcommand{\identification}{
  \noindent
  {\large Nome: \hrulefill  ~Matrícula: \rule{4cm}{.1mm}}%
  \par%
  \vskip 2ex%

}



% Header configuration
\fancyhead[R]{
  \@author \\
  Fundamentos de Lógica e Algoritmos \\
  \doc@name~\ifthenelse{\isundefined{\doc@order}}{}{\doc@order}~- \doc@subject\\
  \@date}
\fancyhead[L]{\includegraphics[width=5cm]{logo-ifc-parcial-nova-concordia.pdf}}
\addtolength{\headheight}{70pt}
\renewcommand{\headrulewidth}{1pt}


\AtBeginDocument{
 \ifthenelse{\equal{\doc@type}{exam}}{\identification}{}
 
}
\renewcommand{\maketitle}{}