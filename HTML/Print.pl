#!/usr/bin/perl

use HtmlPrint;

my $obj=HtmlPrint->new;
my $head= $obj->head;
my $body= $obj->body;
my $html=$head . $body;

my $outFile="out/t.html";
open(OUT, ">$outFile"); # 上書きオープン
print OUT $html; # $line の内容を出力

exit;
