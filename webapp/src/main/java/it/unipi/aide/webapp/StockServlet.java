package it.unipi.aide.webapp;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "stockServlet", value = "/stock-details")
public class StockServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/stock-details.jsp");
        dispatcher.forward(request, response);
    }
}