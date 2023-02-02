#!/usr/bin/python
import boto3

#Initialize a Client to Interact with DynamoDB table

client = boto3.client('dynamodb')

#Create a Table
table = client.create_table(
    TableName='Music',
    KeySchema=[
        {
            'AttributeName': 'Artist',
            'KeyType': 'HASH' 
        },
        {
            'AttributeName': 'songTitle',
            'KeyType': 'RANGE'
        }
    ],
    AttributeDefinitions=[
        {
            'AttributeName': 'Artist',
            'AttributeType': 'S'
        },
        {
            'AttributeName': 'songTitle',
            'AttributeType': 'S'
        },

    ],
    ProvisionedThroughput={
        'ReadCapacityUnits': 10,
        'WriteCapacityUnits': 10
    }
)

# Write Data to the Table
response = table.put_item(
            Item = { 
                'Artist': "No One You Know",
                'songTitle': "Call Me Today"
                }
            )

# Batch Write Data to the Table
response = client.batch_write_item(
    RequestItems={
        'Music': [
            {
              'PutRequest': {
                'Item': {
                    'Artist': {
                        'S': "No One You Know"
                    },
                    'songTitle': {
                        'S': "Call Me Today"
                    },
                },
                'Item': {
                    'Artist': {
                        'S': "The Acme Band"
                    },
                    'songTitle': {
                        'S': "Still in Love"
                    },
                }
              }
            }
        ]
    }
    )
# Scan All Items from DynamoDB Table
response = table.scan()

# Get Item from DynamoDB Table
response = client.get_item(
    TableName='Music'
    Key={
        "Artist": {
                "S": "The Acme Band"
            },
        "songTitle": {
                "S": "Still in Love"
            }
    }
    )

# Delete an existing Item
response = client.delete_item(
    TableName='Music',
    Key={
        "Artist": {
            "S": "The Acme Band"
        },
        "songTitle": {
            "S": "Still in Love"
        }
    }
)

# Delete a Table
response = client.delete_table(
    TableName='Music'
)
