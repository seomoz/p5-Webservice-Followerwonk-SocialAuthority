#!/usr/bin/env perl
use 5.12.1;
use warnings;
use HTTP::Thin::UserAgent;
use Getopt::Long;
use Pod::Usage;

my $uri = 'http://api.followerwonk.com/access-control/';
GetOptions( 
    'uri=s' => \$uri,
    'h|help' => \my $help,
) or pod2usage(2);

pod2usage(1) if $help;

my ($access_id, $secret_key) = @ARGV;

die "$uri $access_id $secret_key";

say http( POST $uri )->as_json(
    {   'AccessID'  => $access_id,
        'SecretKey' => $secret_key
    }
)->response->dump;

__END__

=head1 NAME
 
add_keys.pl -- Adds Secret Keys to the FollowerWonk API (Limited Beta)
 
=head1 SYNOPSIS
 
sample [options]  ID SECRET_KEY
 
 Options:
   -uri             optional URI to target (defaults to production)
   -help            brief help message
   -man             full documentation
 
=head1 OPTIONS
 
=over 4

=item B<-help>
 
Print a brief help message and exits.
 
=item B<-man>
 
Prints the manual page and exits.
 
=back
 
=head1 DESCRIPTION
 
B<This program> will read the given input file(s) and do something
useful with the contents thereof.
 
=cut
