package Libs;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

/**
 * Created by user on 8/14/2015.
 */
public class Formatting {

    // for mapping names of the products to actual names
    public static String GetName(String name) throws Exception{
        String newname = "";
        if(name.equals("2")){
            newname = "Kaspersky Internet Security";
        }
        else if(name.equals("4")){
            newname = "Brother Laser Printer";
        }
        else if(name.equals("container2")){
            newname = "Prestigio 4.5 inch Mobile";
        }
        else if(name.equals("JP")){
            newname = "Totolink Wireless Router";
        }
        else if(name.equals("China")){
            newname = "Baleyo Projector Screen";
        }
        else{
            newname = "Brother 3 in 1";
        }
        return newname;
    }

    //return the date in terms of number of days
    public static String ParseDate(String input) throws Exception{
        input = input.substring(10, input.indexOf("T"));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = sdf.parse(input);
        Date first = sdf.parse("2014-03-01");
        long diff = date.getTime() - first.getTime();
        diff = TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
        return String.valueOf(diff);
    }

    // for mapping names of the shipping to numeric codes
    public static String GetShip(String name) throws Exception{
        String newname = "";
        //flat = 1, free = 2
        if(name.equals("Flat Rate - Fixed")){
            newname = "1";
        }
        else{
            newname = "2";
        }
        return newname;
    }

    // for mapping names of the status to numeric codes
    public static String GetStatus(String name) throws Exception{
        String newname = "";
        // processing 1, confirmed 2, cancelled 3
        if(name.equals("processing")){
            newname = "1";
        }
        else if(name.equals("canceled")){
            newname = "3";
        }
        else{
            newname = "2";
        }
        return newname;
    }

    //for interpreting the result of decision (regression) tree
    public static String Interpret(String value) throws Exception{
        String newname = "";
        double val = Double.parseDouble(value);
        // symmetrical assumption 1-1.5 confirmed, 1.5-2.5 pending, and above 2.5 cancelled
        if(val > 1 && val < 1.5){
            newname = "Order " + (int)((2 - val)* 100) + "% likely to be confirmed";
        }
        else if(val > 1.5 && val < 2.5){
            newname = "Order " + (int)((2.5 - val)* 100) + "% likely to be pending";;
        }
        else{
            newname = "Order " + (int)((3 - val)* 100) + "% likely to be cancelled";
        }
        return newname;
    }
}
