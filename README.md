 # Projeto: Ambiente Linux no Windows com WSL e Nginx
Projeto individual do estágio da Compass Uol
## Descrição
Este projeto tem como objetivo criar um ambiente Linux no Windows utilizando o Windows Subsystem for Linux (WSL) com Ubuntu, configurar um servidor Nginx e desenvolver um script para monitorar o status do serviço Nginx. O script é automatizado para execução a cada 5 minutos, e todo o processo é documentado para facilitar a replicação.

## Pré-requisitos
Antes de começar, você precisará ter os seguintes itens instalados:
- Windows 10 ou superior
- Windows Subsystem for Linux (WSL) habilitado
- Ubuntu instalado via Microsoft Store
- Acesso à internet para download de pacotes

## Passo a Passo

## 1. Habilitar o WSL
- Abra o PowerShell como administrador e execute o seguinte comando:
  ```bash
  wsl --install
## 2. Instalar o Ubuntu
 - Acesse a Microsoft Store e procure por "Ubuntu". Selecione a versão desejada e clique em "Instalar".

## 3. Configurar o Ubuntu
- Após a instalação, abra o Ubuntu a partir do menu iniciar.
Configure seu nome de usuário e senha.

## 4. Atualizar o sistema
- Execute os seguintes comandos para garantir que o sistema esteja atualizado:
- ```bash 
  sudo apt upgrade -y

## 5. Instalar o Nginx
-Instale o Nginx com o seguinte comando:
- ```bash 
  sudo apt install nginx -y
Inicie o serviço Nginx: sudo service nginx start

## 7. Criar o script de monitoramento
- ```bash 
  nano ~/monitoramento_nginx.sh
Adcione código ao script:
- ```bash 
  mkdir -p $LOG_DIR
  if systemctl is-active -- quiet nginx; then
  STATUS="ONLINE"
  MESSAGE="Rodando"
  echo "$(date '+%Y-%m-%d %H:%M:%S' ) - Nginx - $STATUS - MESSAGE" >> $LOG_DIR/nginx_online. log
  else
  STATUS="OFFLINE"
  MESSAGE="Nao esta rodando"
  echo "$(date '+%Y-%m-%d %H:%M:%S' ) - Nginx - $STATUS - $MESSAGE" >> $LOG_DIR/nginx_offline.log
  fi

Salve e feche o arquivo (CTRL + O, CTRL + X)

## 8. Tornar o script executável
Execute o seguinte comando para tornar o script executável:
- ```bash 
  chmod +x ~/monitoramento_nginx.sh
## 9. Automatizar a execução do script
Para automatizar a execução do script a cada 5 minutos, adicione uma entrada no cron
- ```bash 
  crontab -e
  */5 * * * * /bin/bash ~/monitoramento_nginx.sh
## Conclusão
Agora você tem um ambiente Linux configurado no Windows com Nginx em execução e um script para monitorar o status do serviço. Sinta-se à vontade para modificar e expandir o projeto conforme necessário
