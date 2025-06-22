public class Computer {

    // Required parameters
    private String CPU;
    private String RAM;

    // Optional parameters
    private String storage;
    private String graphicsCard;
    private String keyboard;
    private String mouse;

    // Private constructor to enforce object creation via Builder
    private Computer(Builder builder) {
        this.CPU = builder.CPU;
        this.RAM = builder.RAM;
        this.storage = builder.storage;
        this.graphicsCard = builder.graphicsCard;
        this.keyboard = builder.keyboard;
        this.mouse = builder.mouse;
    }

    // Static Nested Builder Class
    public static class Builder {
        private String CPU;
        private String RAM;
        private String storage;
        private String graphicsCard;
        private String keyboard;
        private String mouse;

        public Builder(String CPU, String RAM) {
            this.CPU = CPU;
            this.RAM = RAM;
        }

        public Builder setStorage(String storage) {
            this.storage = storage;
            return this;
        }

        public Builder setGraphicsCard(String graphicsCard) {
            this.graphicsCard = graphicsCard;
            return this;
        }

        public Builder setKeyboard(String keyboard) {
            this.keyboard = keyboard;
            return this;
        }

        public Builder setMouse(String mouse) {
            this.mouse = mouse;
            return this;
        }

        public Computer build() {
            return new Computer(this);
        }
    }

    // Display configuration
    public void showSpecs() {
        System.out.println("CPU: " + CPU);
        System.out.println("RAM: " + RAM);
        System.out.println("Storage: " + (storage != null ? storage : "N/A"));
        System.out.println("Graphics Card: " + (graphicsCard != null ? graphicsCard : "N/A"));
        System.out.println("Keyboard: " + (keyboard != null ? keyboard : "N/A"));
        System.out.println("Mouse: " + (mouse != null ? mouse : "N/A"));
        System.out.println("-------------------------");
    }
}
