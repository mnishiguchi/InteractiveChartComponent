# If you hardcode the data within the component.

@LineChartApp = React.createClass

  getInitialState: ->
    records: @props.data

  render: ->
    React.createElement ChartComponent("Line"),
      name:   "lineChart"
      data:   @dataForLineChart()
      height: 150
      width:  1100
      options: @optionsForLineChart()

  dataForLineChart: ->
    {
      labels: ["January", "February", "March", "April", "May", "June", "July"],
      datasets: [
        {
          fillColor: "#25BDFF",
          strokeColor: "#25BDFF",
          pointColor: "#25BDFF",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "#25BDFF",
          data: [28, 48, 40, 19, 86, 27, 90]
        }
      ]
    }

  optionsForLineChart: ->
    bezierCurve: false
    datasetFill: false
    pointDotStrokeWidth: 4
    scaleShowVerticalLines: false
