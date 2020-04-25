package formation;

import java.util.Scanner;

public class Exercice {

	public static void main(String[] args) {
		
		Palindrome palindrome = new Palindrome();
		Scanner scanner = new Scanner(System.in);

        while (true) {

            System.out.print("Entrez une chaine : ");
            String phrase = scanner.nextLine();

            if (palindrome.test(phrase))
    			System.out.println(phrase+" est un palindrome");
    	   	else 
    	   		System.out.println(phrase+" n’est pas un palindrome"); 		
            
            System.out.print("Voulez-vous continuer o/n ?");
            if ("n".equals(scanner.nextLine())) {
                System.out.println("Fin...");
                break;
            }
        }

        scanner.close();
        System.exit(0);
	}
	
}
