data volume_csw_inq;
length tran_type $ 20;
set volume_csw_inq;
tran_type = "csw_inq";
drop csw_inq;
run;
data volume_csw_from;
length tran_type $ 20;
set volume_csw_from;
tran_type = "csw_from";
drop csw_from;
run;
data volume_csw_to;
length tran_type $ 20;
set volume_csw_to;
tran_type = "csw_to";
drop csw_to;
run;
data volume_vru_inq;
length tran_type $ 20;
set volume_vru_inq;
tran_type = "vru_inq";
drop vru_inq;
run;
data volume_vru_from;
length tran_type $ 20;
set volume_vru_from;
tran_type = "vru_from";
drop vru_from;
run;
data volume_combined;
set volume_csw_inq;
where tran_code ne '';
run;
proc datasets library=work nolist;
append base=volume_combined data=volume_csw_from (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=volume_combined data=volume_csw_to (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=volume_combined data=volume_vru_inq (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=volume_combined data=volume_vru_from (where=(tran_code ne ''));
run;
ods html close;
proc freq data=bagels.trans_new_201203 (keep=tran_code csw_inq);
table tran_code*csw_inq / nocol norow out=wip.volume_csw_inq (rename=(csw_inq=band));
format csw_inq trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code csw_from);
table tran_code*csw_from / nocol norow out=wip.volume_csw_from (rename=(csw_from=band));
format csw_from trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code csw_to);
table tran_code*csw_to / nocol norow out=wip.volume_csw_to (rename=(csw_to=band));
format csw_to trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code vru_inq);
table tran_code*vru_inq / nocol norow out=wip.volume_vru_inq (rename=(vru_inq=band));
format vru_inq trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code vru_from);
table tran_code*vru_from / nocol norow out=wip.volume_vru_from (rename=(vru_from=band));
format vru_from trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code vru_to);
table tran_code*vru_to / nocol norow out=wip.volume_vru_to (rename=(vru_to=band));
format vru_to trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code bp_mtb);
table tran_code*bp_mtb / nocol norow out=wip.volume_bp_mtb (rename=(bp_mtb=band));
format bp_mtb trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code bp_non);
table tran_code*bp_non / nocol norow out=wip.volume_bp_non (rename=(bp_non=band));
format bp_non trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code bp_mtb_amt);
table tran_code*bp_mtb_amt / nocol norow out=wip.volume_bp_mtb_amt (rename=(bp_mtb_amt=band));
format bp_mtb_amt trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code bp_non_amt);
table tran_code*bp_non_amt / nocol norow out=wip.volume_bp_non_amt (rename=(bp_non_amt=band));
format bp_non_amt trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code ATMO_wdral);
table tran_code*ATMO_wdral / nocol norow out=wip.volume_ATMO_wdral (rename=(ATMO_wdral=band));
format ATMO_wdral trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code atmo_dep);
table tran_code*atmo_dep / nocol norow out=wip.volume_atmo_dep (rename=(atmo_dep=band));
format atmo_dep trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code atmo_trsf);
table tran_code*atmo_trsf / nocol norow out=wip.volume_atmo_trsf (rename=(atmo_trsf=band));
format atmo_trsf trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code atmo_cshck);
table tran_code*atmo_cshck / nocol norow out=wip.volume_atmo_cshck (rename=(atmo_cshck=band));
format atmo_cshck trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code atmo_inq);
table tran_code*atmo_inq / nocol norow out=wip.volume_atmo_inq (rename=(atmo_inq=band));
format atmo_inq trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code atmo_zcash);
table tran_code*atmo_zcash / nocol norow out=wip.volume_atmo_zcash (rename=(atmo_zcash=band));
format atmo_zcash trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code atmo_with_amt);
table tran_code*atmo_with_amt / nocol norow out=wip.volume_atmo_with_amt (rename=(atmo_with_amt=band));
format atmo_with_amt trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code atmo_dep_amt);
table tran_code*atmo_dep_amt / nocol norow out=wip.volume_atmo_dep_amt (rename=(atmo_dep_amt=band));
format atmo_dep_amt trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code atmo_trsf_amt);
table tran_code*atmo_trsf_amt / nocol norow out=wip.volume_atmo_trsf_amt (rename=(atmo_trsf_amt=band));
format atmo_trsf_amt trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code atm_cshck_amt);
table tran_code*atm_cshck_amt / nocol norow out=wip.volume_atm_cshck_amt (rename=(atm_cshck_amt=band));
format atm_cshck_amt trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code atmo_inqry_amt);
table tran_code*atmo_inqry_amt / nocol norow out=wip.volume_atmo_inqry_amt (rename=(atmo_inqry_amt=band));
format atmo_inqry_amt trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code atmo_zcash_amt);
table tran_code*atmo_zcash_amt / nocol norow out=wip.volume_atmo_zcash_amt (rename=(atmo_zcash_amt=band));
format atmo_zcash_amt trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code atmt_wdral);
table tran_code*atmt_wdral / nocol norow out=wip.volume_atmt_wdral (rename=(atmt_wdral=band));
format atmt_wdral trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code AtMt_inqry);
table tran_code*AtMt_inqry / nocol norow out=wip.volume_AtMt_inqry (rename=(AtMt_inqry=band));
format AtMt_inqry trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code atmt_xfer);
table tran_code*atmt_xfer / nocol norow out=wip.volume_atmt_xfer (rename=(atmt_xfer=band));
format atmt_xfer trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code atmt_zcash);
table tran_code*atmt_zcash / nocol norow out=wip.volume_atmt_zcash (rename=(atmt_zcash=band));
format atmt_zcash trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code atmt_wdral_amt);
table tran_code*atmt_wdral_amt / nocol norow out=wip.volume_atmt_wdral_amt (rename=(atmt_wdral_amt=band));
format atmt_wdral_amt trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code atmr_inqry_amt);
table tran_code*atmr_inqry_amt / nocol norow out=wip.volume_atmr_inqry_amt (rename=(atmr_inqry_amt=band));
format atmr_inqry_amt trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code atmt_xfer_amt);
table tran_code*atmt_xfer_amt / nocol norow out=wip.volume_atmt_xfer_amt (rename=(atmt_xfer_amt=band));
format atmt_xfer_amt trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code atmt_zcash_amt);
table tran_code*atmt_zcash_amt / nocol norow out=wip.volume_atmt_zcash_amt (rename=(atmt_zcash_amt=band));
format atmt_zcash_amt trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code lobby_dep);
table tran_code*lobby_dep / nocol norow out=wip.volume_lobby_dep (rename=(lobby_dep=band));
format lobby_dep trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code drv_dep);
table tran_code*drv_dep / nocol norow out=wip.volume_drv_dep (rename=(drv_dep=band));
format drv_dep trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code nite_dep);
table tran_code*nite_dep / nocol norow out=wip.volume_nite_dep (rename=(nite_dep=band));
format nite_dep trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code lobby_dep_amt);
table tran_code*lobby_dep_amt / nocol norow out=wip.volume_lobby_dep_amt (rename=(lobby_dep_amt=band));
format lobby_dep_amt trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code drvin_dep_amt);
table tran_code*drvin_dep_amt / nocol norow out=wip.volume_drvin_dep_amt (rename=(drvin_dep_amt=band));
format drvin_dep_amt trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code nite_dep_amt);
table tran_code*nite_dep_amt / nocol norow out=wip.volume_nite_dep_amt (rename=(nite_dep_amt=band));
format nite_dep_amt trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code lobby_sav_with);
table tran_code*lobby_sav_with / nocol norow out=wip.volume_lobby_sav_with (rename=(lobby_sav_with=band));
format lobby_sav_with trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code lobby_sav_amt);
table tran_code*lobby_sav_amt / nocol norow out=wip.volume_lobby_sav_amt (rename=(lobby_sav_amt=band));
format lobby_sav_amt trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code drive_sav);
table tran_code*drive_sav / nocol norow out=wip.volume_drive_sav (rename=(drive_sav=band));
format drive_sav trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code drive_sav_amt);
table tran_code*drive_sav_amt / nocol norow out=wip.volume_drive_sav_amt (rename=(drive_sav_amt=band));
format drive_sav_amt trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code sign_ons);
table tran_code*sign_ons / nocol norow out=wip.volume_sign_ons (rename=(sign_ons=band));
format sign_ons trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code wap_balreq);
table tran_code*wap_balreq / nocol norow out=wip.volume_wap_balreq (rename=(wap_balreq=band));
format wap_balreq trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code wap_hist);
table tran_code*wap_hist / nocol norow out=wip.volume_wap_hist (rename=(wap_hist=band));
format wap_hist trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code wap_schtran);
table tran_code*wap_schtran / nocol norow out=wip.volume_wap_schtran (rename=(wap_schtran=band));
format wap_schtran trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code wap_cantran);
table tran_code*wap_cantran / nocol norow out=wip.volume_wap_cantran (rename=(wap_cantran=band));
format wap_cantran trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code wap_trans);
table tran_code*wap_trans / nocol norow out=wip.volume_wap_trans (rename=(wap_trans=band));
format wap_trans trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code wap_bpay);
table tran_code*wap_bpay / nocol norow out=wip.volume_wap_bpay (rename=(wap_bpay=band));
format wap_bpay trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code sms_bal);
table tran_code*sms_bal / nocol norow out=wip.volume_sms_bal (rename=(sms_bal=band));
format sms_bal trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code sms_hist);
table tran_code*sms_hist / nocol norow out=wip.volume_sms_hist (rename=(sms_hist=band));
format sms_hist trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code b2b_deb);
table tran_code*b2b_deb / nocol norow out=wip.volume_b2b_deb (rename=(b2b_deb=band));
format b2b_deb trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code b2b_cred);
table tran_code*b2b_cred / nocol norow out=wip.volume_b2b_cred (rename=(b2b_cred=band));
format b2b_cred trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code b2b_debit_amt);
table tran_code*b2b_debit_amt / nocol norow out=wip.volume_b2b_debit_amt (rename=(b2b_debit_amt=band));
format b2b_debit_amt trans. tran_code $transegm.;
run;
proc freq data=bagels.trans_new_201203 (keep=tran_code b2b_credit_amt);
table tran_code*b2b_credit_amt / nocol norow out=wip.volume_b2b_credit_amt (rename=(b2b_credit_amt=band));
format b2b_credit_amt trans. tran_code $transegm.;
run;
ods html;
data wip.volume_csw_inq;
length tran_type $ 20;
set wip.volume_csw_inq;
tran_type = "csw_inq";
drop csw_inq;
run;
data wip.volume_csw_from;
length tran_type $ 20;
set wip.volume_csw_from;
tran_type = "csw_from";
drop csw_from;
run;
data wip.volume_csw_to;
length tran_type $ 20;
set wip.volume_csw_to;
tran_type = "csw_to";
drop csw_to;
run;
data wip.volume_vru_inq;
length tran_type $ 20;
set wip.volume_vru_inq;
tran_type = "vru_inq";
drop vru_inq;
run;
data wip.volume_vru_from;
length tran_type $ 20;
set wip.volume_vru_from;
tran_type = "vru_from";
drop vru_from;
run;
data wip.volume_vru_to;
length tran_type $ 20;
set wip.volume_vru_to;
tran_type = "vru_to";
drop vru_to;
run;
data wip.volume_bp_mtb;
length tran_type $ 20;
set wip.volume_bp_mtb;
tran_type = "bp_mtb";
drop bp_mtb;
run;
data wip.volume_bp_non;
length tran_type $ 20;
set wip.volume_bp_non;
tran_type = "bp_non";
drop bp_non;
run;
data wip.volume_bp_mtb_amt;
length tran_type $ 20;
set wip.volume_bp_mtb_amt;
tran_type = "bp_mtb_amt";
drop bp_mtb_amt;
run;
data wip.volume_bp_non_amt;
length tran_type $ 20;
set wip.volume_bp_non_amt;
tran_type = "bp_non_amt";
drop bp_non_amt;
run;
data wip.volume_ATMO_wdral;
length tran_type $ 20;
set wip.volume_ATMO_wdral;
tran_type = "ATMO_wdral";
drop ATMO_wdral;
run;
data wip.volume_atmo_dep;
length tran_type $ 20;
set wip.volume_atmo_dep;
tran_type = "atmo_dep";
drop atmo_dep;
run;
data wip.volume_atmo_trsf;
length tran_type $ 20;
set wip.volume_atmo_trsf;
tran_type = "atmo_trsf";
drop atmo_trsf;
run;
data wip.volume_atmo_cshck;
length tran_type $ 20;
set wip.volume_atmo_cshck;
tran_type = "atmo_cshck";
drop atmo_cshck;
run;
data wip.volume_atmo_inq;
length tran_type $ 20;
set wip.volume_atmo_inq;
tran_type = "atmo_inq";
drop atmo_inq;
run;
data wip.volume_atmo_zcash;
length tran_type $ 20;
set wip.volume_atmo_zcash;
tran_type = "atmo_zcash";
drop atmo_zcash;
run;
data wip.volume_atmo_with_amt;
length tran_type $ 20;
set wip.volume_atmo_with_amt;
tran_type = "atmo_with_amt";
drop atmo_with_amt;
run;
data wip.volume_atmo_dep_amt;
length tran_type $ 20;
set wip.volume_atmo_dep_amt;
tran_type = "atmo_dep_amt";
drop atmo_dep_amt;
run;
data wip.volume_atmo_trsf_amt;
length tran_type $ 20;
set wip.volume_atmo_trsf_amt;
tran_type = "atmo_trsf_amt";
drop atmo_trsf_amt;
run;
data wip.volume_atm_cshck_amt;
length tran_type $ 20;
set wip.volume_atm_cshck_amt;
tran_type = "atm_cshck_amt";
drop atm_cshck_amt;
run;
data wip.volume_atmo_inqry_amt;
length tran_type $ 20;
set wip.volume_atmo_inqry_amt;
tran_type = "atmo_inqry_amt";
drop atmo_inqry_amt;
run;
data wip.volume_atmo_zcash_amt;
length tran_type $ 20;
set wip.volume_atmo_zcash_amt;
tran_type = "atmo_zcash_amt";
drop atmo_zcash_amt;
run;
data wip.volume_atmt_wdral;
length tran_type $ 20;
set wip.volume_atmt_wdral;
tran_type = "atmt_wdral";
drop atmt_wdral;
run;
data wip.volume_AtMt_inqry;
length tran_type $ 20;
set wip.volume_AtMt_inqry;
tran_type = "AtMt_inqry";
drop AtMt_inqry;
run;
data wip.volume_atmt_xfer;
length tran_type $ 20;
set wip.volume_atmt_xfer;
tran_type = "atmt_xfer";
drop atmt_xfer;
run;
data wip.volume_atmt_zcash;
length tran_type $ 20;
set wip.volume_atmt_zcash;
tran_type = "atmt_zcash";
drop atmt_zcash;
run;
data wip.volume_atmt_wdral_amt;
length tran_type $ 20;
set wip.volume_atmt_wdral_amt;
tran_type = "atmt_wdral_amt";
drop atmt_wdral_amt;
run;
data wip.volume_atmr_inqry_amt;
length tran_type $ 20;
set wip.volume_atmr_inqry_amt;
tran_type = "atmr_inqry_amt";
drop atmr_inqry_amt;
run;
data wip.volume_atmt_xfer_amt;
length tran_type $ 20;
set wip.volume_atmt_xfer_amt;
tran_type = "atmt_xfer_amt";
drop atmt_xfer_amt;
run;
data wip.volume_atmt_zcash_amt;
length tran_type $ 20;
set wip.volume_atmt_zcash_amt;
tran_type = "atmt_zcash_amt";
drop atmt_zcash_amt;
run;
data wip.volume_lobby_dep;
length tran_type $ 20;
set wip.volume_lobby_dep;
tran_type = "lobby_dep";
drop lobby_dep;
run;
data wip.volume_drv_dep;
length tran_type $ 20;
set wip.volume_drv_dep;
tran_type = "drv_dep";
drop drv_dep;
run;
data wip.volume_nite_dep;
length tran_type $ 20;
set wip.volume_nite_dep;
tran_type = "nite_dep";
drop nite_dep;
run;
data wip.volume_lobby_dep_amt;
length tran_type $ 20;
set wip.volume_lobby_dep_amt;
tran_type = "lobby_dep_amt";
drop lobby_dep_amt;
run;
data wip.volume_drvin_dep_amt;
length tran_type $ 20;
set wip.volume_drvin_dep_amt;
tran_type = "drvin_dep_amt";
drop drvin_dep_amt;
run;
data wip.volume_nite_dep_amt;
length tran_type $ 20;
set wip.volume_nite_dep_amt;
tran_type = "nite_dep_amt";
drop nite_dep_amt;
run;
data wip.volume_lobby_sav_with;
length tran_type $ 20;
set wip.volume_lobby_sav_with;
tran_type = "lobby_sav_with";
drop lobby_sav_with;
run;
data wip.volume_lobby_sav_amt;
length tran_type $ 20;
set wip.volume_lobby_sav_amt;
tran_type = "lobby_sav_amt";
drop lobby_sav_amt;
run;
data wip.volume_drive_sav;
length tran_type $ 20;
set wip.volume_drive_sav;
tran_type = "drive_sav";
drop drive_sav;
run;
data wip.volume_drive_sav_amt;
length tran_type $ 20;
set wip.volume_drive_sav_amt;
tran_type = "drive_sav_amt";
drop drive_sav_amt;
run;
data wip.volume_sign_ons;
length tran_type $ 20;
set wip.volume_sign_ons;
tran_type = "sign_ons";
drop sign_ons;
run;
data wip.volume_wap_balreq;
length tran_type $ 20;
set wip.volume_wap_balreq;
tran_type = "wap_balreq";
drop wap_balreq;
run;
data wip.volume_wap_hist;
length tran_type $ 20;
set wip.volume_wap_hist;
tran_type = "wap_hist";
drop wap_hist;
run;
data wip.volume_wap_schtran;
length tran_type $ 20;
set wip.volume_wap_schtran;
tran_type = "wap_schtran";
drop wap_schtran;
run;
data wip.volume_wap_cantran;
length tran_type $ 20;
set wip.volume_wap_cantran;
tran_type = "wap_cantran";
drop wap_cantran;
run;
data wip.volume_wap_trans;
length tran_type $ 20;
set wip.volume_wap_trans;
tran_type = "wap_trans";
drop wap_trans;
run;
data wip.volume_wap_bpay;
length tran_type $ 20;
set wip.volume_wap_bpay;
tran_type = "wap_bpay";
drop wap_bpay;
run;
data wip.volume_sms_bal;
length tran_type $ 20;
set wip.volume_sms_bal;
tran_type = "sms_bal";
drop sms_bal;
run;
data wip.volume_sms_hist;
length tran_type $ 20;
set wip.volume_sms_hist;
tran_type = "sms_hist";
drop sms_hist;
run;
data wip.volume_b2b_deb;
length tran_type $ 20;
set wip.volume_b2b_deb;
tran_type = "b2b_deb";
drop b2b_deb;
run;
data wip.volume_b2b_cred;
length tran_type $ 20;
set wip.volume_b2b_cred;
tran_type = "b2b_cred";
drop b2b_cred;
run;
data wip.volume_b2b_debit_amt;
length tran_type $ 20;
set wip.volume_b2b_debit_amt;
tran_type = "b2b_debit_amt";
drop b2b_debit_amt;
run;
data wip.volume_b2b_credit_amt;
length tran_type $ 20;
set wip.volume_b2b_credit_amt;
tran_type = "b2b_credit_amt";
drop b2b_credit_amt;
run;
data wip.volume_combined;
set wip.volume_csw_inq;
where tran_code ne '';
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_csw_from (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_csw_to (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_vru_inq (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_vru_from (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_vru_to (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_bp_mtb (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_bp_non (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_bp_mtb_amt (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_bp_non_amt (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_ATMO_wdral (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_atmo_dep (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_atmo_trsf (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_atmo_cshck (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_atmo_inq (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_atmo_zcash (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_atmo_with_amt (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_atmo_dep_amt (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_atmo_trsf_amt (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_atm_cshck_amt (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_atmo_inqry_amt (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_atmo_zcash_amt (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_atmt_wdral (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_AtMt_inqry (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_atmt_xfer (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_atmt_zcash (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_atmt_wdral_amt (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_atmr_inqry_amt (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_atmt_xfer_amt (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_atmt_zcash_amt (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_lobby_dep (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_drv_dep (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_nite_dep (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_lobby_dep_amt (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_drvin_dep_amt (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_nite_dep_amt (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_lobby_sav_with (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_lobby_sav_amt (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_drive_sav (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_drive_sav_amt (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_sign_ons (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_wap_balreq (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_wap_hist (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_wap_schtran (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_wap_cantran (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_wap_trans (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_wap_bpay (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_sms_bal (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_sms_hist (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_b2b_deb (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_b2b_cred (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_b2b_debit_amt (where=(tran_code ne ''));
run;
proc datasets library=work nolist;
append base=wip.volume_combined data=wip.volume_b2b_credit_amt (where=(tran_code ne ''));
run;