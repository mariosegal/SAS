data percent(drop=i);              
   set orion.employee_donations;
   array Contrib{4} qtr1-qtr4;        
   array Percent{4};
   Total=sum(of contrib{*});           
   do i=1 to 4;     
      percent{i}=contrib{i}/total;
   end;                               
run; 
proc print data=percent noobs;
   var Employee_ID percent1-percent4;
   format percent1-percent4 percent6.;
run;
