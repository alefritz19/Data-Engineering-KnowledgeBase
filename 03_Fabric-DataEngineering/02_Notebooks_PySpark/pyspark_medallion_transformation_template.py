# ============================================================================
# Назначение: Шаблон блокнота PySpark: Переход Bronze -> Silver -> Gold в Fabric
# Контекст:   Microsoft Fabric / PySpark / Delta Lake
# Автор:      Alexander Fritzler
# ============================================================================

from pyspark.sql.functions import col, to_date, year, month, date_format, coalesce, lit, when
from pyspark.sql.window import Window

# ----------------------------------------------------------------------------
# 1. BRONZE -> SILVER: Очистка, типизация, дедупликация
# ----------------------------------------------------------------------------
df_raw = spark.read.table("lh_bronze.dbo.publicholidays")

df_silver = df_raw \
    .filter(col("date") >= "2020-01-01") \
    .withColumn("HolidayDate", to_date(col("date"))) \
    .withColumn("Year", year(col("HolidayDate"))) \
    .withColumn("Month", month(col("HolidayDate"))) \
    .withColumn("DayOfWeek", date_format(col("HolidayDate"), "EEEE")) \
    .withColumn("IsPaid", coalesce(col("isPaidTimeOff"), lit(False))) \
    .select(
        col("countryRegionCode").alias("CountryCode"),
        col("countryOrRegion").alias("CountryName"),
        col("holidayName").alias("HolidayName"),
        col("HolidayDate"),
        col("Year"),
        col("Month"),
        col("DayOfWeek"),
        col("IsPaid")
    )

# Сохранение в Silver (V-Order включен по умолчанию)
df_silver.write \
    .format("delta") \
    .mode("overwrite") \
    .saveAsTable("lh_silver.dbo.dim_holidays")

print("Успешно: lh_silver.dbo.dim_holidays создана!")

# ----------------------------------------------------------------------------
# 2. DELTA LAKE MAINTENANCE: Оптимизация и Z-Order
# ----------------------------------------------------------------------------
spark.sql("OPTIMIZE lh_silver.dbo.dim_holidays ZORDER BY (HolidayDate);")
print("Успешно: Z-Order кластеризация завершена!")
