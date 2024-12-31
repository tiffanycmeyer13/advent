#!/usr/bin/perl

$inFile="sample.txt";
#$inFile="input.txt";
open IN, "<$inFile" or die "cannot open $inFile\n";

@lines=<IN>;

foreach $line(@lines)
{
  chomp $line;
  @splitCol=split(/  /,$line);

  push(@colA, $splitCol[0]);
  push(@colB, $splitCol[1]);
}

@sortedA = sort { $a <=> $b } @colA;
@sortedB = sort { $a <=> $b } @colB;


$sum=0;

for($i=0; $i<=$#sortedA; $i++)
{
  $nSum=$sortedA[$i] - $sortedB[$i];
  $sum+=abs($nSum);
}

print "Sum is: $sum\n";

