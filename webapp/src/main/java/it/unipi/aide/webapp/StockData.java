package it.unipi.aide.webapp;

import java.util.ArrayList;
import java.util.List;

public class StockData {
    private final String date;
    private final double open;
    private final double high;
    private final double low;
    private final double close;

    public StockData(String date, double open, double high, double low, double close) {
        this.date = date;
        this.open = open;
        this.high = high;
        this.low = low;
        this.close = close;
    }


    public static List<StockData> getData(String tickerSymbol) {
        List<StockData> data = new ArrayList<>();
        data.add(new StockData("2015-12-24", 511.53, 514.98, 505.79, 506.40));
        data.add(new StockData("2015-12-25", 512.53, 514.88, 505.69, 510.34));
        data.add(new StockData("2015-12-26", 511.83, 514.98, 505.59, 507.23));
        data.add(new StockData("2015-12-27", 511.22, 515.30, 505.49, 506.47));
        data.add(new StockData("2015-12-28", 511.53, 514.98, 505.79, 506.40));
        data.add(new StockData("2015-12-29", 512.53, 513.88, 505.69, 510.34));
        data.add(new StockData("2015-12-30", 511.83, 512.98, 502.59, 503.23));
        data.add(new StockData("2015-12-31", 511.22, 515.30, 505.49, 506.47));
        data.add(new StockData("2016-01-01", 510.35, 515.72, 505.23, 508.80));
        return data;
    }
}
