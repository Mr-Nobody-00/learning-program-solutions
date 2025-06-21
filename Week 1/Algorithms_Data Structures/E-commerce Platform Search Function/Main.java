import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Scanner;

public class Main {
    static ArrayList<Product> productList = new ArrayList<>();
    static Scanner sc = new Scanner(System.in);

    public static void main(String[] args) {
        int choice;

        do {
            System.out.println("\n--- E-Commerce Product Management ---");
            System.out.println("1. Insert Product");
            System.out.println("2. Display Products");
            System.out.println("3. Search Product [Linear Search]");
            System.out.println("4. Search Product [Binary Search]");
            System.out.println("5. Exit");
            System.out.print("Enter your choice: ");
            choice = sc.nextInt();
            sc.nextLine();

            switch (choice) {
                case 1:
                    insertProduct();
                    break;
                case 2:
                    displayProducts();
                    break;
                case 3:
                    searchLinear();
                    break;
                case 4:
                    searchBinary();
                    break;
                case 5:
                    System.out.println("Exiting program.");
                    break;
                default:
                    System.out.println("Invalid choice!");
            }
        } while (choice != 5);

        sc.close();
    }

    static void insertProduct() {
        System.out.print("Enter Product ID: ");
        int id = sc.nextInt();
        sc.nextLine();
        System.out.print("Enter Product Name: ");
        String name = sc.nextLine();
        System.out.print("Enter Category: ");
        String category = sc.nextLine();

        productList.add(new Product(id, name, category));
        System.out.println("Product added successfully.");
    }

    static void displayProducts() {
        if (productList.isEmpty()) {
            System.out.println("No products available.");
            return;
        }
        System.out.println("\n--- Product List ---");
        for (Product p : productList) {
            System.out.println(p);
        }
    }

    static void searchLinear() {
        if (productList.isEmpty()) {
            System.out.println("No products to search.");
            return;
        }
        System.out.print("Enter product name to search: ");
        String name = sc.nextLine();
        Product result = SearchUtility.linearSearch(productList.toArray(new Product[0]), name);
        System.out.println(result != null ? result : "Product not found.");
    }

    static void searchBinary() {
        if (productList.isEmpty()) {
            System.out.println("No products to search.");
            return;
        }
        System.out.print("Enter product name to search: ");
        String name = sc.nextLine();

        // Sort product list before binary search
        Collections.sort(productList, Comparator.comparing(p -> p.productName.toLowerCase()));

        Product result = SearchUtility.binarySearch(productList.toArray(new Product[0]), name);
        System.out.println(result != null ? result : "Product not found.");
    }
}
