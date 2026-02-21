#!C:/Strawberry/perl/bin/perl.exe
use CGI qw(:standard);
use DBI;

my $nm  = param('name');
my $age = param('age');

print "Content-type: text/html\n\n";
print "<html><body>";

# Connect to SQLite database
my $db = DBI->connect(
    "DBI:SQLite:C:/xampp/cgi-bin/student.db",
    "",
    "",
    { RaiseError => 1 }
);

# Create table if not exists
$db->do("CREATE TABLE IF NOT EXISTS info (name TEXT, age INTEGER)");

# Insert new record
if ($nm && $age) {
    my $insert = $db->prepare("INSERT INTO info VALUES (?, ?)");
    $insert->execute($nm, $age);
}

# Retrieve all records
my $q = $db->prepare("SELECT * FROM info");
$q->execute();

print "<h2>All Student Records</h2>";
print "<table border='1' cellpadding='8'>";
print "<tr><th>Name</th><th>Age</th></tr>";

while (my ($name, $age) = $q->fetchrow_array) {
    print "<tr><td>$name</td><td>$age</td></tr>";
}

print "</table></body></html>";

$q->finish;
$db->disconnect;