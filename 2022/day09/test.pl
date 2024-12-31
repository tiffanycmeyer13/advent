#!/usr/bin/perl
#
# 2D Array Push, uses references to the array being pushed
#

use strict;
use warnings;

#use Data::Dump;

# Empty 2D array
my @TwoD = ();

# Values to be pushed
my @A0 = ('a', 'b', 'c');
my @A1 = ('d', 'e', 'f');
my @A2 = ('g', 'h', 'i');

push(@TwoD, \@A0);
push(@TwoD, \@A1);
push(@TwoD, \@A2);

#dd \@TwoD;

$TwoD[1][1]="X";

print "Expect 'a': $TwoD[0][0]";
print "\n";

print "Expect 'e': $TwoD[1][1]";
print "\n";

print "Expect 'i': $TwoD[1][0]";
print "\n";
