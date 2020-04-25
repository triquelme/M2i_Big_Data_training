package fr.m2i.exercice

import org.apache.spark._
import org.apache.spark.sql.SparkSession
import org.apache.log4j._
import org.apache.spark.ml.regression.LinearRegression 
import org.apache.spark.ml.linalg.Vectors
import org.apache.spark.ml.feature.VectorAssembler

object regression_lineaire2 {
  
  Logger.getLogger("org").setLevel(Level.ERROR)
  
  val spark = SparkSession.builder
    .appName("LinearRegressionExample")
    .master("local[*]")
    .getOrCreate()
    
  def main(args: Array[String]) {
    
    val path = "/Users/thomas/Documents/poe_bigdata/s7_8_scala_spark/EcommerceCustomers.csv"
    
    val data = spark.read.option("header", "true").option("inferSchema", "true").csv(path)
    
    data.printSchema()
    data.show(5)
    
    val data2 = data.na.drop()
    data2.show(5)
    
    println("data : " + data.count + " data2 : " + data2.count)
    
    val assembler = new VectorAssembler().setInputCols(Array("Avg Session Length","Time on App","Time on Website","Length of Membership")).setOutputCol("features") 
    
    val output = assembler.transform(data2)
    
    // final data format must contains colnames "features" and "label"
    var final_data = output.select("features", "Yearly Amount Spent")
    // on cherche a prédire le "Yearly Amount Spent" grâce aux 4 autres colonnes/features
    
    final_data = final_data.withColumnRenamed("Yearly Amount Spent", "label")
    final_data.printSchema()
    final_data.show(5)
    
    val training_test = final_data.randomSplit(Array(0.7, 0.3), seed = 11L)
    // sépare les données en 70% training et 30% test
    
    //training_test.printSchema()
    //training_test.show(5)
    
    //println("Training : " + training_test(0).count())
    //println("Test : " + training_test(1).count())
    
    val training = training_test(0)
    val test = training_test(1)
    
    val lr = new LinearRegression().setMaxIter(10).setRegParam(0.3).setElasticNetParam(0.8)
    println("Create new LinearRegression Object")
    
    // Fit the model   
    val lrModel = lr.fit(training)
    println("Fit the model")
    
    // Print the coefficients and intercept for linear regression
    println("Coefficients: " + lrModel.coefficients + " - Intercept: " + lrModel.intercept)
    
    // Evaluate model
    val test_results = lrModel.evaluate(test)
    
    test_results.residuals.show()
    
    println("R2 : " + test_results.r2)
    println("RMSE : " + test_results.rootMeanSquaredError)  
    
  }
  
}