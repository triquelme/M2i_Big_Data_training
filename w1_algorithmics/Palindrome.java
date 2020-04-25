package formation;

public class Palindrome {
	
	public Boolean test(String str)
	{
		int left = 0;
		int right = str.length() -1;	
		while(left <= right)
		{
			if (!acceptChar(str.charAt(left)))
			{
				left++;
			}
			else if (!acceptChar(str.charAt(right)))
			{
				right--;
			}
			else if (str.charAt(left) != str.charAt(right)) 
			{
				return false;
			}
			else
			{
				left++;
				right--;
			}
		}
	    return true;  
	}
	
	private Boolean acceptChar(char chr)
	{
		return 
				(chr >= 'a' && chr <= 'z') ||
				(chr >= 'A' && chr <= 'Z') ||
				(chr >= '0' && chr <= '9');
	}
	
	
//	private Boolean acceptChar(char chr)
//	{
//		return Character.isLetterOrDigit(chr);
//	}
}
