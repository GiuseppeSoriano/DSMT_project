<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="author" content="saa" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5"/>
    <link rel="stylesheet"  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.0.0/css/all.css"/>
    <meta name="description"  content="Saa - Get Realtime Stock Data of the Top Performing Ticker in the world."/>
    <meta property="og:type" content="website" />
    <meta charset="UTF-8" />

    <title>
        Saa - Get Realtime Stock Data of the Top Performing Ticker in the world.
    </title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body data-new-gr-c-s-check-loaded="14.1165.0" data-gr-ext-installed="" cz-shortcut-listen="true">

    <div id="root">
        <section class="hero is-black is-small hide-scrollbar" id="ticker" style="overflow-y: hidden">
            <div class="hero-body">
                <div class="container-fluid">
                    <div class="columns is-mobile">
                        <div class="column tick">
                            <div class="subtitle is-6">
                                <a href="/stock-details?name=BTC USD&ticker=BTC/USD">BTC/USD</a>
                                <span class="price is-pulled-right"
                                ><strong id="BTC_USD">65112</strong></span>
    <%--                            <div class="text-red mt-1">--%>
    <%--                    <span class="icon float-left mt-1"--%>
    <%--                    ><i class="fas fa-chevron-down"></i--%>
    <%--                    ></span>--%>
    <%--                                <span style="font-size: 1.2rem">-6.56%</span> (-4569.82)--%>
    <%--                            </div>--%>
                            </div>
                        </div>
                        <div class="column tick">
                            <div class="subtitle is-6">
                                <a href="/stock-details?name=ETH USD&ticker=ETH/USD">ETH/USD</a><span class="price is-pulled-right"
                            ><strong id="ETH_USD">3290.36</strong></span>
    <%--                            <div class="text-red mt-1">--%>
    <%--                    <span class="icon float-left mt-1"--%>
    <%--                    ><i class="fas fa-chevron-down"></i></span--%>
    <%--                    ><span style="font-size: 1.2rem">-6.15%</span> (-215.49)--%>
    <%--                            </div>--%>
                            </div>
                        </div>
                        <div class="column tick">
                            <div class="subtitle is-6">
                                <a href="/stock-details?name=AMAZON INC&ticker=AMZN">AMZN</a><span class="price is-pulled-right"
                            ><strong id="AMZN">1.0758</strong></span>
    <%--                            <div class="text-green mt-1">--%>
    <%--                    <span class="icon float-left mt-1"--%>
    <%--                    ><i class="fas fa-chevron-up"></i></span--%>
    <%--                    ><span style="font-size: 1.2rem">0.14%</span> (0.0015)--%>
    <%--                            </div>--%>
                            </div>
                        </div>
                        <div class="column tick">
                            <div class="subtitle is-6">
                                <a href="/stock-details?name=Tesla Inc&ticker=TSLA">TSLA</a><span class="price is-pulled-right"
                            ><strong id="TSLA">1.2557</strong></span>
    <%--                            <div class="text-green mt-1">--%>
    <%--                    <span class="icon float-left mt-1"--%>
    <%--                    ><i class="fas fa-chevron-up"></i></span--%>
    <%--                    ><span style="font-size: 1.2rem">0.05%</span> (0.00060)--%>
    <%--                            </div>--%>
                            </div>
                        </div>
                        <div class="column tick">
                            <div class="subtitle is-6">
                                <a href="/stock-details?name=Apple Inc&ticker=AAPL">AAPL</a><span class="price is-pulled-right"
                            ><strong id="AAPL">169.06</strong></span>
    <%--                            <div class="text-red mt-1">--%>
    <%--                    <span class="icon float-left mt-1"--%>
    <%--                    ><i class="fas fa-chevron-down"></i></span--%>
    <%--                    ><span style="font-size: 1.2rem">-1.41%</span> (-2.42)--%>
    <%--                            </div>--%>
                            </div>
                        </div>
                        <div class="column tick">
                            <div class="subtitle is-6">
                                <a href="/stock-details?name=Microsoft Corp&ticker=MSFT">MSFT</a><span class="price is-pulled-right">
                        <strong id="MSFT">420.34</strong></span>
    <%--                            <div class="text-red mt-1">--%>
    <%--                    <span class="icon float-left mt-1"--%>
    <%--                    ><i class="fas fa-chevron-down"></i></span--%>
    <%--                    ><span style="font-size: 1.2rem">-0.09%</span> (-0)--%>
    <%--                            </div>--%>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <section class="main-first-section">
            <div class="container">
                <div>
                    <div>
                        <h1>Saa Stock Data</h1>
                        <p>
                            Get Realtime Stock Data of the Top Performing Ticker in the world.
                        </p>
                        <h2 class="">
                            Real-Time Data for Stocks, Currencies, and Crypto.
                        </h2>
                        <p>
                            Access real-time stock data to stay updated with the latest market trends.
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <section style="background: linear-gradient(135deg, #343434 0%, #010101 100%);color: white">
            <div class="mx-auto col-xs-12">
                <div class="text-center small muted py-5">
                    ©Copyright 2024 UNIPI-DSMT-Saa
                </div>
            </div>
        </section>
    </div>

    <script src="js/websocket-handler.js"></script>

</body>
</html>