/**
 * 
 */
package formation;
import java.time.*;

/**
 * @author yrome
 *
 */
public class Bonjour {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		LocalDateTime now = LocalDateTime.now();
		DayOfWeek day = now.getDayOfWeek();
		int hour = now.getHour();
		if (weekEnd(day,hour))
			print("Bon week-end");
		else if ( hour >= 9 && hour < 18)
			print("Bonne journée");
		else
			print("Bonne soirée");
	}

	private static boolean weekEnd(DayOfWeek day, int hour)
	{
		if (day == DayOfWeek.SATURDAY || day == DayOfWeek.SUNDAY)
			return true;
		if (day == DayOfWeek.FRIDAY || hour >= 18)
			return true;
		if (day == DayOfWeek.MONDAY || hour < 9)
			return true;
		return false;
	}
	
	private static void print(String message)
	{
		System.out.println(String.format("%1s %2s", message, System.getProperty("user.name")));
	}
}
