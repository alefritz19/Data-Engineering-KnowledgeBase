# ==============================================================================
# Zweck:    PySpark Notebook Vorlage: Medallion Pipeline Bronze -> Silver -> Gold
# Kontext:  Microsoft Fabric / PySpark / Delta Lake
# Autor:    Alexander Fritzler
# ==============================================================================

from pyspark.sql.functions import col, to_date, trim, when, lit, current_timestamp

# 1. BRONZE -> SILVER: Bereinigung, Typisierung, Deduplizierung
df_raw = spark.read.table("lh_bronze.dbo.raw_holidays")

df_silver = df_raw \
    .filter(col("Date").isNotNull()) \
    .withColumn("HolidayDate", to_date(col("Date"), "yyyy-MM-dd")) \
    .withColumn("CountryCode", trim(col("CountryOrRegion"))) \
    .withColumn("HolidayName", trim(col("HolidayName"))) \
    .withColumn("IsNational", when(col("CountryCode") == lit("DE"), True).otherwise(False)) \
    .withColumn("IngestionTimestamp", current_timestamp()) \
    .select("HolidayDate", "CountryCode", "HolidayName", "IsNational", "IngestionTimestamp") \
    .dropDuplicates(["HolidayDate", "CountryCode", "HolidayName"])

# In Silver persistieren (V-Order standardmäßig aktiviert)
df_silver.write \
    .format("delta") \
    .mode("overwrite") \
    .option("overwriteSchema", "true") \
    .saveAsTable("lh_silver.dbo.dim_holidays")

print("Erfolgreich: lh_silver.dbo.dim_holidays geschrieben!")

# 2. DELTA LAKE WARTUNG: Optimierung & Z-Order Clustering
spark.sql("""
    OPTIMIZE lh_silver.dbo.dim_holidays 
    ZORDER BY (HolidayDate, CountryCode)
""")

print("Erfolgreich: Z-Order Clustering abgeschlossen!")
