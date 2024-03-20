from pyspark.sql import SparkSession

def load_data_partitioned(subject, year, url):
    # Analyze min and maximum values
    spark = SparkSession.getActiveSession()
    df = spark.read \
    .format("jdbc") \
    .option("url", url) \
    .option("driver", "org.postgresql.Driver") \
    .option("dbtable", "(select \"CO_PROVA_CN\", \""+ subject +"\" from \"Data_years\".\"" + year + "\")  as subq") \
    .option("numPartitions","8") \
    .option("partitionColumn", "\"CO_PROVA_CN\"") \
    .option("lowerBound", "89") \
    .option("upperBound", "108") \
    .option("user", "admin") \
    .option("password", "*********")
    df_part = df.load()
    return df_part

# general function for queries using partition
def load_query(query, url, partitionColumn = "CO_PROVA_CN", numPartitions = "8", lowerbound = "89", upperbound = "108"):
    # Analyze min and maximum values
    spark = SparkSession.getActiveSession()
    df = spark.read \
    .format("jdbc") \
    .option("url", url) \
    .option("driver", "org.postgresql.Driver") \
    .option("dbtable", query) \
    .option("numPartitions",numPartitions) \
    .option("partitionColumn", "\"" + partitionColumn + "\"") \
    .option("lowerBound", lowerbound) \
    .option("upperBound", upperbound) \
    .option("user", "admin") \
    .option("password", "*********")
    df_part = df.load()
    return df_part