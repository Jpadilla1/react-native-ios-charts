var React = require('react-native');

var {
  requireNativeComponent,
  processColor
} = React;

let RNBarChart = requireNativeComponent('RNBarChartSwift', BarChart);

var BarChart = React.createClass({
  render: function() {
    let { config, ...otherProps} = this.props;

    if ('backgroundColor' in config) {
      config.backgroundColor = processColor(config.backgroundColor);
    }

    if ('gridBackgroundColor' in config) {
      config.gridBackgroundColor = processColor(config.gridBackgroundColor);
    }

    if ('colors' in config) {
      config.colors = processColor(config.colors);
    }

    if ('descriptionTextColor' in config) {
      config.descriptionTextColor = processColor(config.descriptionTextColor);
    }

    if ('infoTextColor' in config) {
      config.infoTextColor = processColor(config.infoTextColor);
    }

    return <RNBarChart
      config={JSON.stringify(config)}
      {...otherProps}/>;
  }
});

// BarChart.propTypes = {
//   config: React.PropTypes.array.isRequired,
// }

module.exports = BarChart;