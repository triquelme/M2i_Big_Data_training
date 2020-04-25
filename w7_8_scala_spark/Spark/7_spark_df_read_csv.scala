package fr.m2i.exercice

import org.apache.log4j._
import org.apache.spark.sql

import org.apache.spark.sql.{Row, SparkSession}
import org.apache.spark.sql.functions._

object exercice7 {
  
  Logger.getLogger("org").setLevel(Level.ERROR)
  
  val spark = SparkSession.builder
  .appName("SparkSQL")
  .master("local[*]")
  .getOrCreate()
  
  def main (args: Array[String]) {
    
    //Scala DataFrame - Dates et Timestamp
    val df = spark.read
    .option("header", "true")
    .option("inferSchema", "true")
    .csv("/Users/thomas/Documents/poe_bigdata/s7_8_scala_spark/CitiGroup2006_2008.csv")
    
    df.printSchema()
    df.show(5)
    
    // Afficher la colonne Date    
    df.select("Date").show(5)
    
    // Afficher la colonne date (année)
    df.select(year( df("Date") ) ).show(5) 
    // fonction year récupère l'année dans une date et prend comme argument une colonne 
    
    // Afficher la colonne Date (mois)
    df.select(month( df("Date") ) ).show(5)
    
    // Afficher la colonne Date (jour)
    df.select(dayofmonth( df("Date") ) ).show(5)
    
    // Ajouter 3 colonnes Année, Mois, Jour
    val df2 = df.withColumn("Année", year(df("Date")))
      .withColumn("Mois", month(df("Date")))
      .withColumn("Jour", dayofmonth(df("Date")))
    
    println("Dataframe avec 3 colonnes Année, Mois, Jour : ")
    df2.show(5)
    
    // Calculer la moyenne des Volumes par année
    df2.groupBy("Année").agg(mean("Volume")).show()
    
    // Obtenir les années distinctes
    df2.select("Année").distinct().show(5)
    
  }
  
}