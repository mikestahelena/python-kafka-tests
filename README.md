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

```bash
docker exec kafka kafka-topics --bootstrap-server kafka:9092 --describe --topic message-tests
```

```bash
docker exec kafka kafka-topics --bootstrap-server kafka:9092 --list
```

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. 
There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)
[akhq]: <http://localhost:8080>