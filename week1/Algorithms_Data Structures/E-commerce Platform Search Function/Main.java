import java.util.Arrays;
import java.util.Comparator;

public class Main {
    public static void main(String[] args) {
        Product[] products = {
            new Product(101, "Laptop", "Electronics"),
            new Product(102, "Shirt", "Clothing"),
            new Product(103, "Phone", "Electronics"),
            new Product(104, "Shoes", "Footwear"),
            new Product(105, "Watch", "Accessories")
        };

        // Linear Search
        Product foundLinear = Search.linearSearch(products, "Phone");
        System.out.println("Linear Search Result: " + (foundLinear != null ? foundLinear : "Not Found"));

        // Sort for Binary Search
        Arrays.sort(products, Comparator.comparing(p -> p.productName.toLowerCase()));

        // Binary Search 
        Product foundBinary = Search.binarySearch(products, "Phone");
        System.out.println("Binary Search Result: " + (foundBinary != null ? foundBinary : "Not Found"));
    }
}
