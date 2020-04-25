package fr.m2i.exercice

object exercice1 {
  def main (args: Array[String]) {
    
    println("Bonjour Scala !")
    
    // if/else syntax
    if (1>3) 
      println("Impossible!")
    else
      println("C'est vrai!")
    
    if (1>3) {
      println("Impossible!")
    }
    else {
      println("C'est vrai!!")
    }
    
    val number = 3
    number match {
      case 1 => println("Un")
      case 2 => println("Deux")
      case 3 => println("Trois")
      case 4 => println("Autres..")
    }
    
    // for loop
    
    for (x <- 1 to 4) {
      val carre = x * x
      println(carre)
    }
    
    // While loop
    
    println("===== While loop 1 =====")
    var x = 10
    while (x >= 0) {
      println(x)
      x -= 1 
    }
    
    println("===== While loop 2 =====")
    x = 0
    do {
      println(x)
      x += 1
    } while (x <= 10)
      
    println({val x = 10; x + 20 })
    
    // Suite de Fibonacci 
    // 0, 1, 1, 2, 3, 5, 8, 13, 21, 34
    // N(n+1) = N(n) + N(n-1)
    // 1 = 1 + 0
    // 2 = 1 + 1
    // 3 = 2 + 1
    
    println("===== Fibonacci =====")
    var N = 50
    var a:Long = 0
    var b:Long = 1
    var c:Long = 0 
    
    for (x <- 0 to 50) {
      println(b)
      c = a + b
      a = b
      b = c
    } 
    
  }
}