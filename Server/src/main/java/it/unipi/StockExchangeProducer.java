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

//    private static final String ERLANG_NODE="cowboy_bridge@192.168.1.6";
    private static final String ERLANG_NODE = "cowboy_bridge@fedora";

    private static double generateStockData(double basePrice, double fluctuationRange) {
        double randomFluctuation = Math.random() * fluctuationRange * 2 - fluctuationRange;
        double currentPrice = basePrice + randomFluctuation;
        return currentPrice;
    }

    private static void send_data_to_erlang_node(double basePrice, String ticker, int fluctuationRange) {
        double price = generateStockData(basePrice, fluctuationRange);
        OtpMbox mbox = ErlangMailBox.getErlangMailBox();
        // Construct message
        OtpErlangObject[] msg = new OtpErlangObject[3];
        msg[0] = new OtpErlangAtom(ticker);
        msg[1] = new OtpErlangDouble(Double.parseDouble(String.format("%.4f", price)));
        msg[2] = new OtpErlangLong(System.currentTimeMillis()/1000L);

        OtpErlangTuple tuple = new OtpErlangTuple(msg);

        System.out.println("Sending message to Erlang node: " + ticker + " " + price);

//            Send message
        mbox.send("message_receiver", ERLANG_NODE, tuple);
        LOGGER.info(String.format("%s: %.2f", ticker, price));
    }

    @Schedule(hour = "*", minute = "*", second = "*/1", info = "Every 1 seconds timer")
    public void generate_TSLA_stock_data() {
        send_data_to_erlang_node(175.79, "TSLA", 5);
    }

    @Schedule(hour = "*", minute = "*", second = "*/2", info = "Every 2 seconds timer")
    public void generate_AMZN_stock_data() {
        send_data_to_erlang_node(180.38, "AMZN", 8);
    }

    @Schedule(hour = "*", minute = "*", second = "*/3", info = "Every 3 seconds timer")
    public void generate_MSFT_stock_data() {
        send_data_to_erlang_node(420.72, "MSFT", 10);
    }

    @Schedule(hour = "*", minute = "*", second = "*/3", info = "Every 3 seconds timer")
    public void generate_AAPL_stock_data() {
        send_data_to_erlang_node(171.48, "AAPL", 10);
    }

    @Schedule(hour = "*", minute = "*", second = "*/4", info = "Every 4 seconds timer")
    public void generate_BTC_USD_stock_data() {
        send_data_to_erlang_node(67706.60, "BTC/USD", 15);
    }

    @Schedule(hour = "*", minute = "*", second = "*/4", info = "Every 4 seconds timer")
    public void generate_ETH_USD_stock_data() {
        send_data_to_erlang_node(3333.94, "ETH/USD", 15);
    }

}