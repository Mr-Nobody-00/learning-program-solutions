public class Main {
    public static void main(String[] args) {

        // Basic Computer
        Computer basicComputer = new Computer.Builder("Intel i3", "8GB").build();

        // Gaming Computer
        Computer gamingComputer = new Computer.Builder("Intel i7", "16GB")
                .setGraphicsCard("NVIDIA RTX 3060")
                .setStorage("1TB SSD")
                .setKeyboard("Mechanical RGB")
                .setMouse("Gaming Mouse")
                .build();

        // Office Computer
        Computer officeComputer = new Computer.Builder("Intel i5", "12GB")
                .setStorage("512GB SSD")
                .setKeyboard("Standard Keyboard")
                .build();

        System.out.println("Basic Computer:");
        basicComputer.showSpecs();

        System.out.println("Gaming Computer:");
        gamingComputer.showSpecs();

        System.out.println("Office Computer:");
        officeComputer.showSpecs();
    }
}
