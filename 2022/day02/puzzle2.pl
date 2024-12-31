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
  $end=$splitCol[1];

  #Loss
  if($end eq "X")
  {
    if($elf eq "A") { $me="C"; }
    elsif($elf eq "B") { $me="A"; }
    elsif($elf eq "C") { $me="B"; }
  }
  #Draw
  elsif($end eq "Y")
  {
    $points+=3;
    $me=$elf;
  }
  #Win
  elsif($end eq "Z")
  {
    $points+=6;
    if($elf eq "C") { $me="A"; }
    elsif($elf eq "A") { $me="B"; }
    elsif($elf eq "B") { $me="C"; }
  }
  

  if($me eq "A") #rock
  { $points+=1; }
  elsif($me eq "B") #paper
  { $points+=2; }
  elsif($me eq "C") #scissors
  { $points +=3; }

}

print "Total points: $points\n";
