#! /bin/env perl

# Shell History cloc

use strict;
use warnings;
use constant MIN => 13;

my $shtyp = $ENV{SHELL} // '';
$shtyp =~ /\/(\w+)$/ or die 'unknow shell type';
my $history_file = "$ENV{HOME}/.".$1."_history";

my %counter;
open( my $hf, '<', $history_file ) or die "艹你妈的，文件都不存在，读个钩八";
while ( my $line = <$hf> ) {
  $line =~ /(\w+)\b/;
  $counter{$1}++;
}
close $hf;

my @skeys = sort { $counter{$a} <=> $counter{$b} } keys %counter;
my ($other, $sum) = (0, 0);
foreach my $key (@skeys) {
  my $value = $counter{$key};
  $sum += $value;
  if ($value < MIN) {
    $other += $value;
    next;
  }
  printf ("%10s: %d\n", $key, $value);
}

printf ("%10s: %d (less then %d)\n", "Other", $other, MIN);
print "------------------------------\n";
printf ("%10s: %s\n", "Shel", $shtyp);
printf ("%10s: %d\n", "Diff",scalar @skeys);
printf ("%10s: %d\n", "Sum", $sum);
