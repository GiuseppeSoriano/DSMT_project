package it.unipi;

import com.ericsson.otp.erlang.*;
import jakarta.ejb.*;

import java.io.IOException;
import java.util.logging.Logger;

@Startup
@Singleton
public class StockEchangeProducer {
    private static final Logger LOGGER = Logger.getLogger(StockEchangeProducer.class.getName());


    @Schedule(hour = "*", minute = "*", second = "*/5", info = "Every 5 seconds timer")
    public void generate_TSLA_stock_data(Timer timer) {

        double price = generateStockData(175.79, 5);
        try {

            OtpNode  node = new OtpNode("javaNode", "mycookie");
            OtpMbox mbox = node.createMbox("mailbox");

//            Construct message
            OtpErlangObject[] msg = new OtpErlangObject[2];
            msg[0] = new OtpErlangAtom("TSLA");
            msg[1] = new OtpErlangDouble(price);
            OtpErlangTuple tuple = new OtpErlangTuple(msg);

//            Send message
            mbox.send("message_receiver", "cowboy_bridge@fedora", tuple);
            LOGGER.info(String.format("%s: %.2f", "TSLA", price));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    @Schedule(hour = "*", minute = "*", second = "*/5", info = "Every 5 seconds timer")
    public void generate_AMZN_stock_data(Timer timer) {

        double price = generateStockData(180.38, 5);
        try {

            OtpNode  node = new OtpNode("javaNode", "mycookie");
            OtpMbox mbox = node.createMbox("mailbox");

//            Construct message
            OtpErlangObject[] msg = new OtpErlangObject[2];
            msg[0] = new OtpErlangAtom("AMZN");
            msg[1] = new OtpErlangDouble(price);
            OtpErlangTuple tuple = new OtpErlangTuple(msg);

//            Send message
            mbox.send("message_receiver", "cowboy_bridge@fedora", tuple);
            LOGGER.info(String.format("%s: %.2f", "AMZN", price));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    @Schedule(hour = "*", minute = "*", second = "*/5", info = "Every 5 seconds timer")
    public void generate_MSFT_stock_data(Timer timer) {

        double price = generateStockData(420.72, 5);
        try {

            OtpNode  node = new OtpNode("javaNode", "mycookie");
            OtpMbox mbox = node.createMbox("mailbox");

//            Construct message
            OtpErlangObject[] msg = new OtpErlangObject[2];
            msg[0] = new OtpErlangAtom("MSFT");
            msg[1] = new OtpErlangDouble(price);
            OtpErlangTuple tuple = new OtpErlangTuple(msg);

//            Send message
            mbox.send("message_receiver", "cowboy_bridge@fedora", tuple);
            LOGGER.info(String.format("%s: %.2f", "MSFT", price));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    @Schedule(hour = "*", minute = "*", second = "*/5", info = "Every 5 seconds timer")
    public void generate_AAPL_stock_data(Timer timer) {

        double price = generateStockData(171.48, 5);
        try {

            OtpNode  node = new OtpNode("javaNode", "mycookie");
            OtpMbox mbox = node.createMbox("mailbox");

//            Construct message
            OtpErlangObject[] msg = new OtpErlangObject[2];
            msg[0] = new OtpErlangAtom("AAPL");
            msg[1] = new OtpErlangDouble(price);
            OtpErlangTuple tuple = new OtpErlangTuple(msg);

//            Send message
            mbox.send("message_receiver", "cowboy_bridge@fedora", tuple);
            LOGGER.info(String.format("%s: %.2f", "AAPL", price));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }


    private static double generateStockData(double basePrice,  double fluctuationRange) {
        double randomFluctuation = Math.random() * fluctuationRange * 2 - fluctuationRange;
        double currentPrice = basePrice + randomFluctuation;
        return currentPrice;

    }
}