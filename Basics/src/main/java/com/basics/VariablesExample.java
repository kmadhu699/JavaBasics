package com.basics;


public class VariablesExample {

    // global variable -> since declared and defined in the class scope
    final static String userName = "madhu";

    // non-static variable
    int number = 1234;

    public static void main(String[] args) {

// trying to access nonstatic variable
//        System.out.println("number : " + number);

        // userName should be accessible inside the method , since userName is global

        System.out.println("Username is : " + userName);
        reprintName();

        // trying to access a non static function
       // sampleNonStaticBlock();


        //  Accessible only with the help of class object
        // Nonstatic blocks can be accessible inside the static block only with the help of a Class-instance variable
        // Class-instance variable is other wise called as "Object"

        VariablesExample variablesExample = new VariablesExample();

        variablesExample.sampleNonStaticBlock();


        // Object/variables will behave like its immediate parent
        // Inherits the features of the parent block
        // a variable created inside a static block is a static variable
        // a variable created inside a non-static block will be by default a non-static variable


    }

    public static void reprintName() {
        // redefining the final variable is not possible
        // userName = "Madhu K";
        System.out.println("Username reprinting : " + userName);
    }


    public void sampleNonStaticBlock() {

        // Trying to access a non-static variable - works
        System.out.println("number : " + number);

        // Trying to access a static variable -- works
        System.out.println("Name : " + userName);

    }


}
