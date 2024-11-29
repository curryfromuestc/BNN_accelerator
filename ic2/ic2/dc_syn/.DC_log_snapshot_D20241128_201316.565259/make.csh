#!/bin/csh -f
# V0.2 create static html files

set log_cgi = "./load_log.cgi"
set summary_cgi = "./load_summary.cgi"
set log_html = "log.html"
set summary_html = "summary.html"
set log_cgic = "log.cgic"
set summary_cgic = "summary.cgic"
set pycache = "__pycache__"

if ( ! -x $log_cgi ) then
	echo "Error: Cannot find dynamic log CGI file: $log_cgi"
	exit -1
endif

if ( ! -x $summary_cgi ) then
	echo "Error: Cannot find dynamic summary CGI file: $summary_cgi"
	exit -2
endif


#handle log
if ( -e $log_html ) then
	rm -f $log_html 
	if ( $status != 0 ) then
		echo "Error: Cannot remove static log HTML file: $log_html"
		exit 1
	endif
endif

$log_cgi > & ! $log_html
if ( $status != 0 ) then
	echo "Error: Cannot create static log HTML file: $log_html"
	exit 2
endif


#handle summary
if ( -e $summary_html ) then
	rm -f $summary_html 
	if ( $status != 0 ) then
		echo "Error: Cannot remove static summary HTML file: $summary_html"
		exit 3
	endif
endif

$summary_cgi > & ! $summary_html
if ( $status != 0 ) then
	echo "Error: Cannot create static summary HTML file: $summary_html"
	exit 4
endif


#adjust cross references
perl -pi -e s/"summary\.cgi"/"summary\.html"/g $log_html
if ( $status != 0 ) then
	echo "Error: Cannot adjust references in static log HTML file: $log_html"
	exit 5
endif

perl -pi -e s/"log\.cgi"/"log\.html"/g $summary_html
if ( $status != 0 ) then
	echo "Error: Cannot adjust references in static summary HTML file: $summary_html"
	exit 6
endif

perl -pi -e s/"^Content\-type\:\stext\/html\n"/""/g $log_html
if ( $status != 0 ) then
        echo "Error: Cannot adjust references in static log HTML file: $log_html"
        exit 5
endif

perl -pi -e s/"^Content\-type\:\stext\/html\n"/""/g $summary_html
if ( $status != 0 ) then
        echo "Error: Cannot adjust references in static summary HTML file: $summary_html"
        exit 6
endif

perl -pi -e s/"^.*DeprecationWarning.*\n"/""/g $summary_html
if ( $status != 0 ) then
        echo "Error: Cannot adjust references in static summary HTML file: $summary_html"
        exit 6
endif

#handle temps
if ( -e $log_cgic ) then
	rm -f $log_cgic 
endif
if ( -e $summary_cgic ) then
	rm -f $summary_cgic 
endif
if ( -e $pycache ) then
	rm -fr $pycache 
endif

exit 0

