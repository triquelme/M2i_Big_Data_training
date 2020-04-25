package fr.m2i.exercice

object exercice2 {
  
  def maFonction1(x: Int) : Int = {
    x+3
    x*x //la fonction va renvoyer uniquement le résultat du dernier traitement
    // Rq: on peut ecrire return x*x ou x*x, le return n'est pas obligatoire
  }
  
  def maFonction2(x: Int, y: Int) : Int = {
    x + y
  }
  
  def maFonction2bis(x: Int, y : Int) = { // scala déduit le type renvoyé
    x+y * 0.3
  }
  
  //fonction lambda
  val f1 = (x: Int) => x + 1
  val f2 = f1
  
  //ex notation lambda
  val ex1 = (x: Int) => x + 1
  val ex2 = (_: Int) +1
  
  val ex3 = (z: Int, y: Int) => z*y
  val ex4 = (_:Int)*(_:Int)
  
  def maFonction3(x: Int, f: Int => Int) : Int = {
    f(x)
  }
  
  def maFonction4(x: Int, y: Int, f: (Int, Int) => Int) : Int = {
    f(x,y) 
  }
  
  def maFonction5(x: Int): Unit = { // Unit quand la fonction ne renvoie rien
    println(x)
  }
  
  def maFonction6(x: Int): Int = {
    return x+1 // return renvoie le résultat
    // sort de la fonction et ne traite plus ce qu'il y a derrière
    x*x
  }
  
  
  def main (args: Array[String]) {
    println("===== fonction 1 =====")
    println(maFonction1(3))
    
    println("===== fonction 2 =====")
    val res = maFonction2(2,3)
    println(res)
    
    println("===== fonction 2 =====")
    val res2 = maFonction2bis(2,3)
    println(res2)
    
    println("===== fonction lambda f1 =====")
    println(f1(3))
    println(f2(7))
    
    println("===== fonction 3 =====")
    println(maFonction3(3, (x: Int) => x +1))
    println(maFonction3(3, (_: Int)+1))
    
    println(maFonction3(3, maFonction1))
    
    println("===== fonction 4 =====")
    println(maFonction4(3, 7, (x: Int, y: Int) => x +y))
    println(maFonction4(3, 7, (_: Int) + (_: Int)))
    
    println(maFonction4(5, 10, maFonction2))
    
    println("===== fonction 5 =====")
    maFonction5(5)
    
    println("===== fonction 6 =====")
    println(maFonction6(5))
    
  }
  
}