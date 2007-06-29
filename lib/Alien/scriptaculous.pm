package Alien::scriptaculous;

# Required inclusions.
use strict;
use warnings;
use Carp;
use File::Copy qw(copy);
use File::Path qw(mkpath);

# Version number
our $VERSION = '1.7.0';

# Returns the script.aculo.us version number.
sub version {
    return $VERSION;
}

# Returns the path to the available copy of script.aculo.us.
sub path {
    my $base = $INC{'Alien/scriptaculous.pm'};
    $base =~ s{\.pm$}{};
    return $base;
}

# Installs the script.aculo.us Javascript libraries into the given '$destdir'.
sub install {
    my ($class, $destdir) = @_;
    if (!-d $destdir) {
        mkpath( $destdir ) || croak "can't create '$destdir'; $!";
    }

    my $path = $class->path();
    my @jsfiles = grep { -f $_ } glob "$path/*/*.js";
    foreach my $file (@jsfiles) {
        copy( $file, $destdir ) || croak "can't copy '$file' to '$destdir'; $!";
    }
}

1;

=head1 NAME

Alien::scriptaculous - installing and finding script.aculo.us

=head1 SYNOPSIS

  use Alien::scriptaculous;
  ...
  $version = Alien::scriptaculous->version();
  $path    = Alien::scriptaculous->path();
  ...
  Alien::scriptaculous->install( $my_destination_directory );

=head1 DESCRIPTION

Please see L<Alien> for the manifesto of the Alien namespace.

=head1 AUTHOR

Graham TerMarsch (cpan@howlingfrog.com)

=head1 LICENSE

Copyright (C) 2006, Graham TerMarsch.  All rights reserved.

This is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

=head1 SEE ALSO

http://script.aculo.us/,
L<Alien>.

=cut
