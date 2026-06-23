import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoggingExample {
    
    // Created the logger instance for this class
    private static final Logger logger = LoggerFactory.getLogger(LoggingExample.class);

    public static void main(String[] args) {
        
        // Logging an Error message
        logger.error("This is an error message");
        
        // Logging a Warning message
        logger.warn("This is a warning message");
        
    }
}