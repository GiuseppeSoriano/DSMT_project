package it.unipi.DSMT.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import it.unipi.DSMT.model.StockData;
import it.unipi.DSMT.dao.redis.StockDAO;
import redis.clients.jedis.resps.Tuple;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.*;

public class StockService {
    private final StockDAO stockDAO;

    public StockService() {
        this.stockDAO = new StockDAO();
    }

    public String getStockHistory(String ticker, Long timestamp) throws JsonProcessingException {
        List<Tuple> resultsWithScores =  stockDAO.getStockHistory(ticker, timestamp);

        List<Map<String, String>> dataList = new ArrayList<>();

        for (Tuple tuple : resultsWithScores) {
            Map<String, String> dataMap = new LinkedHashMap<>();

            String[] parts = tuple.getElement().split(":");
            String price = parts[0];

            dataMap.put(String.valueOf((long)tuple.getScore()), price);
            dataList.add(dataMap);
        }

        ObjectMapper objectMapper = new ObjectMapper();

        return objectMapper.writeValueAsString(dataList);
    }

    public void saveStockData(StockData data) {
        // Salva i dati nel database o in un altro sistema di memorizzazione
        stockDAO.saveStockData(data);
    }
}
