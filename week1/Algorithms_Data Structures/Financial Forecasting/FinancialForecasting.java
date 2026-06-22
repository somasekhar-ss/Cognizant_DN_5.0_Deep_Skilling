import java.util.*;
public class FinancialForecasting {

    public static double forecastSavings(double savings, double interestRate, int years) {

        // Base case
        if (years == 0) {
            return savings;
        }

        // Recursive case
        return forecastSavings(savings, interestRate, years - 1) * (1 + interestRate);
    }

    public static void main(String[] args) {

    	Scanner sc=new Scanner(System.in);
    	System.out.println("Enter Saving");
        double savings = 50000;
        double interestRate = 0.07; // 7%
        int years = 4;

        double result = forecastSavings(savings, interestRate, years);

        System.out.printf("Savings after %d years: %.2f Rs/-", years, result);
    }
}