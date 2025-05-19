\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{doccv}[2012/11/27Documented curriculum vitae]

\LoadClassWithOptions{book}



% l10n
\RequirePackage{babel}
\RequirePackage{datetime}
\newcommand\foreign[1]{\foreignlanguage{english}{\textit{#1}}}

% Enable UTF-8 support
%
\usepackage[utf8]{inputenc}

% Select font encoding.
%
\RequirePackage[T1]{fontenc}
\RequirePackage{libertine}


% Set paper margin
%
\RequirePackage[pdftex]{geometry}
\geometry{left=20mm,right=20mm,top=20mm,bottom=20mm}


% Title formatting
%
\RequirePackage[pagestyles,noindentafter,rigidchapters,largestsep]{titlesec}
%
% Add a dot after the section/subsection/etc counters.
\titlelabel{\thetitle.\quad}
%
% titlespacing{<command>}{<left>}{<before>}{<after>}[<right>]
\titlespacing{\section}{0pt}{1.2em}{.8em}[0pt]


% Yes, we need URLs
%
% \RequirePackage[obeyspaces, spaces]{url}
\RequirePackage[colorlinks=true,linktocpage=true]{hyperref}
\newcommand{\hlabel}{\phantomsection\label}

% Configure line spacing to 1.5
%
\RequirePackage{setspace}
\onehalfspace


% Graphics support
%
\RequirePackage[pdftex]{graphicx}
\RequirePackage{epstopdf}
%
% Allow strange filenames
\RequirePackage[encoding,space,babel,multidot]{grffile}


% PDF configuration
%
% Allow the inclusion of PDF files (faster and more flexible than includegraphics
\RequirePackage{pdfpages}
%
% Set up compression level
\pdfminorversion=7
\pdfcompresslevel=9
\pdfobjcompresslevel=3
%
% Set up PDF metadata
\newcommand{\metadata}{
	\pdfinfo {
		/Title (\@title)
		/Author (\@author)
		/Keywords (CV resume \@author)
		/CreationDate (D:\pdfdate)
		/ModDate (D:\pdfdate)
	}
}

% Disable hyphenation
%
% \RequirePackage[none]{hyphenat}


% Avoids widow lines (do not set a value higher than 10000 as this may disable
% the intended behaviour, do not ask me why!).
%
\widowpenalty = 9999
\clubpenalty = 9999


% Configuration
%
\def\address#1{\gdef\@address{#1}}%
\def\@address{\@latex@error{No \noexpand\address given}\@ehc}%
%
\def\fulldate#1{\gdef\@fulldate{#1}}%
\def\@fulldate{\@latex@error{No \noexpand\fulldate given}\@ehc}%


% Format title page
%
\renewcommand{\maketitle}{%
	\thispagestyle{empty}
	\hspace{0pt}
	\vfill
	\begin{center}
		\vspace{3cm}
		{\par \LARGE \bfseries\ \@title}
		\vspace*{4cm}
		{\par \Large \@author}
		\vfill
		{\par \large \@address}
		\vspace*{1.5cm}
		{\par \large \@fulldate}
	\end{center}
}


% Appendix
%
\RequirePackage{appendix}
\renewcommand{\appendixpagename}{Documentos comprobatórios}
\renewcommand{\appendixtocname}{Documentos comprobatórios}
\let\origappendix=\appendix
\renewcommand\appendix{
	\origappendix
	\cleardoublepage
	\addappheadtotoc
	\appendixpage
}


% Random hacks. Use them, trust me
%
\setlength{\headheight}{16pt}
\setlength{\fboxsep}{0pt}
\pretolerance=500
\tolerance=500
\setlength{\emergencystretch}{3em}
\RequirePackage[final, babel]{microtype}


% Do not use the chapter title on the page head (bug 94)
%
\if@twoside
	\def\ps@headings{
		\let\@oddfoot\@empty
		\let\@evenfoot\@empty
		\def\@evenhead{\thepage\hfil}
		\def\@oddhead{\hfil\thepage}
		\let\@mkboth\markboth
	}
\else
	\def\ps@headings{
		\let\@oddfoot\@empty
		\def\@oddhead{\hfil\thepage}
		\let\@mkboth\markboth
	}
\fi

% Bug 94
\renewcommand\tableofcontents{
	\cleardoublepage
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\section*{\contentsname}
	\@starttoc{toc}
	\if@restonecol
		\twocolumn
	\fi
	\clearpage{\pagestyle{empty}\cleardoublepage}
}


% Pretty chapter start at frontmatter
\newpagestyle{frontmatter}{
	\sethead{}
		{}
		{}
	\setfoot{}
		{\thepage}
		{}
}

% Pretty chapter start at mainmatter
\newpagestyle{mainmatter}[\small\sffamily]{
	\headrule
	\sethead{}
		{}
		{}
	\setfoot{}
		{\thepage}
		{}
}

% Pretty chapter start at backmatter
\newpagestyle{backmatter}{
	\headrule
	\sethead{}
		{}
		{}
	\setfoot{}
		{\thepage}
		{}
}

\renewcommand\frontmatter{%
	\cleardoublepage
	\@mainmatterfalse
	\pagestyle{frontmatter}
	\pagenumbering{roman}
}

\renewcommand\mainmatter{
	\cleardoublepage
	\@mainmattertrue
	\pagenumbering{arabic}
}

\renewcommand\backmatter{%
	\cleardoublepage
	\@mainmatterfalse
}

\renewcommand\thesection{\@arabic\c@section}

\RequirePackage{calc}

\newcommand{\signature}{
	\begin{flushright}
		\vspace*{2.5cm}
		\par \@address, \@fulldate.

		\vspace*{3cm}
%		\par \line(1,0){\widthof{\@author}}
		\par \line(1,0){180}
		\\\@author
	\end{flushright}
}

\newcommand{\bold}[1]{\noindent\textbf{#1}}
\newcommand{\doc}[1]{  
    \par
    \vspace*{-6pt}
    \hfill\textbf{[%
		\hypertarget{\detokenize{Anchor#1}}{
			\hyperlink{\detokenize{Doc#1}}{Doc. #1, p.~\pageref{PageDoc#1}}
		}
	]}
}

\newcommand{\docheader}[2]{
	\clearpage
	\lhead{%
		\hypertarget{Doc#1}{
			\hyperlink{\detokenize{Anchor#1}}{\small\textbf{#1} -- #2}
		}
	}
	\hlabel{PageDoc#1}
}
