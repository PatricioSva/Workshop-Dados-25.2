#a idei do VsCODE é apenas juntar os comandos para uma melhor análise da Linguagem Phyton utilizada

import pandas as pd
df = pd.read_csv('/content/dados_nao_tratados.csv')
display(df)

df['idade'] = pd.to_numeric(df['idade'], errors='coerce')
df["idade"]=df["idade"].astype('Int64')

df['nota'] = pd.to_numeric(df['nota'], errors='coerce')
df["nota"]=df["nota"].astype('Float64')

df["ativo"]=df["ativo"].astype(str).str.strip().str.lower().map({
    "sim":True,
    "não":False,
    "true":True,
    "false":False,
    "yes":True,
    "nao":False,
    "nan":False,
    "TRUE":True,
    "FALSE:":False,
    })
display(df)

df['data_inscricao']=pd.to_datetime(df['data_inscricao'], errors='coerce')
display(df)

df['ativo']=df['ativo'].fillna("sem cadastro")
display(df)

df=df.fillna(0)
display(df)