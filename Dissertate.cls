% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "Dissertate.cls",
%     version         = "2.0",
%     date            = "21 March 2017",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, Dissertate",
%     supported       = "Send email to suchow@post.harvard.edu.",
%     docstring       = "Class for a dissertation."
% --------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Dissertate}[2017/03/21 v2.1 Dissertate Class]
\LoadClass[12pt, twoside, letterpaper, cleardoublepage=empty]{book}

%
% Options
%
\RequirePackage{etoolbox}
\usepackage{eso-pic}
\usepackage{emptypage}


\newenvironment{conditions}
  {\par\vspace{\abovedisplayskip}\noindent\begin{tabular}{>{$}l<{$} @{${}={}$} l}}
  {\end{tabular}\par\vspace{\belowdisplayskip}}

\usepackage{afterpage}
\usepackage{sidecap}
\usepackage{tikz}
    \usetikzlibrary{decorations}
    \usetikzlibrary{intersections}
    \usetikzlibrary{trees}
    \usetikzlibrary{calc}
%    \usetikzlibrary{positioning}


% We need layers to draw the block diagram
\pgfdeclarelayer{background}
\pgfdeclarelayer{foreground}
\pgfsetlayers{background,main,foreground}

\definecolor{cff0000}{RGB}{0,0,255}
\definecolor{f}{RGB}{0,0,0}

%\tikzset{main node/.style={circle,fill=blue!20,draw,minimum size=1cm,inner sep=0pt},}    
  
% UNITS
\usepackage{siunitx}
\sisetup{per=slash, load=abbr}

    % GRAPHICS
\usepackage{pgfplots}
\usetikzlibrary{arrows.new}
\usetikzlibrary{fadings}
\usepgfplotslibrary{units}
\pgfplotsset{width=8cm, compat=1.3}
%\usepackage{amsmath}
%\usepackage{amssymb}
%\usepackage{mathrsfs}
\usepackage{hhline}

% Fix macro spacing bug
\addtolength{\parskip}{-0.5mm}
\setlength{\textfloatsep}{0.1cm}



% Line spacing: dsingle/ddouble
%   Whether to use single- or doublespacing.
\newtoggle{DissertateSingleSpace}
\togglefalse{DissertateSingleSpace}
\DeclareOption{dsingle}{
    \toggletrue{DissertateSingleSpace}
    \ClassWarning{Dissertate}{Single-spaced mode on.}
}
\DeclareOption{ddouble}{\togglefalse{DissertateSingleSpace}}

\ProcessOptions\relax

% Line Spacing
%   Define two line spacings: one for the body, and one that is more compressed.
\iftoggle{DissertateSingleSpace}{
    \newcommand{\dnormalspacing}{1.2}
    \newcommand{\dcompressedspacing}{1.0}
}{
    \newcommand{\dnormalspacing}{1.2}
    \newcommand{\dcompressedspacing}{1.2}
}

% Block quote with compressed spacing
\let\oldquote\quote
\let\endoldquote\endquote
\renewenvironment{quote}
    {\begin{spacing}{\dcompressedspacing}\oldquote}
    {\endoldquote\end{spacing}}

% Itemize with compressed spacing
\let\olditemize\itemize
\let\endolditemize\enditemize
\renewenvironment{itemize}
    {\begin{spacing}{\dcompressedspacing}\olditemize}
    {\endolditemize\end{spacing}}

% Enumerate with compressed spacing
\let\oldenumerate\enumerate
\let\endoldenumerate\endenumerate
\renewenvironment{enumerate}
    {\begin{spacing}{\dcompressedspacing}\oldenumerate}
    {\endoldenumerate\end{spacing}}

% Text layout.
\RequirePackage{mdframed}
\RequirePackage[width=6.1in, letterpaper]{geometry} % 5.75in
\usepackage{ragged2e}
\RaggedRight
%\RequirePackage{pdfpages}
\RequirePackage{graphicx}
\usepackage{fixltx2e}
\parindent 12pt
\RequirePackage{lettrine}
\RequirePackage{setspace}
\RequirePackage{verbatim}
\RequirePackage{placeins}

% Fonts.
\usepackage{amsmath}
\RequirePackage{color}
\RequirePackage{xcolor}
\usepackage{hyperref} 
\RequirePackage[toc, acronyms, automake]{glossaries-extra}
\renewcommand{\glsnamefont}[1]{\textbf{#1}}
\RequirePackage{url}
\newcommand{\vars}{\texttt}
\newcommand{\func}{\textrm}
\RequirePackage{amssymb}
\RequirePackage{mathspec}
\usepackage{xfrac}
\RequirePackage{mathrsfs, esint}
\usepackage{parskip}
\usepackage{balance}
\usepackage{floatrow}
\usepackage{multirow}
\usepackage{etoolbox}
\setlength{\parindent}{15pt}
\usepackage{xspace}
\usepackage{stackengine}

%\setmathsfont(Digits,Latin,Greek)[Numbers={Proportional}]{EB Garamond}
%\setmathrm{EB Garamond}
\AtBeginEnvironment{tabular}{\addfontfeature{RawFeature=+tnum}}
\widowpenalty=300
\clubpenalty=300
%\setromanfont[Numbers=OldStyle,Ligatures={Common, TeX}, Scale=1.0]{EB Garamond}
\newfontfamily{\smallcaps}[RawFeature={+c2sc,+scmp}]{EB Garamond}
\setsansfont[Scale=MatchLowercase, BoldFont={Lato Bold}]{Lato Regular}% Regular
\setmonofont[Scale=MatchLowercase]{Source Code Pro}
\usepackage[labelfont={bf, footnotesize, singlespacing},
                textfont={footnotesize, singlespacing},
                justification={justified},
                singlelinecheck=false,
                margin=0pt,
                figurewithin=chapter,
                tablewithin=chapter,
                tableposition=top]{caption}
\usepackage{subcaption}
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\RequirePackage{microtype}
\usepackage{adjustbox}

% Headings and headers.
\RequirePackage{fancyhdr}
\RequirePackage[tiny, md, sc]{titlesec}
\setlength{\headheight}{15pt}
\pagestyle{plain}
\RequirePackage{titling}

% Front matter.
\setcounter{tocdepth}{1}
\usepackage[titles]{tocloft}
\usepackage[titletoc]{appendix}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\normalsize \scshape}
\renewcommand\listfigurename{Listing of figures}
\renewcommand\listtablename{Listing of tables}

% Endmatter
\renewcommand{\setthesection}{\arabic{chapter}.A\arabic{section}}

% References.
\renewcommand\bibname{References}
\RequirePackage[super,comma,numbers]{natbib}
\renewcommand{\bibnumfmt}[1]{[#1]}
\RequirePackage[palatino]{quotchap}
\renewcommand*{\chapterheadstartvskip}{\vspace*{-0.5\baselineskip}}
\renewcommand*{\chapterheadendvskip}{\vspace{1.3\baselineskip}}

% An environment for paragraph-style section.
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \noindent\textsc{#1}%
}

% Align reference numbers so that they do not cause an indent.
\newlength\mybibindent
\setlength\mybibindent{0pt}
\renewenvironment{thebibliography}[1]
    {\chapter*{\bibname}%
     \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
     \list{\@biblabel{\@arabic\c@enumiv}}
          {\settowidth\labelwidth{\@biblabel{999}}
           \leftmargin\labelwidth
            \advance\leftmargin\dimexpr\labelsep+\mybibindent\relax\itemindent-\mybibindent
           \@openbib@code
           \usecounter{enumiv}
           \let\p@enumiv\@empty
           \renewcommand\theenumiv{\@arabic\c@enumiv}}
     \sloppy
     \clubpenalty4000
     \@clubpenalty \clubpenalty
     \widowpenalty4000%
     \sfcode`\.\@m}
    {\def\@noitemerr
      {\@latex@warning{Empty `thebibliography' environment}}
     \endlist}

% Some definitions.
\def\advisor#1{\gdef\@advisor{#1}}
\def\coadvisorOne#1{\gdef\@coadvisorOne{#1}}
\def\coadvisorTwo#1{\gdef\@coadvisorTwo{#1}}
\def\committeeInternal#1{\gdef\@committeeInternal{#1}}
\def\committeeInternalOne#1{\gdef\@committeeInternalOne{#1}}
\def\committeeInternalTwo#1{\gdef\@committeeInternalTwo{#1}}
\def\committeeExternal#1{\gdef\@committeeExternal{#1}}
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degreeterm#1{\gdef\@degreeterm{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\department#1{\gdef\@department{#1}}
\def\field#1{\gdef\@field{#1}}
\def\university#1{\gdef\@university{#1}}
\def\universitycity#1{\gdef\@universitycity{#1}}
\def\universitystate#1{\gdef\@universitystate{#1}}
\def\programname#1{\gdef\@programname{#1}}
\def\pdOneName#1{\gdef\@pdOneName{#1}}
\def\pdOneSchool#1{\gdef\@pdOneSchool{#1}}
\def\pdOneYear#1{\gdef\@pdOneYear{#1}}
\def\pdTwoName#1{\gdef\@pdTwoName{#1}}
\def\pdTwoSchool#1{\gdef\@pdTwoSchool{#1}}
\def\pdTwoYear#1{\gdef\@pdTwoYear{#1}}
% School name and location
\university{Bielefeld University}
\universitycity{Bielefeld}
\universitystate{Germany}

% School color found from university's graphic identity site:
% http://isites.harvard.edu/icb/icb.do?keyword=k75408&pageid=icb.page392732
\definecolor{SchoolColor}{rgb}{0, 0, 0} % black
\definecolor{chaptergrey}{rgb}{0.5, 0.5, 0.5} % for chapter numbers

%{RGB}{206, 17, 38}
%{rgb}{0.5, 0.5, 0.5} 

\hypersetup{
    colorlinks,
    citecolor=gray,
    filecolor=black,
    linkcolor=black,
    urlcolor=gray,
}

% Formatting guidelines found in:
% http://www.gsas.harvard.edu/publications/form_of_the_phd_dissertation.php
\renewcommand{\frontmatter}{
	\input{frontmatter/personalize}
	\maketitle
	\copyrightpage
	\abstractpage
	\tableofcontents
	% \listoffigures % optional
	\authorlist
	\dedicationpage
	\clearpage
	\acknowledgments
}

\renewcommand{\maketitle}{
	\vspace*{\fill}
%	\vspace{100pt}
	\begin{center}
	\Huge \textcolor{SchoolColor}{\thetitle} \normalsize \\
	\vspace{100pt}
	\textsc{a dissertation submitted \\ by\\
	\theauthor\\ to the \@department\\ Faculty of Technology\\
	\vspace{12pt}
	in partial fulfillment of the requirements\\
	for the degree of\\ \@degree\\
	in the subject of\\ \@field\\
	\vspace{12pt}
	\@university\\ \@universitycity, \@universitystate\\
	\@degreemonth\ \@degreeyear}
	\end{center} \vspace*{\fill}
}

\newcommand{\copyrightpage}{
	\cleardoublepage
	\thispagestyle{empty}
	\vspace*{\fill}
	\scshape \noindent \small \copyright \small 2017 \hspace{3pt}-- \theauthor \\
	\noindent all rights reserved.
	\vspace*{\fill}
	\vfill
	\noindent Printed on non-ageing paper according to DIN-ISO 9706.
	\newpage
	\rm
}

\newcommand{\abstractpage}{
	\cleardoublepage
	\newpage
	\pagenumbering{roman}
	\setcounter{page}{3}
	\pagestyle{fancy}
	\lhead{Thesis advisor: apl. Prof. Dr.-Ing. \@advisor \\Thesis co-advisor: Prof. Dr. \@coadvisorOne}
	\rhead{\@author}
	
	\renewcommand{\headrulewidth}{0.0pt}
	\begin{center}
	\vspace*{35pt}
%	\Large \textcolor{white}{\@title} 
	\normalsize
	\scshape Abstract \\ \rm
	\end{center}
	\vspace*{\fill}
	\input{frontmatter/abstract}
	\newpage \lhead{} \rhead{}
	\cfoot{\thepage}
	\cleardoublepage
}


\newcommand{\authorlist}{
	\cleardoublepage 
	\newpage \thispagestyle{fancy} \vspace*{\fill}
	\scshape \noindent \input{frontmatter/authorlist}
	\vspace*{\fill} \newpage \rm
}

\newcommand{\dedicationpage}{
	\cleardoublepage 
	\newpage \thispagestyle{fancy} \vspace*{\fill}
	\scshape \noindent \input{frontmatter/dedication}
	\vspace*{\fill} \newpage \rm
}

\newcommand{\acknowledgments}{
	\chapter*{Acknowledgments}
	\noindent
	\input{frontmatter/thanks}
	\vspace*{\fill} \newpage \thispagestyle{empty} \mbox{} \newpage \thispagestyle{empty}
	\setcounter{page}{1}
	\pagenumbering{arabic}
}


\renewcommand{\backmatter}{
    % Appendix A
    \begin{appendices}
        \include{chapters/appendixA}
     	\include{chapters/appendixD}
       	\include{chapters/appendixB}
        \include{chapters/appendixC}
    \end{appendices}
    \clearpage
    % Acronyms and Glossary
    \input{endmatter/personalize}
    \clearpage
    % References
    \bibliography{references}
    \addcontentsline{toc}{chapter}{References}
    \bibliographystyle{unsrt}%apalike2}
    \clearpage
    % Colophon
%    \include{endmatter/colophon}
}
