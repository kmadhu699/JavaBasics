package com.basics;


import org.apache.commons.lang3.StringUtils;

public class StringOperations {


    public static void main(String[] args) {


        String testAction = "";



        String myPath = "/Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home/bin/java -Didea.launcher.port=7532 -Didea.launcher.bin.path=/Applications/IntelliJ IDEA CE.app/Contents/bin";
//
//        if (myPath.isEmpty()) {
//            System.out.println(true);
//        } else {
//            System.out.println(false);
//        }
//
//
//        // inline if condition
//        boolean empty = testAction.isEmpty() ? true : false;
//
//        System.out.println("Empty status is : " + empty);
//
//
//        System.out.println("Lenght is : " + myPath.length());
//
        System.out.println(StringUtils.join(myPath,
                "dsafasd",
                "onemorestring",
                myPath));


        System.out.println(StringUtils.indexOf(myPath, "java"));
        System.out.println(        StringUtils.countMatches(myPath, "java"));

        int firstOccurance = StringUtils.indexOf(myPath, "java");
        int lastOccurance =(StringUtils.lastIndexOf(myPath, "java"));

        if(firstOccurance == lastOccurance) {
            System.out.println("Only one occurance");
        } else {
            System.out.println("More than one occurance of string ");
        }



        // Comparision
        String one = "Madhu";
        String two = "madhu";
        String three = "";
        String four = null;

        System.out.println(one.equals(two) );
        System.out.println(one.equalsIgnoreCase(two) );
        System.out.println(myPath.substring(5, 15));
        System.out.println(StringUtils.substring(myPath, 5, 15));

        System.out.println(StringUtils.equals(three, four));
        System.out.println(four.substring(3));


    }


    // concatenation
    // split
    // substring
    // start-substring
    // end-substring
    // trim
    // length
    // specific substring with special char
    // subsitutuion - replace
    // replace all
    // replace first
    // replace - specific occurance with another string


}
