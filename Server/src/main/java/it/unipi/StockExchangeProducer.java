package it.unipi;

import com.ericsson.otp.erlang.*;
import jakarta.ejb.Schedule;
import jakarta.ejb.Singleton;
import jakarta.ejb.Startup;

import java.util.logging.Logger;

@Startup
@Singleton
public class StockExchangeProducer {
    private static final Logger LOGGER = Logger.getLogger(StockExchangeProducer.class.getName());

    private static double generateStockData(double basePrice, double fluctuationRange) {
        double randomFluctuation = Math.random() * fluctuationRange * 2 - fluctuationRange;
        double currentPrice = basePrice + randomFluctuation;
        return currentPrice;

    }

    private static void send_data_to_erlang_node(double basePrice, String ticker) {
        double price = generateStockData(basePrice, 5);
        OtpMbox mbox = ErlangMailBox.getErlangMailBox();
//            Construct message
        OtpErlangObject[] msg = new OtpErlangObject[2];
        msg[0] = new OtpErlangAtom(ticker);
        msg[1] = new OtpErlangDouble(price);
        OtpErlangTuple tuple = new OtpErlangTuple(msg);

//            Send message
        mbox.send("message_receiver", "cowboy_bridge@fedora", tuple);
        LOGGER.info(String.format("%s: %.2f", ticker, price));
    }

    @Schedule(hour = "*", minute = "*", second = "*/1", info = "Every 1 seconds timer")
    public void generate_TSLA_stock_data() {
        send_data_to_erlang_node(175.79, "TSLA");
    }

    @Schedule(hour = "*", minute = "*", second = "*/2", info = "Every 2 seconds timer")
    public void generate_AMZN_stock_data() {
        send_data_to_erlang_node(180.38, "AMZN");
    }

    @Schedule(hour = "*", minute = "*", second = "*/3", info = "Every 3 seconds timer")
    public void generate_MSFT_stock_data() {
        send_data_to_erlang_node(420.72, "MSFT");
    }

    @Schedule(hour = "*", minute = "*", second = "*/4", info = "Every 4 seconds timer")
    public void generate_AAPL_stock_data() {
        send_data_to_erlang_node(171.48, "AAPL");
    }
}