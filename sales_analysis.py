import pandas as pd
import csv
#import warnings
#warnings.warn("ignore")

dataset = pd.read_csv('C:\\Users\\LENOVO\\Downloads\\archive.zip')

print(dataset)

#print(dataset.head(20))

# print(dataset.columns.tolist())
# print(dataset)
# print(dataset.columns.values)
pd.set_option('display.max_columns',None)
print(dataset)

#how many diif kind of values we have
#Syntax

print(dataset['Ship Mode'].unique())

#use of na to replace not available.to replace not available we can directly use na_values in the above dataset = code

dataset= pd.read_csv('C:\\Users\\LENOVO\\Downloads\\archive.zip', na_values=['Not Available','unknown'])
print(dataset.head(30))

#rename columns make then in lower case and replace space with underscore

#dataset.rename(columns=('order Id' : 'order_id','City' :'city'  )) --> this is the firdt method

dataset.columns = dataset.columns.str.lower()
dataset.columns = dataset.columns.str.replace(' ','_')
print(dataset)

#derive some new columns discount sale price and profit and create discount coloumn

dataset['discount'] = dataset['list_price']*dataset['discount_percent']*.01
print(dataset)

#now we will calculate sale price

dataset['sale_price'] = dataset['list_price']-dataset['discount']
print(dataset)

#again calculate profit

dataset['profit'] = dataset['sale_price']-dataset['cost_price']
print(dataset)

#convert order date from object data type to date time

dataset.dtypes
print(dataset.dtypes)

dataset['order_date'] = pd.to_datetime(dataset['order_date'],format = "%Y-%m-%d")
print(dataset)

#Now we will drop some unnessasary columns cost_price,list_price,discount_persent columns

dataset.drop(columns = ['cost_price','list_price','discount_percent'],inplace=True)

print(dataset)

#load the data into sql server using replace option

# import pandas as pd
# import sqlalchemy as sal

import sqlalchemy as sal

engine = sal.create_engine('mysql+pymysql://root:jan200315@localhost:3306/db')
conn = engine.connect()

#load the data into sql server using replace option

dataset.to_sql('dataset_orders',con=conn, index=False, if_exists='append')

dataset.columns
print(dataset.columns)












