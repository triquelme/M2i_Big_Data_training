import requests
import json
import os
from elasticsearch import Elasticsearch

# Connect to the Elasticsearch server
res = requests.get('http://localhost:9200')
print(res.content)
es = Elasticsearch([{'host': 'localhost', 'port': '9200'}])

# Create an index and load JSON file into Elasticsearch at the same time

i = 1
for line in open('restaurants.json', 'r'):
    es.index(index='restaurants2', ignore=400, id=i,
             doc_type='_doc', body=json.loads(line))
    i = i + 1

