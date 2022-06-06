libname TP "/folders/myfolders/SASLAB/Project/Data";

/*______________________________________________________________________________________________ */
/* 											IMPORT					    						 */
/*______________________________________________________________________________________________ */

PROC IMPORT DATAFILE="/folders/myfolders/SASLAB/Project/Data/
						HoChiMinhCity_PM2.5_2016_12_MTD.csv"
		    OUT=TP.HCMN_2016_12
		    DBMS=CSV
		    REPLACE;
RUN;


PROC IMPORT DATAFILE="/folders/myfolders/SASLAB/Project/Data/
						HoChiMinhCity_PM2.5_2017_12_MTD.csv"
		    OUT=TP.HCMN_2017_12
		    DBMS=CSV
		    REPLACE;
RUN;



PROC IMPORT DATAFILE="/folders/myfolders/SASLAB/Project/Data/
						HoChiMinhCity_PM2.5_2018_12_MTD.csv"
		    OUT=TP.HCMN_2018_12
		    DBMS=CSV
		    REPLACE;
RUN;

PROC IMPORT DATAFILE="/folders/myfolders/SASLAB/Project/Data/
						HoChiMinhCity_PM2.5_2019_12_MTD.csv"
		    OUT=TP.HCMN_2019_12
		    DBMS=CSV
		    REPLACE;
RUN;

PROC IMPORT DATAFILE="/folders/myfolders/SASLAB/Project/Data/
						HoChiMinhCity_PM2.5_2020_12_MTD.csv"
		    OUT=TP.HCMN_2020_12
		    DBMS=CSV
		    REPLACE;
RUN;

PROC IMPORT DATAFILE="/folders/myfolders/SASLAB/Project/Data/
						HoChiMinhCity_PM2.5_2021_02_MTD.csv"
		    OUT=TP.HCMN_2021_02
		    DBMS=CSV
		    REPLACE;
RUN;


/*______________________________________________________________________________________________ */
/* 											DATA DESCRIPTION		    						 */
/*______________________________________________________________________________________________ */

PROC CONTENTS 
	data=tp.hcmn_2016_12;
RUN;


PROC CONTENTS 
	data=tp.hcmn_2017_12;
RUN;
	
	
PROC CONTENTS 
	data=tp.hcmn_2018_12;
RUN;


PROC CONTENTS 
	data=tp.hcmn_2019_12;
RUN;

	
PROC CONTENTS 
	data=tp.hcmn_2020_12;
RUN;

	
PROC CONTENTS 
	data=tp.hcmn_2021_02;

RUN;

/*______________________________________________________________________________________________ */
/* 											TOP 5 ROWS				    						 */
/*______________________________________________________________________________________________ */

PROC PRINT 
	data=tp.hcmn_2016_12
	(OBS=5);
RUN;

PROC PRINT 
	data=tp.hcmn_2017_12
	(OBS=5);
RUN;
	
PROC PRINT 
	data=tp.hcmn_2018_12
	(OBS=5)
RUN;
	
PROC PRINT 
	data=tp.hcmn_2019_12
	(OBS=5);
RUN;
	
PROC PRINT 
	data=tp.hcmn_2020_12
	(OBS=5);
RUN;
	
PROC PRINT 
	data=tp.hcmn_2021_02
	(OBS=5);
RUN;
	
	