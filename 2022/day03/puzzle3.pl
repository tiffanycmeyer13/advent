#!/bin/perl

$file="sample";
$file="puzzle_input";

$lc="abcdefghijklmnopqrstuvwxyz";
$uc="ABCDEFGHIJKLMNOPQRSTUVWXYZ";

open IN, "<$file" or die "cannot open";
@lines=<IN>;

$priorities=0;

print "Number of lines: $#lines\n";

for($j=0; $j<$#lines; $j+=3)

{
#  if($j>6) { die;  }
  chomp $lines[$j];
  chomp $lines[$j+3];
  chomp $lines[$j+2];

  $same="";

  print "Lines: $j $#lines\n";

}

