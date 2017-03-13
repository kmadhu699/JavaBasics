package com.basics;


public class FunctionsExample {

    // 4 different types of functions
    // 1. Functions without input parameter and without return type - static
    // 2. Functions without input parameter and with return type - non static
    // 3. Functions with input parameter and without return type - nonstatic
    // 4. Functions with input parameter and with return type -  static

    static int a = 14;

    public static void main(String[] args) {

        FunctionsExample functionsExample = new FunctionsExample();

        //creating an object
        functionsExample.sub(20, 40);
        // store the return value in a local variable
        String prod = functionsExample.mul(1, 3);

        // consume the return value directly by printing on console
        System.out.println(functionsExample.mul(10, 20));
    }
    // 1
    public  void add() {
        int a = 10;
        int b = 20;
        System.out.println(a + b);
        System.out.println("Sum is:" + (a + b));
    }

    // 4
    public  String mul(int a, int b) {
        // error -- can not access non static method in static methods
        System.out.println(modular());
        return "Product  is " + (a * b);
    }

    // 3
    public void sub(int a, int b) {
        add();
        System.out.println("Diffrence is:" + (b - a));

    }

    //2
    public boolean modular() {
        return (a % 2) == 0;
    }

}

