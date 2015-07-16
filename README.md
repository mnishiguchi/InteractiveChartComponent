# InteractiveChartComponent

[日本語](http://qiita.com/mnishiguchi/items/aeb6231b405051aba85c)

InteractiveChartComponent is a convenient helper method to generate a React.js component of verious types of interactive Chart.js charts/graphs. 

I wrote this because I wanted to keep the graphs updated in an application like the screenshot below, where users can add and update displayed data.

![Screenshot 2015-07-14 16.25.07.png](https://qiita-image-store.s3.amazonaws.com/0/82804/02afbf45-52ce-476f-b304-7d1862f6d2ea.png)

##Dependencies

- React.js
- Chart.js

##Advantages

- You can user Chart.js-powered interactive charts/graphs at ease.
- Every time new data is provided to a chart component from its parent node, the chart is automatically updated, which makes the UI interactive.
- Once you include the `InteractiveChartComponent`, you can generate classes for various types of charts/graphs with a few lines of codes + data, which keeps your code dry.

##Usage

1. Add `InteractiveChartComponent.js` or cut & paste its content to your project.

2. Use `ChartComponent(String chartType)` method to generate a component class for the specified type of Chart.js chart/graph. Pass in as an argument a string of chart type, such as `"Bar"`, `"Pie"`, `"PolarArea"`, etc. For example, if a string "Bar" is passed in, a component class for Bar chart will be created. Please refer to the Chart.js [documentation](http://www.chartjs.org/docs/) for the available chart types.

3. Instantiate the chart class by using [`React.createElement`](https://facebook.github.io/react/docs/top-level-api.html#react.createelement) in `render` method of its parent component, passing in 4 required properties and options in necessary.

>The required properties
>+ `name`:   Must be a unique string. Used for finding a canvas later on.
>+ `data`:   A set of data in the data structure that a chart type requires.
>+ `height`: the height of the canvas
>+ `width`:  the width of the canvas

```coffeescript

# With "Bar" passed in, a component class of Bar Chart will be generated.
React.createElement CustomChart("Bar"),
  name: "barChart"         # Unique string
  data: @dataForBarChart() # The data structure required by the chart type you use.
  height: 200
  width:  400

# With "Pie" passed in, a component class of Pie Chart will be generated.
React.createElement CustomChart("Pie"),          
  name: "pieChart"
  data: @dataForPieChart()           
  height: 200            
  width:  200
```


Note: Each Chart.js chart type require different data structure.
For example, if you use `"Bar"`, its data structure is as following. Please refer to the Chart.js [documentation](http://www.chartjs.org/docs/) for the required data structure for your chart.


```coffeescript
# e.g. Data structure for Bar chart
labels: ["January", "February", "March", "April", "May", "June", "July"]
datasets: [
  {
    label:           "My First dataset"
    fillColor:       "rgba(220,220,220,0.5)"
    strokeColor:     "rgba(220,220,220,0.8)"
    highlightFill:   "rgba(220,220,220,0.75)"
    highlightStroke: "rgba(220,220,220,1)"
    data: [65, 59, 80, 81, 56, 55, 40]
  }
  {
    label:           "My Second dataset"
    fillColor:       "rgba(151,187,205,0.5)"
    strokeColor:     "rgba(151,187,205,0.8)"
    highlightFill:   "rgba(151,187,205,0.75)"
    highlightStroke: "rgba(151,187,205,1)"
    data: [28, 48, 40, 19, 86, 27, 90]
  }
]
```

You can also configure your chart by passing in the `options`. Just like the data structure, each chart type has a different set of configuration items. Please refer to the Chart.js [documentation](http://www.chartjs.org/docs/) for the configurable items for your chart.

```coffeescript
React.createElement CustomChart("Bar"),
  name: "barChart"
  data: @dataForBarChart()
  height: 200
  width:  400
  options: {
    scaleBeginAtZero:         true
    scaleShowGridLines:       true
    scaleGridLineColor:       "rgba(0,0,0,.05)"
    scaleGridLineWidth:       1
    scaleShowHorizontalLines: true
    scaleShowVerticalLines:   true
    barShowStroke:            true
    barStrokeWidth:           2
    barValueSpacing:          5
    barDatasetSpacing:        1
  }
```

