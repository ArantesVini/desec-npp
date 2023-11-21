
# Análise de Logs I

Usando o comando `awk '{print $1}' access.log | sort -u | wc -l` podemos contar quantos IP's distintos temos no arquivo usando wc-l

# Análise de Logs II

Como o objetivo é saber qual é o atacante, o mais simple é validar qual IP fez o maior número de requisicoes, usando o comando `awk '{print $1}' access.log | sort | uniq -c | sort -u` fica como o último caso.
# Análise de Logs III

Usando os comandos `cat access.log | grep "177.138.28.7" | head -n1` e `cat access.log | grep "177.138.28.7" | tail -n1`conseguimos ver o horário de inicio e fim do ataque

# Investigando o Ataque - Lab1

Similar ao primeiro VLAB - `awk '{print $1}' lab.log | sort | uniq -c | sort -u`

# Investigando o Ataque - Lab2

Admito, foi meio na unha, mas usei o comando `awk '$1 == "205.251.150.186" && $9 == 200' lab.log > status_200.txt` e examinei os diretórios que poderiam ter informacoes sensiveis.

# Investigando o Ataque - Lab3

Investiguei as relacoes com o diretorio sensível e localizei qual arquivo foi baixado.

# Investigando o Ataque - Lab4

Estava na mesma linha, comeco a achar que minha ideia de exportar o txt nao foi tao ruim.

# Investigando o Ataque - Lab5

Apenas olhei a hora do log

# Investigando o Ataque - Lab6

Apenas procurei o próximo diretorio

# Investigando o Ataque - Lab7

Examinei a data e hora do ocorrido

# Investigando o Ataque - Lab8

Na mesma linha, vi a ferramenta utilizada

# Investigando o Ataque - Lab9

Procurei o primeiro navegador utilizado nesse diretorio.
