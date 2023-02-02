#!/usr/bin/python
import boto3

#Initialize a Client to Interact with SQS queues
client = boto3.client('sqs')

response = client.create_queue(
    QueueName='MyQueue'
)

#Response for Crete Queue
{
    'QueueUrl': 'string'
}

#Send Message to SQS Queue

response = client.send_message(
    QueueUrl='QueueUrl',
    MessageBody='MY MESSAGE HERE'
)

#Recieve Message from a Queue
response = client.receive_message(
    QueueUrl='QueueUrl',
    MaxNumberOfMessages=1 to 10
)

# Response Body Required Items - 'MessageId' & 'ReceiptHandle'

# Delete Message from Queue

response = client.delete_message(
    QueueUrl='QueueUrl',
    ReceiptHandle='RECIEPTHANDLEFROM_receive_message'
)

# Delete Batch Message from Queue
response = client.delete_message_batch(
    QueueUrl='QueueUrl',
    Entries=[
        {
            'Id': 'MessageIdFROM_recieve_message',
            'ReceiptHandle': 'RECIEPTHANDLEFROM_receive_message'
        },
    ]
)

# Delete Queue

response = client.delete_queue(
    QueueUrl='QueueUrl'
)
