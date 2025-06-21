import java.util.HashMap;

public class Forecast {
    // Recursive method to calculate future value
    public static double futureValue(double principal, double rate, int years) {
        if (years == 0)
            return principal;
        return (1 + rate / 100) * futureValue(principal, rate, years - 1);
    }

    // Optimized recursive method using memoization
    private static HashMap<Integer, Double> memo = new HashMap<>();

    public static double futureValueMemo(double principal, double rate, int years) {
        if (years == 0)
            return principal;
        if (memo.containsKey(years))
            return memo.get(years);
        double value = (1 + rate / 100) * futureValueMemo(principal, rate, years - 1);
        memo.put(years, value);
        return value;
    }
}
