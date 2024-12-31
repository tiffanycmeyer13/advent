#!/bin/perl

$file="sample";
#$file="puzzle_input";

#make hash for letters and values
$number = 1;
foreach('a'..'z'){
        $alpha_nums{$_} = $number;
        $number++;
}

open IN, "<$file" or die "cannot open";
@lines=<IN>;

@topoMap=();
@moveMap=();


foreach $line(@lines)
{
  chomp $line;

  $charRow="";
  $moveRow="";
  foreach $char(split//,$line)
  {
    $charRow.=$char;
    $moveRow.="X";
    #print "$char, $alpha_nums{$char}\n";
    #print "$char";
  }
  #print "\n";
  push(@topoMap, $charRow);
  push(@moveMap, $moveRow);
}


print "\n\n";

for($i=0; $i<=$#topoMap; $i++)
{
  #print $topoMap[$i]."\n";
  @splitMoveRow=split(//,$moveMap[$i]);
  @splitCharRow=split(//,$topoMap[$i]);
  $col=0;
  for $char(split//,$topoMap[$i])
  {
    #print "$char";
    if($char eq "S") #startingPoint
    {
      @pos=($i,$col);
      #0,0
      #start by looking up
      if($i<0) { next; } #at first row
      #next look to the left
      elsif($col<0) { next; } #far left  
      #next look to the right
      do {
        @updatedRow=@splitMoveRow; #create new row for this case
        if($char eq "S") { $updatedRow[$col]=">"; $char=""; } #first move
        else{
          $curChar=$splitCharRow[$col];
          $nextChar=$splitCharRow[$col+1];

          print "------$curChar $nextChar\n";
          print "$alpha_nums{$curChar} - $alpha_nums{$nextChar}\n";
          $diff = $alpha_nums{$curChar} - $alpha_nums{$nextChar};
          if($curChar eq "E") { print "It's over\n"; }
          elsif($diff<-1) { $col=$#splitCharRow; print "diff $diff, NEXT\n"; next; } # 
          else #we can move to this block
          { 
            $updatedRow[$col]=">";
            @pos=($i,$col);
            print "New position, $curChar, $i, $col\n";
            print "\t$diff > \n"; 
          }
        }
        $col++;
      }
      while ($col < $#splitCharRow); 
       
    }


  }
  print "\n";
}


