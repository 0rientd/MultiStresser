# CÓDIGO FEITO PARA ESTUDOS DE THREADS EM LINGUAGEM PERL


# [!] ATENÇÃO [!]

--------------

Ao usar este script, você concorda que esta ciente de que ao realizar um ataque de negação de serviço (DoS) é crime, e que qualquer ataque realizado a um servidor, IP, site, computador ou qualquer outro dispositivo eletrônico ligado ou não a internet sem conscientização do dono resultará em pena de prisão e/ou multa perante as leis do Estado em que ataca e/ou esta atacando, e que você (usuário final) é totalmente responsável pelo uso deste script.

Eu não me responsabilizo pelo mal uso deste script.

--------------

# Descrição

Este script realiza um ataque de negação de serviço (DoS) baseado na potência do computador. O interessante dele é que ele faz um loop de criação de variaveis para criação de threads automáticas que retornam uma sub rotina.

É altamente recomendado que você possua computadores com um processador Core i3 ou semelhante e 4 Gb de RAM DDR3 ou mais pois com certeza vai travar seu computador caso não tenha estes requisitos.

É recomendado também que você use mantenha tudo fechado e rode somente o script para economizar mais memória RAM e seu computador não travar.


PS: Caso sua distro não seja Debian, aqui esta um link para baixar a versão 1.0 do script que é universal.

-> https://mega.co.nz/#!hoBxDLqK!0i9XcGwj9L0UiJSfTqbQvBvwWf__Bkl-F8WEvhDpBhc


# COMO EXECUTAR O SCRITP

Basta você caminhar até o diretório aonde se encontra o script e roda-lo com o comando "~$ perl MultiStresser.pl"


# DEPENDÊNCIAS 

Você precisará dos seguintes módulos instalados em seu computador:

* threads;
* threads::shared;
* IO::Socket::INET;
* utf8;

--------------
PS: Script disponível apenas para sistemas operacionais Linux para incentivar o uso de Sistemas Operacionais de Códigos Aberto. :D