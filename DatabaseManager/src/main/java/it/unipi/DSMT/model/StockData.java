package it.unipi.DSMT.model;

import java.util.Date;

public class StockData {
    private String ticker;
    private Double price;
    private Date timestamp;

    public StockData(String ticker, Double price, Date timestamp) {
        this.ticker = ticker;
        this.price = price;
        this.timestamp = timestamp;
    }

    public String getTicker() {
        return ticker;
    }

    public void setTicker(String ticker) {
        this.ticker = ticker;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }
}
