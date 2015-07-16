var ChartComponent = function(chartType) {
  return React.createClass({
    displayName: chartType + "Chart",
    getInitialState: function() {
      return {
        chartInstance: null
      };
    },
    render: function() {
      return React.DOM.canvas({
        ref: this.props.name,
        style: {
          height: this.props.height,
          width: this.props.width
        }
      });
    },
    componentDidMount: function() {
      return this.initializeChart();
    },
    componentWillUnmount: function() {
      if (this.state.chartInstance) {
        return this.state.chartInstance.destroy();
      }
    },
    initializeChart: function() {
      var canvas = React.findDOMNode(this.refs[this.props.name]);
      var ctx = canvas.getContext("2d");
      var chart = new Chart(ctx)[chartType](this.props.data);
      return this.setState.chartInstance = chart;
    }
  });
};
module.exports = ChartComponent
