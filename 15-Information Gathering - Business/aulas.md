
# Information Gathering

- Define o sucesso do pentest
- Transforma o desconhecido em informacoes uteis
- Na parte do Business, conseguimos mapear tecnologias necessarias, colaboradores, departamentos, padroes, e-mails
- Duvidas em foruns
- *Leaks* de dados

## Importancia

- Entender o negocio / operacao
- Mapear a superficie de ataque
- Personificacao de colaboradores

## Tipos

- Ativa - Interage diretamente com o alvo
- Passiva - NAO interage diretamente com o alvo

# Mapeando colaboradores

- Pesquisa no linkedin
- Mapear pessoas envolvidas com a tecnologia
- Pesquisar perfil dos profissionais, github, projetos, etc
- Comportamento nas redes sociais

# Coleta via vagas de emprego


- Buscar vagas na area de tecnologia de uma empresa
- Na parte de requisitos muitas vezes teremos informacoes detalhadas das tecnologias utilizadas
- Pode ajudar a criar ferramentas mais especificas

# Coletando enderecos de e-mail

- http://hunter.io
- Pode ser usado com bases de vazamentos de senhas, e-mails para engenharia social e etc
- tem um verificador se o e-mail e valido ou nao
- da pra usar via API

# Vazamento de Dados (Leaks)

Infos sensiveis disponibilizadas na internet apos algum servico ser comprometido ou quando alguma empresa e hackeada ou ate quando funcionarios mal-intencionados que querem prejudicar o negocio.

No mundo todo, empresas gigantes sofrem desses vazamentos.

- Have i been pwned?
- Site de vendas de Leaks

# Consultando Leaks na Dark Web

- Dehashed - Semelhante ao Have I Been Pwned? Porem promete que quando voce paga exibe os dados censurados vazados

## Base de leaks na darkweb

**Aviso**: Links de sites da darkweb, utilize o Tor!!

- http://pwndb2am4tzkvold.onion/ - Atualizacao: site morreu!
- Consegue verificar por dominio, e-mail, usuario, senha

# Utilizando a rede TOR no kali

```shell
# No terminal, digite uma linha por vez
# E necessario usar os pacotes tor e proxychains com 
sudo apt install tor proxychains
# iniciar servico do tor
service tor start
# checar se o servico do tor esta funcionando
netstat -nlpt
# Configurar o proxychains
nano /etc/proxychains.conf
# Configurar com a porta em execucao no Tor, no fim do arquivo
socks5 {ip} 9050 
# E escolher entre as opcoes random, dynamic ou strict, descomentando a que for usar. Dynamic e mais funcional
```

Na sequencia configuramos nosso navegador indo em preferencias/network/settings/ e escolher o proxy local do tipo SOCKS v5 e passar o endereco local e a porta a ser utilizada e marcar a opcao de fazer proxy do DNS quando estiver sendo utilizado.

# Script para consulta de Leaks

E apresentando o Karma, que tambem morreu :(