function subscribeToStock(ticker) {
    const message = JSON.stringify({
      type: "subscribe_stock",
      ticker: ticker,
    });
    ws.send(message);
 }
function unsubscribeFromStock(ticker) {
    const message = JSON.stringify({
      type: "unsubscribe_stock",
      ticker: ticker,
    });
    ws.send(message);
  }

var ws = new WebSocket("ws://fedora:8081/websocket");

ws.onopen = function () {
    console.log("Connessione aperta");
    setInterval(function () {
      ws.send("ping");
    }, 30000);
};
  ws.onmessage = function (event) {
    var data = JSON.parse(event.data);
    console.log("Messaggio ricevuto: ", data);
    if (data.time) {
      document.getElementById("time").textContent = data.time;
    } else if (data.random) {
      document.getElementById("random").textContent = data.random;
    } else if (data.stock) {
      document.getElementById("stock").textContent = data.stock;
    }
  };
  ws.onclose = function () {
    console.log("Connessione chiusa");
  };
  ws.onerror = function (error) {
    console.log("Errore: ", error);
  };

  document
    .getElementById("toggleTime")
    .addEventListener("click", function () {
      if (subscribedTime) {
        ws.send("unsubscribe_time");
        this.textContent = "Iscriviti agli Aggiornamenti dell'Orario";
      } else {
        ws.send("subscribe_time");
        this.textContent = "Disiscriviti dagli Aggiornamenti dell'Orario";
      }
      subscribedTime = !subscribedTime;
    });

  document
    .getElementById("toggleRandom")
    .addEventListener("click", function () {
      if (subscribedRandom) {
        ws.send("unsubscribe_random");
        this.textContent = "Iscriviti ai Numeri Casuali";
      } else {
        ws.send("subscribe_random");
        this.textContent = "Disiscriviti dai Numeri Casuali";
      }
      subscribedRandom = !subscribedRandom;
    });

  document
    .getElementById("toggleStock")
    .addEventListener("click", function () {
      if (subscribedStock) {
        //ws.send("unsubscribe_stock");
        unsubscribeFromStock("AAPL");
        this.textContent = "Iscriviti agli Aggiornamenti delle Azioni";
      } else {
        //ws.send("subscribe_stock");
        subscribeToStock("AAPL");
        this.textContent = "Disiscriviti dagli Aggiornamenti delle Azioni";
      }
      subscribedStock = !subscribedStock;
    });