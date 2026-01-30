%let pgm=utl-altair-slc-identify-posters-language-in-altair-forum-question;

%stop_submission

Altair slc identify posters language in altair forum question
https://github.com/rogerjdeangelis/utl-altair-slc-identify-posters-language-in-altair-forum-question

Too long to post here, see github

PROBLEM

   INPUT
     This is an English sentence.
     Das ist ein deutscher Satz.
     Esta es una frase en espa~nol.

   OUTPUT
     WORK.WANTWPS total obs=3

     Obs     WANT
      1     english
      2     german
      3     spanish

see
https://goo.gl/dzfqgb
https://communities.sas.com/t5/SAS-Text-and-Content-Analytics/Detecting-English-comments-from-a-corpus-of-customer-complaints/m-p/400656

Bens solution ( there are other intersesting solutions)
https://stackoverflow.com/questions/8078604/detect-text-language-in-r

Ben profile
https://stackoverflow.com/users/1036500/ben

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

options validvarname=upcase;
libname sd1 "d:/sd1";
data sd1.have;
 length txt $96;
 input;
 txt=_infile_;
cards4;
This is an English sentence.
Das ist ein deutscher.
Esta es una frase en espa~nol.
;;;;
run;quit;

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/

options set=RHOME "C:\Progra~1\R\R-4.5.2\bin\r";
proc r;
export data=workx.have r=have;
submit;
library(textcat)
have
want<-textcat(have$TXT)
want=cbind(have,want)
want
endsubmit;
import r=want data=workx.want;
run;

proc print data=workx.want;
run;quit;

/*           _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| `_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
*/

/**************************************************************************************************************************/
/*   PROC R                                             | Basse SLC                                                       */
/*                                                      |                                                                 */
/*   Altair SLC                                         |  Altair SLC                                                     */
/*                                                      |                                                                 */
/*                                TXT    want           |  Obs                 TXT                   WANT                 */
/*   1   This is an English sentence. english           |   1     This is an English sentence.      english               */
/*   2    Das ist ein deutscher Satz.  german           |   2     Das ist ein deutscher Satz.       german                */
/*   3 Esta es una frase en espa~nol. spanish           |   3     Esta es una frase en espa~nol.    spanish               */
/**************************************************************************************************************************/

/*
| | ___   __ _
| |/ _ \ / _` |
| | (_) | (_| |
|_|\___/ \__, |
         |___/
*/

1                                          Altair SLC        09:48 Friday, January 30, 2026

NOTE: Copyright 2002-2025 World Programming, an Altair Company
NOTE: Altair SLC 2026 (05.26.01.00.000758)
      Licensed to Roger DeAngelis
NOTE: This session is executing on the X64_WIN11PRO platform and is running in 64 bit mode

NOTE: AUTOEXEC processing beginning; file is C:\wpsoto\autoexec.sas
NOTE: AUTOEXEC source line
1       +  ï»¿ods _all_ close;
           ^
ERROR: Expected a statement keyword : found "?"
NOTE: Library workx assigned as follows:
      Engine:        SAS7BDAT
      Physical Name: d:\wpswrkx

NOTE: Library slchelp assigned as follows:
      Engine:        WPD
      Physical Name: C:\Progra~1\Altair\SLC\2026\sashelp


LOG:  9:48:19
NOTE: 1 record was written to file PRINT

NOTE: The data step took :
      real time : 0.019
      cpu time  : 0.031


NOTE: AUTOEXEC processing completed

1         options set=RHOME "C:\Progra~1\R\R-4.5.2\bin\r";
2         proc r;
NOTE: Using R version 4.5.2 (2025-10-31 ucrt) from C:\Program Files\R\R-4.5.2
3         export data=workx.have r=have;
NOTE: Creating R data frame 'have' from data set 'WORKX.have'

4         submit;
5         library(textcat)
6         have
7         want<-textcat(have$TXT)
8         want=cbind(have,want)
9         want
10        endsubmit;

NOTE: Submitting statements to R:

> library(textcat)
> have
> want<-textcat(have$TXT)
> want=cbind(have,want)
> want

NOTE: Processing of R statements complete

11        import r=want data=workx.want;
NOTE: Creating data set 'WORKX.want' from R data frame 'want'
NOTE: Column names modified during import of 'want'
NOTE: Data set "WORKX.want" has 3 observation(s) and 2 variable(s)

12        run;
NOTE: Procedure r step took :
      real time : 0.363
      cpu time  : 0.015


2                                                                                                                         Altair SLC


13
14        proc print data=workx.want;
15        run;quit;
NOTE: 3 observations were read from "WORKX.want"
NOTE: Procedure print step took :
      real time : 0.010
      cpu time  : 0.015


ERROR: Error printed on page 1

NOTE: Submitted statements took :
      real time : 0.459
      cpu time  : 0.109

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
