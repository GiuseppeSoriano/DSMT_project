package it.unipi;


import jakarta.servlet.ServletContainerInitializer;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import jakarta.websocket.*;

import java.io.IOException;
import java.net.URI;

@ClientEndpoint
@WebListener
public class WebSocketClient implements ServletContextListener {

    @OnMessage
    public void onMessage(Session session, String message) {
        System.out.println(message);
    }

    @OnError
    public void onError(Session session, Throwable error) {
        System.out.println(error.getMessage());
    }

    @OnClose
    public void onClose(Session session, CloseReason reason) {
        System.out.println("### closed ###");
    }

    @OnOpen
    public void onOpen(Session session) throws IOException {
        session.getBasicRemote().sendText("{\"type\":\"subscribe\",\"symbol\":\"AAPL\"}");
        session.getBasicRemote().sendText("{\"type\":\"subscribe\",\"symbol\":\"AMZN\"}");
        session.getBasicRemote().sendText("{\"type\":\"subscribe\",\"symbol\":\"BINANCE:BTCUSDT\"}");
        session.getBasicRemote().sendText("{\"type\":\"subscribe\",\"symbol\":\"IC MARKETS:1\"}");
    }

    public static void main(String[] args) {
        try {
            // Replace with your actual Finnhub websocket endpoint
            String endpoint = "wss://ws.finnhub.io?token=cllk8mpr01qske4rgbagcllk8mpr01qske4rgbb0";
//            ContainerProvider.getWebSocketContainer().connectToServer(WebSocketClient.class, endpoint);

            ContainerProvider.getWebSocketContainer().connectToServer(WebSocketClient.class, new URI(endpoint));

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Initization");
        try {
            String endpoint = "wss://ws.finnhub.io?token=cllk8mpr01qske4rgbagcllk8mpr01qske4rgbb0";
            ContainerProvider.getWebSocketContainer().connectToServer(WebSocketClient.class, new URI(endpoint));

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }
}