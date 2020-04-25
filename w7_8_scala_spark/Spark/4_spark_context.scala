package fr.m2i.exercice

import org.apache.spark._
import org.apache.spark.SparkContext._
import org.apache.log4j._

object exercice4 {
  
  val sc = new SparkContext("local[*]", "test")
  
  var list = List(("Ankit", 25), ("Jalfaizy", 22), ("saurabh", 20), ("Bala", 26))
  
  def main (args: Array[String]) {
    
    println(list)
    
  }
}