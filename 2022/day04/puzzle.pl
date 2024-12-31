#!/bin/perl

$file="sample";
$file="puzzle_input";


open IN, "<$file" or die "cannot open";
@lines=<IN>;

$overlaps=0;
$j=0; 

LINE: foreach $line(@lines)

{
  chomp $line;
  #if($j>6) { die; }
  @sections=split(/,/,$line);

  @subSection1=split(/-/,$sections[0]);
  @subSection2=split(/-/,$sections[1]);

  $a=$subSection1[0];
  $b=$subSection1[1];
  $c=$subSection2[0];
  $d=$subSection2[1];

  print "$a,$b,$c,$d\n";

  $section1=",";
  $section2=",";

  for($i=$a; $i<=$b; $i++)
  {
    $section1.="$i,"
  }
  for($i=$c; $i<=$d; $i++)
  { 
    $section2.="$i,"
  }

  $j++;
  #print "$section1 vs $section2\n";
  if($section1=~$section2 or $section2=~$section1) { $overlaps++; } #print "YES\n"; }
}

print "Number of complete overlaps: $overlaps\n";
