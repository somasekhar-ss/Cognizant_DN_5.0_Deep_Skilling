import static org.junit.Assert.assertEquals;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class EvenTest {
    Even e;
    @Before
    public void setUp() {
        e = new Even();
        System.out.println("Setup Method Executed");
    }
    @After
    public void tearDown() {

        System.out.println("Teardown Method Executed");
    }
    @Test
    public void testAdd() {
        int a = 1;
  

        boolean result = e.isEven(a);
        assertEquals(true, result);
    }
}