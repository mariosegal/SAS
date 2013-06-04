data cbox;
set data.main_201212;
where cbr eq 16;
keep band dda mms sav tda ira mtg iln ind heq card sec hhid ;
run;
data cbox;
merge cbox(in=a) data.contrib_201212(in=b keep=hhid dda_con mms_con sav_con tda_con ira_con mtg_con iln_con ind_con heq_con card_con sec_con);
by hhid;
if a;
run;
data cbox;
set cbox;
if not dda then dda_con = .;
if not mms then mms_con = .;
if not sav then sav_con = .;
if not tda then tda_con = .;
if not ira then ira_con = .;
if not mtg then mtg_con = .;
if not heq then heq_con = .;
if not iln then iln_con = .;
if not sec then sec_con = .;
if not ind then ind_con = .;
if not card then card_con = .;
run;
data cbox1 ;
set cbox ;
order = 1;
contribution = dda_con;
output;
order = 2;
contribution = mms_con;
output;
order = 3;
contribution = sav_con;
output;
order = 4;
contribution = tda_con;
output;
order = 5;
contribution = ira_con;
output;
order = 6;
contribution = card_con;
output;
order = 7;
contribution = iln_con;
output;
order = 8;
contribution = ind_con;
output;
order = 9;
contribution = sec_con;
output;
order = 10;
contribution = mtg_con;
output;
order = 11;
contribution = heq_con;
output;
keep order contribution band hhid;
run;
proc format;
value order 1 = 'Checking' 2 = 'Money Mkt' 3 = 'Savings' 4 = 'Time Dep' 5 = 'IRAs' 6 = 'Credit Card' 7 = 'Dir. Loan' 8 = 'Ind. Loan' 9 = 'Securities' 10= 'Mortgage' 11='Home Equity';
run;
data cbox1;
set cbox1;
variable = put(band,$band.);
run;
proc sql;
select count(unique(variable)) into :class_n TRIMMED from cbox1 ;
quit;
proc sql;
select variable, count(*) into :name1 - :name6, :n1 - :n6 from cbox1 group by variable ;
quit;
proc sort data=cbox1;
by variable;
run;
data cbox1;
set cbox1;
retain index;
by variable;
if first.variable then index+1;
run;
proc sort data=cbox1;
by hhid order;
run;
proc transpose data=cbox1 out=cbox_tran prefix=amt;
var contribution;
id index;
by hhid order;
copy variable contribution;
run;
proc sort data=cbox_tran;
by order;
run;
