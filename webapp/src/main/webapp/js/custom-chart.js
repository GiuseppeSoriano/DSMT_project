anychart.onDocumentReady(async function () {

    // Get company name (assuming it's available)
    companyName = document.getElementById("companyName").textContent;

    // Create data table
    var dataTable = anychart.data.table();

    try {
        const response = await fetch('/api/stocks-data?ticker=TSLA');
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data = await response.json();
        console.log(data); // This will log the fetched JSON data

        // Process fetched data into a format suitable for AnyChart (NEW)
        dataTable.addData(data.map(item => [item.date, item.open, item.high, item.low, item.close]));

    } catch (error) {
        console.error('Error fetching data:', error);
    }

    // Map loaded data (adjust column indexes if needed)
    var mapping = dataTable.mapAs({'open': 1, 'high': 2, 'low': 3, 'close': 4});

    // Create a stock chart
    var chart = anychart.stock();

    // Configure the plot (first layer)
    var plot = chart.plot(0);
    plot.yGrid(true).xGrid(true).yMinorGrid(true).xMinorGrid(true); // Enable grid lines

    // Create candlestick series with company name
    var series = plot.candlestick(mapping).name(companyName);
    series.legendItem().iconType('rising-falling'); // Set legend icon type

    // Create scroller series with mapped data
    chart.scroller().candlestick(mapping);

    // Set date range (optional, uncomment if needed)
    // chart.selectRange('2015-12-24', '2016-01-01');

    // Create range picker for interactive selection
    var rangePicker = anychart.ui.rangePicker();
    rangePicker.render(chart);

    // Create range selector for additional navigation
    var rangeSelector = anychart.ui.rangeSelector();
    rangeSelector.render(chart);

    // Set chart title with company name
    chart.title(companyName + '. Stock Chart');

    // Set container ID for chart rendering
    chart.container('container');

    // Draw the chart
    chart.draw();
});
