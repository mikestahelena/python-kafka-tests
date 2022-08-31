# python-kafka-tests

## _Projeto para explorar as funcionalidades do Kafka com Python_

Criar virtualenv e instalar dependências

```bash
python -m venv venv && source venv/bin/activate && pip install -r requirements.txt
```

Subir container
```bash
docker compose up -d
```

Criar tópico
```bash
docker exec kafka kafka-topics --bootstrap-server kafka:9092 --create --topic message-tests
```

Abrir [AKHQ][akhq] e verificar o tópico criado 

Detalhes do tópico
```bash
docker exec kafka kafka-topics --bootstrap-server kafka:9092 --describe --topic message-tests
```

Lista tópicos
```bash
docker exec kafka kafka-topics --bootstrap-server kafka:9092 --list
```

Abre psql
```bash
docker exec -ti postgres psql exampledb -U docker
```

Cria tabelas
```
CREATE TABLE debezium_signal (id VARCHAR(42) PRIMARY KEY, type VARCHAR(32) NOT NULL, data VARCHAR(2048) NULL);
CREATE TABLE CUSTOMER (ID INT PRIMARY KEY, NAME VARCHAR);
ALTER TABLE CUSTOMER REPLICA IDENTITY FULL;
```

curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/ -d @debezium.json

Executa comandos sql que irão gerar os eventos no tópico 
```
INSERT INTO PUBLIC.CUSTOMER (ID, NAME) VALUES(1, 'RICH CUSTOMER');
INSERT INTO PUBLIC.CUSTOMER (ID, NAME) VALUES(2, 'POOR CUSTOMER');
UPDATE PUBLIC.CUSTOMER SET NAME = 'RICHEST CUSTOMER' WHERE ID=2;
```

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. 
There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)
[akhq]: <http://localhost:8080>