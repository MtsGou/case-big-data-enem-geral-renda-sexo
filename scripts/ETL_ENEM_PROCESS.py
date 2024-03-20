# CODIGO ETL PARA REMOVER CARACTERES NAO RECONHECIDOS
# PARA CONSEGUIR FAZER A CARGA NO BANCO POSTGRESQL

import csv
import pandas as pd
import re

# String para armazenar cada linha do arquivo csv
str_line = ''

# Endereco dos dados, variavel
file_location = "2012\DADOS\MICRODADOS_ENEM_2012.csv"

# Nome do arquivo CSV destino, variavel
destiny_csv = "ENEM2012_Dados_tratados.csv"

# Ano inicialmente igual a 2012
year = int(file_location[27:31])

for i in range(10):
    with open(file_location, 'r') as file_csv:
        for line in file_csv:
            str_line = str(line)
            
            # Substituir todos os char nao aceitos
            str_line = re.sub('[Ã]|[Â]|[À]|[Á]', 'A', str_line)
            str_line = re.sub('[ã]|[â]|[à]|[á]', 'a', str_line)
            str_line = re.sub('[Ê]|[É]|[È]', 'E', str_line)
            str_line = re.sub('[ê]|[é]|[è]', 'e', str_line)
            str_line = re.sub('[Í]|[Ì]', 'I', str_line)
            str_line = re.sub('[í]|[ì]', 'i', str_line)
            str_line = re.sub('[Ó]|[Ò]|[Ô]|[Õ]', 'O', str_line)
            str_line = re.sub('[õ]|[ó]|[ò]|[ô]', 'o', str_line)
            str_line = re.sub('[Ú]', 'U', str_line)
            str_line = re.sub('[ú]', 'u', str_line)
            str_line = re.sub('[ç]', 'C', str_line)
            str_line = re.sub('[Ç]', 'C', str_line)
            #print(str_line)

            with open(destiny_csv, 'a', newline= '') as csv_file:
                writer = csv.writer(csv_file)
                newrow = str_line.replace('\n',"").split(",")
                writer.writerow(newrow)
    year += 1
    file_location = file_location.replace(str(year-1),str(year))
    destiny_csv = destiny_csv.replace(str(year-1),str(year))

