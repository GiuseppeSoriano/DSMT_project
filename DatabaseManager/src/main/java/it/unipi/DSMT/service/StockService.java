package it.unipi.DSMT.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import it.unipi.DSMT.model.StockData;
import it.unipi.DSMT.dao.redis.StockDAO;
import redis.clients.jedis.resps.Tuple;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.*;

import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

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

    public String getDailyStockHistory(String ticker, Long timestamp) throws JsonProcessingException {
        List<Tuple> resultsWithScores = stockDAO.getStockHistory(ticker, timestamp);
        // Map to store daily values
        Map<String, List<Double>> dailyValues = new TreeMap<>();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd").withZone(ZoneId.systemDefault());

        for (Tuple tuple : resultsWithScores) {
            String[] parts = tuple.getElement().split(":");
            double price = Double.parseDouble(parts[0]);
            long score = (long) tuple.getScore();

            // Convert timestamp to readable date
            String day = formatter.format(Instant.ofEpochSecond(score));

            dailyValues.putIfAbsent(day, new ArrayList<>());
            dailyValues.get(day).add(price);
        }

        List<Map<String, Object>> dailyStats = new ArrayList<>();

        for (Map.Entry<String, List<Double>> entry : dailyValues.entrySet()) {
            Map<String, Object> dayMap = new LinkedHashMap<>();
            List<Double> prices = entry.getValue();

            // Compute daily statistics
            double open = prices.get(0);
            double low = prices.stream().min(Double::compare).get();
            double high = prices.stream().max(Double::compare).get();
            double close = prices.get(prices.size() - 1);

            dayMap.put("day", entry.getKey());
            dayMap.put("open_value", open);
            dayMap.put("low_value", low);
            dayMap.put("high_value", high);
            dayMap.put("close_value", close);

            dailyStats.add(dayMap);
        }

        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.writeValueAsString(dailyStats);
    }

    public void saveStockData(StockData data) {
        // Store data in Redis
        stockDAO.saveStockData(data);
    }
}
