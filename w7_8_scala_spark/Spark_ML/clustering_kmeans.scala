package fr.m2i.exercice

import org.apache.spark._
import org.apache.spark.sql.SparkSession
import org.apache.log4j._
import org.apache.spark.ml.clustering.{KMeans, KMeansModel}
import org.apache.spark.ml.evaluation.ClusteringEvaluator

import org.apache.spark.ml.linalg.Vectors
import org.apache.spark.ml.feature.VectorAssembler

import org.apache.spark.ml.feature.{StandardScaler, StandardScalerModel}


object kmeans {
  
  Logger.getLogger("org").setLevel(Level.ERROR)
  
  val spark = SparkSession.builder
    .appName("LinearRegressionExample")
    .master("local[*]")
    .getOrCreate()
    
  def main(args: Array[String]) {
    
    val path = "/Users/thomas/Documents/poe_bigdata/s7_8_scala_spark/seeds_dataset.csv"
    
    val data = spark.read.option("header", "true").option("inferSchema", "true").csv(path)
    
    data.printSchema()
    data.show(5)
    
    data.columns.foreach(println)
    
    val data2 = data.na.drop()
    data2.show(5)
    
    println("data : " + data.count + " data2 : " + data2.count)
    
    val assembler = new VectorAssembler().setInputCols(data2.columns).setOutputCol("features")
    
    val output = assembler.transform(data2)
    
    output.printSchema()
    output.show(5)
    
    // StandardScaler transforme les données 
    // de sorte que leur distribution aura une valeur moyenne de 0 et un écart type de 1
    val scaler = new StandardScaler().setInputCol("features").setOutputCol("features_std")  
    // fitter le scaling sur les données
    val scaler_model = scaler.fit(output)
    // Transformer (=standardiser) les données
    val std_data = scaler_model.transform(output)
    
    std_data.printSchema()
    std_data.show(5)
    
    // Training model et Evaluation
    val kmeans = new KMeans().setK(3).setFeaturesCol("features_std")
    
    val model = kmeans.fit(std_data)
    
    val predictions = model.transform(std_data)
  
    // Evaluate clustering by computing Silhouette score
    val evaluator = new ClusteringEvaluator()
    
    val silhouette = evaluator.evaluate(predictions)
    println(s"Silhouette with squared euclidean distance = $silhouette")
    
    // Pour prédire cluster sur un nouveau jeu de donnée (=nouvelles graines) à partir de ce modèle:
    // predictions.evaluate(new_std_seed_dataset)
    // Rq: le nouveau data set doit être préparé au format svm et standardisé
    // mais on ne calcule pas de nouveau modèle à partir de ces nouvelles données
    // on va utiliser le modèle calculé précédémment pour prédire dans quel cluster classifier nos nouvelles graines
    
    // Shows the result.
    println("Cluster Centers: ")
    model.clusterCenters.foreach(println)   
    
    // Sauvegarder le modèle au format libsvm
    val final_data = std_data.select("features_std")
    final_data.write.format("libsvm").save("kmeans-model.svm")
    
    // on enregistre le package fr.m2i.exercice au format .jar (clique droit sur le package > export > JAR file)
    // pour le lire, on execute la commande:
    // spark-submit --class fr.m2i.exercice.exercice2 /Users/thomas/Documents/poe_bigdata/s7_8_scala_spark/exo_spark.jar
    
    
  }
  
}