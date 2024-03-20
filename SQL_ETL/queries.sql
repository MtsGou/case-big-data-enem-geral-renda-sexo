INSERT INTO "Data_years"."Analise_2010"
SELECT
   "NU_ANO" As Ano, 
   "TP_FAIXA_ETARIA" As Faixa_Etaria, 
   "TP_SEXO" As Sexo,
   "NU_NOTA_CN", 
   "NU_NOTA_CH",
   "NU_NOTA_LC",
   "NU_NOTA_MT",
   "NU_NOTA_REDACAO",
   ROUND(CAST(("NU_NOTA_CN" + "NU_NOTA_CH" + "NU_NOTA_LC" + "NU_NOTA_MT" + "NU_NOTA_REDACAO")/5 As numeric),2) As Nota_final,
   "Q02" As Escolaridade_pai,
   "Q03" As Escolaridade_mae,
   "Q04" As Renda_familiar,
   "Q05" As Renda_individual,
   "Q08" As Trabalha_ou_ja,
   "Q09" As Ajudar_despesas_casa,
   "Q22" As Carga_trabalho_semanal,
   "Q23" As Idade_comecou_trabalhar
FROM "Data_years"."2010"
-- LIMIT 100

INSERT INTO "Data_years"."Analise_2011"
SELECT
   "NU_ANO" As Ano, 
   "TP_FAIXA_ETARIA" As Faixa_Etaria, 
   "TP_SEXO" As Sexo,
   "NU_NOTA_CN", 
   "NU_NOTA_CH",
   "NU_NOTA_LC",
   "NU_NOTA_MT",
   "NU_NOTA_REDACAO",
   ROUND(CAST(("NU_NOTA_CN" + "NU_NOTA_CH" + "NU_NOTA_LC" + "NU_NOTA_MT" + "NU_NOTA_REDACAO")/5 As numeric),2) As Nota_final,
   "Q002" As Escolaridade_pai,
   "Q003" As Escolaridade_mae,
   "Q004" As Renda_familiar,
   "Q005" As Renda_individual,
   "Q008" As Trabalha_ou_ja,
   "Q009" As Ajudar_despesas_casa,
   "Q022" As Carga_trabalho_semanal,
   "Q023" As Idade_comecou_trabalhar
FROM "Data_years"."2011"

-- REPEAT ABOVE UNTIL 2019

INSERT INTO "Data_years"."Analise_2020"
SELECT
   "NU_ANO" As Ano, 
   "TP_FAIXA_ETARIA" As Faixa_Etaria, 
   "TP_SEXO" As Sexo,
   "NU_NOTA_CN", 
   "NU_NOTA_CH",
   "NU_NOTA_LC",
   "NU_NOTA_MT",
   "NU_NOTA_REDACAO",
   ROUND(CAST(("NU_NOTA_CN" + "NU_NOTA_CH" + "NU_NOTA_LC" + "NU_NOTA_MT" + "NU_NOTA_REDACAO")/5 As numeric),2) As Nota_final,
   "Q001" As Escolaridade_pai,
   "Q002" As Escolaridade_mae,
   "Q006" As Renda_familiar,
   "Q026" As Trabalha_ou_ja,
   NULL As Ajudar_despesas_casa,
   NULL As Carga_trabalho_semanal,
   NULL As Idade_comecou_trabalhar
FROM "Data_years"."2020"

-- REPEAT ABOVE FOR 2021

-- REPEAT THE FOLLOWING QUERIES FOR ALL YEARS

ALTER TABLE "Data_years"."Analise_2020"
DROP COLUMN "Renda_individual";

UPDATE "Data_years"."Analise_2010"
SET "Trabalha_ou_ja" = 'N'
WHERE "Trabalha_ou_ja" = 'B';




