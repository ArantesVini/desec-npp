
# Análise de Logs I

Usando o comando `awk '{print $1}' access.log | sort -u | wc -l` podemos contar quantos IP's distintos temos no arquivo usando wc-l

# Análise de Logs II

	Como o objetivo é saber qual é o atacante, o mais simple é validar qual IP fez o maior número de requisicoes, usando o comando `awk '{print $1}' access.log | sort | uniq -c | sort -u` fica como o último caso.
# Análise de Logs III

Usando os comandos `cat access.log | grep "177.138.28.7" | head -n1` e `cat access.log | grep "177.138.28.7" | tail -n1`conseguimos ver o horário de inicio e fim do ataque

