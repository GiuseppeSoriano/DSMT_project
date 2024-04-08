package it.unipi.DSMT.service;

import it.unipi.DSMT.model.StockData;
import it.unipi.DSMT.dao.redis.StockDAO;

import java.util.Date;

public class StockService {
    private final StockDAO stockDAO;

    public StockService() {
        this.stockDAO = new StockDAO();
    }

    public String getStockHistory(String ticker, Date dateString){
        return stockDAO.getStockHistory(ticker, dateString);
    }

    public void saveStockData(StockData data) {
        // Salva i dati nel database o in un altro sistema di memorizzazione
        stockDAO.saveStockData(data);
    }
}
