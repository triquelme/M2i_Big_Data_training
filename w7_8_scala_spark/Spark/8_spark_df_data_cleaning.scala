package fr.m2i.exercice

import org.apache.log4j._
import org.apache.spark.sql

import org.apache.spark.sql.{Row, SparkSession}
import org.apache.spark.sql.functions._

object exercice8 {
  
  Logger.getLogger("org").setLevel(Level.ERROR)
  
  val spark = SparkSession.builder
  .appName("SparkSQL")
  .master("local[*]")
  .getOrCreate()
  
  def main (args: Array[String]) {
    
    val df = spark.read
    .option("header", "true")
    .option("inferSchema", "true")
    .csv("/Users/thomas/Documents/poe_bigdata/s7_8_scala_spark/ContainsNull.csv")
    
    df.printSchema()
    df.show(5)
    df.describe().show()
    
    // Supprime toutes les lignes contenant un nombre quelconque de valeurs na
    println("resultat après suppression des na : ")
    df.na.drop().show()
    
    // Supprime les lignes dont le nombre de null est supérieur ou égal au seuil
    println("resultat après suppression des doubles na : ")
    df.na.drop(2).show()
    
    // Remplir les valeurs de na avec un Int
    println("Remplir les valeurs de na avec '100' : ")
    df.na.fill(100).show()
    
    // Remplir les valeurs de na avec un String
    println("Remplir les valeurs de na avec 'Emp name missing' : ")
    df.na.fill("Emp name missing").show()
    
    // Remplir les valeurs de na avec un String uniquement dans une colonne spécifique
    println("Remplir les valeurs de na avec 'Specific' uniquement dans la colonne 'name': ")
    df.na.fill("Specific", Array("Name")).show()
    
  } 
}