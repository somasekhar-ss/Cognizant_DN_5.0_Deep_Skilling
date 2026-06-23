import static org.junit.Assert.*;
import org.junit.Test;

public class AssertionTest {
@Test
    public void testAssertion() {
        assertEquals(5, 2 + 3);
        assertTrue(5 > 3);
        assertFalse(5 < 10);
        assertNull(null);
        assertNotNull(new Object());
    }
}