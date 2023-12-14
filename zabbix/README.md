# install

## simple script to run

notice : it is recommended to change the password which is saved in the .env file.

```

mkdir -p ./zabbix_docker && cd ./zabbix_docker

curl -fsSL https://raw.githubusercontent.com/darrenoshan/DevOps-Study/main/zabbix/zabbix.srv.yml -o zabbix.srv.yml

curl -fsSL https://raw.githubusercontent.com/darrenoshan/DevOps-Study/main/zabbix/.env -o .env

docker-compose -f zabbix.srv.yml up -d

```
