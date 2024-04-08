package it.unipi.DSMT.controller;

import com.google.gson.Gson;
import it.unipi.DSMT.model.StockData;
import it.unipi.DSMT.service.StockService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "StockController", value = "/stock-api")
public class StockController extends HttpServlet {
    private static final Logger logger = LoggerFactory.getLogger(StockController.class);
    private final StockService stockService;

    public StockController() {
        this.stockService = new StockService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ticker = request.getParameter("ticker");
        String dateString = request.getParameter("date");

        logger.info("GET request for ticker: " + ticker + " and date: " + dateString);

        if (ticker == null || dateString == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\": \"No ticker or time interval\"}");
            return;
        }

        try {
            Date timestamp = parseDate(dateString);
            String stockHistory = stockService.getStockHistory(ticker, timestamp);
            response.setContentType("application/json");
            response.getWriter().write(stockHistory);
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Error in loading historic data\"}");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        StockData data = parseRequest(request.getReader());

        if (data != null) {
            logger.info("POST request with data: " + data.getTicker() + " " + data.getPrice() + " " + data.getTimestamp());
        } else {
            logger.error("Error parsing the request");
        }

        if (data == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\": \"Wrong data format\"}");
            return;
        }

        try {
            stockService.saveStockData(data);
            response.setStatus(HttpServletResponse.SC_CREATED);
            response.getWriter().write("{\"message\": \"Data correctly saved\"}");
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Error in savig data\"}");
        }
    }

    private StockData parseRequest(BufferedReader reader) {
        Gson gson = new Gson();

        try {
            String requestBody = reader.lines().reduce("", (accumulator, actual) -> accumulator + actual);

            return gson.fromJson(requestBody, StockData.class);
        } catch (Exception e) {
            logger.error("Error parsing the request", e);

            return null;
        }
    }

    private Date parseDate(String dateString) {
        return new Date(Long.getLong(dateString));
    }
}
