package com.myorg;

import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;

public class CalculatorTest {
    private Calculator calc;

    @Before
    public void setUp() {
        // Arrange: create a fresh Calculator before each test
        calc = new Calculator();
    }

    @After
    public void tearDown() {
        // Teardown: clean up if needed (not strictly necessary here)
        calc = null;
    }

    @Test
    public void testAdd() {
        // Act
        int result = calc.add(2, 3);
        // Assert
        assertEquals("2 + 3 should equal 5", 5, result);
    }

    @Test
    public void testMultiply() {
        int result = calc.multiply(4, 5);
        // Assert
        assertEquals("4 * 5 should equal 20", 20, result);
    }
}
