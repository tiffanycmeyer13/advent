#!/bin/perl
#use List::MoreUtils qw( minmax );
use List::Util qw( min max );



$file="sample";
#$file="puzzle_input";


open IN, "<$file" or die "cannot open";
@lines=<IN>;


$visible=0;
$row=0;
$col=0;
LINE: for($i=0; $i<=$#lines; $i++)
{
  chomp $lines[$i];
  @splitLine=split / /, $lines[$i];
  $dir=$splitLine[0];
  $dist=$splitLine[1];

  if($dir eq "D") { $row=$row-$dist; push(@rows, $row); }
  elsif($dir eq "U") { $row+=$dist; push(@rows, $row); }
  elsif($dir eq "R") { $col+=$dist; push(@cols, $col); }
  elsif($dir eq "L") { $col-=$dist; push(@cols, $col); }

}

$rMax= max @rows;
$rMin= min @rows;
$cMax = max @cols;
$cMin = min @cols;

$rowLength=$rMax-$rMin;
$colLength=$cMax-$cMin;

#print "Rows: $rMax,$rMin\n";
#print "\t".$rMax-$rMin."\n";
#print "Cols: $cMax,$cMin\n";
#print "\t".$cMax-$cMin."\n";


  #for($x=0; $x<=$colLength; $x++)
  for($x=0; $x<=$cMax; $x++)
  {
    push(@gridRow,"X");
  }


#for($y=0; $y<=$rowLength; $y++)
for($y=0; $y<=$rMax; $y++)
{
  push(@grid,\@gridRow);
  #print "@gridRow\n";
}


$Tx=0;
$Ty=0;
$Hx=0;
$Hy=0;

for($i=0; $i<=$#lines; $i++)
{
  chomp $lines[$i];
  @splitLine=split / /, $lines[$i];
  $dir=$splitLine[0];
  $dist=$splitLine[1];

  print "$dir $dist\n";
  if($dir eq "D") 
  { 
    #$Hy-$dist; 
  }
  elsif($dir eq "U") 
  {

  }
  elsif($dir eq "R") 
  { 
    for($d=0; $d<$dist; $d++)
    {
      print "$d\n";
      if($d==0)
      {
        $Hx++;
        #$grid[$Hx][$Hy]="H";
        $grid[2]="H";
        print "H: ($Hx,$Hy)\n";
        print "\t$grid[$Hx][$Hy]\n";
	print "\t\t$grid[$Hx+1][$Hy]\n";
        #print "\t$grid[0][1],$grid[1][1],$grid[2][2],$grid[3][3],$grid[4][4],$grid[5][5]\n";
      } else {
        $Tx++;
        $Hx++;
        $grid[$Tx-1][$Ty]="#";
        $grid[$Tx][$Ty]="T";
        $grid[$Hx][$Hy]="H";
      }
      for($y=0; $y<=$rMax; $y++)
      {
        for($x=0; $x<=$cMax; $x++)
          {
            print "$grid[$x][$y]";
          }
          print "\n";
      }
      die;
    }
  }
  elsif($dir eq "L") 
  { 
    for($d=0; $d<$dist; $d++)
    {
      if($d==0) 
      { 
        $Hx-1;
        $grid[$Hx][$Hy]="H";
      } else {
        
      }
    }

    die;	
  }



#for($y=0; $y<=$rMax; $y++)
#{   
#  for($x=0; $x<=$cMax; $x++)
#  {
#    print "$grid[$x][$y]";
#  }
#  print "\n";
#}
}
