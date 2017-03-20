package collectionExamples;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by kandukurim on 08/03/2017.
 */
public class ArrayListExample {


    public static void main(String[] args) {

// Creating a variable - an instance of arraylist
        List<String> allName = new ArrayList<String>();
        List<String> fewNames = new ArrayList<String>();

        fewNames.add("One");
        fewNames.add("Two");


        // adding value to the arraylist
        allName.add("Madhu");
        allName.add("K");

        System.out.println(allName);

        // get the size of the list
        allName.size();

        // add a value at a specific location
        allName.add(1, "Mounika");
        allName.add(3, "mounika");

        System.out.println(allName);

        allName.remove(2); // remove with help of index
        allName.remove("mounika"); // remove with help of object
        System.out.println(allName);

        allName.addAll(fewNames);
        System.out.println(allName);
        allName.add(3, "extraString");
        System.out.println(allName);
        System.out.println(allName.containsAll(fewNames));


        // print all values

        for (String entry : allName) {
            System.out.println(entry);
        }


    }

    // multiple data items on a list


}
