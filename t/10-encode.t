#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More tests => 4;
use Encode::Wechsler;
use Data::Dumper;

my $wechsler = Encode::Wechsler->new;

is $wechsler->encode(
".**....
**.****
.******
..****.
"), '27deee6', '27deee6 encoded correctly';

#SKIP: {
    #skip "z not implemented", 1;
is $wechsler->encode(
"...**.**.
..*.*.*.*
.*..*...*
.**..***.
.........
.*****...
*.....*..
*.*.*.*..
.**.**...
"), '0ca178b96z69d1d96', '0ca178b96z69d1d96 encoded correctly';
#};

SKIP: {
    skip "consecutive zero runs not implemented", 1;
is $wechsler->encode(
"..**...
..**...
.......
.......
.......
...*...
..***..
.*...*.
*.***.*
.*****.
.......
.......
.......
.......
.......
.......
.......
.......
.......
.......
...**..
...**..
.......
"), 'w33z8kqrqk8zzzx33', 'xp30_w33z8kqrqk8zzzx33 encoded correctly';
};

SKIP: {
    skip "consecutive zero runs not implemented", 1;
is $wechsler->encode(
"**........
*.*.......
..........
..*.*.....
..........
....*.*...
.....**...
.......**.
.......*.*
........**
"), '31a08zy0123cko', 'xp2_31a08zy0123cko encoded correctly';
};
