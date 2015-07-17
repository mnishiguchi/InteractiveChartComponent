# If you receive the data from the parent node through @props

@LineChartApp = React.createClass

  getInitialState: ->
    # Every time new data is provided, it will be stored here first.
    dataForLineChart: @props.dataForLineChart

  # Then React will invoke the render method with your new state.
  render: ->
    React.createElement ChartComponent("Line"),
      name:   "lineChart"
      data:   @state.dataForLineChart
      height: 150
      width:  1100
      options: @optionsForLineChart()

  optionsForLineChart: ->
    bezierCurve: false
    datasetFill: false
    pointDotStrokeWidth: 4
    scaleShowVerticalLines: false
