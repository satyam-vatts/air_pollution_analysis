***************************************************************;
********CREATING a NEW LIBRARY FOR HOCHIMINH POLLUTION DATA********;
*-------------------------------------------------------------*;
***************************************************************;
libname GP "/folders/myfolders/Project/GP_Lib";
options datestyle=dmy;

FILENAME HCMC2016 "/folders/myfolders/Project/datasets/HoChiMinhCity_PM2.5_2016_12_MTD.csv";
FILENAME HCMC2017 "/folders/myfolders/Project/datasets/HoChiMinhCity_PM2.5_2017_12_MTD.csv";
FILENAME HCMC2018 "/folders/myfolders/Project/datasets/HoChiMinhCity_PM2.5_2018_12_MTD.csv";
FILENAME HCMC2019 "/folders/myfolders/Project/datasets/HoChiMinhCity_PM2.5_2019_12_MTD.csv";
FILENAME HCMC2020 "/folders/myfolders/Project/datasets/HoChiMinhCity_PM2.5_2020_12_MTD.csv";
FILENAME HCMC2021 "/folders/myfolders/Project/datasets/HoChiMinhCity_PM2.5_2021_02_MTD.csv";


***************************************************************;
********IMPORTING DATA FOR ALL YEARS FROM 2015 to 2019*********;
*-------------------------------------------------------------*;
***************************************************************;
proc import datafile=HCMC2016
		    dbms=csv
		    out=GP.HoChiMinh2016
		    replace;
	 guessingrows=MAX;
run;

proc import datafile=HCMC2017
		    dbms=csv 
		    out=GP.HoChiMinh2017
		    replace;
	 guessingrows=MAX;
run;

proc import datafile=HCMC2018
		    dbms=csv 
		    out=GP.HoChiMinh2018
		    replace;
	 guessingrows=MAX;
run;
proc import datafile=HCMC2019
		    dbms=csv
		    out=GP.HoChiMinh2019 
		    replace;
	 guessingrows=MAX;
run;

proc import datafile=HCMC2020
		    dbms=csv 
		    out=GP.HoChiMinh2020
		    replace;
	 guessingrows=MAX;
run;

proc import datafile=HCMC2021
		    dbms=csv 
		    out=GP.HoChiMinh2021
		    replace;
	 guessingrows=MAX;
run;


***************************************************************;
********************* ANALYSING DATASETS **********************;
***************************************************************;

*-------------------- Analysing Table Attributes --------------;

ods noproctitle;
ods select attributes position;

title 'Data Structure for HoChiMinh City 2016';
proc contents data=GP.HoChiMinh2016 order=varnum;
run;

title 'Data Structure for HoCHiMinh City 2017';
proc contents data=GP.HoChiMinh2017 order=varnum;
run;

title 'Data Structure for HoChiMinh City 2018';
proc contents data=GP.HoChiMinh2018 order=varnum;
run;

title 'Data Structure for HoCHiMinh City 2019';
proc contents data=GP.HoChiMinh2019 order=varnum;
run;

title 'Data Structure for HoChiMinh City 2020';
proc contents data=GP.HoChiMinh2020 order=varnum;
run;

title 'Data Structure for HoCHiMinh City 2021';
proc contents data=GP.HoChiMinh2021 order=varnum;
run;


*-----------------Analysing First 20 Rows----------------------;

proc print data=GP.HoChiMinh2016 (obs=15) obs="S.No." label n;
	title 'List Data for HCMC 2016 PM2.5 Concentrations';
run;

proc print data=GP.HoChiMinh2017 (obs=15) obs="S.No." label n;
	title 'List Data for HCMC 2017 PM2.5 Concentrations';
run;

proc print data=GP.HoChiMinh2018 (obs=15) obs="S.No." label n;
	title 'List Data for HCMC 2018 PM2.5 Concentrations';
run;

proc print data=GP.HoChiMinh2019 (obs=15) obs="S.No." label n;
	title 'List Data for HCMC 2019 PM2.5 Concentrations';
run;

proc print data=GP.HoChiMinh2020 (obs=15) obs="S.No." label n;
	title 'List Data for HCMC 2020 PM2.5 Concentrations';
run;

proc print data=GP.HoChiMinh2021 (obs=15) obs="S.No." label n;
	title 'List Data for HCMC 2021 PM2.5 Concentrations';
run;

*-----------------Analyze categorical variables-----------------;

proc freq data=GP.HoChiMinh2016;
	tables Site QC_Name AQI_Category Parameter Conc__Unit Duration / nocum;
	title "Frequencies for Categorical Variables HCMC 2016";
run;

proc freq data=GP.HoChiMinh2017;
	tables Site QC_Name AQI_Category Parameter Conc__Unit Duration / nocum;
	title "Frequencies for Categorical Variables HCMC 2017";
run;


proc freq data=GP.HoChiMinh2018;
	tables Site QC_Name AQI_Category Parameter Conc__Unit Duration / nocum;
	title "Frequencies for Categorical Variables HCMC 2018";
run;

proc freq data=GP.HoChiMinh2019;
	tables Site QC_Name AQI_Category Parameter Conc__Unit Duration / nocum;
	title "Frequencies for Categorical Variables HCMC 2019";
run;


proc freq data=GP.HoChiMinh2020;
	tables Site QC_Name AQI_Category Parameter Conc__Unit Duration / nocum;
	title "Frequencies for Categorical Variables HCMC 2020";
run;

proc freq data=GP.HoChiMinh2021;
	tables Site QC_Name AQI_Category Parameter Conc__Unit Duration / nocum ;
	title "Frequencies for Categorical Variables HCMC 2021";
run;


*------------------Analyze numerical variables------------------;

proc means data=GP.HoChiMinh2016 n nmiss min mean median max std;
	var Raw_Conc_ _24_hr__Midpoint_Avg__Conc_ AQI;
	title "Descriptive Statistics for Numeric Variables HCMC 2016";
run;

proc means data=GP.HoChiMinh2017 n nmiss min mean median max std;
	var Raw_Conc_ NowCast_Conc_ AQI;
	title "Descriptive Statistics for Numeric Variables HCMC 2017";
run;

proc means data=GP.HoChiMinh2018 n nmiss min mean median max std;
	var Raw_Conc_ NowCast_Conc_ AQI;
	title "Descriptive Statistics for Numeric Variables HCMC 2018";
run;

proc means data=GP.HoChiMinh2019 n nmiss min mean median max std;
	var Raw_Conc_ NowCast_Conc_ AQI;
	title "Descriptive Statistics for Numeric Variables HCMC 2019";
run;

proc means data=GP.HoChiMinh2020 n nmiss min mean median max std;
	var Raw_Conc_ NowCast_Conc_ AQI;
	title "Descriptive Statistics for Numeric Variables HCMC 2020";
run;

proc means data=GP.HoChiMinh2021 n nmiss min mean median max std;
	var Raw_Conc_ NowCast_Conc_ AQI;
	title "Descriptive Statistics for Numeric Variables HCMC 2021";
run;


***************************************************************;
**********************CLEANING DATASETS************************;
*-------------------------------------------------------------*;
***************************************************************;

********************Handling 2016 Dataset**************;

******Removing Invalid and Negative Values*********;

data work.HoChiMinh2016_intermediate;
	set GP.HoChiMinh2016(where=(QC_Name ^= 'Invalid'));
	drop _24_hr__Midpoint_Avg__Conc_;
run;

***********Fixing Categories***********************;
data work.HoChiMinh2016_aqi_category_fixed;
	set work.HoChiMinh2016_intermediate;
	format AQI_Category_Name $40.;

	if AQI_Category=1 then
		AQI_Category_Name="Good";

	if AQI_Category=2 then
		AQI_Category_Name="Moderate";

	if AQI_Category=3 then
		AQI_Category_Name="Unhealthy for Sensitive Groups";

	if AQI_Category=4 then
		AQI_Category_Name="Unhealthy";

	if AQI_Category=5 then
		AQI_Category_Name="Very Unhealthy";

	if AQI_Category=6 then
		AQI_Category_Name="Hazardous";
	drop AQI_Category;
	rename AQI_Category_Name=AQI_Category;
run;

************Calculating NowCast 2016*******;
proc sql;
	create table work.calc_min_max_conc as 
	select Date__LT_, 
	       (select max(Raw_Conc_) 
	        from work.HoChiMinh2016_aqi_category_fixed as b 
	        where intnx('hour', a.Date__LT_, -11, 'b') le b.Date__LT_ le a.Date__LT_) as Max_Conc,
		   (select min(Raw_Conc_) 
		    from work.HoChiMinh2016_aqi_category_fixed as c 
		    where intnx('hour', a.Date__LT_, -11, 'b') le c.Date__LT_ le a.Date__LT_) as Min_Conc 
	from work.HoChiMinh2016_aqi_category_fixed as a;

	create table work.calc_min_max_weight as 
	select *, case 
	              when Min_Conc/Max_Conc < 0.5 then 0.5 
	              else Min_Conc/Max_Conc 
	          end as weight 
	from work.calc_min_max_conc;

	create table work.HoChiMinh2016_fixed as 
	select a.*, 
	       (select ROUND(SUM(case 
	                             when intck('hour', b.Date__LT_, a.Date__LT_)=0  
	                             then b.Raw_Conc_
	                             when intck('hour', b.Date__LT_, a.Date__LT_)=1  
	                             then b.Raw_Conc_ * (c.weight** 1)
	                             when intck('hour', b.Date__LT_, a.Date__LT_)=2  
	                             then b.Raw_Conc_ * (c.weight** 2) 
						 		 when intck('hour', b.Date__LT_, a.Date__LT_)=3  
						 		 then b.Raw_Conc_ * (c.weight** 3) 
						 		 when intck('hour', b.Date__LT_, a.Date__LT_)=4  
						 		 then b.Raw_Conc_ * (c.weight** 4)
						 		 when intck('hour', b.Date__LT_, a.Date__LT_)=5  
						 		 then b.Raw_Conc_ * (c.weight** 5)
						 		 when intck('hour', b.Date__LT_, a.Date__LT_)=6  
						 		 then b.Raw_Conc_ * (c.weight** 6)
						 		 when intck('hour', b.Date__LT_, a.Date__LT_)=7  
						 		 then b.Raw_Conc_ * (c.weight** 7)
						 		 when intck('hour', b.Date__LT_, a.Date__LT_)=8  
						 		 then b.Raw_Conc_ * (c.weight** 8) 
						 		 when intck('hour', b.Date__LT_, a.Date__LT_)=9  
						 		 then b.Raw_Conc_ * (c.weight** 9) 
						 		 when intck('hour', b.Date__LT_, a.Date__LT_)=10 
						 		 then b.Raw_Conc_ * (c.weight**10) 
						 		 when intck('hour', b.Date__LT_, a.Date__LT_)=11 
						 		 then b.Raw_Conc_ * (c.weight**11)
						 		 else b.Raw_Conc_
						 	 end)/SUM(case 
						 	              when intck('hour', b.Date__LT_, a.Date__LT_)=0  
						 	              then 1
						 	              when intck('hour', b.Date__LT_, a.Date__LT_)=1  
						 	              then c.weight** 1 
						 	              when intck('hour', b.Date__LT_, a.Date__LT_)=2  
						 	              then c.weight** 2 
						 	              when intck('hour', b.Date__LT_, a.Date__LT_)=3  
						 	              then c.weight** 3 
						 	              when intck('hour', b.Date__LT_, a.Date__LT_)=4  
						 	              then c.weight** 4 
						 	              when intck('hour', b.Date__LT_, a.Date__LT_)=5  
						 	              then c.weight** 5 
						 	              when intck('hour', b.Date__LT_, a.Date__LT_)=6  
						 	              then c.weight** 6 
						 	              when intck('hour', b.Date__LT_, a.Date__LT_)=7  
						 	              then c.weight** 7 
						 	              when intck('hour', b.Date__LT_, a.Date__LT_)=8  
						 	              then c.weight** 8 
						 	              when intck('hour', b.Date__LT_, a.Date__LT_)=9  
						 	              then c.weight** 9 
						 	              when intck('hour', b.Date__LT_, a.Date__LT_)=10 
						 	              then c.weight**10 
						 	              when intck('hour', b.Date__LT_, a.Date__LT_)=11 
						 	              then c.weight**11
						 	              else 1
						 	           end),
					     0.1) 
			from work.HoChiMinh2016_aqi_category_fixed as b 
			where b.Date__LT_ between intnx('hour', a.Date__LT_, -11, 'b') and a.Date__LT_) as NowCast_Conc_
	from 
	work.HoChiMinh2016_aqi_category_fixed as a 
	inner join work.calc_min_max_weight as c on a.Date__LT_=c.Date__LT_;
quit;


***************************************************************;
***********Merging DATASETS to Create Master Dataset***********;
*-------------------------------------------------------------*;
***************************************************************;

data GP.HoCHiMinh2016_2021_Master;
	set work.HoChiMinh2016_fixed GP.hochiminh2017 GP.hochiminh2018 GP.hochiminh2019 GP.hochiminh2020 GP.hochiminh2021;
	if QC_Name = 'Invalid' then delete;
run;

*-----------------Analyze categorical variables-----------------;
proc freq data=GP.HoCHiMinh2016_2021_Master;
	tables Site QC_Name AQI_Category Parameter Conc__Unit Duration / nocum ;
	title "Frequencies for Categorical Variables HCMC 2016-2021";
run;


*------------------Analyze numerical variables------------------;

proc means data=GP.HoCHiMinh2016_2021_Master n nmiss min mean median max std;
	var Raw_Conc_ AQI NowCast_Conc_;
	title "Descriptive Statistics for Numeric Variables HCMC 2016-2021";
run;


*-----------------Removing Invalid and Negative Values----------;
data work.HoChiMinh_master_intermediate;
	set GP.HoCHiMinh2016_2021_Master;
	if Raw_Conc_ < 0 then Raw_Conc_ = '.';
	if AQI < 0 then AQI = '.';
	if NowCast_Conc_ < 0 then NowCast_Conc_='.';
run;

******Back FIlling Macro****************;
%macro backfill(variable);
retain help_&variable;
if not missing(&variable)
then help_&variable = &variable;
else &variable = help_&variable;
drop help_&variable;
%mend;

data work.hochiminh2016_2021_missing_fixed;
set work.HoChiMinh_master_intermediate;
%backfill(Raw_Conc_);
%backfill(AQI);
%backfill(NowCast_Conc_);
run;

data GP.hochiminh2016_2021_cleaned;
set work.hochiminh2016_2021_missing_fixed;
if QC_Name='Missing' and Raw_Conc_^='.' and Raw_Conc_ >= 0 then QC_Name='Valid';
if AQI >= 0   and AQI <= 50  and AQI_Category='N/A' then AQI_Category = 'Good';
if AQI >= 51  and AQI <= 100 and AQI_Category='N/A' then AQI_Category = 'Moderate';
if AQI >= 101 and AQI <= 150 and AQI_Category='N/A' then AQI_Category = 'Unhealthy for Sensitive Groups';
if AQI >= 151 and AQI <= 200 and AQI_Category='N/A' then AQI_Category = 'Unhealthy';
if AQI >= 201 and AQI <= 300 and AQI_Category='N/A' then AQI_Category = 'Very Unhealthy';
if AQI >= 301 and AQI <= 500 and AQI_Category='N/A' then AQI_Category = 'Hazardous';
run;


***************************************************************;
***********Analysing Cleaned Master Dataset***********;
*-------------------------------------------------------------*;
***************************************************************;

*********************Analysing Categorical Variables***********;

title "Frequencies for Categorical Variables of Cleaned Dataset";

proc freq data=GP.hochiminh2016_2021_cleaned;
	tables QC_Name AQI_Category Year/ nocum plots=(freqplot);
run;

title "Frequencies for Categorical Variables of Cleaned Dataset";

proc freq data=GP.hochiminh2016_2021_cleaned;
	tables  Site Parameter Duration Conc__Unit/ nocum;
run;

*----------------------Analyze numerical variables-------------------;
title "Descriptive Statistics for Numeric Variables of Cleaned Dataset";

proc means data=GP.hochiminh2016_2021_cleaned n nmiss min mean median max std;
	var NowCast_Conc_ AQI Raw_Conc_;
run;

title;
*------------------------ Analysing Issues --------------------------;

*---------------------------999 Values-------------------------------;
proc print data=GP.hochiminh2016_2021_cleaned label n;
where Raw_Conc_=-999 or AQI=-999 or NowCast_Conc_=-999;
run;

*------------------------Missing QC_Name | Conc Values-----------------;
proc print data=GP.hochiminh2016_2021_cleaned(where=(QC_Name='' or QC_Name='Missing'));
var  Date__LT_ QC_Name Raw_Conc_ AQI  NowCast_Conc_;
run;

***************************************************************;
***********Export Master Dataset***********;
*-------------------------------------------------------------*;
***************************************************************;
proc export data=GP.hochiminh2016_2021_cleaned
outfile="/folders/myfolders/Project/HoChiMinhCity_PM2.5_2017_2021_Master_MTD.csv" dbms=csv replace;
run;

