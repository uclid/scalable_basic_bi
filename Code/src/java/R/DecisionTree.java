package R;

import MongoDB.TryMongoDB;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;

/**
 * Created by uclid on 7/1/2015.
 */
public class DecisionTree {
    public static String test(int price, int ship, int disc, int qty) throws Exception {
        // create a script engine manager:
        ScriptEngineManager manager = new ScriptEngineManager();
        // create a Renjin engine:
        ScriptEngine engine = manager.getEngineByName("Renjin");
        // check if the engine has loaded correctly:
        if(engine == null) {
            throw new RuntimeException("Renjin Script Engine not found on the classpath.");
        }
        // ... evaluation Java code here ...
        System.out.println();

        String[][] facts = TryMongoDB.DecTree();
        double[] results = new double[5];

        String pr = "(" + facts[0][0];
        String sh = "(" + facts[0][1];
        String di = "(" + facts[0][2];
        String qt = "(" + facts[0][3];
        String tr = "(" + facts[0][4];
        for(int i = 1; i < 83; i++){
            pr = pr + "," + facts[i][0];
            sh = sh + "," + facts[i][1];
            di = di + "," + facts[i][2];
            qt = qt + "," + facts[i][3];
            tr = tr + "," + facts[i][4];
        }
        pr = pr + ")";
        sh = sh + ")";
        di = di + ")";
        qt = qt + ")";
        tr = tr + ")";
        engine.eval ("price <- c" + pr);
        engine.eval ("ship <- c" + sh);
        engine.eval ("disc <- c" + di);
        engine.eval ("qty <- c" + qt);
        // processing 1, confirmed 2, cancelled 3
        engine.eval ("trans <- c" + tr);
        engine.eval ("data <- data.frame( 'Price' = price, 'Shipping' = ship,'Discount' = disc, 'Quantity' = qty,'Transaction' = trans)");
        //engine.eval("class = ifelse(data$Transaction > 1,(ifelse(data$Transaction > 2,\"Cancelled\",\"Confirmed\")),\"Processing\")");
        //engine.eval("data <- data.frame(data,'Class' = class)");
        //engine.eval ("tree.data = tree(Class~.-Transaction,data)");
        engine.eval ("reg <- lm(trans ~ price + ship + disc + qty , data)");

        String result2 =engine.eval("summary(reg)$coefficients[1, 1]\n").toString();
        String result3 =engine.eval("summary(reg)$coefficients[2, 1]\n").toString();
        String result4 =engine.eval("summary(reg)$coefficients[3, 1]\n").toString();
        String result5 =engine.eval("summary(reg)$coefficients[4, 1]\n").toString();
        String result6 =engine.eval("summary(reg)$coefficients[5, 1]\n").toString();
        results[0] = Double.parseDouble(result2); //intercept
        results[1] = Double.parseDouble(result3); //price
        results[2] = Double.parseDouble(result4); //ship
        results[3] = Double.parseDouble(result5); //disc
        results[4] = Double.parseDouble(result6); //qty

        double value = results[1] * price + results[2] * ship + results[3] * disc + results[4] * qty + results[0];
        return String.valueOf(value);
    }
}
