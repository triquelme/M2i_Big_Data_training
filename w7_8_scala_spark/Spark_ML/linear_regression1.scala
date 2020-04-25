package fr.m2i.exercice

import org.apache.spark._
import org.apache.spark.sql.SparkSession
import org.apache.log4j._
import org.apache.spark.ml.regression.LinearRegression


object regression_lineaire {
  
  Logger.getLogger("org").setLevel(Level.ERROR)
  
  val spark = SparkSession.builder
    .appName("LinearRegressionExample")
    .master("local[*]")
    .getOrCreate()
   
  def main(args: Array[String]) {
    
    // Load file 
    // Format LIBSVM -> format prêt à l'apprentissage
    // label              index1:value1        index2:value2 ...
    // -9.490009878824548 1:0.4551273600657362 2:0.36644694351969087 3:-0.38256108933468047
    val path = "/Users/thomas/Documents/poe_bigdata/s7_8_scala_spark/sample_linear_regression_data.txt"
    
    val training = spark.read.format("libsvm").load(path)
    
    // Explore file
    training.printSchema()
    training.show(5, false)
    
    // Create new LinearRegression Object 
    val lr = new LinearRegression()
      .setMaxIter(10)
      .setRegParam(0.3)
      .setElasticNetParam(0.8)
    println("Create new LinearRegression Object")
    
    // Fit the model   
    val lrModel = lr.fit(training)
    println("Fit the model")
    
    // Print the coefficients and intercept for linear regression
    println("Coefficients: " + lrModel.coefficients + " - Intercept: " + lrModel.intercept)
    
    // Summarize the model over the training set and print out some metrics
    val trainingSummary = lrModel.summary
    println(s"numIterations: ${trainingSummary.totalIterations}")
    println(s"objectiveHistory: ${trainingSummary.objectiveHistory.toList}")
    trainingSummary.residuals.show()
    println(s"RMSE: ${trainingSummary.rootMeanSquaredError}")
    println(s"r2: ${trainingSummary.r2}")
    
  }
  
}