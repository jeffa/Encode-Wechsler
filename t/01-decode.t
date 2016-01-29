#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More tests => 1;
use Encode::Wechsler;
use Data::Dumper;

my $wechsler = Encode::Wechsler->new;

for (<DATA>) {
    next if /^#/;
    print Dumper [ $wechsler->decode( $_ ) ];
    print $wechsler->{_max_len}, $/;
}

is 1, 1, "one is one";


__DATA__
#xq4_27deee6
#xs21_03lkkl3zc96w1
xs31_0ca178b96z69d1d96
#xp30_w33z8kqrqk8zzzx33
#xp2_31a08zy0123cko
#xp30_ccx8k2s3yagzy3103yaheha4xcczyk1
