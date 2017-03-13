package com.basics;


public class FunctionsExcercise {


    static int a = 14;

    //1

    public  static void staticAdd() {
        int a = 10;
        int b = 20;
        System.out.println(a + b);
        System.out.println("Sum is:" + (a + b));
    }
//2
    public  void add() {
        int a = 10;
        int b = 20;
        System.out.println(a + b);
        System.out.println("Sum is:" + (a + b));
    }

    //3
    public static String staticMul(int a, int b) {

        System.out.println();

        //calling non static method in static methiod

        functionsExcercise.mul(5,5);

        return "Product  is " + (a * b);
    }
    //4

    public String mul(int a, int b) {

        //Step2

        System.out.println(staticModular());
        return "Product  is " + (a * b);
    }

    //5

    public static void staticSub(int a, int b) {

        System.out.println("Diffrence is:" + (b - a));

    }

    //6
    public  void sub(int a, int b) {
        add();
        System.out.println("Diffrence is:" + (b - a));

    }

    //7

    public boolean modular() {
        return (a % 2) == 0;
    }

    //8
    public static boolean staticModular() {
        return (a % 2) == 0;
    }

   static  FunctionsExcercise functionsExcercise = new FunctionsExcercise();



    public static void main(String[] args) {

         //Step1


        functionsExcercise.sub(20, 40);   //Step3
        staticSub(20, 40);

        functionsExcercise.add();
        staticAdd();

        String prod = functionsExcercise.mul(1, 3);
        String prod1 = staticMul(1, 3);


        System.out.println(functionsExcercise.modular());
        System.out.println(staticModular());





    }


}
