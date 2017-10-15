use strict;
use 5.10.0;

while(<>){
	next if /^\s*KEY\b/;
	s/^[* ]*//;
	print;
}
