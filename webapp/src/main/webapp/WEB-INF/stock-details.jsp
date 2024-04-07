<%--
  Created by IntelliJ IDEA.
  User: tderick
  Date: 4/7/24
  Time: 11:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Stock Details</title>

    <link href="https://cdn.anychart.com/releases/8.10.0/css/anychart-ui.min.css" type="text/css" rel="stylesheet">
    <link href="https://cdn.anychart.com/releases/8.10.0/fonts/css/anychart-font.min.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="../css/style.css">
    <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
    />

    <link
            rel="stylesheet"
            href="https://use.fontawesome.com/releases/v6.0.0/css/all.css"
    />
    <style>
        html,
        body,
        #container {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
        }
    </style>
</head>
<body>
    <section
            class="hero is-black is-small hide-scrollbar"
            id="ticker"
            style="overflow-y: hidden"
    >
        <div class="hero-body">
            <div class="container-fluid">
                <div class="columns is-mobile">
                    <div class="column tick">
                        <div class="subtitle is-6">
                            <a href="/stock-details?name=BTC USD">BTC/USD</a>
                            <span class="price is-pulled-right"
                            ><strong>65112</strong></span
                            >
                            <div class="text-red mt-1">
                    <span class="icon float-left mt-1"
                    ><i class="fas fa-chevron-down"></i
                    ></span>
                                <span style="font-size: 1.2rem">-6.56%</span> (-4569.82)
                            </div>
                        </div>
                    </div>
                    <div class="column tick">
                        <div class="subtitle is-6">
                            <a href="/stock-details?name=ETH USD">ETH/USD</a><span class="price is-pulled-right"
                        ><strong>3290.36</strong></span
                        >
                            <div class="text-red mt-1">
                    <span class="icon float-left mt-1"
                    ><i class="fas fa-chevron-down"></i></span
                    ><span style="font-size: 1.2rem">-6.15%</span> (-215.49)
                            </div>
                        </div>
                    </div>
                    <div class="column tick">
                        <div class="subtitle is-6">
                            <a href="/stock-details?name=AMAZON INC">AMZ</a><span class="price is-pulled-right"
                        ><strong>1.0758</strong></span
                        >
                            <div class="text-green mt-1">
                    <span class="icon float-left mt-1"
                    ><i class="fas fa-chevron-up"></i></span
                    ><span style="font-size: 1.2rem">0.14%</span> (0.0015)
                            </div>
                        </div>
                    </div>
                    <div class="column tick">
                        <div class="subtitle is-6">
                            <a href="/stock-details?name=Tesla Inc">TSLA</a><span class="price is-pulled-right"
                        ><strong>1.2557</strong></span
                        >
                            <div class="text-green mt-1">
                    <span class="icon float-left mt-1"
                    ><i class="fas fa-chevron-up"></i></span
                    ><span style="font-size: 1.2rem">0.05%</span> (0.00060)
                            </div>
                        </div>
                    </div>
                    <div class="column tick">
                        <div class="subtitle is-6">
                            <a href="/stock-details?name=Apple Inc">AAPL</a><span class="price is-pulled-right"
                        ><strong>169.06</strong></span
                        >
                            <div class="text-red mt-1">
                    <span class="icon float-left mt-1"
                    ><i class="fas fa-chevron-down"></i></span
                    ><span style="font-size: 1.2rem">-1.41%</span> (-2.42)
                            </div>
                        </div>
                    </div>
                    <div class="column tick">
                        <div class="subtitle is-6">
                            <a href="/stock-details?name=Microsoft Corp">MSFT</a><span class="price is-pulled-right">
                    <strong>420.34</strong></span
                        >
                            <div class="text-red mt-1">
                    <span class="icon float-left mt-1"
                    ><i class="fas fa-chevron-down"></i></span
                    ><span style="font-size: 1.2rem">-0.09%</span> (-0)
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>

    <div id="companyName" style="display: none"><%= request.getParameter("name") %></div>
    <div id="container"></div>

    <section style="background: linear-gradient(135deg, #343434 0%, #010101 100%);color: white">
        <div class="mx-auto col-xs-12">
            <div class="text-center small muted py-4">
                ©Copyright 2024 UNIPI-DSMT-Saa
            </div>
        </div>
    </section>

    <script src="https://cdn.anychart.com/releases/8.10.0/js/anychart-core.min.js"></script>
    <script src="https://cdn.anychart.com/releases/8.10.0/js/anychart-stock.min.js"></script>
    <script src="https://cdn.anychart.com/releases/8.10.0/js/anychart-data-adapter.min.js"></script>

    <script src="https://cdn.anychart.com/releases/8.10.0/js/anychart-ui.min.js"></script>
    <script src="https://cdn.anychart.com/releases/8.10.0/js/anychart-exports.min.js"></script>

    <script src="../js/custom-chart.js"></script>

</body>
</html>
