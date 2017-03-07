package com.basics;


public class FunctionsExample {


    // 4 different types of functions


    // 1. Functions without input parameter and without return type
    // 2. Functions without input parameter and with return type
    // 3. Functions with input parameter and without return type
    // 4. Functions with input parameter and with return type

    // 1
    public static void add() {
        int a = 10;
        int b = 20;
        System.out.println(a + b);
        System.out.println("Sum is:" + (a + b));
    }

    public static void main(String[] args) {
        add();
        sub(20, 40);
        // store the return value in a local variable
        String prod = mul(1, 3);

        // consume the return value directly by printing on console
        System.out.println(mul(10, 20));
        System.out.println(modular());
    }


    // 3
    public static void sub(int a, int b) {

        System.out.println("Diffrence is:" + (b - a));

    }

    // 4
    public static String mul(int a, int b) {

        return "Product  is " + (a * b);
    }

    static int a = 14;
    //2
    public static boolean modular() {



        return (a % 2 ) == 0;
    }

}

