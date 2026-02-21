#!C:/Strawberry/perl/bin/perl

use strict;
use warnings;
use CGI qw(:standard);

# Get input from browser
my $name = param('name');

# Greeting messages
my @greet = (
    "Hello",
    "Hi",
    "Nice meeting you",
    "Have a nice day"
);

# Choose random greeting
my $index = int(rand(@greet));

# Print HTTP header
print "Content-type: text/html\r\n\r\n";

# Print HTML output
print "<html>";
print "<center>";

if ($name) {
    print "<h2>$name, $greet[$index]</h2>";
} else {
    print "<h2>Please enter your name</h2>";
}

print "</center>";
print "</html>";
