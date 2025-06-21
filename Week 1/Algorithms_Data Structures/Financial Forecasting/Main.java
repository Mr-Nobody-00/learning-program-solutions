import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter initial investment amount: ");
        double principal = sc.nextDouble();

        System.out.print("Enter annual growth rate (%): ");
        double rate = sc.nextDouble();

        System.out.print("Enter number of years: ");
        int years = sc.nextInt();

        double result = Forecast.futureValue(principal, rate, years);
        System.out.printf("Future Value (Recursive): %.2f\n", result);

        double optimizedResult = Forecast.futureValueMemo(principal, rate, years);
        System.out.printf("Future Value (Memoized): %.2f\n", optimizedResult);

        sc.close();
    }
}
