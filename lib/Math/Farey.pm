#! /usr/bin/perl

package Math::Farey;
require Exporter;
our @ISA =qw(Exporter);
our @EXPORT = qw(farey);


sub farey
{
	my ($x, $N) = @_;
    	my ($a, $b) = (0, 1);
    	my ($c, $d) = (1, 0);
	while ($b <= $N && $d <= $N) {
		my $mediant = ($a+$c)/($b+$d);
		if ($x == $mediant) {
			if ($b + $d <= $N) {
				return ($a+$c, $b+$d);
			} elsif ($d > $b) {
				return ($c, $d);
			} else {
				return ($a, $b);
			}
		} elsif ($x > $mediant) {
			($a, $b) = ($a+$c, $b+$d);
		} else {
			($c, $d) = ($a+$c, $b+$d);
		}
	}
	if ($b > $N) {
		return ($c, $d);
	} else {
		return ($a, $b);
	}
}

1;
