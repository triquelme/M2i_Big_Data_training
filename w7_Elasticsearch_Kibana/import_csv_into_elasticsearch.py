import pandas as pd
#import re
#from unidecode import unidecode
#import numpy as np
from elasticsearch import helpers, Elasticsearch


# Index pour le test
raw_index = 'blogs'

# Se connecter à elastic
host = "localhost"
port = 9200

es = Elasticsearch(hosts=[{'host': host, 'port': 9200}])

# Create and format (mapping) elasticsearch index


def create_index(es_instance, _index):
    request_body = {
        "settings": {
            "number_of_shards": 5,
            "number_of_replicas": 2
        },

        'mappings': {
            'properties': {

                'title':  {'type': 'text'},
                'seo_title':  {'type': 'text'},
                'url':  {'type': 'text'},
                'author':  {'type': 'text'},
                'date':  {'type': 'text'},
                'category':  {'type': 'text'},
                'locales':  {'type': 'text'},
                'content':  {'type': 'text'},

            }}}

    print("creating index...")
    es_instance.indices.create(index=_index, body=request_body)


#es.indices.delete(index=raw_index, ignore=[400, 404])
create_index(es, raw_index)


# Load ES index with csv data
def write_to_index(es, index_name, df, bulk_size, doc_type):
    bulk_size = 10
    bulk_data = []

    for idx, row in df.iterrows():
        data_dict = {}

        for i in range(len(row)):
            data_dict[df.columns[i]] = str(row[i])

        op_dict = {
            "index": {
                "_index": index_name,
                "_type": doc_type
            }
        }
        bulk_data.append(op_dict)
        bulk_data.append(data_dict)

        if (idx + 1) % bulk_size == 0:
            res = es.bulk(index=index_name, body=bulk_data,
                          refresh=True, request_timeout=200)
            print('filling index')
            bulk_data = []

    if len(bulk_data) > 0:
        res = es.bulk(index=index_name, body=bulk_data,
                      refresh=True, request_timeout=200)
    print('done.')


df = pd.read_csv('blog.csv', header=None, encoding="ISO-8859-1")
df.columns = columns = ['title', 'seo_title', 'url',
                        'author', 'date', 'category', 'locales', 'content']

bulk_size = 10
doc_type = '_doc'
index = 'blogs'
write_to_index(es, index, df, bulk_size, doc_type)
