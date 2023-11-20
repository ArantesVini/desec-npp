
# Análise do Log disponibilizado

Primeiro ponto que vemos usando `wc - access.log` é que o mesmo possui **37.625** linhas.

Para entender a estrutura do Log, o primeiro passo é analisar a primeira linha com `head -nl access.log` .
No nosso exemplo temos o IP - Data : Timezone - Requisicao - Retorno da Requisicao - User Agent.

# Buscando os IP's do ataque

Se quisermos filtrar todos os IP's distintos do log podemos fazer via terminal com `cat access.log | cut -d " " -f 1 | sort -u`.

Como nosso objetivo é ver quais IP's fizeram maior número de requisicoes alteramos um pouco esse comando `cat access.log | cut -d " " -f 1 | sort | uniq -c` trazendo a quantidade de requisicoes por IP.

Com  `cat access.log | cut -d " " -f 1 | sort | uniq -c | sort -un` ainda filtramos do menor para o maior número de requisicoes por IP. Assim chegamos num suspeito, o IP **177.138.28.7** com 37.038 requisicoes.

# Analisando o IP Suspeito

Usando `cat access.log | grep "177.138.28.7" | head -n1` vemos a primeira ocorrencia do IP suspeito, que foi as 00:21 no dia 13/02/2015, com `cat access.log | grep "177.138.28.7" | tail -n1` vemos que a última requisicao foi as 08:58 do mesmo dia.

# Identificando o Ataque

Um dos pontos que logo de cara mostra que esse IP é um atacante, é a quantidade de requisicoes feitas no mesmo segundo. Segundo ponto é o User agent, **NMAP**, ferramenta mais comum de *scanning*.
Identificamos uso de outras ferramentas ,como **NIKTO** e **NESSUS**.

