package it.unipi;

import jakarta.ejb.*;

import java.util.logging.Logger;

@Startup
@Singleton
public class StockEchangeProducer {
    private static final Logger LOGGER = Logger.getLogger(StockEchangeProducer.class.getName());


    @Schedule(hour = "*", minute = "*", second = "*/5", info = "Every 5 seconds timer")
    public void automaticallyScheduled(Timer timer) {

        double price = generateStockData();
       LOGGER.info(String.format("%s: %.2f", "AAPL", price));
    }

    private static double generateStockData() {
        String symbol = "AAPL";
        double basePrice = 150.0;
        double fluctuationRange = 5.0;

        double randomFluctuation = Math.random() * fluctuationRange * 2 - fluctuationRange;
        double currentPrice = basePrice + randomFluctuation;
        return currentPrice;

    }
}