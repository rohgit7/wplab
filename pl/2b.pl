#!C:/Strawberry/perl/bin/perl

use strict;
use warnings;
use CGI qw(:standard);

print "Content-type: text/html\r\n\r\n";

my $count = 0;

# Open file for reading
if (open(my $fh, "<", "count.txt")) {
    $count = <$fh>;
    close($fh);
}

# Increment count
$count++;

# Write updated count back to file
open(my $fhw, ">", "count.txt") or die "Cannot open file";
print $fhw $count;
close($fhw);

# Display result
print "<html>";
print "<center>";
print "<h2>This page has been viewed $count times</h2>";
print "</center>";
print "</html>";
