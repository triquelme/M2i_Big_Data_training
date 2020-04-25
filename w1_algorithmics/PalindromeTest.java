package formation;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class PalindromeTest {

	Palindrome palindrome ;
	
	@BeforeEach
	void setUp() throws Exception {
		palindrome = new Palindrome();
	}

	@AfterEach
	void tearDown() throws Exception {
	}

	@Test
	void testSuccess1() {
		assertTrue(palindrome.test("C"));
	}
	
	@Test
	void testSuccess2() {
		assertTrue(palindrome.test("Aà"));
	}
	
	@Test
	void testSuccess3() {
		assertTrue(palindrome.test("NON"));
	}

	@Test
	void testSuccess4() {
		assertTrue(palindrome.test("* ! 199 1"));
	}
	
	@Test
	void testSuccess5() {
		assertTrue(palindrome.test("ELU, PAR CETTE CRAPULE !"));
	}
	
	@Test
	void testFail1() {
		assertFalse(palindrome.test("Aa"));
	}
	
	@Test
	void testFail2() {
		assertFalse(palindrome.test("NOL"));
	}
}
