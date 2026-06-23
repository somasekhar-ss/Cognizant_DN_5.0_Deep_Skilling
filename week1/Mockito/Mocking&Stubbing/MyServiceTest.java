import static org.junit.Assert.*;
import static org.mockito.Mockito.when;

import org.junit.Test;
import org.mockito.Mockito;
public class MyServiceTest {
    @Test
    public void testExternalApi() {
        // 1. Created a mock object for the external API
        ExternalApi mockApi = Mockito.mock(ExternalApi.class);
        
        // 2. Stubbed the method
        when(mockApi.getData()).thenReturn("Mock Data");
        
        // 3. Write a test case that uses the mock object
        MyService service = new MyService(mockApi);
        String result = service.fetchData();
        
        // Verify the result matches our stubbed data
        assertEquals("Mock Data", result);
    }
}