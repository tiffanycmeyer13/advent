#!/usr/bin/perl


$file="puzzle_input";
open IN, "<$file" or die "cannot open";
@lines=<IN>;

$points=0;

foreach $line(@lines)
{
  chomp $line;
  @splitCol=split(' ',$line);
  $elf=$splitCol[0];
  $me=$splitCol[1];

  #wins
  if($elf eq "C" and $me eq "X")
  { $points+=6; }
  elsif($elf eq "A" and $me eq "Y")
  { $points+=6; }
  elsif($elf eq "B" and $me eq "Z")
  { $points+=6; }

  #ties
  elsif($elf eq "A" and $me eq "X")
  { $points+=3; }
  elsif($elf eq "B" and $me eq "Y")
  { $points+=3; }
  elsif($elf eq "C" and $me eq "Z")
  { $points+=3; }
 
 
 
  if($me eq "X") #rock
  { $points+=1; }
  elsif($me eq "Y") #paper
  { $points+=2; }
  elsif($me eq "Z") #scissors
  { $points +=3; }

}

print "Total points: $points\n";
