Encode::Wechsler
=====================
Just another Wechsler encoder/decoder.

Synopsis
--------
```perl
use Encode::Wechsler

my $wechsler = Encode::Wechsler->new( pad => 1 );
my @array  = decode->( 'xp3_0ggmligkcz32w46' );
my $string = scalar decode->( 'xp3_0ggmligkcz32w46' );
```

Installation
------------
To install this module, you should use CPAN. A good starting
place is [How to install CPAN modules](http://www.cpan.org/modules/INSTALL.html).

If you truly want to install from this github repo, then
be sure and create the manifest before you test and install:
```
perl Makefile.PL
make
make manifest
make test
make install
```

Support and Documentation
-------------------------
After installing, you can find documentation for this module with the
perldoc command.
```
perldoc Encode::Wechsler
```
License and Copyright
---------------------
See [source POD](/lib/Encode/Wechsler.pm).
