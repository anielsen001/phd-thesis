% umd-thesis.cls

%% This is a class (.cls) file for LaTeX2e.
%% This should be a replacement for the dissertation.sty file used with
%% LaTeX209.  Basically we want the report class with a few modifications.
%% TLC gives an example of this on page 468.
%%
%% Author:      Thomas J. Stone
%%              Institute for Physical Science and Technology
%%              The University of Maryland
%%              College Park, Maryland
%%
%%              tstone@glue.umd.edu
%%
%% Feel free to copy, modify, and distribute.
%% I am interested in any changes you make.
%% Send changes to tstone@glue.umd.edu
%%
%%
%% This file is based on the dissertation.sty file by Pablo A. Straub.
%% (Actually it is based on a modified version that contains modifications
%% by Aaron E. Naiman.)
%
% fixed math mode problem with \copyright command -aaron nielsen
% 5 Feb 2001, anielsen@squid.umd.edu
%
%
% Version History
% ---------------
% v0.1  1995-01-15      Test of Class file
%                       Included (Aaron Naiman's modified version) of 
%                       dissertation.sty
% v0.2  1995-01-15      Modified slightly to conform to LaTeX2e suggested
%                       standards
% v0.3  1995-01-15      Got rid of a bunch of stuff that I don't think
%                       is needed.  I.e.,  some of the cross referencing
%                       stuff.  I think that most people either won't
%                       use this or they have their own macros.
% v1.0  1995-04-25      Set up for distrubution to others.
%
%   9/1997  changes by Stefan Kehrbaum (sk) to accomodate new guidelines 
%   implemented by the graduate school in summer 1997
%
%------------------------------------------------------------------------------
%
%------------------------- Identification -------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{umd-thesis}[1995/01/15 v0.3]
%------------------------- Initial Code ---------------------------------------
%
% I am not sure what to put here
\RequirePackage{ifthen}
%
%------------------------- Declaration of Options -----------------------------
\PassOptionsToClass{12pt}{report}
\PassOptionsToClass{letterpaper}{report}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
%------------------------- Execution of Options -------------------------------
\ProcessOptions
%------------------------- Package Loading ------------------------------------
\LoadClass{report}
%------------------------- Main Code ------------------------------------------
% 
%
% apn 3 July 01 : some logic to make the appendix headings different
% from the chapter headings
\newboolean{appendices}
%
% this will be set true when the \appendix command is issued
% leave false until then.
\setboolean{appendices}{false}

%
% I am not sure what to put here
%
% not sure why I need this -- from dissertation.sty
%
\@namedef{ds@10pt}{\def\@ptsize{0}}
%
% saving taken from dissertation.sty with modification
%
%\newif\ifsaving
%\@namedef{ds@saving}{\savingtrue}
\newboolean{saving}\setboolean{saving}{false}
%
% masters taken from dissertation.sty with modification
%
%\newif\ifmasters
%\@namedef{ds@masters}{\masterstrue\gdef\@thesis{Thesis}}
\newboolean{masters}\setboolean{masters}{false}
%\ifthenelse{\boolean{masters}} {\newcommand{\@thesis}{Thesis}}
%                               {\newcommand{\@thesis}{Dissertation}}
\newcommand{\@thesis}{\ifthenelse{\boolean{masters}}{Thesis}{Dissertation}}
%
%
%
% 2. Margins and spacing
%
% Rules taken from pages 10-12 of the Style and Policy Manual.
%
% I changed these (slightly) from what Aaron used.  He probably changed
% these slightly from what Pablo used.
% In general we want to over state the margins a little bit, so that
% variations due to printing/copying don't kill us....
% The style guide requires a 1in top margin.  We use 1.15in.
% The sytle guide requires a 1in bottom margin.  We use 1.40in.
%       This is larger because we need the page number at the bottom
%       with two blank lines between the last line and the page number
%       and at least 0.5in below the page number.  Note that the
%       0.7in footskip might be a little large, but better safe than sorry....
% The style guide requires a 1.5in left margin.  We use 1.65in.
%
\ifthenelse{\boolean{saving}}
{       \setlength {\topmargin}{0in}            % top margin    1.0 inch
        \setlength {\textheight}{8.5in}         % bottom margin 1.5 inch
        \setlength {\oddsidemargin}{0in}        % left margin   1.0 inch
        \setlength {\textwidth}{6.5in}          % right margin  1.0 inch
}
{       \setlength {\topmargin}{0.15in}         % top margin    1.15 inch
        \setlength {\textheight}{8.45in}        % bottom margin 1.40 inch
        \setlength {\oddsidemargin}{0.65in}     % left margin   1.65 inch
        \setlength {\textwidth}{5.7in}          % right margin  1.15 inch
        \setlength {\footskip}{0.7in}           % 2 blank lines before pg num.
}
\setlength {\footnotesep}{14pt}         % baseline skip for footnotes' 1st line
\setlength {\headheight}{0in}           % no header
\setlength {\headsep}{0in}              % no header separation
%
% \spacing - redefine \baselinestretch and recompute \baselineskip
%            lateral effect: set typeface to normalize roman
% from TLC after issuing the \renewcommand{\baselinestretch}{whatever}
% command, a font changing command is needed for the change to take effect.
%
\newcommand{\spacing}[1]{\renewcommand{\baselinestretch}{#1}\large\normalsize}
%
\ifthenelse{\boolean{saving}}
{       \spacing{1}                     % single spacing for drafts
}
{       \spacing{1.667}                 % double spacing for final
}
%
%
% 3. Commands to define parameters for the front matter
% 
% There are two kinds of commands that define parametters for the  front
% matter:  those  that  provide info (like \author or \abstractfile) and
% those that set flages (like \hascopyright).
% 
% All commands that provide info redefine an internal command named  the
% same but with an initial at sign (e.g., \advisor redefined \@advisor).
% This  idea is standard in LaTeX, so \author, \title, and \date are not
% defined here (the standards are used).
%  
% All commands that set  flags  are  used  to  set  the  status  of  the
% corresponding if command. The parameter must be true or false, or else
% a `Undefined control sequence command' will be issued by TeX.
%
%
% The following are the definitions of the commands  that  provide  info
% (standard  LaTeX  commands  like  \author are omitted because they are
% already defined).
%
\def\advisor#1{\gdef\@advisor{#1}}
%
\def\chairtitle#1{\gdef\@chairtitle{#1}}
%
\def\committee#1{\gdef\@committee{#1}}
%
\def\department#1{\gdef\@department{#1}}
%
\def\abstractfile#1{\gdef\@abstractfile{#1}}
%
\def\masterof#1{\gdef\@masterof{#1}}
%
\def\prefacefile#1{\gdef\@prefacefile{#1}}
%
\long\def\dedication#1{\long\gdef\@dedication{#1}}
%
\long\def\acknowledgements#1{\long\gdef\@acknowledgements{#1}}
%
\long\def\comment#1{\long\gdef\@comment{#1}}
%
%
% The following are the initial values for some commands that provide info.
%
\gdef\@author{{\it Your Full Name}}
%
\gdef\@title{{\it Your Dissertation Title}}
%
\gdef\@date{\number\year}
%
\gdef\@advisor{{\it Academic title and name of advisor}}
%
\gdef\@chairtitle{Chairman/Advisor}
%
\gdef\@committee{{\it Academic title and name of members}}
%
\gdef\@department{Department of Mathematics}
%
\def\@abstractfile{abstract}
%
\gdef\@masterof{Science}
%
%
% The following are all switch setting commands along with their initial
% values and corresponding \newif definitions.
%
%
%\newif\ifhascopyright
%\hascopyrighttrue
%\def\hascopyright#1{\csname hascopyright#1\endcsname}
\newboolean{hascopyright}\setboolean{hascopyright}{true}
%
%\newif\ifhasfigures
%\hasfigurestrue
%\def\hasfigures#1{\csname hasfigures#1\endcsname}
\newboolean{hasfigures}\setboolean{hasfigures}{true}

%\newif\ifhastables
%\hastablestrue
%\def\hastables#1{\csname hastables#1\endcsname}
\newboolean{hastables}\setboolean{hastables}{true}
%
%
% I more or less (more!) leave the next part untouched from
% what Pablo did and the minor changes Aaron made.  At somepoint
% one could change the \ifhastables ... \fi into the \ifthenelse construct...
%
%
% 4. Command \makefrontmatter
%        
% The \makefrontmatter command creates the front matter by conditionally
% invoking other commands:
%  
%       \makeabstract, \maketitlepage, \makecopyrightpage, \makepreface,
%       \makededication, \makeacknowledgements, \tableofcontents,
%       \makelistoftables, \makelistoffigures, \makecommentpage.
%
% \makefrontmatter takes care of numbering in lowercase roman, arabic or
% none.
%
\def\makefrontmatter{
 \pagestyle {empty}
 \ifx\@empty \@abstractfile \else \makeabstract \fi
 \maketitlepage
 \makecopyrightpage
 \pagestyle {plain}
 \pagenumbering {roman}
 \setcounter {page}{2}
 \@ifdefined {@prefacefile}{\makepreface}
 \@ifdefined {@dedication}{\makededication}
 \@ifdefined {@acknowledgements}{\makeacknowledgements}
 \tableofcontents\newpage
 \ifhastables \makelistoftables \fi
 \ifhasfigures \makelistoffigures \fi
 \pagenumbering {arabic}
% aen: turn off comment page and adjust page numbering
% \setcounter {page}{0}
% \makecommentpage}
 \setcounter {page}{1}
 }
%
%
% 5. Commands to create different parts of the front matter
%
%
% \makeabstract - create the abstract page(s) including title, author, etc.
%
% change sk 9/97 capitalize ABSTRACT
\def\makeabstract{
 \newpage
 \vspace*{.8in}
 {\spacing{1.1}
 \begin{center}ABSTRACT \end{center}
 \spacing{1.667}
 \bigskip\par\noindent
% sk 9/97  change  aligment 
\ifmasters 
 Title of \@thesis: \hspace{35pt} {\begin{tabular}[t]{l} \@title \end{tabular}} 
 \spacing{1.1}
 \bigskip\par\noindent
  Degree candidate: \hspace{27pt} \@author 
  \bigskip\par\noindent
  Degree and year: \hspace{32pt} Master of \@masterof, \@date
 \bigskip\par\noindent
 \@thesis\ directed by: \hspace{16pt}
 \begin{tabular}[t]{l}\@advisor \\ \@department\end{tabular}
\else 
 Title of \@thesis:  \hspace{14pt} {\begin{tabular}[t]{l} \@title \end{tabular}}
 \spacing{1.1}
 \bigskip\par\noindent
  \begin{center} \@author, Doctor of Philosophy, \@date \end{center}
 \bigskip\par\noindent
 \@thesis\ directed by:
 \begin{tabular}[t]{l}\@advisor \\ \@department\end{tabular}
 \fi
 \hugeskip\par\mbox{}\hugeskip\par}
 \@input{\@abstractfile}
 \newpage}
%
%
% \maketitlepage - create the title page according to a complex format
%
\def\maketitlepage{
 \newpage
 \vspace*{.85in}
 \begin{center}
 %\spacing{1.3}
 \spacing{1.667}
 {\begin{tabular}[t]{c}\@title\end{tabular}}
 \\ \hugeskip
 {by \\ \bigskip \@author}
 \end{center}
 \hugeskip
 {\spacing{1}
 \begin{center}
 \ifmasters Thesis \else Dissertation \fi
          submitted to the Faculty of the Graduate School of the \\
% aen: "the" -> "The"
% of the University of Maryland in partial fulfillment \\
% sk 9/97 some other changes here , but minor
% apn 2 Jul 01: ``at'' -> ``,'' in accordance with official name change of the
% university
 University of Maryland, College Park in partial fulfillment \\
 of the requirements for the degree of \\
 \ifmasters Master of \@masterof \else Doctor of Philosophy \fi \\
 \@date
 \end{center}
 %\hugeskip\par\mbox{}\hugeskip\par\hspace*{15pt}
 % sk 9/97 noindent for this paragraph 
 \hugeskip\par\mbox{}\hugeskip\par
 
 \noindent
 Advisory Committee:
 %\medskip\par\hspace*{60pt}
 \medskip\par\hspace*{25pt}
 \begin{tabular}[t]{l}\@advisor, \@chairtitle \\ \@committee \end{tabular}}
 \newpage}
%
%
% \makecopyrightpage - create a copyright page or an empty page
%
\def\makecopyrightpage{
 \newpage
 \mbox{}\par\vfill
 \ifhascopyright
  {\large
  \begin{center}
% removed $---$ mathmode from around copyright command - APN 
  \boldmath \copyright Copyright by \\
  \@author \\
  \@date
  \end{center}}
  \vfill
 \fi
 \newpage}
%
%
% \makepreface - create a preface from file \@prefacefile
%
\def\makepreface{
 \newpage
 \chapter*{Preface}
 \@input{\@prefacefile}
 \newpage}
%
%
% \makededication - create a dedication page
%
\def\makededication{
 \newpage
 \vspace*{2in}
% aen: all "\LARGE" --> "\Large"
% \begin{center}\LARGE \bf DEDICATION \end{center}
% sk 9/97 all these headings must be changed 
 \begin{center}\large DEDICATION \end{center}
 \hugeskip\par\noindent
 \begin{quote} \@dedication \end{quote}
 \newpage}
%
%
% \makeacknowledgements - create an acknowledgements page
%
\def\makeacknowledgements{
 \newpage
 \vspace*{2in}
% aen: all "\LARGE" --> "\Large"
% \begin{center}\LARGE\bf Acknowledgements \end{center}
 \begin{center}\large ACKNOWLEDGEMENTS \end{center}
 \hugeskip\par\noindent
 \begin{quote} \@acknowledgements \end{quote}
 \newpage}
%
%
% \makelistoftables - create the list of tables
%
\def\makelistoftables{
 \newpage
 \addcontentsline {toc}{chapter}{List of Tables}
 \listoftables
 \newpage}
%
%
% \makelistoffigures  - create the list of figures
%
\def\makelistoffigures{
 \newpage
 \addcontentsline {toc}{chapter}{List of Figures}
 \listoffigures
 \newpage}
%
%
% \makecommentpage - create a (possibly empty) comment page
%
\def\makecommentpage{
 {\spacing{1}
 \begin{center}\@title \\[1ex]  \@author \\[1ex] \today \end{center}
 \par\vfill
 \@ifdefined{@comment}{\@comment}
 \par\vfill}
 \begin{center} \large\bf This comment page is not part of the dissertation.
 \\[3ex]
 \end{center}
 \newpage}
%
%
% \hugeskip - skip twice as much as the TeX command \bigskip
%
\def\hugeskip{\vskip 24pt plus 8pt minus 8pt}
%
%
% \@ifdefined - expand #2 if command #1 is not defined
%
\def\@ifdefined#1#2{\@ifundefined{#1}{}{#2}}
%
%
% \@makechapterhead \@makeschapterhead - create a chapter head
%
% These standard LaTeX commands are redefined here to use not-so-huge type
%
\def\@makechapterhead#1{ \vspace*{50pt} { \parindent 0pt \raggedright
% apn 3 jul 01: logic to control headings when in appendices
\ifthenelse{\boolean{appendices}}%
  {\ifnum \c@secnumdepth >\m@ne \Large\bf \@chapapp{}}% true
  { \ifnum \c@secnumdepth >\m@ne \Large\bf \@chapapp{} \thechapter \par }%false
% aen: all "\LARGE" --> "\Large"
% \vskip 20pt \fi \LARGE \bf #1\par
 \vskip 20pt \fi \Large \bf #1\par
 \nobreak \vskip 40pt } }
%
\def\@makeschapterhead#1{ \vspace*{50pt} { \parindent 0pt \raggedright
% aen: all "\LARGE" --> "\Large"
% \LARGE \bf #1\par
 \Large \bf #1\par
 \nobreak \vskip 40pt } }
%
% aen: new restrictions
%
%      1) "Contents" -> "Table of Contents"
%      2) center the three headers
%      3) three Section/Number and Page headers as well
%      4) REMEMBER: no italics, for emphasis only, throughout
%                   dissertation.
%
% the following is from what Aaron did but I cleaned it up a little....
% 
% First we redefine the headings for the toc, lof, and the lot.
% for one thing we need them centered and we need table of contents
% instead of just contents....
%
%
\renewcommand\contentsname{\centerline{\large \rm TABLE OF CONTENTS}}
\renewcommand\listfigurename{\centerline{\large \rm LIST OF FIGURES}}
\renewcommand\listtablename{\centerline{\large \rm LIST OF TABLES}}
\renewcommand \bibname {\centerline{\large \rm BIBLIOGRAPHY}}
%
% apn 3 jul 01: added appendix and index name to correspond to 
% correct univeristy style 
\renewcommand\appendixname{\centerline{\large \rm APPENDIX \thechapter}}
\renewcommand\indexname{\centerline{\large \rm INDEX}}

%
% next we modify the definitions of \tableofcontents, \listoffigures,
% and \listoftables.  We need to have \underline{Section}   \underline{Page}
% and so forth....  basically we add the contentsheader line to each 
% of the standard definitions 
%
% we take this definition of from Aaron
%
\newcommand{\contentsheader}[2]
{       \addtocontents{#1}
        {       \centerline{\underline{#2}\protect\hfill \underline{Page}}%
        }%
}
%
\renewcommand\tableofcontents
{       \if@twocolumn
                \@restonecoltrue\onecolumn
        \else
                \@restonecolfalse
        \fi
        \chapter*{\contentsname \@mkboth        {\uppercase{\contentsname}}%
                                                {\uppercase{\contentsname}}}%
        %\contentsheader{toc}{Section}%
        \@starttoc{toc}%
        \if@restonecol\twocolumn\fi
}
%
\renewcommand\listoffigures
{       \if@twocolumn
                \@restonecoltrue\onecolumn
        \else
                \@restonecolfalse
        \fi
        \chapter*{\listfigurename \@mkboth      {\uppercase{\listfigurename}}%
                                                {\uppercase{\listfigurename}}}%
        %\contentsheader{lof}{Number}%
        \@starttoc{lof}%
        \if@restonecol\twocolumn\fi
}
%
\renewcommand\listoftables
{       \if@twocolumn
                \@restonecoltrue\onecolumn
        \else
                \@restonecolfalse
        \fi
        \chapter*{\listtablename \@mkboth       {\uppercase{\listtablename}}%
                                                {\uppercase{\listtablename}}}%
        %\contentsheader{lot}{Number}%
        \@starttoc{lot}%
        \if@restonecol\twocolumn\fi
}
%
\renewcommand\appendix
{       \setcounter{chapter}{0}%
        \setcounter{section}{0}%
        \renewcommand\@chapapp{\appendixname}%
        \renewcommand\thechapter{\@Alph\c@chapter}%
        \setboolean{appendices}{true}
}

%
%
%% End of file `umd-thesis.cls'.



