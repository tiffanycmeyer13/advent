#!/usr/bin/perl

$file="puzzle1_input";
open IN, "<$file" or die "cannot open";
@lines=<IN>;

$calories=0;
$i=1;
foreach $line(@lines)
{
  chomp $line;
  if($line eq "")
  {
    push(@calorieCount, $calories);

    #print "Elf $i: $calories\n";
    $calories=0;
    $i++;
  }
  $calories+=$line;
}

@n = sort { $b <=> $a } @calorieCount;

print "$n[0],$n[-1]\n";

$x=0;
for($i=0; $i<3; $i++)
{
  $x+=$n[$i];
}

print "Max Calories: $n[0]\n";
print "Top 3 Elves Calories: $x\n\n";

print "$n[0],$n[1],$n[2]\n";
