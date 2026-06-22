public class Main {

	public static void main(String [] args) {
		
		// Get the single instance of Logger
		Logger log1= Logger.getInstance();
		Logger log2= Logger.getInstance();
		
		// Logging messages
		log1.log("User1 Logged In");
		log2.log("User2 Logged In");
		
		// Check if both instances are the same
		// Since both the reference variables point to the same logger object in the heap , i.e the same address , always the if statement will be executed 
		if(log1 == log2) {
			System.out.println("Logger Class Is A Singleton Class. Both Instances Are The Same");
		}
		else {
			System.out.println("Logger Class Is Not A Singleton Class. Both Instances Are Not The Same");
		}
		
	}
	
}
