#! /bin/bash
# Primeiro script em Bash, comentários são feitos com #.
echo "Hello World!" # Echo printa o texto na tela.

echo "System are on since: $(uptime -p)" 
# Uptime mostra o tempo que o sistema está ligado.    
echo "Current directory: $(pwd)"
echo "Current user: $(whoami)"

bash_variables="Bash Variables"
echo "Bash Variables: $bash_variables"
echo "Type something: "
read something
echo "You type: $something"