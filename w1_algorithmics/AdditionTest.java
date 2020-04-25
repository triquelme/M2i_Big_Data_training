package math;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class AdditionTest {

	Addition op;
	
	@BeforeEach
	void setUp() throws Exception {
		op = new Addition();
	}

	@AfterEach
	void tearDown() throws Exception {
	}

	@Test
	void testCalculer() {
		assertEquals(4, op.Calculer(2, 2));
	}

	@Test
	void testLireSymbole() {
		assertEquals('+', op.LireSymbole());
	}

}
