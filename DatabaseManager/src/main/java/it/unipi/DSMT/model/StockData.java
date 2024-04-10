package it.unipi.DSMT.model;

import java.util.Date;

public class StockData {
    private String ticker;
    private Double price;
    private Long timestamp;

    public StockData(String ticker, Double price, Long timestamp) {
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

    public Long getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Long timestamp) {
        this.timestamp = timestamp;
    }
}
