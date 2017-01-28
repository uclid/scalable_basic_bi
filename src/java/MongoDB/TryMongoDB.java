package MongoDB;

/**
 * Created by uclid on 7/1/2015.
 */

import java.util.ArrayList;
import java.util.List;

import Libs.Formatting;
import org.json.*;

import com.mongodb.*;

import static Libs.Formatting.GetShip;
import static Libs.Formatting.GetStatus;

public class TryMongoDB {

    //globals for database connection
    public static MongoClient mongoClient;
    public static DB db;

    //start connection to the database
    public static void connect() throws Exception{
        mongoClient = new MongoClient("localhost" , 27017);
        db = mongoClient.getDB("local");
    }

    //for authenticating a user
    public static boolean authenticate(String user, String pass) throws Exception{
        connect();
        Boolean result = false;
        DBObject cred = db.getCollection("users").findOne();
        String users = cred.toString();
        JSONObject items = new JSONObject(users);
        String username = items.getString("user");
        String password = items.getString("password");
        if((user.equals(username)) && (pass.equals(password))){
            result = true;
        }
        mongoClient.close();
        return result;
    }

    //stats for dashboard
    public static int[] testMongo() throws Exception {
        connect();
        int[] results = new int[12];

        //Sales and Visits
        results[0] = (int) db.getCollection("log_visitor").getCount();  //webVisitors
        //orders
        BasicDBObject orQuery = new BasicDBObject();

        List<BasicDBObject> obj = new ArrayList<BasicDBObject>();
        obj.add(new BasicDBObject("state", "new"));
        obj.add(new BasicDBObject("state", "pending_payment"));
        orQuery.put("$or", obj);

        DBCursor cursor1 = db.getCollection("sales_flat_order").find(orQuery);
        results[1] = (int)db.getCollection("sales_flat_order").getCount();

        cursor1.close();


        //items in stock
        DBObject stockItems = new BasicDBObject("$group", new BasicDBObject("_id", "$qty")
                .append("count", new BasicDBObject("$sum", 1)));
        AggregationOutput output = db.getCollection("cataloginventory_stock_item").aggregate(stockItems);

        JSONObject items;
        int count = 0;
        int qty = 0;
        int counter = 0;
        for (DBObject result : output.results()) {
            items = new JSONObject(result.toString());
            count = items.getInt("count");
            qty = (int)items.getDouble("_id");
            counter = counter + (count*qty);
            //System.out.println(result);
        }
        results[2] = counter;

        //total sales worth
        int total = 0;
        DBObject salesWorth = new BasicDBObject("$group", new BasicDBObject("_id", "$state")
                .append("total", new BasicDBObject("$sum", "$base_grand_total")));
        AggregationOutput output1 = db.getCollection("sales_flat_order").aggregate(salesWorth);
        for (DBObject result : output1.results()) {
            items = new JSONObject(result.toString());
            total = items.getInt("total"); //total comes at last
        }
        results[3] = total;

        //Quick Stats

        results[4] = (int) db.getCollection("catalog_product_entity_media_gallery").getCount();  //items in gallery

        //visible items
        BasicDBObject whereQuery = new BasicDBObject();
        whereQuery.put("is_visible_on_front", 1);

        DBCursor cursor3 = db.getCollection("catalog_eav_attribute").find(whereQuery);
        results[5] = cursor3.count();

        cursor3.close();

        //active discounts
        BasicDBObject discQuery = new BasicDBObject();
        discQuery.put("is_active", 1);
        DBCursor cursor4 = db.getCollection("catalogrule").find(discQuery);

        results[6] = cursor4.count();  //active discounts
        cursor4.close();

        results[7] = (int) db.getCollection("catalogsearch_query").getCount();  //searches
        results[8] = (int) db.getCollection("customer_entity").getCount();  //backend users
        List l1 = db.getCollection("report_viewed_product_index").distinct("product_id");  //most viewed products
        results[9] = l1.size();
        List l2 = db.getCollection("report_compared_product_index").distinct("product_id"); //most compared products
        results[10] = l2.size();
        results[11] = (int) db.getCollection("wishlist_item").getCount();    //wishlist
        mongoClient.close();
        return results;
    }

    //sales and order information
    public static int[] SalesOrders() throws Exception{
        connect();

        //orders
        int[] monthlyRes = new int[]{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
        BasicDBObject ordersQuery = new BasicDBObject("$group",new BasicDBObject("_id", new BasicDBObject("$month","$created_at")).append("count",new BasicDBObject("$sum",1)));
        AggregationOutput orders = db.getCollection("sales_flat_order").aggregate(ordersQuery);
        JSONObject items;
        int id;
        int count;
        for (DBObject result : orders.results()) {
            items = new JSONObject(result.toString());
            id = items.getInt("_id");
            count = items.getInt("count");
            monthlyRes[id-1] = count;
        }

        //sales
        DBObject project = new BasicDBObject("$project", new BasicDBObject("state", 1)
                .append("created_at", 1));
        DBObject match = new BasicDBObject("$match", new BasicDBObject("state", "new"));
        DBObject group = new BasicDBObject("$group", new BasicDBObject("_id", new BasicDBObject("$month", "$created_at"))
                .append("count", new BasicDBObject("$sum", 1)));

        AggregationOutput sales = db.getCollection("sales_flat_order").aggregate(project, match, group);
        for (DBObject result : sales.results()) {
            items = new JSONObject(result.toString());
            id = items.getInt("_id");
            count = items.getInt("count");
            monthlyRes[12 + id-1] = count;
        }

        mongoClient.close();
        return monthlyRes;
    }

    //stats for summary page
    public static int[] Summary() throws Exception{
        connect();

        int[] monthlyRes = new int[]{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
        //visitors
        BasicDBObject visitorQuery = new BasicDBObject("$group",new BasicDBObject("_id", new BasicDBObject("$month","$first_visit_at")).append("count",new BasicDBObject("$sum",1)));
        AggregationOutput visitor = db.getCollection("log_visitor").aggregate(visitorQuery);
        JSONObject items;
        int id;
        int count;
        for (DBObject result : visitor.results()) {
            items = new JSONObject(result.toString());
            id = items.getInt("_id");
            count = items.getInt("count");
            monthlyRes[36] = monthlyRes[36]+count;
            monthlyRes[id-1] = count;

        }

        //views
        BasicDBObject viewQuery = new BasicDBObject("$group",new BasicDBObject("_id", new BasicDBObject("$month","$added_at")).append("count",new BasicDBObject("$sum",1)));
        AggregationOutput views = db.getCollection("report_viewed_product_index").aggregate(viewQuery);
        for (DBObject result : views.results()) {
            items = new JSONObject(result.toString());
            id = items.getInt("_id");
            count = items.getInt("count");
            monthlyRes[37] = monthlyRes[37]+count;
            monthlyRes[12+id-1] = count;
        }

        //orders
        BasicDBObject ordersQuery = new BasicDBObject("$group",new BasicDBObject("_id", new BasicDBObject("$month","$created_at")).append("count",new BasicDBObject("$sum",1)));
        AggregationOutput orders = db.getCollection("sales_flat_order").aggregate(ordersQuery);
        for (DBObject result : orders.results()) {
            items = new JSONObject(result.toString());
            id = items.getInt("_id");
            count = items.getInt("count");
            monthlyRes[38] = monthlyRes[38]+count;
            monthlyRes[24+id-1] = count;
        }

        mongoClient.close();
        return monthlyRes;
    }

    //compared and wishlist items
    public static int[] CompWish() throws Exception{
        connect();

        int[] monthlyRes = new int[]{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

        //compared items
        BasicDBObject compItemsQuery = new BasicDBObject("$group",new BasicDBObject("_id", new BasicDBObject("$month","$added_at")).append("count",new BasicDBObject("$sum",1)));
        AggregationOutput compared = db.getCollection("report_compared_product_index").aggregate(compItemsQuery);
        JSONObject items;
        int id;
        int count;
        for (DBObject result : compared.results()) {
            items = new JSONObject(result.toString());
            id = items.getInt("_id");
            count = items.getInt("count");
            monthlyRes[id-1] = count;
        }

        //wishlist
        BasicDBObject wishItemsQuery = new BasicDBObject("$group",new BasicDBObject("_id", new BasicDBObject
                ("$month","$added_at")).append("count",new BasicDBObject("$sum",1)));
        AggregationOutput wished = db.getCollection("wishlist_item").aggregate(wishItemsQuery);
        for (DBObject result : wished.results()) {
            items = new JSONObject(result.toString());
            id = items.getInt("_id");
            count = items.getInt("count");
            monthlyRes[12 + id-1] = count;
        }

        mongoClient.close();
        return monthlyRes;
    }

    //updating the password for an account
    public static void Update(String pwd) throws Exception {
        connect();

        BasicDBObject newDocument = new BasicDBObject();
        newDocument.append("$set", new BasicDBObject().append("password", pwd));

        BasicDBObject searchQuery = new BasicDBObject().append("user", "Uclid");
        db.getCollection("users").update(searchQuery, newDocument);

        mongoClient.close();
    }

    //finding statistics for top products sold
    public static String[][] TopProds() throws Exception {

        connect();

        String[][] products = new String[7][2];
        //Most Sold Products
        ArrayList<DBObject> aggList = new ArrayList<DBObject>();
        DBObject project = new BasicDBObject("$project", new BasicDBObject("value", 1));
        DBObject group = new BasicDBObject("$group", new BasicDBObject("_id", "$value")
                .append("count", new BasicDBObject("$sum", 1)));
        DBObject sort = new BasicDBObject("$sort", new BasicDBObject("count", -1));
        DBObject limit = new BasicDBObject("$limit", 7);
        aggList.add(project);
        aggList.add(group);
        aggList.add(sort);
        aggList.add(limit);

        JSONObject items;
        String id;
        int count;
        int index = 0;
        AggregationOutput sales = db.getCollection("catalog_product_entity_varchar").aggregate(aggList);
        for (DBObject result : sales.results()) {
            items = new JSONObject(result.toString());
            id = Formatting.GetName(items.optString("_id"));
            count = items.getInt("count");
            products[index][0] = id;
            products[index][1] = String.valueOf(count);
            index++;
        }

        mongoClient.close();
        return products;
    }

    //for amount of sales, i.e. number of items
    public static String[][] AmtReg() throws Exception {
        connect();

        String[][] qty = new String[83][2];
        //total_qty_ordered
        DBObject qtyOrder = new BasicDBObject("$project", new BasicDBObject("total_qty_ordered", 1).append("created_at", 1).append("_id", 0));

        JSONObject items;
        int count = 0;
        int cumulative = 0;
        AggregationOutput sales = db.getCollection("sales_flat_order").aggregate(qtyOrder);
        for (DBObject result : sales.results()) {
            items = new JSONObject(result.toString());
            cumulative = cumulative + items.getInt("total_qty_ordered");
            qty[count][0] = String.valueOf(cumulative);
            qty[count][1] = Formatting.ParseDate(String.valueOf(items.optString("created_at")));
            count++;
        }

        mongoClient.close();
        return qty;
    }

    //for value of sales, i.e. total money collected
    public static String[][] ValReg() throws Exception {
        connect();

        String[][] amt = new String[83][2];
        //grand_total here
        DBObject grandTot = new BasicDBObject("$project", new BasicDBObject("grand_total", 1).append("created_at", 1).append("_id", 0));

        JSONObject items;
        int count = 0;
        int cumulative = 0;
        AggregationOutput total = db.getCollection("sales_flat_order").aggregate(grandTot);
        for (DBObject result : total.results()) {
            items = new JSONObject(result.toString());
            cumulative = cumulative + items.getInt("grand_total");
            amt[count][0] = String.valueOf(cumulative);
            amt[count][1] = Formatting.ParseDate(String.valueOf(items.optString("created_at")));
            count++;
        }

        mongoClient.close();
        return amt;
    }

    //for reading raw values to create decision tree
    public static String[][] DecTree() throws Exception {
        connect();

        String[][] facts = new String[83][5];
        //for decision tree
        DBObject decision = new BasicDBObject("$project", new BasicDBObject("grand_total", 1).append("status", 1).append("shipping_description", 1).append("discount_amount", 1).append("total_qty_ordered", 1).append("_id", 0));

        JSONObject items;
        int count = 0;
        AggregationOutput dec = db.getCollection("sales_flat_order").aggregate(decision);
        for (DBObject result : dec.results()) {
            items = new JSONObject(result.toString());

            facts[count][0] = String.valueOf(items.getInt("grand_total"));
            facts[count][1] = GetShip(String.valueOf(items.optString("shipping_description")));
            facts[count][2] = String.valueOf(Math.abs(items.getInt("discount_amount")));
            facts[count][3] = String.valueOf(items.getInt("total_qty_ordered"));
            facts[count][4] = GetStatus(String.valueOf(items.optString("status")));
            count++;
        }

        mongoClient.close();
        return facts;
    }

}