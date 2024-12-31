#!/bin/perl

$file="sample";
$file="puzzle_input";


open IN, "<$file" or die "cannot open";
@lines=<IN>;

LINE: foreach $line(@lines)
{
  chomp $line;

  $packet="";
  $i=0;
  foreach $char(split //, $line)
  {
    if($packet=~$char) 
    {
      $packet.=$char;
      $first=0;
      $newPacket="";
      for $char2(split //, $packet)
      {
        if($char2 eq $char and $first == 0) 
        {
          $first=1;
          next;
        }
        if($first == 1)
        {
          $newPacket.=$char2
        }
      }
      $packet=$newPacket; 
    } else {
      $packet.=$char;
    }
    #print "Packet: $packet\n";
    $i++; 
    if(length($packet) == 14) { print "I: $i\n"; next LINE; }
  }
}

