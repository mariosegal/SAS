options mstored sasmstore=sas;

%macro as_logical(dataset, exclude=) / store source  des='creates 0/1 flags from counts';
data &dataset;
set &dataset;
array all_nums[*] _NUMERIC_; 
do i = 1 to dim(all_nums);
  if all_nums[i] ne &exclude and all_nums[i] ge 1 then all_nums[i] = 1; 
end; 
drop i; 
run; 
%mend as_logical;
