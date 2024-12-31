#!/bin/perl

#$file="sample";
$file="puzzle_input";

$X = 1;
$cycle=0;
$match=40;
$total=0;
$pixel=0;

foreach (1..40) { push(@sprite,"."); }
foreach (1..40) { push(@CRT1,"."); }

@curSprite=@sprite;
$curSprite[$X-1]="#";
$curSprite[$X]="#";
$curSprite[$X+1]="#";

#foreach $e(@cycle1) { print "$e"; }

#die;
open IN, "<$file" or die "cannot open";
@lines=<IN>;

foreach $line(@lines)
{
  chomp $line;
 # print "$line\n";
  if($line eq "noop")
  {
    $cycle++;
    if($curSprite[$pixel] eq "\#") { $CRT1[$pixel] = "#"; }
    $pixel++;
    $match=matchCycle($cycle, $match);
    
  } else { #addx
    @splitCol=(split/ /,$line);
    for $char(@splitCol)
    {
      if($char eq "addx")
      { 
        $cycle++; 
        if($curSprite[$pixel] eq "\#") { $CRT1[$pixel] = "#" }
        $pixel++;
        #print "Cycle $cycle:";
        #foreach $e(@CRT1) { print "$e"; } print "\n";
        $match=matchCycle($cycle, $match);  
      } else {
        $cycle++;
        if($curSprite[$pixel] eq "\#") { $CRT1[$pixel] = "#" }
        $pixel++;
        #print "Cycle $cycle:";
        #foreach $e(@CRT1) { print "$e"; } print "\n";
        $match=matchCycle($cycle, $match);
        if($char =~/\-/) { $char=~s/\-//; $X=$X-$char; }
        else { $X=$X+$char; }
        @curSprite=@sprite;
        $curSprite[$X-1]="#";
        $curSprite[$X]="#";
        $curSprite[$X+1]="#";
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
    #print "\t\t$subCycle, $strength\n";
    #$total+=$strength;
    foreach $ex(@CRT1) { print "$ex"; }
    print "\n";
    @CRT1=@sprite;
    @curSprite=@sprite;
    $curSprite[$X-1]="#";
    $curSprite[$X]="#";
    $curSprite[$X+1]="#";
    $pixel=0;
  } 
  return $subMatch;
}
