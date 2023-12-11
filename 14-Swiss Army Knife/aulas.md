
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

