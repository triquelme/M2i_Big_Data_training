package formation;

public class Tri {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] tableau = {112, 9, 43, 68, 14, 5, 91, 77 };
		trier(tableau);
		for(int i : tableau)
			System.out.println(i);
	}

	/**
	*   Trie le tableau donn� selon l'algorithme de tri par s�lection
	*
	*   int tab[] :: tableau � trier
	*   int taille :: taille du tableau
	*
	*   return void
	**/
	static void trier(int tab[])
	{
		int taille = tab.length;
	    int indice_max;
	    
	    // � chaque tour de boucle, on va d�placer le plus grand �l�ment
	    // vers la fin du tableau, on diminue donc � chaque fois sa taille
	    // car le dernier �l�ment est obligatoirement correctement
	    // plac� (et n'a donc plus besoin d'�tre parcouru/d�plac�)

	    for(; taille > 1 ; taille--) // tant qu'il reste des �l�ments non tri�s
	    {
	        indice_max = max(tab, taille);
	    
	        echanger(tab, taille-1, indice_max); // on �change le dernier �l�ment avec le plus grand
	    }
	}

	/**
	*   Renvoie l'indice du plus grand �l�ment du tableau
	*
	*   int tab[] :: tableau dans lequel on effectue la recherche
	*   int taille :: taille du tableau
	*
	*   return int l'indice du plus grand �l�ment
	**/
	static int max(int tab[], int taille)
	{
	    // on consid�re que le plus grand �l�ment est le premier
	    int i=0, indice_max=0;
	    
	    while(i < taille)
	    {
	        if(tab[i] > tab[indice_max])
	            indice_max = i;
	        i++;
	    }
	    
	    return indice_max;
	}

	/**
	*   �change deux �l�ments d'un tableau
	*
	*   int tab[] :: tableau dans lequel on effectue l'�change
	*   int x :: indice du premier �l�ment
	*   int y :: indice du second �l�ment
	*
	*   return void
	**/
	static void echanger(int tab[], int x, int y)
	{
	    int tmp;
	    
	    tmp = tab[x];
	    tab[x] = tab[y];
	    tab[y] = tmp;
	}

}
