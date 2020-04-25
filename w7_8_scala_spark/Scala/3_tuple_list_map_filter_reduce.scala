package fr.m2i.exercice

object exercice3 {
  
  // Tuple
  val tuple = ("exo1", "exo2", "exo3", "exo4", 1, 5.5, true, "clé" -> "valeur")
  
  // List
  val list0 = List("exo1", "exo2", "exo3", "exo4", 1) 
  // accepte et interprète tous les types à l'intérieur
  
  val list1: List[Any] = List("exo1", "exo2", "exo3", "exo4", 1)
  // accepte tout type d'éléments 
  
  val list2: List[String] = List("exo1", "exo2", "exo3", "exo4")
  // n'accepte que des éléments de type String
  
  val list3: List[Int] = List(1, 2, 3, 4, 5)
  // n'accepte que des éléments de type String
  
  val list4: List[Int] = List(6, 7, 8, 9, 10)
  
  // Map
  val map1: Map[String, String] = Map("1"->"exo1", "2"->"exo2", "3"->"exo3", "4"->"exo4")
  val map2 : Map[Int, String] = Map(1->"exo1", 2->"exo2", 3->"exo3", 4->"exo4")
  
  
  def main(args: Array[String]) {
    
    println("====== tuple ======")
    println(tuple)
    println(tuple._1)
    println(tuple._2)
    println(tuple._3)
    println(tuple._4)
    println(tuple._5)
    println(tuple._6)
    println(tuple._7)
    println(tuple._8)
    println(tuple._8._1)
    println(tuple._8._2)
    
    val subTuple = tuple._8
    println(subTuple._1)
    println(subTuple._2)
    
    println("====== list ======")
    println(list0)
    println(list0(0))
    println(list0(1))
    println(list0(4))
    
    println(list1)
    println(list2)
    println(list3)
    
    println("====== list3.head/tail ======")
    println(list3.head)
    println(list3.tail)
    
    println("====== print éléments de la liste ======")
    for (ele <- list2) {
      println(ele)
    }
    
    println("====== map ======")
    println("====== map('_t' + x) ======")
    val list2_t = list2.map((x: String) => "t_"+x) 
    // map permet transformation de chaque elt de la list avec une fonction
    println(list2_t)
    
    println("====== map(x * x) ======")
    val list3_t1 = list3.map((x: Int) => x * x)
    val list3_t2 = list3.map((x: Int) => math.pow(x, 2).toInt)
    val list3_t3 = list3.map(math.pow((_:Int), 2).toInt)
    
    println(list3_t1)
    println(list3_t2)
    println(list3_t3)
    
    println("====== reduce ======")
    println("====== reduce(x+y) ======")
    val sum = list3.reduce((x: Int, y: Int) => x + y)
    println(sum)
    // 1, 2, 3, 4, 5
    // 2 -> (1 + 2), 2, 3, 4, 5
    // 3 -> ((1 + 2) + 3), 4, 5
    // 4 -> ((1 + 2) + 3) + 4), 5
    // 5 -> ((1 + 2) + 3) + 4) + 5
    
    println("====== filter ======")
    val list3_f1 = list3.filter((x: Int) => x % 2 == 0) 
    // filtre les elts pairs de la liste
    val list3_f2 = list3.filter((x: Int) => x >= 3) 
    
    println(list3_f1)
    println(list3_f2)
    
    println("====== ajout d'un élément dans la liste ======")
    val list2_1 = list2 :+ "exo5"
    println(list2_1)
    
    println("====== concaténer 2 listes ======")
    // concaténer 2 listes
    val list5 = list3 ++ list4
    println(list5)
    
    val list6 = list5 ++ list5
    println(list6)
    println("====== list.ditinct/max/min ======")
    println(list6.distinct)
    println(list6.max)
    println(list6.min)
    println(list6.contains(6))
    println(list6.contains(11))
    
    println("====== maps ======")
    println(map1)
    println(map2)
    
    println(map1("1"))
    println(map2(3))
    
    println(map1.contains("11"))
    println(map1.keys)
    println(map1.values)
    println(map1.keys.reduce((x:String, y:String) => x + "-" + y))
    println(map1.values.reduce((x:String, y:String) => x + "-" + y))
    println(map2.keys.filter((x: Int) => x >= 3).reduce((x:Int, y:Int) => x + y))
    println(map2.filterKeys(_>=3).values.reduce((x:String, y:String) => x + "-" + y))
    println(map1.filterKeys(_.toInt>=3).values.reduce((x:String, y:String) => x + "-" + y))
    
    // Ex1:Ecrivez une fonction qui prend un entier et renvoie un booléen indiquant s'il est pair ou non.
    // Voyez si vous pouvez écrire ceci en une seule ligne!
    println("====== est pair: ======")
    def is_even(x: Int): Boolean = {
      x % 2 == 0 
    }
    println(is_even(7))
    
    val is_even2 = (x:Int) => x % 2 ==0
    println(is_even2(8))
    
    // Ex2: Vérifier les événements dans une liste:
    // Ecrivez une fonction qui renvoie Vrai s'il y a un nombre pair dans une liste, sinon, retournez Faux.
    def contains_even_number(list: List[Int]): Boolean = {
      for (ele <- list) {
        if (ele % 2 == 0) {
          return true
        }        
      }
      return false // important de retourner fasle s'il n'y a pas d'éléement pair dans la liste
      // pour satisfaire le retour de la fonction de type Boolean sinon retour vide de type Unit
    }
    
    println("====== liste contient un élément pair: ======")
    println(contains_even_number(list3))
    
    // Ex2bis: Vérifier les événements dans une liste:
    // Ecrivez une fonction qui renvoie Vrai si le nombre d'élément dans une liste est pair, sinon, retournez Faux.
    
    println("====== nb d'éléments dans la liste est pair: ======")
    def nb_elt_even (list: List[Any]): Boolean = {
      list.length % 2 == 0
    }
    
    val nb_elt_even2 = (x: List[Any]) => x.length % 2 == 0
    
    println(nb_elt_even(list0))
    println(nb_elt_even(list2))
    
    println(nb_elt_even2(list0))
    println(nb_elt_even2(list2))
    
    // Ex3: Prenez une liste d’entiers (ex: 1,2,3,7) et calculez leur somme. 
    // Cependant, les sept sont chanceux et devraient être comptés deux fois, 
    // ce qui signifie que leur valeur est 14 pour la somme. 
    // Supposons que la liste n'est pas vide.
    val list7: List[Int] = List(1, 2, 3, 7)
    def sum_lucky_sevens (list: List[Int]): Int = {
      var cpt: Int = 0
      for (ele <- list) {
        if (ele == 7) {
          cpt = cpt + ele * 2
        }
        else {
          cpt = cpt + ele
        }
      }
      return cpt
    }
    println("====== somme des éléments dans la liste avec 7 chanceux: ======")
    println(sum_lucky_sevens(list7))
        
    // val sum7 = list7.reduce((x: Int, y: Int) => x + y)
    // println(sum7)
    
    // Ex4: Vérification du palindrome
    // Étant donné une chaîne, retourne un booléen indiquant s'il s'agit ou non d'un palindrome. 
    // (Épelé le même avant et en arrière).
    
    def is_palindrome(chaine: String): Boolean = {
      chaine.reverse == chaine
    }   
    
    println("====== le mot est un palindrome: ======")
    println(is_palindrome("bonjour"))
    println(is_palindrome("coloc"))
    
  }
  
}