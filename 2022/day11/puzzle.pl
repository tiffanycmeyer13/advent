#!/bin/perl

$file="sample";
#$file="puzzle_input";


open IN, "<$file" or die "cannot open";
@lines=<IN>;

%monkeys=();
$done=0;
LINE: foreach $line(@lines)
{
  chomp $line;
  if($line=~/^Monkey/)
  {
    $curMonkey=$line;
    $curMonkey=~s/ //;
    $curMonkey=~s/://;
  }
  @splitCol=split(/:/, $line);
  if($line=~/Starting/)
  {
    $nums=$splitCol[-1];
    $nums=~s/ //g;
  } elsif($line=~/Operation/)
  {
    $oper=$splitCol[-1];
  } elsif ($line=~/Test/)
  {
    $test=$splitCol[-1]; 
    $test=~s/ //g;
    $test=~s/divisibleby//; 
  } elsif($line=~/true/)
  {
    @splitSpace=split(/ /,$line);
    $tMonk="Monkey$splitSpace[-1]"; 
  } elsif($line=~/false/)
  {
    @splitSpace=split(/ /,$line);
    $fMonk="Monkey$splitSpace[-1]"; 
    $done=1; 
  }
  if($done==1)
  {
  $monkeys { $curMonkey } = {
      items => $nums,
      ops => $oper,
      test => $test,
      true => $tMonk,
      false => $fMonk,
      searched => 0,
    };
    $done=0;
  }

}

#print $monkeys{Monkey0}{items}; 



for $monk (sort keys %monkeys) {
  print "$monk\n";
  for $role (keys %{ $monkeys{$monk} } ) {
  
    print "\t$role=$monkeys{$monk}{$role}\n ";
  }
  #print "\n";
}

print "-----------------------------------------------\n";

#for($count=1; $count<=20; $count++)
for($count=1; $count<=10000; $count++)
{
for $monk (sort keys %monkeys) {
  print "$monk:\n";

  #loop through items
  @items=split(/,/, $monkeys{$monk}{items});
  foreach $item(@items)
    {
      $new=0;
      print "\tOriginal $item\n";
      $monkeys{$monk}{searched}++;
  #calculate operation
      $oper=$monkeys{$monk}{ops};
      #print "\toriginal oper $oper\n";
      $oper=~s/new = //g;
      $oper=~s/ //g;

      if($oper=~/\+/) { @ops=split(/\+/, $oper); $char="+"; }
      if($oper=~/\*/) { @ops=split(/\*/, $oper); $char="*"; }

      if($ops[0] eq "old") { $ops[0]=$item; }
      if($ops[1] eq "old") { $ops[1]=$item; }
      
      if($char eq "+") { $new= $ops[0] + $ops[1]; }
      if($char eq "*") { $new= $ops[0] * $ops[1]; }
      print "\tNew item number: $new\n";

      #monkey gets bored, divide by 3
      $new=int($new/3);
      print "\tBored monkey number: $new\n";

      #check test
      $test=$monkeys{$monk}{test};
      $nItems="";
      $nMonk="";
      $rem=$new%$test;
      print "REMAINDER: $rem \t\t$test $new\n";
      if($rem == 0) 
      { 
        $nMonk=$monkeys{$monk}{true};
        $nItems=$monkeys{$nMonk}{items};
        $nItems.=",$new";
        $nItems=~s/^,//;
        $monkeys{$nMonk}{items}=$nItems;
        print "TRUE - New item ($new) went to $nMonk\n\t$monkeys{$nMonk}{items}\n";
      } else
      {
        $nMonk=$monkeys{$monk}{false};
        $nItems=$monkeys{$nMonk}{items};
        $nItems.=",$new";
        $nItems=~s/^,//;
        $monkeys{$nMonk}{items}=$nItems;
        print "False ($new) item went to $nMonk\n\t$monkeys{$nMonk}{items}\n";
      }
    }
    $monkeys{$monk}{items} = ""; 
  #for $role (keys %{ $monkeys{$monk} } ) {
  #
  #  print "\t$role=$monkeys{$monk}{$role}\n ";
  #}
  #print "\n";
}

print "ROUND $count:\n-----------------------------------------\n";
for $monk (sort keys %monkeys) {
  print "$monk:\n";
  print "\t$monkeys{$monk}{items}\n";
  print "\tSearched $monkeys{$monk}{searched}\n";
}
#die;
}
