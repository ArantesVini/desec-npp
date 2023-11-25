
# Wireshark

- Possui interface grafica
- Pode filtrar o tipo de trafego
- Suporta a maioria dos protocolos

Por padrao o **Wireshark** ja vem instalado no Kali Linux, entao basta digitar `wireshark` no terminal para iniciar

## Filtros

No filtro inicial podemos adicionar diretamente o protocolo ou aplicar diferentes filtros, como:

- `ip.addr == {ip}` para buscar um ip especifico
- `ip.addr == {ip} & ip.addr == {ip}` para buscar um par de IP's
- `ip.src {ip}` ip de origem
- `ip.dst` ip de destino
- `tcp.port {porta}` buscar por uma porta especifica
- Alem disso, em opcoes temos alguns filtros pre definidos que podem facilitar
- Podemos usar o wireshark para abrir uma captura especifica tambem
- Nessa aba de filtros personalizados podemos tamb'em criar nossos proprios filtros em **Manage Capture Filters**. Exemplo criado foi um filtro de FTP que filtra a porta 21 usando o *Filter* `port 21`
- Com esse filtro me conectei ao ambiente ensino usando `ftp ftp.businesscorp.com.br` e tentei realizar login
- Podemos usar a mesma logica para filtrar qualquer porta, mas apenas com esse exemplo de FTP ja conseguimos levantar informacoes sobre o servidor
- podemos buscar *strings* dentro de um protocolo, exemplo `tcp contains pass` procurando uma requisicao dentro do protocolo TCP que contenha senha
- `http request` procura todas as requisicoes http
- podemos ainda usar `http.request.uri contains stringaqui` para procurar URI especificas
- sempre podemos consultar o [Site do wireshark](https://www.wireshark.org/) para conseguir mais informacoes

## TCPDUMP

- Analisar baseado em *Command Line Interface*
- No Kali basta usar `tcpdump -v -i eth0` para comecar a capturar de forma verbosa na interface eth0
- com `-w {nome do arquivo}.pcap` iremos salvar o output em um arquivo *pcap*
- com o `tcpdump -r {arquivo}.pcap` podemos tamber ler arquivos *pcap*
- Temos a flag `-n` para exibir o endereco IP e nao o nome da maquina
- Sempre usamos as flags juntas, exemplo que vimos at'e agora `tcpdump -vnr` para ser *verboso*, dar o *endereco* ao inves do nome e *ler um arquivo*
- se inserirmos um protocolo ao final do comando de leitura podemos filtrar protocolos, exemplo `tcpdump -vnr teste.pcap udp` buscando apenas pacotes **relacionados** ao UDP
- quando filtrarmos um ip podemos usar `tcpdump -vnr teste.pcap src host {ip}` para buscar um IP de origem ou `tcpdump -vnr teste.pcap dst host {ip}` buscando um IP de destino
- podemos usar o *pipe* `|` e dar continuidade usando comandos linux