#!/bin/perl

$file="sample";
$file="puzzle_input";

$lc="abcdefghijklmnopqrstuvwxyz";
$uc="ABCDEFGHIJKLMNOPQRSTUVWXYZ";

open IN, "<$file" or die "cannot open";
@lines=<IN>;

$priorities=0;

LINE: foreach $line(@lines)

{
  chomp $line;
  $half=length($line)/2;

  $comp1=substr($line,0,$half);
  $comp2=substr($line,$half);

  print "$comp1\n$comp2\n\n";

  foreach $char1 (split //, $comp1)
  {
    foreach $char2 (split //, $comp2)
    { 
      if($char1 eq $char2)
      { 
        $priorities+=calcPoints($char1); 
        print "Priority: $char1,$char2,$priorities\n";
        next LINE; 
      }
    }
  }
}

print "Thus sum of the priorities are: $priorities\n";


sub calcPoints {
  $char = shift;
  $i=0;

  foreach $let(split//, $lc)
  {
    $i++;
    if($char eq $let) { return $i; }
  }

  
  foreach $let(split//, $uc)
  {
    $i++;
    if($char eq $let) { return $i; }
  }
}
