#!/usr/bin/perl
#

require "../paths.pl";
while($in = <STDIN>){
	$in =~ s/SCL_CGIDIR/$GlblVar::CGIDIR/g;
	$in =~ s/SCL_CGI/$GlblVar::SCL_CGI/g;
	$in =~ s/CGIDIR/$GlblVar::CGIDIR/g;
	$in =~ s/TFPATH/$GlblVar::TFPATH/g;
	$in =~ s/GraphvizDot/$GlblVar::GraphvizDot/g;
	print $in;
}
