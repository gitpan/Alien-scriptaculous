use strict;
use warnings;
use Test::More tests => 3;
use Test::Exception;
use File::Path qw(rmtree);
use Alien::scriptaculous;

my $dir = 't/eraseme';

# Do an install and make sure that at least one file from each of the 'lib' and
# 'src' directories was installed properly.
Alien::scriptaculous->install( $dir );
foreach my $file (qw( prototype.js scriptaculous.js )) {
    ok( -e "$dir/$file", "$dir/$file exists" );
}

# Re-install into the same directory, to make sure that it doesn't choke.
lives_ok { Alien::scriptaculous->install($dir) };

# Clean out the test directory
rmtree( $dir );
