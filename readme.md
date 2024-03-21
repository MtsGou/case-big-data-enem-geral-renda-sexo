# ESTUDO COM DADOS DO ENEM DE 2010-2021. UMA VISÃO SOBRE PONTUAÇÃO, RENDA E SEXO
\# ANALYTICS

**Repositório de ciência de dados com arquivos e códigos utilizados para análise dos dados disponibilizados pelo governo brasileiro referentes ao ENEM, no período 2010-2021. Investigados os resultados quanto a pontuação, renda e sexo dos alunos.**

**Este estudo não pretende explicar ou atribuir causas específicas aos resultados, mas apenas mostrá-los.**

_Data science repository with files and codes used to analyze data available by the Brazil's government concerning ENEM ("Exame Nacional do Ensino Médio" - High School National Exam), in the 2010 - 2021 period. Investigate results for score, income and sex of students._

_This study doesn't intend to explain or attribute specific causes to the results, but only to show them._ 

(in portuguese)

## Sumário

- [Contexto](#contexto)
- [Métodos](#métodos)
- [Análise Geral](#análise-geral)
  - [Nota Total (Média)](#nota-da-redação-média---geral)
  - [Nota da Redação (Média)](#nota-da-redação-média---geral)
  - [Quantidade de Inscritos](#quantidade-de-inscritos)
  - [Aprovados em Medicina](#aprovados-em-medicina)
  - [Aprovados na menor nota](#aprovados-na-menor-nota)
  - [Domínio da norma culta](#domínio-da-norma-culta---geral)
  - [Por área](#por-área)
  - [Curva de distribuição das notas](#curva-de-distribuição-das-notas)
- [Análise Renda](#análise-renda)
  - [Nota Total (Média)](#nota-total-média---por-renda)
  - [Nota da Redação (Média)](#nota-da-redação-média---por-renda)
  - [Domínio da norma culta](#domínio-da-norma-culta---por-renda)
  - [Aprovados em medicina de baixa renda](#aprovados-em-medicina-de-baixa-renda)
- [Análise por Sexo](#análise-por-sexo)
  - [Nota Total (Média)](#nota-da-redação-média---por-sexo)
  - [Nota da Redação (Média)](#nota-da-redação-média---por-sexo)
  - [Já trabalharam?](#já-trabalharam)
  - [Resultado de estudantes de alta renda que nunca trabalharam](#resultado-de-estudantes-de-alta-renda-que-nunca-trabalharam)

----

## Contexto

O Exame Nacional do Ensino Médio (Enem) é a maior porta de entrada para as universidades públicas brasileiras, e, inclusive, para as universidades particulares. Anualmente, milhões de estudantes fazem suas inscrições no exame e milhares de alunos ingressam no ensino superior através do SISU (Sistema de Seleção Unificada), que utiliza as notas do ENEM para selecionar os alunos aprovados de acordo com o número de vagas em cada curso.

O Enem se divide em 4 áreas:

- Ciências Humanas e suas Tecnologias (CH)
- Ciências da Natureza e suas Tecnologias (CN)
- Linguagens, Códigos e suas Tecnologias (LC)
- Matemática e suas Tecnologias (MT)

Cada área vale 1000 pontos, sendo a nota mínima zero (0 - 1000).

Além disso, o exame conta com uma redação, que avalia o conhecimento da norma culta da língua portuguesa, a capacidade argumentativa, conhecimentos gerais sobre a sociedade, entre outros. A redação também vale 1000 pontos.

A nota final do aluno é calculada de acordo com a média aritmética das 5 competências (CH + CN + LC + MT + REDAÇÃO)/5.

Tradicionalmente, o governo brasileiro disponibiliza os dados do ENEM no [site gov.br](https://www.gov.br/inep/pt-br/acesso-a-informacao/dados-abertos). Sabe-se que a renda familiar impacta diretamente no resultado dos alunos, assim como há também uma tendência, entre alunos do sexo feminino, de os resultados (nota final) serem um pouco inferiores aos resultados do sexo masculino. Esse estudo busca investigar esses resultados e visualizá-los.

**É importante deixar claro que o estudo não busca atribuir causas a esses resultados, que podem ser claramente constatados. Porém, estes podem ser usados como base para outros estudos que buscam explicá-los.**

Mas, segundo estudos e pesquisadores:

Quanto à renda, é aceito de forma praticamente unânime que, no Brasil, alunos de baixa renda tendam a obter piores resultados devido à falta de oportunidades, ao acesso mais difícil e limitado à educação básica de qualidade - mesmo com a educação pública gratuita que é geralmente oferecida no país - e às condições sociais, familiares e sanitárias em que vivem esses alunos e suas famílias. Também em função disso, o Brasil é um país conhecido por ter historicamente índices de trabalho infantil elevados.

Quanto à diferença de pontuação entre os sexos, as principais vertentes defendem que o viés da sociedade no tratamento ao sexo feminino - quanto a cobranças e expectativas, entre outros - seja o principal causador. Como mostra este presente estudo, um número significativamente maior de estudantes do sexo feminino já trabalharam, possivelmente de forma precoce para ajudar a família, em comparação com o sexo masculino.

----

## Métodos

Os dados foram coletados diretamente do site do governo [gov.br](https://www.gov.br/inep/pt-br/acesso-a-informacao/dados-abertos) de 2010 até o ano de 2021. Em seguida, foram realocados em um contâiner [docker](https://www.docker.com/), em um banco relacional [PostgreSQL](https://www.postgresql.org/).

No total, o estudo abrange mais de **40 GB de dados** (especificamente 43.9 GB), ao longo de 12 anos, contendo próximo de **70 milhões de registros** (69 milhões) de estudantes, e um número de colunas que fica entre 70 e 105 atributos. A descrição dos dados de todos os anos se encontra na pasta "dataset_description".

Para manipulação e transformação dos dados foram utilizadas queries SQL para criar novas tabelas reduzidas, chamadas "Analise_{ano}", com dados mais relevantes para o estudo. Apesar disso, as tabelas originais "{ano}" também foram utilizadas em alguns casos. Além disso, foi utilizado um pipeline python ETL para tratar os dados originais.

Para processamento das análises, queries e também manipulação de dados foi utilizado o [Spark](https://spark.apache.org/) em linguagem python, especificamente o pacote [PySpark](https://spark.apache.org/docs/latest/api/python/index.html). Pacotes e APIs: [Pandas](https://pandas.pydata.org/).

-----

## Análise Geral

Para os gráficos e análises a seguir, "candidatos presentes" se refere a todos os candidatos que estiveram presentes para o exame, em todas as provas e na redação.

Para a redação, foram consideradas apenas as redações dos alunos presentes ou não em branco (na redação, os ausentes/em branco também recebem zero, em vez de NULL - valor vazio).

### Nota Total (Média) - Geral

![Nota total média](/plots/nota_final_geral.png)

### Nota da Redação (Média) - Geral

![Nota da Redação média](/plots/nota_redacao_geral.png)

### Quantidade de Inscritos

![Quantidade de inscritos](/plots/qtd_candidatos.png)

### Aprovados em Medicina

O curso de medicina é o mais concorrido e de difícil ingresso na maioria das universidades do Brasil. Em média, considerando o período de 2010 a 2021, **apenas 0.0879 % dos candidatos presentes obtêm média para passar em medicina numa faculdade bem avaliada.**

> **NOTA**: Foi levada em consideração a nota de corte da UFAM (Universidade Federal do Amazonas), que é uma universidade com pontuação mediana em medicina, comparada com outras universidades do país. A nota mínima para ingressar no curso de medicina na UFAM fica por volta dos 770-780 pontos na maioria dos anos segundo o SISU, que é uma nota de corte regular para medicina, nem tão baixa, nem tão alta. <br /> <br /> Sendo assim, foi obtido o **número de alunos daquele ano que teriam nota para serem aprovados em medicina em uma universidade regular** (para este estudo de caso, a UFAM) no ano em questão (considerando a nota de corte do mesmo ano), para ser levantada uma estimativa, em vez de ser dado um valor exato.



### Aprovados na menor nota

**Em média, 95% dos candidatos presentes conseguem passar no curso de mais fácil ingresso do ano.**

![Passar mais facil](/plots/menor_nota_corte.png)

> **NOTA**: Os cursos com menor nota de aceitação, em média, têm nota de aprovação em torno de 400, de 1000 pontos. Por exemplo, em 2023, algumas das menores notas de corte foram Filosofia - 323,18 (Unila), Ciência e Tecnologia de Alimentos - 398,56 (Unipampa), Ciências Sociais- 400,94 (Uems), Engenharia de Minas - 407,8 (Unipampa) e Física - 412,8 (UFCG).  <br /> <br /> Foi considerado para os anos 2010-2021 um valor médio de 400 pontos para ser aprovado no curso com menor nota de corte do Brasil. Isso foi utilizado apenas para obter uma estimativa, e não um valor exato, já que para isso seria necessário obter a menor nota de corte de todo o Brasil, para todos os anos.


### Domínio da norma culta - Geral

Ao longo dos anos:

![Norma culta geral](/plots/norma_culta_geral.png)

Distribuição da pontuação:

![Norma culta 2016](/plots/norma_culta_geral_2016.png)
![Norma culta 2011](/plots/norma_culta_geral_2021.png)


### Por área

![Areas geral](/plots/area_geral_periodo.png)
![Media areas](/plots/media_area_todos_anos.png)

## Curva de distribuição das notas

Em 2010, a distribuição da nota total se assemelha mais a uma distribuição normal (Gauss), com média em 524 e desvio padrão de aproximadamente 80 pontos.

![Distribuicao 2010](/plots/2010_nota_total.png)

Já em 2014, essa distribuição se distorce um pouco.

![Distribuicao 2014](/plots/2014_nota_total.png)

Em 2021, a curva se assemelha mais a uma distribuição de Weibull, com um pico mais "deslocado" à esquerda.
![Distribuicao 2021](/plots/2021_nota_total.png)

**[`🔼         back to top        `](#sumário)**

----

## Análise Renda

Para essa análise, foi considerado como "baixa renda" uma renda familiar de até 1,5 salário mínimo. Como "alta renda", uma renda familiar de pelo menos 7 salários mínimos.

### Nota Total (Média) - por renda

![Nota total média renda](/plots/nota_final_renda.png)

### Nota da Redação (Média) - por renda

![Nota redação média renda](/plots/nota_redacao_renda.png)

### Domínio da Norma culta - por renda

![Domínio norma culta](/plots/norma_culta_renda.png)

### Aprovados em medicina de baixa renda

Entre 2010-2021, o número de alunos de baixa renda que seriam aprovados no curso de Medicina em uma universidade de dificuldade média de ingresso (sem o sistema de cotas, em ampla concorrência) oscilou entre apenas **2** (2019) e **163** (2018). 

O número total de estudantes de baixa renda que seriam aprovados no curso de medicina entre os anos 2010 e 2021 foi de apenas **1082** de quase 70 milhões de candidatos, o que corresponde a somente 0.0015% de todos os candidatos. 

> **NOTA**: Para obter mais detalhes desses resultados, ver [nessa seção](#aprovados-em-medicina).

**[`🔼         back to top        `](#sumário)**

----

## Análise por Sexo

### Nota Total (Média) - por sexo

![Nota total média sexo](/plots/nota_final_sexo.png)

### Nota da Redação (Média) - por sexo

![Nota redação média sexo](/plots/nota_redacao_sexo.png)

### Já trabalharam?

![Trabalharam 2016](/plots/trabalharam_2016.png)

![Trabalharam 2010](/plots/trabalharam_2010.png)

![Trabalharam 2013](/plots/trabalharam_2013.png)

### Resultado de estudantes de alta renda que nunca trabalharam

![Resultado sem bias](/plots/nota_alta_ren_nunca_trab.png)

**[`🔼         back to top        `](#sumário)**

