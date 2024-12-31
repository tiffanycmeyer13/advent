#!/bin/perl

$file="sample";
$file="puzzle_input";

$totalDisk=70000000;
$needUnused=30000000;
$used=45390168;

$actualUnused=$totalDisk-$used;
$needToFree=$needUnused-$actualUnused;

print "Need to free up $needToFree\n";

open IN, "<$file" or die "cannot open";
@lines=<IN>;

%fileSizes=();

LINE: foreach $line(@lines)
{
  chomp $line;
  if($line=~/\$/) { $command=1; }
  else { $command=0; }

  if($command==1)
  {
    if($line=~/cd [a-z]/ or $line=~/\//) #new dir
    { 
      @splitLine=split(/ /,$line);
      $curDir=$splitLine[-1];
      $path.="/$curDir";
      $path=~s/\/\//\//g;
    } 
    elsif ($line eq "\$ cd \.\.")
    {
      #if(length($path)>1 and $path=~/\/$/)
      #{ print "In here?\n"; $path=~s/\/$//; }
      #print "In here?\n";
      $newPath=""; 
      @splitPath=split(/\//, $path);
      if($#splitPath == 1) { $path = "/"; }
      else {
        for($i=0; $i<$#splitPath; $i++)
        {
          $newPath.="/$splitPath[$i]";
        }
        $path=$newPath;
      }
      $path=~s/\/\//\//g;
    } elsif ($line eq "\$ ls")
    {
      next;
    }
    #print "$line\t$path\n";
  }
  elsif ($line=~/^[0-9]/)
  {
    @splitLine=split(/ /,$line);
    #print "$splitLine[0]\n";
 
    @splitPath=split(/\//, $path);
    $newPath2="";
    foreach $p(@splitPath)
    {
      $newPath2.="/$p";
      $newPath2=~s/\/\//\//g;
      push @{ $fileSizes{$newPath2} }, "$splitLine[0]";   
    }
  }

}

$deleteDir=$needToFree;

$totalTotals=0;
for $paths (keys %fileSizes)
{
  #print "$paths: @{ $fileSizes{$paths} }\n\n";

  $totals=0;
  for $i (0 .. $#{ $fileSizes{$paths} } ) 
  { 
    #print "\t$fileSizes{$paths}[$i]\n";
    $totals+=$fileSizes{$paths}[$i];
  }
  $diff=$totals-$needToFree;
  print "Totals $totals, Diff $diff\n";
  if($diff > 0 and $diff < $deleteDir) { $deleteDir=$diff; $dirSize=$totals; print "\t\t========$deleteDir\n" }
}

print "$dirSize\n";
