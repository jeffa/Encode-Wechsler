#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More tests => 11;
use Encode::Wechsler;
use Data::Dumper;

my $wechsler = Encode::Wechsler->new;

is $wechsler->decode( 'xq4_27deee6' ), 
".**....
**.****
.******
..****.
.......
", 'xq4_27deee6 decoded correctly';

is $wechsler->decode( 'xs31_0ca178b96' ), 
"...**.**.
..*.*.*.*
.*..*...*
.**..***.
.........
", '1st part of xs31_0ca178b96z69d1d96 decoded correctly';

is $wechsler->decode( 'xs31_69d1d96' ), 
".*****.
*.....*
*.*.*.*
.**.**.
.......
", '2nd part of xs31_0ca178b96z69d1d96 decoded correctly';

is $wechsler->decode( 'xs31_0ca178b96z69d1d96' ), 
"...**.**.
..*.*.*.*
.*..*...*
.**..***.
.........
.*****...
*.....*..
*.*.*.*..
.**.**...
.........
", 'xs31_0ca178b96z69d1d96 decoded correctly';

is $wechsler->decode( 'xp30_w33' ), 
"..**
..**
....
....
....
", '1st part of xp30_w33z8kqrqk8zzzx33 decoded correctly';

is $wechsler->decode( 'xp30_8kqrqk8' ), 
"...*...
..***..
.*...*.
*.***.*
.*****.
", '2nd part of xp30_w33z8kqrqk8zzzx33 decoded correctly';

is $wechsler->decode( 'xp30_x33' ), 
"...**
...**
.....
.....
.....
", '4th part of xp30_w33z8kqrqk8zzzx33 decoded correctly';

is $wechsler->decode( 'xp30_w33z8kqrqk8zzzx33' ), 
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
.......
.......
", 'xp30_w33z8kqrqk8zzzx33 decoded correctly';

is $wechsler->decode( 'xp2_31a08' ), 
"**...
*.*..
.....
..*.*
.....
", '1st half of xp2_31a08zy0123cko decoded correctly';

is $wechsler->decode( 'xp2_y0123cko' ), 
"....*.*...
.....**...
.......**.
.......*.*
........**
", '2nd half of xp2_31a08zy0123cko decoded correctly';

is $wechsler->decode( 'xp2_31a08zy0123cko' ), 
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
", 'xp2_31a08zy0123cko decoded correctly';

#is $wechsler->decode( 'xp30_ccx8k2s3yagzy3103yaheha4xcczyk1' ), 
#"
#", 'xp30_ccx8k2s3yagzy3103yaheha4xcczyk1 decoded correctly';
