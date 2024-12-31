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

  if($a>=$c and $a<=$d) { $overlaps++; }
  elsif($b>=$c and $b<=$d) {$overlaps++; }
  elsif($c>=$a and $c<=$b) { $overlaps++; }
  elsif($d>=$a and $d<=$b) {$overlaps++; }

  #print "$section1 vs $section2\n";
}

print "Number of complete overlaps: $overlaps\n";
