public class TestReverseNumber {
        public static int revNum(int number) {
        int reversed = 0;

        while (number != 0) {
            int lastDigit = number % 10;      
            reversed = reversed * 10 + lastDigit; 
            number = number / 10;          

        }
        return reversed;
        }
        
    }
