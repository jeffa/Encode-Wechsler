package Encode::Wechsler;
use strict;
use warnings FATAL => 'all';
our $VERSION = '0.01';

use Data::Dumper;

my $i = 0;
#{0, 1, 2, ..., 8, 9, a, b, ..., w} correspond to the bitstrings {'00000', '00001', '00010', ..., '11111'}.
our %bits = map { $_ => sprintf("%05d", unpack( 'B32', pack( 'N', $i++ ) ) ) } 0 .. 9, 'a' .. 'v';

$i = 4;
# the symbols {'y0', 'y1', y2', ..., 'yx', 'yy', 'yz'} correspond to runs of between 4 and 39 consecutive '0's.
our %zero = map { 'y' . $_ => (0 x  $i++ ) } 0 .. 9, 'a' .. 'z';

sub new {
    my $self = shift;
    return bless {@_}, $self;
}

# x[spq][0-9]+_[0-9a-z]+
sub decode {
    my ($self,$code) = @_;

    $code =~ s/^\s+//;
    $code =~ s/\s+$//;
    die "invalid format: $code\n" unless $code =~ /x[spq][0-9]+_[0-9a-z]+/;

    my ($prefix,$format) = split '_', $code, 2;

    my @grid;
    $self->{max} = 0;
    for my $part (split 'z', $format ) {

        # pad left and right
        $part = '0' . $part . '0' if $self->{pad};

        # We use the characters 'w' and 'x' to abbreviate '00' and '000', respectively.
        $part =~ s/w/00/g;
        $part =~ s/x/000/g;

        # replace consecutive zeros
        $part =~ s/(y.)/$zero{$1}/g;

        my $i = 0;
        for (split '', $part) {
            push @{ $grid[$i] }, map int $_, reverse split //, $bits{$_};
            $self->{max} = @{ $grid[$i] } if @{ $grid[$i] } > $self->{max};
            $i++;
        }
    }

    my @trans;
    for my $i (reverse 0 .. $#{ $grid[0] }) {
        push @trans, [ map $_->[$i] || 0, @grid ];
    }

    @grid = reverse @trans;
    
    return wantarray ? @grid : $self->_to_string( @grid );
}

sub _to_string {
    my $self = shift;
    my $str = '';
    for (@_) {
        $str .= $_ ? '*' : '.' for @$_;
        $str .= "\n";
    }
    return $str;
}

1;

__END__
=head1 NAME

Encode::Wechsler - Just another Wechsler encoder/decoder

THIS MODULE IS AN ALPHA RELEASE!

=head1 SYNOPSIS

Object oriented interface:

  use Encode::Wechsler;

  my $wechsler = Encode::Wechsler->new;

Procedural interface:

  use Encode::Wechsler qw( wechsler_encode wechsler_decode );

=head1 DESCRIPTION

THIS MODULE IS AN ALPHA RELEASE!

Wechsler encoding is used to describe game boards for Conway's
Game of Life.

=head1 METHODS

=over 4

=item C<new()>

=item C<decode()>

=back

=head1 AUTHOR

Jeff Anderson, C<< <jeffa at cpan.org> >>

=head1 ACKNOWLEDGEMENTS

Pattern notion developed by Allan Wechsler 1992. L<https://catagolue.appspot.com/help/wechsler.txt>

=head1 LICENSE AND COPYRIGHT

Copyright 2016 Jeff Anderson.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

=cut
