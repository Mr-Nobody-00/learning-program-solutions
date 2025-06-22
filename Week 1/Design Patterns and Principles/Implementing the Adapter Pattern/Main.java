public class Main {
    public static void main(String[] args) {
        PaymentProcessor stripe = new StripeAdapter(new StripeGateway());
        stripe.processPayment(500.0);

        PaymentProcessor paypal = new PayPalAdapter(new PayPalGateway());
        paypal.processPayment(1000.0);
    }
}
