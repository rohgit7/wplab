#!C:/Strawberry/perl/bin/perl
use strict;
use warnings;
use CGI ':standard';
use POSIX 'strftime';

# Print HTTP header
print header(-type => 'text/html');

# Get the current server time (hour)
my $hour = strftime("%H", localtime);

# Determine greeting based on time
my $greeting;
if ($hour < 12) {
    $greeting = "Good Morning!";
} elsif ($hour < 18) {
    $greeting = "Good Afternoon!";
} else {
    $greeting = "Good Evening!";
}

# Simulate webmaster login status
# In a real scenario, this would be checked using sessions or authentication data
my $is_webmaster_logged_in = 1;  # 1 = logged in, 0 = not logged in

my $login_status = $is_webmaster_logged_in
    ? "The webmaster is currently logged in."
    : "The webmaster is not logged in.";

# Output HTML content
print start_html("Greeting and Login Check"),
      h1("Greeting Based on Access Time"),
      p($greeting),
      h2("Webmaster Login Status"),
      p($login_status),
      end_html;
