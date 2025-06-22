# AdapterPatternExample

## Description
This project demonstrates the **Adapter Pattern** in Java. The Adapter Pattern is a structural design pattern that allows objects with incompatible interfaces to work together. In this scenario, we apply it to unify different third-party payment gateways under one common interface.

## Problem Statement
You are developing a payment processing system that needs to integrate with multiple third-party payment gateways. Each gateway exposes a different interface. Instead of modifying the client code for each gateway, we use the Adapter Pattern to bridge this gap.

## Objective
To allow integration of multiple payment gateway classes (with different method signatures) into a single unified interface (`PaymentProcessor`) using adapter classes.

## Concepts Used

- **Structural Pattern**: Adapter Pattern is used to make unrelated classes work together.
- **Loose Coupling**: The client code only depends on the `PaymentProcessor` interface.
- **Code Reusability**: Third-party classes remain untouched.

## Author

**Submitted By:** 6387612  
**Submitted for:** Cognizant Digital Nurture 4.0  
**Task:** Exercise 4 - Implementing the Adapter Pattern  
**Language:** Java