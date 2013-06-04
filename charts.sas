options orientation=landscape;
ods html close;
ods pdf file="C:\Documents and Settings\ewnym5s\My Documents\temp_sas_files\test1_20120713.pdf" ;
Title1 "Product Penetration (201203)";
axis1 minor=none color=black label=(a = 90 f="Arial/Bold" "Product Penetration") order=(0 to 1 by 0.25) split=" " ;
axis2 split=" " value=(h=9pt f="Arial/Bold") order=('dda' 'mms' 'sav' 'tda' 'ira' 'sec' 'ins' 'mtg' 'heq' 'iln' 'ind' 'ccs' 'sln' 'sdb') color=black;
axis3 split=" " value=(h=9pt) label=none value=none;
legend1 position=(outside bottom center) mode=reserve cborder=black shape=bar(.15in,.15in) label=('Analysis Group' position=(top center));
proc gchart data=bal3;
where product not in ( 'hh', 'trs');
where also segment ne -1 and tran_segment eq 'All';
vbar segment / type=sum sumvar=penetration group=product subgroup=segment raxis = axis1 maxis=axis3 gaxis=axis2 legend=legend1 autoref clipref cref=graybb;
run;
quit;
Title1 'Product Balances Per Product HH (&period1.)';
axis1 minor=none color=black label=(a = 90 f="Arial/Bold" "Bal per Product HH") split=" " ;
axis2 split=" " value=(h=9pt f="Arial/Bold") order=('dda' 'mms' 'sav' 'tda' 'ira' 'sec' 'ins' 'mtg' 'heq' 'iln' 'ind' 'ccs' 'sln' 'sdb') color=black;
axis3 split=" " value=(h=9pt) label=none value=none;
proc gchart data=bal3;
where product not in ( 'hh', 'trs');
where also segment ne -1 and tran_segment eq 'All';
vbar segment / type=sum sumvar=bal_prod_hh group=product subgroup=segment raxis = axis1 maxis=axis3 gaxis=axis2 legend=legend1 autoref clipref cref=graybb;
run;
Title1 'Product Balances Per Total HH (&period1.)';
axis1 minor=none color=black label=(a = 90 f="Arial/Bold" "Bal per Total HH") split=" " ;
axis2 split=" " value=(h=9pt f="Arial/Bold") order=('dda' 'mms' 'sav' 'tda' 'ira' 'sec' 'ins' 'mtg' 'heq' 'iln' 'ind' 'ccs' 'sln' 'sdb') color=black;
axis3 split=" " value=(h=9pt) label=none value=none;
proc gchart data=bal3;
where product not in ( 'hh', 'trs');
where also segment ne -1 and tran_segment eq 'All';
vbar segment / type=sum sumvar=bal_tot_hh group=product subgroup=segment raxis = axis1 maxis=axis3 gaxis=axis2 legend=legend1 autoref clipref cref=graybb;
run;
Title1 'Product Contribution Per Product HH (&period1.)';
axis1 minor=none color=black label=(a = 90 f="Arial/Bold" "Contribution per Product HH") split=" " ;
axis2 split=" " value=(h=9pt f="Arial/Bold") order=('dda' 'mms' 'sav' 'tda' 'ira' 'sec' 'ins' 'mtg' 'heq' 'iln' 'ind' 'ccs' 'sln' 'sdb') color=black;
axis3 split=" " value=(h=9pt) label=none value=none;
proc gchart data=bal3;
where product not in ( 'hh', 'trs');
where also segment ne -1 and tran_segment eq 'All';
vbar segment / type=sum sumvar=con_prod_hh group=product subgroup=segment raxis = axis1 maxis=axis3 gaxis=axis2 legend=legend1 autoref clipref cref=graybb;
run;
Title1 'Product Contribution Per Total HH (&period1.)';
axis1 minor=none color=black label=(a = 90 f="Arial/Bold" "Contribution per Total HH") split=" " ;
axis2 split=" " value=(h=9pt f="Arial/Bold") order=('dda' 'mms' 'sav' 'tda' 'ira' 'sec' 'ins' 'mtg' 'heq' 'iln' 'ind' 'ccs' 'sln' 'sdb') color=black;
axis3 split=" " value=(h=9pt) label=none value=none;
proc gchart data=bal3;
where product not in ( 'hh', 'trs');
vbar segment / type=sum sumvar=con_tot_hh group=product subgroup=segment raxis = axis1 maxis=axis3 gaxis=axis2 legend=legend1 autoref clipref cref=graybb;
run;
Title1 "Product Penetration (201203)";
axis1 minor=none color=black label=(a = 90 f="Arial/Bold" "Product Penetration") order=(0 to 1 by 0.25) split=" " ;
axis2 split=" " value=(h=9pt f="Arial/Bold") order=('dda' 'mms' 'sav' 'tda' 'ira' 'sec' 'ins' 'mtg' 'heq' 'iln' 'ind' 'ccs' 'sln' 'sdb') color=black;
axis3 split=" " value=(h=9pt) label=none value=none;
legend1 position=(outside bottom center) mode=reserve cborder=black shape=bar(.15in,.15in) label=('Analysis Group' position=(top center));
proc gchart data=bal3;
where product not in ( 'hh', 'trs');
where also tran_segment ne 'All' and segment eq -1;
vbar tran_segment / type=sum sumvar=penetration group=product subgroup=tran_segment raxis = axis1 maxis=axis3 gaxis=axis2 legend=legend1 autoref clipref cref=graybb;
run;
quit;
Title1 'Product Balances Per Product HH (&period1.)';
axis1 minor=none color=black label=(a = 90 f="Arial/Bold" "Bal per Product HH") split=" " ;
axis2 split=" " value=(h=9pt f="Arial/Bold") order=('dda' 'mms' 'sav' 'tda' 'ira' 'sec' 'ins' 'mtg' 'heq' 'iln' 'ind' 'ccs' 'sln' 'sdb') color=black;
axis3 split=" " value=(h=9pt) label=none value=none;
proc gchart data=bal3;
where product not in ( 'hh', 'trs');
where also tran_segment ne 'All' and segment eq -1;
vbar tran_segment / type=sum sumvar=bal_prod_hh group=product subgroup=tran_segment raxis = axis1 maxis=axis3 gaxis=axis2 legend=legend1 autoref clipref cref=graybb;
run;
Title1 'Product Balances Per Total HH (&period1.)';
axis1 minor=none color=black label=(a = 90 f="Arial/Bold" "Bal per Total HH") split=" " ;
axis2 split=" " value=(h=9pt f="Arial/Bold") order=('dda' 'mms' 'sav' 'tda' 'ira' 'sec' 'ins' 'mtg' 'heq' 'iln' 'ind' 'ccs' 'sln' 'sdb') color=black;
axis3 split=" " value=(h=9pt) label=none value=none;
proc gchart data=bal3;
where product not in ( 'hh', 'trs');
where also tran_segment ne 'All' and segment eq -1;
vbar tran_segment / type=sum sumvar=bal_tot_hh group=product subgroup=tran_segment raxis = axis1 maxis=axis3 gaxis=axis2 legend=legend1 autoref clipref cref=graybb;
run;
Title1 'Product Contribution Per Product HH (&period1.)';
axis1 minor=none color=black label=(a = 90 f="Arial/Bold" "Contribution per Product HH") split=" " ;
axis2 split=" " value=(h=9pt f="Arial/Bold") order=('dda' 'mms' 'sav' 'tda' 'ira' 'sec' 'ins' 'mtg' 'heq' 'iln' 'ind' 'ccs' 'sln' 'sdb') color=black;
axis3 split=" " value=(h=9pt) label=none value=none;
proc gchart data=bal3;
where product not in ( 'hh', 'trs');
where also tran_segment ne 'All' and segment eq -1;
vbar tran_segment / type=sum sumvar=con_prod_hh group=product subgroup=tran_segment raxis = axis1 maxis=axis3 gaxis=axis2 legend=legend1 autoref clipref cref=graybb;
run;
Title1 'Product Contribution Per Total HH (&period1.)';
axis1 minor=none color=black label=(a = 90 f="Arial/Bold" "Contribution per Total HH") split=" " ;
axis2 split=" " value=(h=9pt f="Arial/Bold") order=('dda' 'mms' 'sav' 'tda' 'ira' 'sec' 'ins' 'mtg' 'heq' 'iln' 'ind' 'ccs' 'sln' 'sdb') color=black;
axis3 split=" " value=(h=9pt) label=none value=none;
proc gchart data=bal3;
where product not in ( 'hh', 'trs');
vbar tran_segment / type=sum sumvar=con_tot_hh group=product subgroup=tran_segment raxis = axis1 maxis=axis3 gaxis=axis2 legend=legend1 autoref clipref cref=graybb;
run;
ods pdf close;
ods htm;
