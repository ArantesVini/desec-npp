

# HTML Parsing

Foi bem tranquilo, apenas usei o [HTML Parser](parsing_html.sh).

# Malware no servidor

Nessa parte optei por usar o Wireshark por nao ser o foco da atividade, peguei o endereco e cruzei com os subdominios que o Parser retorna.

Para a segunda etapa do desafio, fiz o codigo que [ativa o malware](vl_activate_malware.sh) e no fim retorna o index.html necessario.

# VPN - Malware no Servidor

Achei que seria bem simples, mas sofri muito a toa, na primeira parte estava focando em ja ativar o malware e pegar o html do host infectado, o que resultou em fracasso atras de fracasso.

Foquei em apenas tentar me conectar com a porta 1337 e rapidamente consegui. Apos isso apenas alterar o host de ativar o malware e finaliza o lab!