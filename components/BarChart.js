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

    if ('legend' in config && 'textColor' in config.legend) {
      config.legend.textColor = processColor(config.legend.textColor);
    }

    if ('legend' in config && 'colors' in config.legend) {
      config.legend.colors = processColor(config.legend.colors);
    }

    if ('xAxis' in config && 'textColor' in config.xAxis) {
      config.xAxis.textColor = processColor(config.xAxis.textColor);
    }

    if ('xAxis' in config && 'gridColor' in config.xAxis) {
      config.xAxis.gridColor = processColor(config.xAxis.gridColor);
    }

    if ('xAxis' in config && 'axisLineColor' in config.xAxis) {
      config.xAxis.axisLineColor = processColor(config.xAxis.axisLineColor);
    }

    if ('xAxis' in config && 'limitLines' in config.xAxis) {
      config.xAxis.limitLines = config.xAxis.limitLines.map(function(l) {
        if ('lineColor' in l) {
          l.lineColor = processColor(l.lineColor);
        }
        if ('valueTextColor' in l) {
          l.valueTextColor = processColor(l.valueTextColor);
        }
        return l;
      });
    }

    if ('leftAxis' in config && 'textColor' in config.leftAxis) {
      config.leftAxis.textColor = processColor(config.leftAxis.textColor);
    }

    if ('leftAxis' in config && 'gridColor' in config.leftAxis) {
      config.leftAxis.gridColor = processColor(config.leftAxis.gridColor);
    }

    if ('leftAxis' in config && 'axisLineColor' in config.leftAxis) {
      config.leftAxis.axisLineColor = processColor(config.leftAxis.axisLineColor);
    }

    if ('leftAxis' in config && 'limitLines' in config.leftAxis) {
      config.leftAxis.limitLines = config.leftAxis.limitLines.map(function(l) {
        if ('lineColor' in l) {
          l.lineColor = processColor(l.lineColor);
        }
        if ('valueTextColor' in l) {
          l.valueTextColor = processColor(l.valueTextColor);
        }
        return l;
      });
    }

    if ('rightAxis' in config && 'textColor' in config.rightAxis) {
      config.rightAxis.textColor = processColor(config.rightAxis.textColor);
    }

    if ('rightAxis' in config && 'gridColor' in config.rightAxis) {
      config.rightAxis.gridColor = processColor(config.rightAxis.gridColor);
    }

    if ('rightAxis' in config && 'axisLineColor' in config.rightAxis) {
      config.rightAxis.axisLineColor = processColor(config.rightAxis.axisLineColor);
    }

    if ('rightAxis' in config && 'limitLines' in config.rightAxis) {
      config.rightAxis.limitLines = config.rightAxis.limitLines.map(function(l) {
        if ('lineColor' in l) {
          l.lineColor = processColor(l.lineColor);
        }
        if ('valueTextColor' in l) {
          l.valueTextColor = processColor(l.valueTextColor);
        }
        return l;
      });
    }

    return <RNBarChart
      config={JSON.stringify(config)}
      {...otherProps}/>;
  }
});

BarChart.propTypes = {
  config: React.PropTypes.shape({
    values: React.PropTypes.arrayOf(React.PropTypes.number).isRequired,
    labels: React.PropTypes.arrayOf(React.PropTypes.string).isRequired,
    backgroundColor: React.PropTypes.string,
    gridBackgroundColor: React.PropTypes.string,
    showBackgroundGrid: React.PropTypes.bool,
    descriptionText: React.PropTypes.string,
    colors: React.PropTypes.arrayOf(React.PropTypes.string).isRequired,
    descriptionTextColor: React.PropTypes.string,
    descriptionFontSize: React.PropTypes.number,
    dataSetLabel: React.PropTypes.string,
    descriptionTextPosition: React.PropTypes.shape({
      x: React.PropTypes.number,
      y: React.PropTypes.number
    }),
    descriptionTextAlign: React.PropTypes.string,
    infoTextFontSize: React.PropTypes.number,
    infoTextColor: React.PropTypes.string,
    drawBorders: React.PropTypes.bool,
    borderColor: React.PropTypes.string,
    borderLineWidth: React.PropTypes.number,
    drawValueAboveBar: React.PropTypes.bool,
    drawHighlightArrow: React.PropTypes.bool,
    drawBarShadow: React.PropTypes.bool,
    minOffset: React.PropTypes.number,
    highlightPerTap: React.PropTypes.bool,
    showLegend: React.PropTypes.bool,
    legend: React.PropTypes.shape({
      textColor: React.PropTypes.string,
      textSize: React.PropTypes.number,
      position: React.PropTypes.oneOf([
        'rightOfChart',
        'rightOfChartCenter',
        'rightOfChartInside',
        'leftOfChart',
        'leftOfChartCenter',
        'leftOfChartInside',
        'belowChartLeft',
        'belowChartRight',
        'belowChartCenter',
        'aboveChartLeft',
        'aboveChartRight',
        'aboveChartCenter',
        'pieChartCenter'
      ]),
      form: React.PropTypes.oneOf([
        'square',
        'circle',
        'line'
      ]),
      formSize: React.PropTypes.number,
      xEntrySpace: React.PropTypes.number,
      yEntrySpace: React.PropTypes.number,
      formToTextSpace: React.PropTypes.number,
      colors: React.PropTypes.arrayOf(React.PropTypes.string),
      labels: React.PropTypes.arrayOf(React.PropTypes.string)
    }),
    highlightValues: React.PropTypes.arrayOf(React.PropTypes.number),
    xAxis: React.PropTypes.shape({
      enabled: React.PropTypes.bool,
      position: React.PropTypes.string,
      drawAxisLine: React.PropTypes.bool,
      drawGridLines: React.PropTypes.bool,
      drawLabels: React.PropTypes.bool,
      textColor: React.PropTypes.string,
      textSize: React.PropTypes.number,
      gridColor: React.PropTypes.string,
      gridLineWidth: React.PropTypes.number,
      axisLineColor: React.PropTypes.string,
      axisLineWidth: React.PropTypes.number,
      drawLimitLinesBehindData: React.PropTypes.bool,
      gridDashedLine: React.PropTypes.shape({
        lineLength: React.PropTypes.number,
        spaceLength: React.PropTypes.number,
        phase: React.PropTypes.number
      }),
      limitLines: React.PropTypes.arrayOf(React.PropTypes.shape({
        limit: React.PropTypes.number,
        label: React.PropTypes.string,
        position: React.PropTypes.string,
        lineColor: React.PropTypes.string,
        valueTextColor: React.PropTypes.string,
        lineDashLengths: React.PropTypes.number,
        lineWidth: React.PropTypes.number,
        lineDashPhase: React.PropTypes.number
      }))
    }),
    leftAxis: React.PropTypes.shape({
      enabled: React.PropTypes.bool,
      drawAxisLine: React.PropTypes.bool,
      drawGridLines: React.PropTypes.bool,
      drawLabels: React.PropTypes.bool,
      textColor: React.PropTypes.string,
      textSize: React.PropTypes.number,
      gridColor: React.PropTypes.string,
      gridLineWidth: React.PropTypes.number,
      axisLineColor: React.PropTypes.string,
      axisLineWidth: React.PropTypes.number,
      drawLimitLinesBehindData: React.PropTypes.bool,
      spaceBottom: React.PropTypes.number,
      gridDashedLine: React.PropTypes.shape({
        lineLength: React.PropTypes.number,
        spaceLength: React.PropTypes.number,
        phase: React.PropTypes.number
      }),
      limitLines: React.PropTypes.arrayOf(React.PropTypes.shape({
        limit: React.PropTypes.number,
        label: React.PropTypes.string,
        position: React.PropTypes.string,
        lineColor: React.PropTypes.string,
        valueTextColor: React.PropTypes.string,
        lineDashLengths: React.PropTypes.number,
        lineWidth: React.PropTypes.number,
        lineDashPhase: React.PropTypes.number
      }))
    }),
    rightAxis: React.PropTypes.shape({
      enabled: React.PropTypes.bool,
      drawAxisLine: React.PropTypes.bool,
      drawGridLines: React.PropTypes.bool,
      drawLabels: React.PropTypes.bool,
      textColor: React.PropTypes.string,
      textSize: React.PropTypes.number,
      gridColor: React.PropTypes.string,
      gridLineWidth: React.PropTypes.number,
      axisLineColor: React.PropTypes.string,
      axisLineWidth: React.PropTypes.number,
      drawLimitLinesBehindData: React.PropTypes.bool,
      gridDashedLine: React.PropTypes.shape({
        lineLength: React.PropTypes.number,
        spaceLength: React.PropTypes.number,
        phase: React.PropTypes.number
      }),
      limitLines: React.PropTypes.arrayOf(React.PropTypes.shape({
        limit: React.PropTypes.number,
        label: React.PropTypes.string,
        position: React.PropTypes.string,
        lineColor: React.PropTypes.string,
        valueTextColor: React.PropTypes.string,
        lineDashLengths: React.PropTypes.number,
        lineWidth: React.PropTypes.number,
        lineDashPhase: React.PropTypes.number
      }))
    })
  }),
}

module.exports = BarChart;