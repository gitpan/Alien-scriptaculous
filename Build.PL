use strict;
use warnings;
use lib qw(inc lib);
use MY::Build;

my $build = MY::Build->new
    (
        'module_name'   => 'Alien::scriptaculous',
        'license'       => 'perl',
        'dist_author'   => 'Graham TerMarsch (cpan@howlingfrog.com)',
        'requires'      => { 'Archive::Tar'     => 0,
                             'Test::Exception'  => 0,
                           },
    );
$build->create_build_script();
