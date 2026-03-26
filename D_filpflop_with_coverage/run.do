vsim -c +access +r;
run -all;
acdb save;
acdb report -db fcover.acdb -txt -o cov.txt;
exec cat cov.txt;
exit
//use aldec riviera pro 2017.02 simulator