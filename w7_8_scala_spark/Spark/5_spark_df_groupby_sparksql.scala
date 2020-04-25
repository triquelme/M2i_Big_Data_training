package fr.m2i.exercice

import org.apache.log4j._
import org.apache.spark.sql
import org.apache.spark.sql.{Row, SparkSession}
import org.apache.spark.sql.functions._


object exercice5 {
  
  Logger.getLogger("org").setLevel(Level.ERROR)
  
  val spark = SparkSession.builder
  .appName("SparkSQL")
  .master("local[*]")
  .getOrCreate()
  
  def main (args: Array[String]) {
    
    //val df = spark.read.csv("/Users/thomas/Documents/poe_bigdata/s7_8_scala_spark/walmart_stock.csv")
    val df = spark.read
    .option("header", true)
    .option("inferSchema", "true")
    .csv("/Users/thomas/Documents/poe_bigdata/s7_8_scala_spark/walmart_stock.csv")
    
    println(df.printSchema())
    println(df.show())
    
    println("Nombre de ligne : " + df.count())
    
    df.show(5)
    
    for (ele <- df.head(5))
      println(ele)
      
    val df2 = df.select("Date", "Volume")
    df2.show(5)
    
    println("Nombre de ligne avec doublons: " + df.count())
    df2.distinct()
    println("Nombre de ligne sans doublons: " + df.count())
    
    df.describe().show() // affiche stats pour chaque colonne: count, mean, stddev, min, max
    val res = df.describe()
    
    /* pour formater le nombre chiffre après la virgule
     * resultats.select("summary",
        format_number(resultat[$"Open"],cast('float'),2).alias('Open') 
    )
    .show() */
    
    val df3 = df.filter("Volume > 8222093")
    println("Nombre de ligne après filtre1: " + df3.count())
    
    val df4 = df.filter(df("Volume") > 8222093)
    println("Nombre de ligne après filtre2: " + df4.count())
    
    val df5 = df.filter(df("Volume") > 8222093 && df("Open") > 69)
    println("Nombre de ligne après filtre3: " + df5.count())
    
    // val df6 = df.withColumn("VolumePlus", df("Volume") * 5).withColumn("Exemple", x => "test")
    // df6.describe().show()
    
    println(" Mean : " + df.groupBy("Volume").agg(mean("Close")).show())
    println(" Sum : " + df.groupBy("Volume").agg(sum("Close")).show())
    println(" Count : " + df.groupBy("Volume").agg(count("Close")).show())
    // groupBy groupe par valeur identique dans la colonne "Volume"
    // ensuite agg exécute une fonction mean/sum/count sur les valeurs de la colonne "Close" 
    // pour chaque groupe
    // Exemple2: 
    /* ID, Salarie, statut, salaire
   		 1, paul, fonctionaire, 3000€
       2, fred, Cadre ,    4000€
       3, Eric, fonctionaire, 2000€
       4, jack, Tech,     1000€
       
       df.groupBy("statut").agg(mean("salaire")).show()
       1, paul, fonctionaire, 3000€
       3, Eric, fonctionaire, 2000€  2500€ */ 
    // Calcule la moyenne des salaires des cadres, techniciens, tech etc
    
    df.createOrReplaceTempView("table1") // transforme df en table SQL requêtable
    val df7 = spark.sql("SELECT * FROM table1 WHERE Volume > 8222093")
    println("résultat requête : ")
    df7.show(5)
    
  }
  
}