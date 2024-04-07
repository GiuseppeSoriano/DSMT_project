<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="author" content="saa" />

    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, maximum-scale=5"
    />

    <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
    />

    <link
            rel="stylesheet"
            href="https://use.fontawesome.com/releases/v6.0.0/css/all.css"
    />

    <meta
            name="description"
            content="Saa - Get Realtime Stock Data of the Top Performing Ticker in the world."
    />
    <meta
            property="og:title"
            content="Saa - Get Realtime Stock Data of the Top Performing Ticker in the world."
    />
    <meta property="og:type" content="website" />
    <meta charset="UTF-8" />

    <title>
        Saa - Get Realtime Stock Data of the Top Performing Ticker in the world.
    </title>
    <style type="text/css">
        html,
        body {
            height: 100%;
        }
        body {
            font-size: 14px;
            font-family: Trebuchet MS, roboto, ubuntu, sans-serif;
        }
        .grecaptcha-badge {
            display: none !important;
        }
        .opaq8 {
            opacity: 0.8;
        }
        .flex-vertical-center,
        .main-first-section,
        .register-div,
        .login-div {
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .hide-scrollbar::-webkit-scrollbar {
            display: none;
            -webkit-appearance: none;
        }
        .hide-scrollbar {
            scrollbar-width: none;
        }
        .text-green {
            color: #1db954;
        }
        .text-red {
            color: #f45b5b;
        }
        .text-blue {
            color: #00b3e3 !important;
        }
        .text-brown {
            color: #b98b1d;
        }
        .text-grey {
            color: #c8c8c8;
        }
        @-moz-keyframes spin {
            100% {
                -webkit-transform: rotate(360deg);
                transform: rotate(360deg);
            }
        }
        @-webkit-keyframes spin {
            100% {
                -webkit-transform: rotate(360deg);
                transform: rotate(360deg);
            }
        }
        @keyframes spin {
            100% {
                -webkit-transform: rotate(360deg);
                transform: rotate(360deg);
            }
        }
        a {
            color: #1db954;
        }
        a:hover {
            color: #189945;
        }
        *:focus,
        input,
        .navbar-toggler:focus {
            outline: none;
        }
        .text-my-primary {
            color: #1db954;
        }
        .navbar {
            padding: 0 1rem !important;
        }
        .nav-primary {
            background-color: #2f2e2e;
        }
        .nav-primary .nav-link,
        .navbar-dark .nav-link {
            color: white !important;
        }
        .navbar-toggler {
            outline: none;
            border: none;
        }
        .nav-primary li {
            padding-top: 0.4rem;
            padding-bottom: 0.4rem;
        }
        .nav-item:hover,
        .navbar-toggler:hover,
        .dropdown-item:hover {
            background-color: #38383d;
            color: white;
        }
        .dropdown-menu {
            font-size: unset;
            background: #2f2e2e;
        }
        .dropdown-item {
            color: white;
        }
        .dropdown-item.active {
            color: #1db954;
            background: #2f2e2e;
        }
        @media (min-width: 768px) {
            nav li.dropdown:hover > div.dropdown-menu {
                display: block;
            }
        }
        .main-first-section {
            background-image: url("/static/img/webp/finnhub-wave.webp");
            background-color: #0a0a0a;
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center right;
            position: relative;
            overflow: hidden;
            align-items: stretch;
            height: 80vh;
            color: white;
        }
        .buttons {
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-start;
        }
        .buttons a,
        .buttons button {
            margin-left: 5px;
            margin-bottom: 5px;
        }
        .btn-black {
            background-color: #363636;
            border-color: transparent;
            padding: 12px 20px;
            font-weight: 600;
            color: white !important;
        }
        .btn-black:hover {
            opacity: 0.9;
        }
        .btn-primary {
            background-color: #1db954;
            border-color: transparent;
            padding: 12px 20px;
            font-weight: 500;
            color: white;
        }
        .btn-primary:hover {
            background-color: #189945;
            border-color: transparent;
        }
        .btn-transparent {
            border-color: #1db954;
            background-color: transparent;
            padding: 12px 20px;
            font-weight: 500;
        }
        .btn-transparent:hover {
            background-color: #1db954;
            color: white !important;
        }
        .btn-side-by-side {
            display: inline-block;
            margin-right: 5px;
        }
        @media only screen and (max-width: 526px) {
            .btn-side-by-side {
                margin-bottom: 5px;
            }
        }
        .primary-form {
            position: relative;
            display: flex;
            flex-direction: column;
            z-index: 1;
            padding: 30px 15px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),
            0 6px 20px 0 rgba(0, 0, 0, 0.19);
            margin-left: auto;
            margin-right: auto;
            width: 33vw;
            min-width: 350px;
            background-color: white;
            min-height: 400px;
        }
        .primary-form input {
            padding: 12px 7px;
            margin-top: 12px;
            width: 100%;
        }
        .register-div {
            height: 100vh;
            background-image: url("/static/img/webp/register-stock-exchange.webp");
            background-color: #0a0a0a;
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
        }
        .login-div {
            height: 100vh;
            background-image: url("/static/img/webp/finnhub-data-center.webp");
            background-color: #0a0a0a;
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
        }
        .loader {
            position: absolute;
            left: 45%;
            top: 45%;
            border: 5px solid #f3f3f3;
            border-top: 5px solid #1db954;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            animation: spin 2s linear infinite;
            z-index: 999;
        }
        .main-about-section,
        .timeseries-section {
            padding: 100px 15px;
            background: linear-gradient(135deg, #343434 0%, #010101 100%);
            color: white;
            position: relative;
        }
        .hero {
            align-items: stretch;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            background-color: #222;
            color: #fff;
        }
        .hero-body {
            flex-grow: 1;
            flex-shrink: 0;
        }
        .tick {
            min-width: 180px;
            border-right: 1px solid #363636;
            padding: 0 1rem;
            white-space: nowrap;
        }
        .subtitle.is-6 {
            font-size: 0.9rem;
            color: #ffffff;
        }
        .subtitle {
            color: #6b6b6b;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.25;
        }
        .columns .column {
            display: inline-block;
            flex-basis: 0;
            flex-grow: 1;
            flex-shrink: 1;
            padding: 0.75rem;
        }
        .columns.is-mobile {
            display: flex;
        }
        .columns {
            margin-top: 0.75rem;
            margin-bottom: 0.75rem;
        }
        .price {
            color: #ffffff;
            position: relative;
        }
        #ticker {
            flex-shrink: 0;
            overflow: scroll;
        }
        #ticker .tick {
            min-width: 220px;
            border-right: 1px solid #363636;
            padding: 0 1rem;
            white-space: nowrap;
        }
        .column {
            display: block;
            flex-basis: 0;
            flex-grow: 1;
            flex-shrink: 1;
        }
        .is-pulled-right {
            float: right !important;
        }
        .icon {
            display: inline-flex;
            justify-content: center;
            height: 1.5rem;
            width: 1.5rem;
        }
        .pricing-bg {
            min-height: 80vh;
            background-image: url("/static/img/webp/finnhub-data-center.webp");
            clip-path: polygon(0 0, 100% 0, 100% calc(100% - 8vw), 0 100%);
            background-color: #0a0a0a;
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
        }
        .pricing-parent-div {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            padding: 100px 15px;
        }
        .pricing-parent-div .pricing-div {
            margin-right: 15px;
        }
        .pricing-div {
            flex: 1 1 0;
            padding: 12px 15px;
            border: 2px solid #363636;
            border-radius: 5px;
            max-width: 400px;
            min-height: 350px;
            background: white;
        }
        .pricing-div:hover {
            transform: scale(1.01, 1.01);
        }
        @media only screen and (max-width: 768px) {
            .pricing-parent-div {
                display: flex;
                flex-direction: column;
                padding-left: 0;
                padding-right: 0;
            }
            .pricing-div {
                flex: unset;
                margin-bottom: 10px;
                max-width: unset;
            }
            .pricing-parent-div .pricing-div {
                margin-right: 0;
            }
        }
        .pricing-number {
            color: #1db954;
            font-weight: bold;
            font-size: 1.2rem;
        }
        .form-control {
            background: #f4f7fb;
        }
        .pricing-div ul {
            list-style-type: none;
            margin-left: 0;
            padding-left: 20px;
        }
        .fa-check-circle {
            color: #1db954;
            margin-right: 15px;
        }
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #2f2c2cab;
            z-index: 99;
        }
        .overlay-card-payment {
            border: 2px solid #363636;
            border-radius: 5px;
            background: whitesmoke;
            padding: 20px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),
            0 6px 20px 0 rgba(0, 0, 0, 0.19);
            position: relative;
            top: 40%;
            width: 100vw;
            max-width: 600px;
            z-index: 10;
        }
        .overlay-close {
            position: absolute;
            right: 10px;
            top: 10px;
        }
        .overlay-close:hover {
            opacity: 0.8;
            cursor: pointer;
        }
        .overlay-close:after {
            content: "x";
        }
        .image-3d-left {
            transform-style: preserve-3d;
            transition: transform 1s;
            backface-visibility: hidden;
            transform: perspective(350px) rotateY(-12deg);
            cursor: pointer;
        }
        @media (max-width: 768px) {
            .image-3d-left {
                transform: none;
            }
            .hide-small-screen {
                display: none;
            }
        }
        .image-3d-left:hover {
            transform: perspective(350px) rotateY(0deg);
        }
        .portfolio_image_area {
            padding: 100px 15px;
        }
        .portfolio_image_area .single_Portfolio {
            position: relative;
            margin-bottom: 30px;
            overflow: hidden;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
        }
        .portfolio_image_area .single_Portfolio .portfolio_thumb {
            height: 350px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            overflow: hidden;
        }
        @media (max-width: 767px) {
            .portfolio_image_area .single_Portfolio .portfolio_thumb {
                height: auto;
            }
        }
        .portfolio_image_area .single_Portfolio .portfolio_thumb img {
            width: 100%;
            height: 100%;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
        }
        .portfolio_image_area .single_Portfolio .portfolio_hover {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            text-align: center;
            background: #fff;
            border: 0;
            -webkit-transform: scale(0.9);
            -moz-transform: scale(0.9);
            -ms-transform: scale(0.9);
            transform: scale(0.9);
            -webkit-transition: 0.5s;
            -moz-transition: 0.5s;
            -o-transition: 0.5s;
            transition: 0.5s;
            opacity: 0;
            overflow: hidden;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
        }
        .portfolio_image_area .single_Portfolio .portfolio_hover .title {
            position: absolute;
            top: 50%;
            left: 0;
            right: 0;
            text-align: center;
            -webkit-transform: translateY(-50%);
            -moz-transform: translateY(-50%);
            -ms-transform: translateY(-50%);
            transform: translateY(-50%);
        }
        .portfolio_image_area .single_Portfolio .portfolio_hover span {
            font-size: 14px;
            color: #1db954;
            font-weight: 400;
            font-family: "Roboto", sans-serif;
        }
        .portfolio_image_area .single_Portfolio .portfolio_hover h3 {
            color: #1f1f1f;
            font-size: 24px;
            font-weight: 700;
            margin-top: 11px;
            margin-bottom: 25px;
        }
        .portfolio_image_area
        .single_Portfolio
        .portfolio_hover
        .boxed-btn3:hover {
            border: 1px solid #1db954 !important;
            color: #1db954 !important;
            background: #fff !important;
        }
        .portfolio_image_area .single_Portfolio:hover .portfolio_hover {
            -webkit-transform: scale(1);
            -moz-transform: scale(1);
            -ms-transform: scale(1);
            transform: scale(1);
            opacity: 1;
        }
        .how_we_work_area {
            position: relative;
        }
        .how_we_work_area .work_info {
            padding: 75px 0;
        }
        @media only screen and (min-width: 768px) {
            .how_we_work_area .work_info {
                padding: 150px 0;
            }
            .how_we_work_area::before {
                position: absolute;
                content: "";
                width: 50%;
                right: 0;
                top: 0;
                height: 100%;
                background-image: url(/static/img/webp/finnhub-data-center.webp);
                background-size: cover;
                background-position: center center;
                -webkit-border-radius: 20px 0 0 20px;
                -moz-border-radius: 20px 0 0 20px;
                border-radius: 20px 0 0 20px;
            }
        }
        .floating-box {
            background: #f9f7f7;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),
            0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
        .floating-box:hover {
            box-shadow: 0 10px 30px 0 rgba(0, 0, 0, 0.2),
            0 12px 40px 0 rgba(0, 0, 0, 0.19);
            transform: scale(1.01, 1.01);
        }
        .footer-default ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }
        .footer-default li {
            float: left;
        }
        .fab {
            padding: 15px;
            font-size: 25px;
            width: 25px;
            text-align: center;
            text-decoration: none;
            border-radius: 50%;
            box-sizing: unset;
            margin-left: 5px;
        }
        .fab:hover {
            text-decoration: none;
            color: #1db954;
        }
        .fa-facebook-f,
        .fa-linkedin-in,
        .fa-pinterest-p,
        .fa-twitter,
        .fa-github,
        .fa-youtube,
        .fa-reddit,
        .fa-github-square,
        .fa-kickstarter-k {
            background: #3b3c3e;
            color: white;
        }
        .footer-icon {
            font-size: 1.2rem;
            margin-right: 10px;
        }
        .footer-icon:hover {
            color: #1db954;
        }
        .client-logo-div {
            display: flex;
            flex-wrap: nowrap;
            justify-content: space-between;
            overflow: auto;
            flex: 1 0 10px;
            padding-left: 30px;
            padding-right: 30px;
        }
        .client-logo-div img {
            max-height: 100px;
            min-width: 120px;
            margin-right: 25px;
        }
        @media only screen and (max-width: 526px) {
            .client-logo-div {
                padding-left: 5px;
                padding-right: 5px;
            }
        }
        .card-header::before {
            content: "";
            position: absolute;
            width: 12px;
            height: 2px;
            top: 22px;
            right: 15px;
            margin-left: -6px;
            margin-top: -1px;
            background: #aaadb1;
        }
        .card-header::after {
            content: "";
            position: absolute;
            width: 2px;
            height: 12px;
            top: 22px;
            right: 20px;
            margin-left: -1px;
            margin-top: -6px;
            transition: transform 0.25s ease, opacity 0.25s ease 75ms;
            background: #aaadb1;
        }
    </style>
</head>
<body
        data-new-gr-c-s-check-loaded="14.1165.0"
        data-gr-ext-installed=""
        cz-shortcut-listen="true"
>
<div id="root">
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
                            BTC/USD
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
                            ETH/USD<span class="price is-pulled-right"
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
                            EUR/USD<span class="price is-pulled-right"
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
                            GBP/USD<span class="price is-pulled-right"
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
                            AAPL<span class="price is-pulled-right"
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
                            MSFT<span class="price is-pulled-right">
                    <strong>420.34</strong></span
                        >
                            <div class="text-red mt-1">
                    <span class="icon float-left mt-1"
                    ><i class="fas fa-chevron-down"></i></span
                    ><span style="font-size: 1.2rem">-0.09%</span> (-0)
                            </div>
                        </div>
                    </div>
                    <div class="column tick">
                        <div class="subtitle is-6">
                            AMZN
                            <span class="price is-pulled-right"
                            ><strong>178.92</strong></span
                            >
                            <div class="text-red mt-1">
                    <span class="icon float-left mt-1"
                    ><i class="fas fa-chevron-down"></i></span
                    ><span style="font-size: 1.2rem">-0.81%</span> (-1.46)
                            </div>
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
</div>
</section>
<section style="background: linear-gradient(135deg, #343434 0%, #010101 100%);color: white">
    <div class="mx-auto col-xs-12">
        <div class="text-center small muted py-4">
            ©Copyright 2024 UNIPI-DSMT-Saa
        </div>
    </div>
</section>
</div>
</body>
</html>