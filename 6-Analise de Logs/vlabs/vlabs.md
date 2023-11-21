
# Análise de Logs I

Usando o comando `awk '{print $1}' access.log | sort -u | wc -l` podemos contar quantos IP's distintos temos no arquivo usando wc-l