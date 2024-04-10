anychart.onDocumentReady(function () {

  // Create data table
  var table = anychart.data.table();

  // Add data with formatted dates
  table.addData([
          ['2015-12-24', 511.53, 514.98, 505.79, 506.40],
          ['2015-12-25', 512.53, 514.88, 505.69, 510.34],
          ['2015-12-26', 511.83, 514.98, 505.59, 507.23],
          ['2015-12-27', 511.22, 515.30, 505.49, 506.47],
          ['2015-12-28', 511.53, 514.98, 505.79, 506.40],
          ['2015-12-29', 512.53, 513.88, 505.69, 510.34],
          ['2015-12-30', 511.83, 512.98, 502.59, 503.23],
          ['2015-12-31', 511.22, 515.30, 505.49, 506.47],
          ['2016-01-01', 510.35, 515.72, 505.23, 508.80]
  ]);

  // Map loaded data (adjust column indexes if needed)
  var mapping = table.mapAs({'open': 1, 'high': 2, 'low': 3, 'close': 4});

  // Create a stock chart
  var chart = anychart.stock();

  // Configure the plot (first layer)
  var plot = chart.plot(0);
  plot.yGrid(true).xGrid(true).yMinorGrid(true).xMinorGrid(true); // Enable grid lines

  // Get company name (assuming it's available)
  companyName = document.getElementById("companyName").textContent;

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

//anychart.onDocumentReady(function () {
//  anychart.data.loadCsvFile(
//    'https://gist.githubusercontent.com/shacheeswadia/cd509e0b0c03964ca86ae7d894137043/raw/5f336c644ad61728dbac93026f3268b86b8d0680/teslaDailyData.csv',
//    function (data) {
//      // create data table on loaded data
//      var dataTable = anychart.data.table();
//      dataTable.addData(data);
//
//      // map loaded data for the candlestick series
//      var mapping = dataTable.mapAs({
//        open: 1,
//        high: 2,
//        low: 3,
//        close: 4
//      });
//
//      companyName = document.getElementById("companyName").textContent;
//
//      // create stock chart
//      var chart = anychart.stock();
//
//      // create first plot on the chart
//      var plot = chart.plot(0);
//
//      // set grid settings
//      plot.yGrid(true).xGrid(true).yMinorGrid(true).xMinorGrid(true);
//
//      var series = plot.candlestick(mapping)
//        .name(companyName);
//      series.legendItem().iconType('rising-falling');
//
//      // create scroller series with mapped data
//      chart.scroller().candlestick(mapping);
//
//      // set chart selected date/time range
//      chart.selectRange('2020-11-27', '2021-11-26');
//
//      // create range picker
//      var rangePicker = anychart.ui.rangePicker();
//
//      // init range picker
//      rangePicker.render(chart);
//
//      // create range selector
//      var rangeSelector = anychart.ui.rangeSelector();
//
//      // init range selector
//      rangeSelector.render(chart);
//
//      // sets the title of the chart
//      chart.title(companyName+'. Stock Chart');
//
//      // set container id for the chart
//      chart.container('container');
//
//      // initiate chart drawing
//      chart.draw();
//    }
//  );
//});