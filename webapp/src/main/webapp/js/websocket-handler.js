function subscribeToStock(ticker) {
  const message = JSON.stringify({ type: "subscribe_stock", ticker: ticker });
  ws.send(message);
}

function unsubscribeFromStock(ticker) {
  const message = JSON.stringify({ type: "unsubscribe_stock", ticker: ticker });
  ws.send(message);
}

var ws = new WebSocket("ws://10.2.1.95:8081/websocket");
var subscribedAAPL = false;
var subscribedMSFT = false;
var subscribedTSLA = false;
var subscribedAMZN = false;
var subscribedETHUSD = false;
var subscribedBTCUSD = false;

ws.onopen = function() {
    console.log("Connessione aperta");
    subscribeToStock('AAPL');
    subscribeToStock('MSFT');
    subscribeToStock('TSLA');
    subscribeToStock('AMZN');
    subscribeToStock('ETH/USD');
    subscribeToStock('BTC/USD');
    // Call here all the other subscribe methods you need for other tickers
    setInterval(function() {
        ws.send("ping");
    }, 1000);
};

ws.onmessage = function(event) {
    var data = JSON.parse(event.data);
    console.log("Messaggio ricevuto: ", data);

    if(data.AAPL) {
        document.getElementById("AAPL").textContent = data.AAPL;
    } else if(data.MSFT) {
        document.getElementById("MSFT").textContent = data.MSFT;
    } else if(data.TSLA) {
        document.getElementById("TSLA").textContent = data.TSLA;
    } else if(data.AMZN) {
        document.getElementById("AMZN").textContent = data.AMZN;
    }else if(data["ETH/USD"]) {
        document.getElementById("ETH_USD").textContent = data["ETH/USD"];
    }else if(data["BTC/USD"]) {
        document.getElementById("BTC_USD").textContent = data["BTC/USD"];
    }
};

ws.onclose = function() {
    console.log("Connessione chiusa");
};
ws.onerror = function(error) {
    console.log("Errore: ", error);
};

