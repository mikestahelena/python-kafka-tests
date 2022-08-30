from confluent_kafka import Producer
import socket
from datetime import datetime
import time

producer = Producer({
    'bootstrap.servers': "kafka:9092", 'client.id': socket.gethostname()
})
topic = 'message-tests'


def acked(err, msg):
    """Called once for each message produced to indicate delivery result.
    Triggered by poll() or flush()."""
    if err is not None:
        print(f"Failed to deliver message: {str(msg)}: {str(err)}")
    else:
        print(
            f"{datetime.now()} - "
            f"Message produced: topic: {str(msg.topic())}, "
            f"partition: {str(msg.partition())}, "
            f"offset: {str(msg.offset())}"
        )


if __name__ == "__main__":
    events = 0

    for i in range(50):
        producer.produce(topic, key=str(i), value=f"Message {i}", callback=acked)
        # Wait up to 1 second for events. Callbacks will be invoked during
        # this method call if the message is acknowledged.
        events += producer.poll(1)

    producer.flush()
    print(f"All {events} messages sent")


