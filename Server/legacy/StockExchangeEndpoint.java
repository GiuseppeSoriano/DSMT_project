package it.unipi;

import jakarta.ejb.Schedule;
import jakarta.json.Json;
import jakarta.json.JsonObject;
import jakarta.websocket.*;
import jakarta.websocket.server.ServerEndpoint;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.ThreadLocalRandom;

@ServerEndpoint(value = "/stocks", decoders = {JSONTextDecoder.class},
        encoders = {JSONTextEncoder.class})
public class StockExchangeEndpoint {

    private static final Set<Session> sessions = new HashSet<>();

    public static void broadcastMessage(JsonObject message) {
        for (Session session : sessions) {
            try {
                session.getBasicRemote().sendObject(message);
            } catch (IOException | EncodeException e) {
                e.printStackTrace();
            }
        }
    }

    @OnOpen
    public void onOpen(Session session) {
        System.out.println("WebSocket opened: " + session.getId());
        sessions.add(session);
    }

    @OnMessage
    public void onMessage(JsonObject message, Session session) {
        System.out.println("Stock information received: " + message + " from " + session.getId());
        try {
            session.getBasicRemote().sendObject(message);
        } catch (IOException | EncodeException e) {
            e.printStackTrace();
        }
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        System.out.println("WebSocket error for " + session.getId() + " " + throwable.getMessage());
    }

    @OnClose
    public void onClose(Session session, CloseReason closeReason) {
        System.out.println("WebSocket closed for " + session.getId()
                + " with reason " + closeReason.getCloseCode());
        sessions.remove(session);
    }

    @Schedule(second = "*/5", minute = "*", hour = "*", persistent = false)
    public void sendNewStockExchangeInformation() {
        JsonObject stockInformation = Json.createObjectBuilder()
                .add("stock", "DKE-42")
                .add("price", new BigDecimal(ThreadLocalRandom.current()
                        .nextDouble(250.00))
                        .setScale(2, RoundingMode.DOWN))
                .build();
        System.out.println(new BigDecimal(ThreadLocalRandom.current()
                .nextDouble(250.00))
                .setScale(2, RoundingMode.DOWN));

        StockExchangeEndpoint.broadcastMessage(stockInformation);
    }
}