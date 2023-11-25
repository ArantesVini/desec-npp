
# Semana 02 - TCP/IP


# Scan interno e Acesso

Primeiro desafio foi descobrir o MAC do Atacante, como resolvi usar tcpdump usei o comando:
`tcpdump -vnr scan_interno.pcap -n -e | cut -d " " -f 2 | sort | uniq -c | sort -un`
Isso busca o endereco do arquivo focando no protocolo ethernet puramente, cortei o segundo campo delimitado por espaco, o MAC, agrupei e peguei do maior para o menor

Para descobrir o fabricante, usei o site MAC Vendors

usei o comando `sudo tcpdump -vnr scan_interno.pcap -i eth0 ether host {mac do atacante` para buscar a eth0 do atacante e do alvo

Para identificar a porta alvo usei o seguinte comando do TCPDUMP
`tcpdump -vnr scan_interno.pcap src host {ip do atacante} | cut -d "," -f1 | grep -v tos | grep "F\."`
Dessa forma buscando por todas as flag FIN ACK que indica que houve o THS

Para descobrir a versao do servico acho que fiz de uma forma mais manual que era necessaria

`tcpdump -A -vs100000 -r scan_interno.pcap -i dst port '(lista de portas)'`

No fim localizei que ele havia conseguido se conectar em um servico especifico, continuei buscando ate encontrar a versao detalhada. As credenciais usadas estavam logo abaixo

# Analise de Bytes

Para os desafios de analise de bytes, fiz um codigo simples e bruto em python para ler packets o codigo e o [packet_reader](packet_reader.py)

# Terceira parte Parte - Invasao

No comeco estava bem tranquilo, reaproveitei a maioria dos comandos TCPDUMP e consegui chegar ate o ultimo VLAB, ali o desafio de verdade comecou.

1 - Preferi usar o Wireshark, ja que com a GUI ficou mais facil entender de qual para qual packet devia focar minha atencao

2- Pesquisei sobre como ocorrem as transacoes de um PDF no comando **RETR** do FTP

3- Achei um site que dava justamente a informacao de como pegar um packet de transferencia PDF e usar o Wireshark para salvar o arquivo como um pdf, abri o PDF e usei a chave