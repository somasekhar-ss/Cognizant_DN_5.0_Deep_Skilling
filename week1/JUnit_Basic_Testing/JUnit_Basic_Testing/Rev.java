import static org.junit.Assert.assertEquals;
import org.junit.Test;
public class Rev {
@Test
	public void testrev(){
		int num=1234;
		int check=4321;
		assertEquals(check,TestReverseNumber.revNum(num));
	}

}
