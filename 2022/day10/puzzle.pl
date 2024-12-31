#!/bin/perl

$file="sample";
$file="puzzle_input";

$X = 1;
$cycle=0;
$match=20;
$total=0;

open IN, "<$file" or die "cannot open";
@lines=<IN>;

foreach $line(@lines)
{
  chomp $line;
 # print "$line\n";
  if($line eq "noop")
  {
    $cycle++;
    $match=matchCycle($cycle, $match);
  } else { #addx
    @splitCol=(split/ /,$line);
    for $char(@splitCol)
    {
      if($char eq "addx") { $cycle++; $match=matchCycle($cycle, $match); }
      else {
        $cycle++;
        $match=matchCycle($cycle, $match);
        if($char =~/\-/) { $char=~s/\-//; $X=$X-$char; }
        else { $X=$X+$char; }
      }
    }
  }
}

print "Total strength: $total\n";

sub matchCycle
{
  $subCycle = shift; 
  $subMatch = shift;
  #print "\t$subCycle, $X\n";
  if($subCycle == $subMatch)
  {
    #print "\t\t$subCycle, $X\n";
    $subMatch+=40;
    $strength=$subCycle*$X;
    print "\t\t$subCycle, $strength\n";
    $total+=$strength;
  } 
  return $subMatch;
}
