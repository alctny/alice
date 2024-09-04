#! /bin/env perl

use strict;
use warnings;
use constant MIN => 13;

my $shtyp = $ENV{SHELL};
$shtyp =~ /\/(\w+)$/;
my $history_file = "$ENV{HOME}/.".$1."_history";

my %counter;
open( my $hf, '<', $history_file ) or die "艹你妈的，文件都不存在，读个钩八";
while ( my $line = <$hf> ) {
  $line =~ /(\w+)\b/;
  $counter{$1} = ($counter{$1} // 0)+ 1
}
close $hf;

my @sorted_keys = sort { $counter{$a} <=> $counter{$b} } keys %counter;

my $other = 0;
my $sum = 0;
foreach my $key (@sorted_keys) {
  my $value = $counter{$key};
  $sum += $value;
  if ($value < MIN) {
    $other += $value;
    next;
  }
  printf ("%10s: %d\n", $key, $value);
}
printf ("%10s: %d (less then %d)\n", "OTHER", $other, MIN);
print "----------------\n";
printf ("%10s: %d\n", "Sum", $sum);
