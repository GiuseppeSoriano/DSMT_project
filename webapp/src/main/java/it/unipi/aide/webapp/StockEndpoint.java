package it.unipi.aide.webapp;

import com.google.gson.Gson;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "StockEndpoint", urlPatterns = "/api/stocks-data")
public class StockEndpoint extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<StockData> data = StockData.getData(); // Get stock data
        // Set content type to JSON
        response.setContentType("application/json");

        // Get print writer
        PrintWriter out = response.getWriter();

        // Convert data to JSON string using Gson library
        Gson gson = new Gson();
        String jsonData = gson.toJson(data);

        // Write JSON data to response
        out.println(jsonData);
        out.close();
    }
}
