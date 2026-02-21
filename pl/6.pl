#!C:/Strawberry/perl/bin/perl.exe
use strict;
use warnings;
use CGI qw(:standard);
use DBI;

my $nm  = param('name');
my $age = param('age');

my $db = DBI->connect(
    "DBI:SQLite:dbname=C:/xampp/cgi-bin/test.db",
    "",
    ""
) or die DBI->errstr;

$db->do("CREATE TABLE IF NOT EXISTS info (name TEXT, age INTEGER)");

my $q = $db->prepare("INSERT INTO info VALUES (?, ?)");
$q->execute($nm, $age);

$q = $db->prepare("SELECT * FROM info");
$q->execute();

print "Content-type: text/html\n\n";

print <<HTML;
<html>
<table border="1">
<tr>
<th>Name</th>
<th>Age</th>
</tr>
HTML

while (my ($n, $a) = $q->fetchrow_array) {
    print "<tr><td>$n</td><td>$a</td></tr>";
}

print "</table></html>";

$q->finish;
$db->disconnect;