#!/bin/perl
#use List::MoreUtils qw( minmax );
use List::Util qw( min max );

$file="sample";
#$file="puzzle_input";


open IN, "<$file" or die "cannot open";
@lines=<IN>;

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
    $stringRow.="X";
  }


#for($y=0; $y<=$rowLength; $y++)
for($y=0; $y<=$rMax; $y++)
{
  push(@grid,$stringRow);
  print "\t$stringRow\n";
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
    @splitRow=split(//,$grid[$Hy]);
    for($d=0; $d<$dist; $d++)
    {
      print "$d\n";
      if($d==0)
      {
        $Hx++; 
        $splitRow[$Hx]="H";
      } else {
        $Tx++;
        $Hx++;
        $splitRow[$Tx-1]="#";
        $splitRow[$Tx]="T";
        $splitRow[$Hx]="H";
      }
    } #end for dist
      $stringRow=concatSub(@splitRow);
      $grid[$Hy]=$stringRow;
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
  }

for($y=0; $y<=$rMax; $y++)
{   
   print "$grid[$y]";
  print "\n";
}
    die;	
}

sub splitRowSub
{
  $stringSub=shift;
  @stringArrSub=split(//,$stringSub);

  return @stringArrSub;
}

sub ConcatSub
{
  @arrSub=$_;
  $concatString="";
  foreach $let(@arrSub)
  {
    $concatString.="$let";
  }

  return $concatString;
}
