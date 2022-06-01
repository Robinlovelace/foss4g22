% Document class for ISPRS Publications
% Version 2020-12-15
% Copyright (C) 1999 by Carsten Steger
% Minor modifications January, 2000 by Rolf A. de By
% Modified March 2002 according to ISPRS "Orange Book" for 2 column-layout
% Added intercommission working group commdn \icwg, 01/12/2015 Konrad Schindler
% Modified Jan 2019 to match current Word template (Dennis Wittich)
% Modified Dec 2019 to include the date of revision of the template(s) (Clement Mallet)

\NeedsTeXFormat{LaTeX2e}[1996/06/01]
\ProvidesClass{isprs}[2000/01/15 Class for ISPRS Publications]
\RequirePackage{times}
\RequirePackage{epsfig}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass[a4paper]{article}
\def\partname{Part}
\def\contentsname{Contents}
\def\listfigurename{List of Figures}
\def\listtablename{List of Tables}
\def\refname{References}
\def\indexname{Index}
\def\figurename{Figure}
\def\tablename{Table}
\def\abstractname{Abstract}
\def\kurzfassungname{Kurzfassung}
\def\resumename{R\'esum\'e}
\def\commissionname{\bf{Commission}}
\def\workinggroupname{\bf{WG}}
\def\icwgname{\bf{ICWG}}
\def\keywordsname{Key Words}


\@twocolumntrue


\lineskip 1pt
\normallineskip 1pt
\def\baselinestretch{1.17} % KAO: Increased spacing to more closely match 
\newcommand\titlesize{%
   \fontsize{12}{12}\selectfont}


\renewcommand\normalsize{%
   \fontsize{9.25}{9.25}\selectfont % DW: Increased font size to more closely match 
   %\@setfontsize\normalsize\@ixpt\@xipt %Aenderung
   \abovedisplayskip 9\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
   
   
\renewcommand\small{%
   \@setfontsize\small\@ixpt{11}%
   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip}

\renewcommand\footnotesize{%
   \@setfontsize\footnotesize\@viiipt{9.5}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip}

\renewcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\renewcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\renewcommand\large{\@setfontsize\large\@xiipt{14}}
\renewcommand\Large{\@setfontsize\Large\@xivpt{18}}
\renewcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\renewcommand\huge{\@setfontsize\huge\@xxpt{25}}
\renewcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}

\normalsize

\oddsidemargin 0.0cm % was -0.5cm
\evensidemargin 0.0cm % was -0.5cm
\marginparwidth 0.0cm % was 1.5cm
\marginparsep 0.0cm % was 0.25cm

\topmargin -39pt% was -51pt

\headheight 12pt
\headsep 38pt% was 30pt
\topskip 9pt

\footskip 30pt

\textheight 24.7cm
\textwidth 17cm

\columnsep 0.6cm
\columnseprule 0pt

\footnotesep 5.65pt

\skip\footins 8pt plus 4pt minus 2pt

\floatsep 8pt plus 2pt minus 2pt

\textfloatsep 10pt plus 2pt minus 4pt

\intextsep 8pt plus 2pt minus 2pt

\dblfloatsep 8pt plus 2pt minus 2pt

\dbltextfloatsep 10pt plus 2pt minus 4pt

\@fptop 0pt plus 1fil

\@fpsep 8pt plus 2fil
\@fpbot 0pt plus 1fil

\@dblfptop 0pt plus 1fil

\@dblfpsep 8pt plus 2fil
\@dblfpbot 0pt plus 1fil

\marginparpush 5pt

\parskip 2.4ex plus 3pt minus 3pt %was 1.5 ex

\partopsep 2pt plus 1pt minus 1pt

\setcounter{secnumdepth}{3}

\def\@startsection#1#2#3#4#5#6{\if@noskipsec \leavevmode \fi
   \par \@tempskipa #4\relax
   \@afterindenttrue
   \ifdim \@tempskipa <\z@ \@tempskipa -\@tempskipa \@afterindentfalse\fi
   \if@nobreak \everypar{}\else
     \addpenalty{\@secpenalty}\addvspace{\@tempskipa}\fi \@ifstar
     {\@ssect{#3}{#4}{#5}{#6}}{\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}

\def\@sect#1#2#3#4#5#6[#7]#8{\ifnum #2>\c@secnumdepth
     \let\@svsec\@empty\else
     \refstepcounter{#1}\edef\@svsec{\csname the#1\endcsname\hskip 1em}\fi
     \@tempskipa #5\relax
      \ifdim \@tempskipa>\z@
        \begingroup #6%
          {\@hangfrom{\hskip #3\relax\@svsec}{\interlinepenalty \@M #8\par}}%
        \endgroup
       \csname #1mark\endcsname{#7}\addcontentsline
         {toc}{#1}{\ifnum #2>\c@secnumdepth \else
                      \protect\numberline{\csname the#1\endcsname}\fi
                    #7}\else
        \def\@svsechd{#6\hskip #3\relax  %% \relax added 2 May 90
                   \@svsec #8\csname #1mark\endcsname
                      {#7}\addcontentsline
                           {toc}{#1}{\ifnum #2>\c@secnumdepth \else
                             \protect\numberline{\csname the#1\endcsname}\fi
                       #7}}\fi
     \@xsect{#5}}

\def\@xsect#1{\@tempskipa #1\relax
      \ifdim \@tempskipa>\z@
       \par \nobreak
       \vskip \@tempskipa
       \@afterheading
    \else \global\@nobreakfalse \global\@noskipsectrue
       \everypar{\if@noskipsec \global\@noskipsecfalse
                   \clubpenalty\@M \hskip -\parindent
                   \begingroup \@svsechd \endgroup \unskip
                   \hskip -#1\relax  % relax added 14 Jan 91
                  \else \clubpenalty \@clubpenalty
                    \everypar{}\fi}\fi\ignorespaces}

\def\@ssect#1#2#3#4#5{\@tempskipa #3\relax
   \ifdim \@tempskipa>\z@
     \begingroup #4%
       {\@hangfrom{\hskip #1}{\interlinepenalty \@M #5\par}}%
     \endgroup
   \else \def\@svsechd{#4\hskip #1\relax #5}\fi
    \@xsect{#3}}

%\def\section{\@startsection {section}{1}{\z@}{-3.15ex plus-0.45ex minus
%    -.2ex}{1.35ex plus.18ex}{\reset@font\normalsize\bf\centering\uppercase}}
%\def\section{\@startsection {section}{1}{\z@}{-3.15ex plus-0.45ex minus
%    -.2ex}{1.35ex plus.18ex}{\reset@font\normalsize\bf\uppercase}}
%\def\subsection{\@startsection{subsection}{2}{\z@}{-1.35ex plus-0.45ex
%    minus-.2ex}{1.35ex plus.18ex}{\reset@font\normalsize\bf}}
%\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{1.35ex plus
%    0.45ex minus.2ex}{-1em}{\reset@font\normalsize\bf}}
%\def\paragraph{\@startsection
%     {paragraph}{4}{\z@}{1.35ex plus0.9ex minus.2ex}{-1em}{\reset@font
%     \normalsize\bf}}
%\def\subparagraph{\@startsection
%     {subparagraph}{4}{\parindent}{1.35ex plus0.9ex minus.2ex}{-1em}{\reset@font
%     \normalsize\bf}}
\def\section{\@startsection {section}{1}{\z@}{-2.05ex plus-0.3ex minus
    -.2ex}{0.6ex plus.12ex}{\reset@font\normalsize\bf\centering\uppercase}} %Aenderung cenetring
\def\subsection{\@startsection{subsection}{2}{\z@}{-0.15ex plus-0.35ex
    minus-.2ex}{0.3ex plus.12ex}{\reset@font\normalsize\bf}}
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{0.15ex plus
    0.1ex minus.2ex}{-1em}{\reset@font\normalsize\bf}}
\def\paragraph{\@startsection
     {paragraph}{4}{\z@}{0.15ex plus0.1ex minus.1ex}{-1em}{\reset@font
     \normalsize\bf}}
\def\subparagraph{\@startsection
     {subparagraph}{4}{\parindent}{0.15ex plus0.1ex minus.1ex}{-1em}{\reset@font
     \normalsize\bf}}

\def\appendix{\par
  \setcounter{section}{0}
  \setcounter{subsection}{0}
  \def\thesection{\Alph{section}}}

\leftmargini 5pt
\leftmarginii 22pt
\leftmarginiii 18.7pt
\leftmarginiv 17pt
\leftmarginv 10pt
\leftmarginvi 10pt

\leftmargin\leftmargini
\labelsep 5pt
\labelwidth\leftmargini\advance\labelwidth-\labelsep

\def\@listI{\leftmargin\leftmargini \parsep 4\p@ plus2\p@ minus\p@
\topsep 4\p@ plus2\p@ minus4\p@
\itemsep 4\p@ plus2\p@ minus\p@}

\let\@listi\@listI
\@listi

\def\@listii{\leftmargin\leftmarginii
   \labelwidth\leftmarginii\advance\labelwidth-\labelsep
   \topsep 4\p@ plus2\p@ minus\p@
   \parsep 2\p@ plus\p@ minus\p@
   \itemsep \parsep}

\def\@listiii{\leftmargin\leftmarginiii
    \labelwidth\leftmarginiii\advance\labelwidth-\labelsep
    \topsep 2\p@ plus\p@ minus\p@
    \parsep \z@ \partopsep \p@ plus\z@ minus\p@
    \itemsep \topsep}

\def\@listiv{\leftmargin\leftmarginiv
     \labelwidth\leftmarginiv\advance\labelwidth-\labelsep}

\def\@listv{\leftmargin\leftmarginv
     \labelwidth\leftmarginv\advance\labelwidth-\labelsep}

\def\@listvi{\leftmargin\leftmarginvi
     \labelwidth\leftmarginvi\advance\labelwidth-\labelsep}

\def\labelenumi{\theenumi.}
\def\theenumi{\arabic{enumi}}

\def\labelenumii{(\theenumii)}
\def\theenumii{\alph{enumii}}
\def\p@enumii{\theenumi}

\def\labelenumiii{\theenumiii.}
\def\theenumiii{\roman{enumiii}}
\def\p@enumiii{\theenumi(\theenumii)}

\def\labelenumiv{\theenumiv.}
\def\theenumiv{\Alph{enumiv}}
\def\p@enumiv{\p@enumiii\theenumiii}

\def\labelitemi{$\m@th\bullet$}
\def\labelitemii{\bf --}
\def\labelitemiii{$\m@th\ast$}
\def\labelitemiv{$\m@th\cdot$}

\def\verse{\let\\=\@centercr
  \list{}{\itemsep\z@ \itemindent -1.5em\listparindent \itemindent
          \rightmargin\leftmargin\advance\leftmargin 1.5em}\item[]}
\let\endverse\endlist

\def\quotation{\list{}{\listparindent 1.5em
    \itemindent\listparindent
    \rightmargin\leftmargin \parsep \z@ plus\p@}\item[]}
\let\endquotation=\endlist

\def\quote{\list{}{\rightmargin\leftmargin}\item[]}
\let\endquote=\endlist

\def\descriptionlabel#1{\hspace\labelsep \bf #1}
\def\description{\list{}{\labelwidth\z@ \itemindent-\leftmargin
       \let\makelabel\descriptionlabel}}

\let\enddescription\endlist

\def\theequation{\arabic{equation}}

\def\titlepage{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
     \else \newpage \fi \thispagestyle{empty}\c@page\z@}

\def\endtitlepage{\if@restonecol\twocolumn \else \newpage \fi}

\arraycolsep 5pt

\tabcolsep 6pt

\arrayrulewidth .4pt
\doublerulesep 2pt

\tabbingsep \labelsep

\skip\@mpfootins = \skip\footins

\fboxsep = 3pt

\fboxrule = .4pt


\def\thepart{\Roman{part}}
% \def\thesection{\arabic{section}.}  %\def\thesection{\arabic{section}} 14-02-28 Markus Englich

\RequirePackage{titlesec} % 2016-01-09 Filip Biljecki
\titleformat{\section}
    {\centering\bfseries}{\thesection.}{0.85em}{\normalsize\bf\uppercase}{}
\def\thesection{\arabic{section}}
\def\thesubsection{\thesection.\arabic{subsection}} % 2016-01-09 Filip Biljecki
% \def\thesubsection{\thesection\arabic{subsection}}  %\def\thesubsection{\thesection.\arabic{subsection}} 14-02-28 Markus Englich
\def\thesubsubsection{\thesubsection .\arabic{subsubsection}}  
\def\theparagraph{\thesubsubsection.\arabic{paragraph}}
\def\thesubparagraph{\theparagraph.\arabic{subparagraph}}


\def\part{\par
   \addvspace{4ex}
   \@afterindentfalse
   \secdef\@part\@spart}

\def\@part[#1]#2{\ifnum \c@secnumdepth >\m@ne
        \refstepcounter{part}
        \addcontentsline{toc}{part}{\thepart
        \hspace{1em}#1}\else
      \addcontentsline{toc}{part}{#1}\fi
   {\parindent \z@ \raggedright
    \interlinepenalty \@M
    \ifnum \c@secnumdepth >\m@ne
      \Large \bf \partname~\thepart%   THEN Print '\partname' and
      \par\nobreak
    \fi
    \huge \bf
    #2%
    \markboth{}{}\par
   }\nobreak
   \vskip 3ex
   \@afterheading
  }

\def\@spart#1{{\parindent \z@ \raggedright
    \interlinepenalty \@M
    \huge \bf
    #1\par}
    \nobreak
    \vskip 3ex
    \@afterheading
  }

\def\@pnumwidth{1.55em}
\def\@tocrmarg {2.55em}
\def\@dotsep{4.5}
\setcounter{tocdepth}{3}

\def\tableofcontents{\section*{\contentsname
        \@mkboth{\MakeUppercase{\contentsname}}{\MakeUppercase{\contentsname}}}%
  \@starttoc{toc}}

\def\l@part#1#2{\addpenalty{\@secpenalty}%
   \addvspace{2.25em plus\p@}%
   \begingroup
   \@tempdima 3em
     \parindent \z@ \rightskip \@pnumwidth
     \parfillskip -\@pnumwidth
     {\large \bf
     \leavevmode
     #1\hfil \hbox to\@pnumwidth{\hss #2}}\par
     \nobreak
   \endgroup}

\def\l@section#1#2{\addpenalty{\@secpenalty}% good place for page break
   \addvspace{1.0em plus\p@}%
   \@tempdima 1.5em
   \begingroup
     \parindent \z@ \rightskip \@pnumwidth
     \parfillskip -\@pnumwidth
     \bf
     \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
     #1\nobreak\hfil \nobreak\hbox to\@pnumwidth{\hss #2}\par
   \endgroup}

\def\l@subsection{\@dottedtocline{2}{1.5em}{2.3em}}
\def\l@subsubsection{\@dottedtocline{3}{3.8em}{3.2em}}
\def\l@paragraph{\@dottedtocline{4}{7.0em}{4.1em}}
\def\l@subparagraph{\@dottedtocline{5}{10em}{5em}}

\def\listoffigures{\section*{\listfigurename
    \@mkboth{\MakeUppercase{\listfigurename}}{\MakeUppercase{\listfigurename}}}%
  \@starttoc{lof}}

\def\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}

\def\listoftables{\section*{\listtablename\@mkboth
   {\MakeUppercase{\listtablename}}{\MakeUppercase{\listtablename}}}%
  \@starttoc{lot}}
\let\l@table\l@figure

\def\thebibliography#1{\section*{\expandafter\MakeUppercase\expandafter{\refname}%
    \@mkboth{\MakeUppercase{\refname}}{\MakeUppercase{\refname}}}\list
  {\@biblabel{\arabic{enumiv}}}{\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin 0pt
    \labelwidth 0pt
    \labelsep 0pt
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \def\theenumiv{\arabic{enumiv}}}%
    \def\newblock{\hskip .11em plus.33em minus.07em}%
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=1000\relax}

\def\endthebibliography{%
  \def\@noitemerr{\@warning{Empty `thebibliography' environment}}%
  \endlist}

\def\cite{\@ifnextchar [{\@tempswatrue\@citex}{\@tempswafalse\@citex[]}}

\def\@citex[#1]#2{\if@filesw\immediate\write\@auxout{\string\citation{#2}}\fi
  \let\@citea\@empty
  \@cite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{,\ }%
     \def\@tempa##1##2\@nil{\edef\@citeb{\if##1\space##2\else##1##2\fi}}%
     \expandafter\@tempa\@citeb\@nil
     \@ifundefined{b@\@citeb}{{\reset@font\bf ?}\@warning
       {Citation `\@citeb' on page \thepage \space undefined}}%
     {\csname b@\@citeb\endcsname}}}{#1}}

\def\@cite#1#2{({#1\if@tempswa , #2\fi})}
\def\@biblabel#1{}

\newif\if@restonecol

\def\theindex{\@restonecoltrue\if@twocolumn\@restonecolfalse\fi
\columnseprule \z@
\columnsep 35\p@\twocolumn[\section*{\indexname}]%
    \@mkboth{\MakeUppercase{\indexname}}{\MakeUppercase{\indexname}}%
    \thispagestyle{plain}\parindent\z@
    \parskip\z@ plus.3\p@\relax\let\item\@idxitem}

\def\@idxitem{\par\hangindent 40\p@}

\def\subitem{\par\hangindent 40\p@ \hspace*{20\p@}}

\def\subsubitem{\par\hangindent 40\p@ \hspace*{30\p@}}

\def\endtheindex{\if@restonecol\onecolumn\else\clearpage\fi}

\def\indexspace{\par \vskip 10\p@ plus5\p@ minus3\p@\relax}

\def\footnoterule{\kern-3\p@
  \hrule width .4\columnwidth
  \kern 2.6\p@}

\long\def\@makefntext#1{\parindent 1em\noindent
            \hbox to1.8em{\hss$\m@th^{\@thefnmark}$}#1}

\setcounter{topnumber}{2}
\def\topfraction{.7}
\setcounter{bottomnumber}{1}
\def\bottomfraction{.3}
\setcounter{totalnumber}{3}
\def\textfraction{.2}
\def\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\def\dbltopfraction{.7}
\def\dblfloatpagefraction{.5}

\long\def\@makecaption#1#2{%
   \vskip 4\p@
   \setbox\@tempboxa\hbox{#1: #2}%
   \ifdim \wd\@tempboxa >\hsize
       #1: #2\par
     \else
       \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
   \fi}

\def\thefigure{\@arabic\c@figure}

\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\def\figure{\@float{figure}}
\let\endfigure\end@float
\@namedef{figure*}{\@dblfloat{figure}}
\@namedef{endfigure*}{\end@dblfloat}

% Maybe ISPRS will change its mind again and number figures and tables
% together... so leave this in as a comment so that it can be switched
% quickly...
%\let\c@table\c@figure
%\let\p@table\p@figure
%\let\cl@table\cl@figure
\def\thetable{\@arabic\c@table}

\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\def\table{\@float{table}}
\let\endtable\end@float
\@namedef{table*}{\@dblfloat{table}}
\@namedef{endtable*}{\end@dblfloat}

\def\maketitle{\par
 \begingroup
   \def\thefootnote{\fnsymbol{footnote}}%
   \def\@makefnmark{\hbox
       to\z@{$\m@th^{\@thefnmark}$\hss}}%
   \if@twocolumn
     \twocolumn[\@maketitle]%
     \else \newpage
     \global\@topnum\z@
     \@maketitle \fi\@thanks
 \endgroup
 \setcounter{footnote}{0}%
 \let\maketitle\relax
 \let\@maketitle\relax
 \gdef\@thanks{}\gdef\@author{}\gdef\@address{}\gdef\@title{}\let\thanks\relax}

\def\@maketitle{\newpage
 \null
 \vspace*{-1.2em}
 \begin{center}%
%  {\normalsize\bf\expandafter\uppercase\expandafter{\@title} \par}%
  {\titlesize\bf\expandafter\MakeUppercase\expandafter{\@title} \par}%
  %{\normalsize \ifx\@empty\@version\else%
  %   (Version \@version)%
  %  \fi}	 
  \vskip 5ex %Aenderung
  {\normalsize
%   \lineskip .5em
%   \begin{tabular}[t]{c}\@author
   \begin{tabular}[t]{c}{\@author}\\ %Aenderung
     \\
     \@address
   \end{tabular}\par}%
  \vskip 3ex
  {\normalsize%
    \ifx\@empty\@commission\else%
     \commissionname\ \@commission%
    \fi%
    \ifx\@empty\@workinggroup\else%
      \workinggroupname\ \@workinggroup%
    \fi%
    \ifx\@empty\@icwg\else%
      \icwgname\ \@icwg%
    \fi%
%    \fi%
  }%
 \end{center}%
 \par
 \ifx\@empty\@keywords\else%
  \vspace*{1pt}% was \vskip 3ex
  \vskip 2ex %Aenderung
  \normalsize{\bf\expandafter\MakeUppercase\expandafter{\keywordsname}:}
  \@keywords\par
 \fi
 \ifx\@empty\@abstract\else%
  \vskip \baselineskip% was 2\baselinskip
  \vskip 3ex%Aenderung
  \normalsize{\bf\expandafter\MakeUppercase\expandafter{\abstractname}:\par
    \vskip \baselineskip}
  {\parskip 0ex plus 2pt minus 2pt \@abstract}\par  
 \fi
 \vskip 2\baselineskip% from 1 back to 2\baselineskip 14-02-28 Markus Englich
 }

\def\@abstract{}
\long\def\abstract#1{\gdef\@abstract{#1}}
\def\@kurzfassung{}
\long\def\kurzfassung#1{\gdef\@kurzfassung{#1}}
\def\@resume{}
\long\def\resume#1{\gdef\@resume{#1}}
\def\@commission{}
\def\@workinggroup{}
\def\commission#1#2{\gdef\@commission{#1}\gdef\@workinggroup{#2}}
\def\@keywords{}
\def\keywords#1{\gdef\@keywords{#1}}

\mark{{}{}}

\def\ps@headings{\let\@mkboth\markboth
 \def\@oddfoot{}\def\@evenfoot{}%       No feet.
 \def\@evenhead{\rm \thepage\hfil \sl \leftmark}%        Left heading.
 \def\@oddhead{{\sl \rightmark}\hfil \rm\thepage}% Right heading.
 \def\sectionmark##1{\markboth {\MakeUppercase{\ifnum \c@secnumdepth >\z@
   \thesection\hskip 1em\relax \fi ##1}}{}}%
 \def\subsectionmark##1{\markright {\ifnum \c@secnumdepth >\@ne
         \thesubsection\hskip 1em\relax \fi ##1}}}

\def\ps@myheadings{\let\@mkboth\@gobbletwo
 \def\@oddhead{{\sl\rightmark}\hfil \rm\thepage}%
 \def\@oddfoot{}\def\@evenhead{\rm \thepage\hfil\sl\leftmark}%
 \def\@evenfoot{}\def\sectionmark##1{}\def\subsectionmark##1{}}

\def\ps@isprsheadings{\let\@mkboth\markboth
  \def\@oddfoot{}\def\@evenfoot{}% No feet.
  \def\@evenhead{\vbox{\hbox to\textwidth{\normalsize\@isprsheadingtext}
      \vskip 2pt\hrule width\textwidth\relax}}
  \def\@oddhead{\vbox{\hbox to\textwidth{\normalsize\@isprsheadingtext}
      \vskip 2pt\hrule width\textwidth\relax}}}


\newcommand{\address}[1]{\gdef\@address{#1}}
\newcommand{\workinggroup}[1]{\gdef\@workinggroup{#1}}
\newcommand{\icwg}[1]{\gdef\@icwg{#1}}
\newcommand{\version}[1]{\gdef\@version{#1}}

\newcommand{\isprsvol}[1]{\gdef\@isprsvol{#1}}
\newcommand{\@isprsvol}{\@latex@warning@no@line{No \noexpand\isprsvol
    given (use \noexpand\isprsvol{32}, for example)}
    \gdef\@isprsvol{}}
\newcommand{\isprspart}[1]{\gdef\@isprspart{#1}}
\newcommand{\@isprspart}{\@latex@warning@no@line{No \noexpand\isprspart
    given (use \noexpand\isprspart{3--4W2}, for example)}
    \gdef\@isprspart{}}
\newcommand{\isprsmeeting}[1]{\gdef\@isprsmeeting{#1}}
\newcommand{\@isprsmeeting}{\@latex@warning@no@line{No \noexpand\isprsmeeting
    given (use \noexpand\isprsmeeting{3D Reconstruction and Modeling
      of Topographic Objects}, for example)}
    \gdef\@isprsmeeting{}}
\newcommand{\isprsplace}[1]{\gdef\@isprsplace{#1}}
\newcommand{\@isprsplace}{\@latex@warning@no@line{No \noexpand\isprsplace
    given (use \noexpand\isprsplace{Stuttgart}, for example)}
    \gdef\@isprsplace{}}
\newcommand{\isprsdate}[1]{\gdef\@isprsdate{#1}}
\newcommand{\@isprsdate}{\@latex@warning@no@line{No \noexpand\isprsdate
    given (use \noexpand\isprsdate{September 17--19, 1997}, for example)}
    \gdef\@isprsdate{}}
\newcommand{\@iaprsname}{IAPRS}
\newcommand{\@iaprsvolname}{Vol.}
\newcommand{\@iaprspartname}{Part}

%\def\@isprsheadingtext{\@iaprsname, \@iaprsvolname~\@isprsvol, 
%  \@iaprspartname~\@isprspart,\ \hfil``\@isprsmeeting'',\ \hfil
%  \@isprsplace, \@isprsdate}

\def\@isprsheadingtext{\ \hfil ISPRS, Vol.~XXXIII, Amsterdam, 2000\ \hfil}


% \twocolumn
\flushbottom
\parindent 0pt
\leftmargini 2em
\leftmarginv .5em
\leftmarginvi .5em

\renewcommand{\rmdefault}{ptm}
%\renewcommand{\rmdefault}{phv}
\renewcommand{\sfdefault}{phv}
\renewcommand{\ttdefault}{cmtt}

\pagenumbering{arabic}
\pagestyle{empty}
\bibliographystyle{isprs}

