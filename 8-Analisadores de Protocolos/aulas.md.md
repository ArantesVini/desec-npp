
# Wireshark

- Possui interface grafica
- Pode filtrar o tipo de trafego
- Suporta a maioria dos protocolos

Por padrao o **Wireshark** ja vem instalado no Kali Linux, entao basta digitar `wireshark` no terminal para iniciar

## Filtros

No filtro inicial podemos adicionar diretamente o protocolo ou aplicar diferentes filtros, como:

- `ip.add == {ip}` para buscar um ip especifico
- `ip.add == {ip} & ip.add == {ip}` para buscar um par de IP's
- `ip.src {ip}` ip de origem
- `ip.dst` ip de destino
- `tcp.port {porta}` buscar por uma porta especifica
- Alem disso, em opcoes temos alguns filtros pre definidos que podem facilitar
- Podemos usar o wireshark para abrir uma captura especifica tambem