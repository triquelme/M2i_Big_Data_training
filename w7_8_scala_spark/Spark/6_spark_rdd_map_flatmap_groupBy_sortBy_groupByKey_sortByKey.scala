package fr.m2i.exercice

import org.apache.spark._
import org.apache.spark.SparkContext._
import org.apache.log4j._

object exercice6 {
  
  Logger.getLogger("org").setLevel(Level.ERROR)
  
  val sc = new SparkContext("local[*]", "test")
  
  def main (args: Array[String]) {
    
    // Les transformations
    // Map
    val list = List("test1 test2", "test3 test4", "test5 test6")
    
    val rdd = sc.parallelize(list)
    rdd.foreach(println)
    
    val rdd_map = rdd.map(x => x.split(" "))
    rdd_map.foreach(println) // pb stocke le résultat splité dans un tableau de string
    
    println("Count Map -> " + rdd_map.count())
    for (x <- rdd_map)
      println(x.apply(0) + " " + x.apply(1)) // pour lire le premier elt du tableau et le deuxième
    
    // ( "test1 test2" , "test3 test4", "test5 test6" )
    // Map => 
    // ( ["test1", "test2"] , ["test3", "test4"], ["test5", "test6"] )
      
    // flatmap
    val rdd_flat_map = rdd.flatMap(x => x.split(" "))
    println("Count Flat Map -> " + rdd_flat_map.count())
    rdd_flat_map.foreach(println)
    
    // ( "test1 test2" , "test3 test4", "test5 test6" )
    // flatMap => 
    // ( "test1", "test2" , "test3", "test4", "test5", "test6" )
    
    // filter
    val list2 = List("Pascal", "Pierre-Jean", "Jean", "Davy", "Serge")
    val rdd2 = sc.parallelize(list2)
    
    val rdd_nom_cmp = rdd2.filter(x => x.contains("-"))
    println("noms composés : ")
    rdd_nom_cmp.foreach(println)
    
    val rdd_nom_simple = rdd2.filter(x => !x.contains("-"))
    println("noms simples : ")
    rdd_nom_simple.foreach(println)
    
    //groupBy
    val list3 = List("Pascal", "Pierre", "Serge", "Jean", "Davy", "David")
    val rdd3 = sc.parallelize(list3)
    
    val groupByFirstLetter = rdd3.groupBy(x => x.charAt(0))
    println("résultat groupBy : ")
    groupByFirstLetter.foreach(println)
    // équivalent 
    // for (x <- groupByFirstLetter)
    //   println(x)
    
    // sortBy
    val rdd4 = rdd3.sortBy(x => x.charAt(0))
    println("sortBy : ")
    rdd4.foreach(println)
    val rdd5 = rdd3.groupBy(x => x.charAt(0)).sortBy(a => a._1)
    println("groupBy et sortBy: ")
    rdd5.foreach(println)
    
    // groupByKey
    val list4 = List("0,11", "1,14", "0,3", "2,19", "1,3", "5,7")
    val rdd6 = sc.parallelize(list4, 1)
    
    val rddPair = rdd6.map(x => (x.split(",")(0), x.split(",")(1)))
    println("rddPair: ")
    rddPair.foreach(println)
    
    val rddReducedByKey= rddPair.groupByKey()
    println("rddReducedByKey: ")
    rddReducedByKey.foreach(println)
    
    // sortByKey
    println("sortByKey :")
    rddReducedByKey.sortByKey(true).foreach(println)
    // trie selon l'ordre des clés
    
    // mapvalues
    val rddPair2 = rdd6.map(x => (x.split(",")(0).toInt, x.split(",")(1).toInt))
    val rddPair2_t = rddPair2.mapValues( x => x * 2)
    println("rddPair_t avec mapValues")
    rddPair2_t.foreach(println)
    
  }
  
}