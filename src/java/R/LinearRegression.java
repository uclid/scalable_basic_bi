package R;
/**
 * Created by uclid on 3/20/2015.
 */

import MongoDB.TryMongoDB;
import javax.script.*;

public class LinearRegression {

    public static long test(int val, String type) throws Exception {
        double[] results = new double[2];
        // create a script engine manager
        ScriptEngineManager manager = new ScriptEngineManager();
        // create a Renjin engine
        ScriptEngine engine = manager.getEngineByName("Renjin");
        // check if the engine has loaded correctly:
        if(engine == null) {
            throw new RuntimeException("Renjin Script Engine not found on the classpath.");
        }
        // ... evaluation Java code here ...
        String[][] facts;
        if(type.equals("amount")){
            facts = TryMongoDB.AmtReg();
        }
        else{
            facts = TryMongoDB.ValReg();
        }

        String x = "(" + facts[0][0];
        String y = "(" + facts[0][1];
        for(int i = 1; i < 83; i++){
            x = x + "," + facts[i][0];
            y = y + "," + facts[i][1];
        }
        x = x + ")";
        y = y + ")";
        engine.eval("x <- c" + x);
        engine.eval("y <- c" + y);
        engine.eval("df <- data.frame(x, y)");
        // String result2 =engine.eval("print(df)").toString();
        engine.eval("z <-(lm(x ~ y, df))");
        String result3 =engine.eval("summary(z)$coefficients[1, 1]\n").toString();
        String result4 =engine.eval("summary(z)$coefficients[2, 1]\n").toString();

        results[0] = Double.parseDouble(result3);
        results[1] = Double.parseDouble(result4);
        return ((long)((results[1] * val) + results[0]));
    }
}