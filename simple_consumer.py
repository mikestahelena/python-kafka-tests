from confluent_kafka import Consumer

consumer = Consumer({
    "bootstrap.servers": "kafka:9092",
    "group.id": 'customer-consumer',
    "auto.offset.reset": 'earliest',
})

topic_name = 'message-tests'
consumer.subscribe([topic_name])

if __name__ == "__main__":
    try:
        while True:
            msg = consumer.poll(1)
            if msg is None:
                # No message available within timeout.
                # Initial message consumption may take up to
                # `session.timeout.ms` for the consumer group to
                # rebalance and start consuming
                print("Waiting for message or event/error in poll()")
                continue
            elif msg.error():
                print(f'error: {msg.error()}')
            else:
                # Check for Kafka message
                record_key = "Null" if msg.key() is None else msg.key().decode('utf-8')
                record_value = msg.value().decode('utf-8')
                print(f"Consumed record with key {record_key} and value {record_value}")
    except KeyboardInterrupt:
        pass
    finally:
        print("Leave group and commit final offsets")
        consumer.close()
