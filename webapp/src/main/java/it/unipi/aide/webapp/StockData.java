package it.unipi.aide.webapp;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class StockData {
    private final String date;
    private final double open;
    private final double high;
    private final double low;
    private final double close;

    private static String DATABASE_URL="http://10.2.1.73:8080/database/stock-api?date=1&ticker=";

    public StockData(String date, double open, double high, double low, double close) {
        this.date = date;
        this.open = open;
        this.high = high;
        this.low = low;
        this.close = close;
    }


    public static List<StockData> getData(String tickerSymbol) {
        String url = DATABASE_URL+tickerSymbol;
        JSONArray datah = Util.getJSONDataFromExternalAPI(url);
        List<StockData> data = new ArrayList<>();

        for (int i = 0; i < datah.length(); i++) {
            JSONObject obj = datah.getJSONObject(i);
            String day = obj.getString("day");
            double openValue = obj.getDouble("open_value");
            double highValue = obj.getDouble("high_value");
            double lowValue = obj.getDouble("low_value");
            double closeValue = obj.getDouble("close_value");

            data.add(new StockData(day, openValue, highValue, lowValue, closeValue));
        }
        return data;
    }
}
