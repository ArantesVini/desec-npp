
# Visao Geral sobre WEB e HTTP

# Protocolo HTTP

O protocolo HTTP funciona atraves de trocas de requisicoes entre cliente e servidor.

O *Cliente* geralmente vai ser um **Browser** e o *Servidor* um **Web Server**

A estrutura do HTTP é um **Header** e um **Body**, e suporta vários métodos como **GET**, **POST**, **HEAD**, **PUT**, **DELETE**, **OPTIONS**...

Os mais utilizados sao o **GET** para requisitrar recursos e **POST** para enviar dados.

## HTTP Requext X HTTP Response

O protocolo HTTP funciona por meio de **Requests**, que sao solicitados ou chamadas do cliente para o servidor e as **Responses**, as respostas do servidor para o cliente.

As Request recebem um código conforme seu Status, como **200** - ok **404** - Not Found entre muitos outros.

Como naturalmente sou #teamDog uso sempre o [HTTP Status Dogs](https://http.dog/)

# Entendo o lado do Servidor

## Importancia do index.html

Um ponto crucial de qualquer Web Server é ter o arquivo index.html, sem esse arquivo (ou com a remocao do mesmo) o servidor fica exposto ao **dirbrowsing**, onde um possivel atacante pode ser acesso completo a toda estrutura do servidor.


Isso se aplica também a outros diretórios, caso um diretório for criado e nao ter o index.html acontece a mesma falha de seguranca quando se acessa o diretorio criado.

É possivel alterar o *.conf* do servidor apache para remover esse comportamento padrao, reotrnando um status *403* quando se tenta acessar um diretorio sem index.

## ServerTokens

Outro ponto de risco do servidor Apache é o parametro de **ServerTokens** que por padrao fica em **OS** que retorna várias informacoes sensiveis sobre o servidor.

O ideal é alterarpara **Prod** e também remover a assinatura do servidor, dessa forma Status *404* nao irao retornar informacoes sensiveis.

## Logs do servidor

Do lado do servidor, as informacoes de *logs* sao muito importantes, trazendo o agente que fez a requisicao, ferramenta e ate a versao utilizada, um exemplo utilizando o **Nkito**, que é um scanner de vulnerabilidades, muitas requisicoes sao feitas pelo mesmo endereco, o que ja chamaria atencao.