ods html newfile=proc;
options fmtsearch=(SAS);
libname mjstore 'C:\Documents and Settings\ewnym5s\My Documents\SAS';
options MSTORED SASMSTORE = sas;
options cmplib=(sas.functions);
options mcompilenote=all;

libname data 'C:\Documents and Settings\ewnym5s\My Documents\Data';
libname bbseg 'C:\Documents and Settings\ewnym5s\My Documents\BB Segmentation';
libname Branch 'C:\Documents and Settings\ewnym5s\My Documents\Network Planning';
libname sas 'C:\Documents and Settings\ewnym5s\My Documents\SAS';
libname deposits 'C:\Documents and Settings\ewnym5s\My Documents\Deposits';
libname Hudson 'C:\Documents and Settings\ewnym5s\My Documents\Hudson City';
libname Union 'C:\Documents and Settings\ewnym5s\My Documents\Unions';
libname virtual 'C:\Documents and Settings\ewnym5s\My Documents\Virtually Domiciled';
libname wip 'C:\Documents and Settings\ewnym5s\My Documents\temp_sas_files';
libname Online 'C:\Documents and Settings\ewnym5s\My Documents\Online';
libname bb 'C:\Documents and Settings\ewnym5s\My Documents\Business Banking';
libname Peter 'C:\Documents and Settings\ewnym5s\My Documents\Peter';
libname ATM 'C:\Documents and Settings\ewnym5s\My Documents\ATM';
libname clv 'C:\Documents and Settings\ewnym5s\My Documents\Lifetime Value';
libname mapfiles 'C:\Documents and Settings\ewnym5s\My Documents\SAS Map Data';

ods html style=mtbnew;

