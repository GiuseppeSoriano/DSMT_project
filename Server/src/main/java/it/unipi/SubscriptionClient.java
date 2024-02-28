package it.unipi;
/*
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
*/
import java.io.IOException;
import java.net.URI;
import java.net.http.*;

import java.lang.String;

public class SubscriptionClient {

    public static void main(String[] args) {

        try {
            HttpClient client = HttpClient.newHttpClient();

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create("http://172.27.187.216:8080/unsubscribe"))
                    .GET()
                    .build();

            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            // Stampa il corpo della risposta
            System.out.println(response.body());
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
/*
public static void main(String[] args) {
    CloseableHttpClient httpClient = HttpClients.createDefault();
    HttpGet request = new HttpGet("http://172.27.187.216:8080/");

    try {
        HttpResponse response = httpClient.execute(request);
        // Gestisci la risposta
    } catch (IOException e) {
        e.printStackTrace();
    } finally {
        try {
            httpClient.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}*/
}

