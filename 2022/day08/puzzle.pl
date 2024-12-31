#!/bin/perl

$file="sample";
$file="puzzle_input";


open IN, "<$file" or die "cannot open";
@lines=<IN>;

$visible=0;
LINE: for($i=0; $i<=$#lines; $i++)
{
  chomp $lines[$i];

  #count all trees as visible if in the first or last row
  if($i==0 or $i==$#lines)
  {
    foreach $char(split //, $lines[$i]) { $visible++; }
    next; 
  }

#  $j=0; #counter for current character spot
#loop through each char in the current row
  @splitLine=split(//, $lines[$i]);
TREE: for($j=0; $j<=$#splitLine; $j++)
#TREE: foreach $char(split //, $lines[$i])
  {
    $char=$splitLine[$j];
    #print "Line: $i, Col: $j, Char: $char\n";
    $notVis=0;
    #count all trees as visible if on the edges
    if($j==0 or $j==length($lines[$i])-1) { $t=0; } #$visible++; }
    else 
    {
      #loop through all lines again
      for($k=0; $k<=$#lines; $k++)
      {
#        $l=0; #counter for looped current char spot
        chomp $lines[$k];
        @splitLine2=split(//,$lines[$k]);
        
LL:      for($l=0; $l<=$#splitLine2; $l++)
#        foreach $char2(split//, $lines[$k])
        {
          $char2=$splitLine2[$l]; 
 
          #print "\t\ti line: $i j: $j char: $char length: $#splitLine\n";
          #print "\t\tk line: $k l: $l char: $char2 length: $#splitLine2\n";

          if($k == $i) #need to look through all characters in this row
          {
#            if($l==$j) { next LL; } #this is the same char we are comparing against
            #if($l<$j and $char<=$char2) { print "\tCheck1 $char vs $char2\n"; $notVis++; $l=$j-1; next LL; }
            #elsif($l>$j and $char<=$char2) { print "\tCheck2 $char vs $char2\n"; $notVis++; $l=length($lines[$k]); next; }
            if($l<$j and $char<=$char2) { $notVis++; $l=$j-1; next LL; }
            elsif($l>$j and $char<=$char2) { $notVis++; $l=length($lines[$k]); next; }
          } else { #just need to look through the same column
            if($l != $j) { next; } #only need to look at the same column
            #print "$char vs $char2\n";
            #print "\t\ti line: $i char: $char\n";
            #print "\t\tk line: $k char: $char2\n";
            #if($k<$i and $char <= $char2) { print "\tCheck3 $char vs $char2\n"; $notVis++; $k=$i-1; next; }             
            #if($k>$i and $char <= $char2) { print "\tCheck4 $char vs $char2\n"; $notVis++; $k=$#lines; next; }             
            if($k<$i and $char <= $char2) { $notVis++; $k=$i-1; next; }             
            if($k>$i and $char <= $char2) { $notVis++; $k=$#lines; next; }             
          }
        }
      }
    }
    if($notVis<4) { $visible++; } #print "\tVisible\n"; }
  }

}

print "Visible Trees: $visible\n";
