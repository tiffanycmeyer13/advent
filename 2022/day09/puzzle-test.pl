#!/bin/perl
#use List::MoreUtils qw( minmax );
use List::Util qw( min max );



$file="sample";
#$file="puzzle_input";


open IN, "<$file" or die "cannot open";
@lines=<IN>;

$stringRow='';
  for($x=0; $x<=4; $x++)
  {
   $stringRow.="X";
  }


#for($y=0; $y<=$rowLength; $y++)
for($y=0; $y<=5; $y++)
{
  push(@grid,$stringRow);
}


$grid[1][0]="H";
  
print "$grid[1][0],$grid[1][1],$grid[0][0]\n";

for($y=0; $y<=4; $y++)
{   
#  for($x=0; $x<=5; $x++)
#  {
    print "$grid[$y]";
#  }
  print "\n";
}
