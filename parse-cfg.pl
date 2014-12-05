#!/usr/bin/perl -w
use strict;

my %level;

while(<>) {
	s/\xD//;	s/\xA//;
	s/\s*{\s*$//;
	s/\s*}\s*$//;
	s/\s*;\s*$//;
	my ($space, $rest) = /^(\s*)(.*)$/;
	next unless $rest;
	my $len = length($space);
	$level{$len} = $rest;

	# print
	my $i = 0;
	my @out = ();
	while($i <= $len) {
		push @out, $level{$i} if defined $level{$i};
		$i++;
	}
	print join(" ", "set", @out, "\n");
}
