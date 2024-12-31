#!/bin/perl

$file="sample";
$file="puzzle_input";

$lc="abcdefghijklmnopqrstuvwxyz";
$uc="ABCDEFGHIJKLMNOPQRSTUVWXYZ";

open IN, "<$file" or die "cannot open";
@lines=<IN>;

$priorities=0;

print "Number of lines: $#lines\n";

LINE: for($j=0; $j<$#lines; $j+=3)

{
  #if($j>310) { print "Thus sum of the priorities are: $priorities\n";
#  die;  }
  chomp $lines[$j];
  chomp $lines[$j+3];
  chomp $lines[$j+2];

  $same="";

  print "Lines: $j $#lines\n";

  foreach $char1 (split //, $lines[$j])
  {
    foreach $char2 (split //, $lines[$j+1])
    { 
      if($char1 eq $char2)
      { 
        $same.=$char1;
      }
    }
  }
  if(length($same)==1)
  {
    $priorities+=calcPoints($same); 
    #print "Prioritys: $same,$priorities\n";
    next LINE; 
  } else {
    foreach $char1 (split //, $same)
    {
      foreach $char2 (split //, $lines[$j+2])
      {
 
        if($char2 eq $char1)
        {
          $priorities+=calcPoints($char1);
          #print "Priority, $char1,$priorities\n";
          next LINE;
        }
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
