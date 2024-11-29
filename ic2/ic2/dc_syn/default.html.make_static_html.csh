#!/bin/csh -f
# V0.1 create static html files

set log_dir = ".DC_log_snapshot_D20241128_201316.565259"
set html_file = "/home/ygl/code/BNN_accelerator/ic2/ic2/dc_syn/default.html"
set make_csh = "./make.csh"

#html file exists
if ( ! -e $html_file ) then
	echo "Error: Cannot find the html file: $html_file"
	exit 1
endif

#log dir exists
if ( ! -e $log_dir ) then
	echo "Error: Cannot find the log directory: $log_dir"
	exit 2
endif

#cd to log dir
cd $log_dir
if ( $status != 0 ) then
	echo "Error: Cannot change to log directory: $log_dir"
	exit 3
endif

#script exists
if ( ! -e $make_csh ) then
	echo "Error: Cannot find the make script $make_csh in directory $log_dir"
	cd ..
	exit 4
endif

#script runable
if ( ! -x $make_csh ) then
	echo "Error: Cannot run the make script $make_csh in directory $log_dir"
	cd ..
	exit 5
endif

#run script
$make_csh
if ( $status != 0 ) then
	echo "Error: The make script $make_csh in directory $log_dir returned an error"
	cd ..
	exit 6
endif

#go back
cd ..
if ( $status != 0 ) then
	echo "Error: Cannot change to the original directory"
	exit 7
endif

#set res_cgi = `grep "log\.cgi" $html_file`
#set res_html = `grep "log\.html" $html_file`

if ( res_cgi != "" ) then
else
	if ( res_html != "" ) then
	else
	endif
endif

set html_file_cgi = $html_file"_cgi.html"

#rename cgi file
if ( ! -e $html_file_cgi ) then
	mv $html_file $html_file_cgi
	if ( $status != 0 ) then
		echo "Error: Cannot rename file '$html_file' to '$html_file_cgi'"
		exit 8
	endif
endif

if ( -e $html_file ) then
	rm -f $html_file
	if ( $status != 0 ) then
		echo "Error: Cannot remove file '$html_file'"
		exit 9
	endif
endif

#create new static html file loader
set new_html = "<html><body onLoad="\""javascript:location.replace('$log_dir/log.html')"\""></body></html>"
echo $new_html >&! $html_file
if ( $status != 0 ) then
	echo "Error: Cannot create new static html file '$html_file'"
	#rename back the cgi html file
	mv $html_file_cgi $html_file
	if ( $status != 0 ) then
		echo "Error: Cannot rename file '$html_file_cgi' back to '$html_file'"
		exit 10
	endif
	exit 11
endif

exit 0

