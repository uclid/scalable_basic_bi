package dataanalytics

import Libs.Formatting
import R.LinearRegression
import R.DecisionTree
import MongoDB.TryMongoDB
import java.text.SimpleDateFormat

class IndexController {

    def index() {
    }

    def login(){
        if(TryMongoDB.authenticate(params.username, params.password)){
            session["user"] = params.username;
            redirect(action: 'dashboard');
        }
        else{
            flash.message = "Login Failed";
            redirect(action: 'index');
        }
    }

    def regression(){
        if(session["user"] != null){
            flash.message = session["user"];
        }
        else{
            redirect(action: 'index');
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = sdf.parse(params.time);
        //date of first item on website
        Date first = sdf.parse("2014-03-01")
        int x = date - first
        double reg = LinearRegression.test(x, params.forecast_type)
        String result = "" + reg
        if(params.forecast_type == "amount"){
            result = result + " items to be sold till this date";
        }
        else{
            result = result + " will be earned (in NRs.) till this date";
        }
        render(view: "prediction",  model: [result:result])
    }

    def decision(){
        if(session["user"] != null){
            flash.message = session["user"];
        }
        else{
            redirect(action: 'index');
        }

        int price = Integer.parseInt(params.price);
        String shipping = params.ship_type;
        int ship = (shipping == "flat") ? 1 : 2;
        int disc = Integer.parseInt(params.discount);
        int qty = Integer.parseInt(params.sales);
        String val = DecisionTree.test(price, ship, disc, qty);
        String result = Formatting.Interpret(val);
        render(view: "prediction",  model: [decision:result])
    }

    def update(){
        if(params.newpass == params.cnewpass) {
            if (TryMongoDB.authenticate(session["user"], params.oldpass)) {
                TryMongoDB.Update(params.newpass);
                session.invalidate()
                flash.message = "Password changed successfully, login again";
                redirect(action: "index")
            }
            else{
                flash.message = session["user"];
                render(view: "account",  model: [message:"Incorrect old password!"])
            }
        }
        else{
            flash.message = session["user"];
            render(view: "account",  model: [message:"Password confirmation mismatch!"])
        }
    }

    def dashboard(){
        if(session["user"] != null){
            flash.message = session["user"];
        }
        else {
            redirect(action: 'index');
        }
        int[] results = TryMongoDB.testMongo();
        int totSales = results[3]/1000;
        int[] orderSold = TryMongoDB.SalesOrders();
        String[][] topItems = TryMongoDB.TopProds();
        [
                webVisitors: results[0],
                orders: results[1],
                itemsInStock: results[2],
                totalSales: totSales,
                galleryItems: results[4],
                visibleItems: results[5],
                activeDiscounts: results[6],
                searches: results[7],
                backendUsers: results[8],
                itemsViewed: results[9],
                compared: results[10],
                wishlist: results[11],
                g: orderSold,
                top: topItems
        ]
    }
    def charts(){
        if(session["user"] != null){
            flash.message = session["user"];
        }
        else{
            redirect(action: 'index');
        }
        int[] compWish = TryMongoDB.CompWish();
        int[] orderSold = TryMongoDB.SalesOrders();
        String[][] topItems = TryMongoDB.TopProds();
        [
                g: compWish,
                h: orderSold,
                top: topItems
        ]
    }
    def account(){
        if(session["user"] != null){
            flash.message = session["user"];
        }
        else{
            redirect(action: 'index');
        }
    }
    def prediction(){
        if(session["user"] != null){
            flash.message = session["user"];
        }
        else{
            redirect(action: 'index');
        }
    }

    def guidely(){
        if(session["user"] != null){
            flash.message = session["user"];
        }
        else{
            redirect(action: 'index');
        }
    }

    def summary(){
        if(session["user"] != null){
            flash.message = session["user"];
        }
        else{
            redirect(action: 'index');
        }
        int[] visViews = TryMongoDB.Summary();
        [
                g:  visViews
        ]

    }

    def logout(){
        session.invalidate()
        redirect(action: "index")
    }
}
