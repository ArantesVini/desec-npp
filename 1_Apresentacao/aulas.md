# VPN

Sobre a VPN, importante ativar em sudo utilizando o OpenVPN, sempre no ambiente Kali
Dica para evitar sempre ter que digitar a autenticacao do VPN:

```
nano config.txt
usuario
senha
```

Após isso, passar o arquivo como parametro de auth no arquivo .ovpn

```
auth-user-pass config.txt
```
