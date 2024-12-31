#!/usr/bin/perl

#$file="sample";
$file="puzzle_input";

open IN, "<$file" or die "cannot open";
@lines=<IN>;

$setup=1; #setup is true

$row1="FHBVRQDP";
$row2="LDZQWV";
$row3="HLZQGRPC";
$row4="RDHFJVB";
$row5="ZWLC";
$row6="JRPNTGVM";
$row7="JRLVMBS";
$row8="DPJ";
$row9="DCNWV";

foreach $line(@lines)
{
  chomp $line;
  if($line!~/move/) { next; }
  
  $line=~s/move//;
  $line=~s/from //;
  $line=~s/to //;

  @splitRow=(split / /,$line);
  $move=$splitRow[1];
  $from=$splitRow[2];
  $to=$splitRow[3];

  if($from == 1) { $fromStack=$row1; }
  elsif($from ==2) {$fromStack=$row2; }
  elsif($from ==3) {$fromStack=$row3; }
  elsif($from ==4) {$fromStack=$row4; }
  elsif($from ==5) {$fromStack=$row5; }
  elsif($from ==6) {$fromStack=$row6; }
  elsif($from ==7) {$fromStack=$row7; }
  elsif($from ==8) {$fromStack=$row8; }
  elsif($from ==9) {$fromStack=$row9; }

  if($to == 1) { $toStack=$row1; }
  elsif($to ==2) {$toStack=$row2; }
  elsif($to ==3) {$toStack=$row3; }
  elsif($to ==4) {$toStack=$row4; }
  elsif($to ==5) {$toStack=$row5; }
  elsif($to ==6) {$toStack=$row6; }
  elsif($to ==7) {$toStack=$row7; }
  elsif($to ==8) {$toStack=$row8; }
  elsif($to ==9) {$toStack=$row9; }

  print $line."\n";

  $part=length($fromStack) - $move;
  $newStack=substr($fromStack,$part);
  $fromStack=substr($fromStack,0,$part);
  $toStack.=$newStack;

  if($from == 1) { $row1=$fromStack; }
  elsif($from ==2) {$row2=$fromStack; }
  elsif($from ==3) {$row3=$fromStack; }
  elsif($from ==4) {$row4=$fromStack; }
  elsif($from ==5) {$row5=$fromStack; }
  elsif($from ==6) {$row6=$fromStack; }
  elsif($from ==7) {$row7=$fromStack; }
  elsif($from ==8) {$row8=$fromStack; }
  elsif($from ==9) {$row9=$fromStack; }

  if($to == 1) { $row1=$toStack; }
  elsif($to ==2) {$row2=$toStack; }
  elsif($to ==3) {$row3=$toStack; }
  elsif($to ==4) {$row4=$toStack; }
  elsif($to ==5) {$row5=$toStack; }
  elsif($to ==6) {$row6=$toStack; }
  elsif($to ==7) {$row7=$toStack; }
  elsif($to ==8) {$row8=$toStack; }
  elsif($to ==9) {$row9=$toStack; }

  print "\tRow1: $row1\n";
  print "\tRow2: $row2\n";
  print "\tRow3: $row3\n";
  print "\tRow4: $row4\n";
  print "\tRow5: $row5\n";
  print "\tRow6: $row6\n";
  print "\tRow7: $row7\n";
  print "\tRow8: $row8\n";
  print "\tRow9: $row9\n";
} 

