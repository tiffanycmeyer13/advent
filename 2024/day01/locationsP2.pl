#!/usr/bin/perl

$inFile="sample.txt";
$inFile="input.txt";
open IN, "<$inFile" or die "cannot open $inFile\n";

@lines=<IN>;

foreach $line(@lines)
{
  chomp $line;
  @splitCol=split(/  /,$line);

  push(@colA, $splitCol[0]);
  push(@colB, $splitCol[1]);
}

$sum=0;
foreach $a(@colA)
{
  $count=0;
  foreach $b(@colB)
  {
    if($a == $b) { $count++; }
  }
  $sum+=($count * $a);
}

print "Sum is: $sum\n";

