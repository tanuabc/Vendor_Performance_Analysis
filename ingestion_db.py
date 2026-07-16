import pandas as pd
import os
from sqlalchemy import create_engine
import logging
import time

logging.basicConfig(
    filename="logs/ingestion_db.log",
    level=logging.DEBUG,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

engine = create_engine('sqlite:///inventory.db')

def ingest_db(df, table_name, engine):
    '''this function will ingest the dataframe into database table'''
    df.to_sql(table_name, con = engine, if_exists = 'replace', index= False)  # Fixed: removed extra space in 'replace'

def load_raw_data():
    '''this functon will load the CSVs as a dataframe and ingest into db'''
    start = time.time()
    for file in os.listdir('data'):
        if '.csv' in file:
            df = pd.read_csv('data/'+file)
            logging.info(f'Ingestion {file} in db')
            ingest_db(df, file[:-4], engine)  # Fixed: changed 'ingestion_db' to 'ingest_db'

    end = time.time()  # Fixed: proper indentation (same level as 'start')
    total_time = (end - start)/60  # Fixed: proper indentation
    logging.info('---------------Ingestion Complete-------------------')  # Fixed: proper indentation
    logging.info(f'\nTotal Time Taken: {total_time} minutes')  # Fixed: proper indentation

if __name__ == '__main__':
    load_raw_data()


   