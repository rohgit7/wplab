#!C:\Strawberry\perl\bin\perl

print "Content-type:text/html\n\n";

print <<"HERE";
<html>
<center>
<table border=1>
<tr>
<th>ENV_VARIABLES</th><th>Value</th>
</tr>
HERE

foreach $i (sort keys %ENV)
{
    print "<tr><td>$i</td><td>$ENV{$i}</td></tr>";
}

print <<"HERE";
</table>
</center>
</html>
HERE
