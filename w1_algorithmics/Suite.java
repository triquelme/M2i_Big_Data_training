package formation;

public class Suite {

	public static void main(String[] args) {
		int n = 20;
		for(int i= 0; i <= n; i++)
		{
			System.out.println( i + " : " +fibonacci(i));
		}
	}

	public static long fibonacci(int n)
	{
		if (n <= 1)
		{
			return n;
		}
		else
		{
			return fibonacci(n-1)+fibonacci(n-2);
		}
	}
}

