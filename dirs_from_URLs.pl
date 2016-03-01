#!/usr/bin/perl
use strict;

my %dirs;

while(my $row=<STDIN>)
{
	chomp($row);
	$row=~s/[^\/]+$//;
	$row=~s/^http(s?):\/\/[^\/]+//;
	$dirs{$row}=1;
}

foreach my $dir(keys %dirs)
{
	print "$dir\n";
}


# Usage: 
# 1) Burp Target -> Save URLs
# 2) cat URLs.txt | perl dirs_from_URLs.pl > dirs
# 3) Take some POST request and turn it into the following PUT (embed the list generated above into the holder), make sure / is not HTML-encoded, run the attack, looking for 201 response:
#PUT /$holder$/test.txt HTTP/1.1
#[...]
#Content-Type: application/x-www-form-urlencoded
#Content-Length: 1241
#
#TESTCONTENT
