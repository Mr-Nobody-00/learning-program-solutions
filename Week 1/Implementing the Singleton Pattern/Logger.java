public class Logger {
    // Step 2: private static instance of Logger
    private static Logger instance;

    // Step 2: Private constructor
    private Logger() {
        System.out.println("Logger initialized.");
    }

    // Step 2: public static method to return the instance
    public static Logger getInstance() {
        if (instance == null) {
            instance = new Logger();
        }
        return instance;
    }
    
    // Utility method to simulate logging
    public void log(String message) {
        System.out.println("Log: " + message);
    }
}
