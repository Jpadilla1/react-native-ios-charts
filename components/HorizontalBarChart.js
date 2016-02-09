var React = require('react-native');

var {
  requireNativeComponent,
  processColor
} = React;

let RNHorizontalBarChart = requireNativeComponent('RNHorizontalBarChartSwift', HorizontalBarChart);

var HorizontalBarChart = React.createClass({
  render: function() {
    let { config, ...otherProps} = this.props;

    if ('dataSets' in config ) {
      config.dataSets = config.dataSets.map(function(set) {
        if ('colors' in set) {
          set.colors = processColor(set.colors);
        }
        if ('barShadowColor' in set) {
          set.barShadowColor = processColor(set.barShadowColor);
        }
        if ('valueTextColor' in set) {
          set.valueTextColor = processColor(set.valueTextColor);
        }
        return set;
      });
    }

    if ('backgroundColor' in config) {
      config.backgroundColor = processColor(config.backgroundColor);
    }

    if ('gridBackgroundColor' in config) {
      config.gridBackgroundColor = processColor(config.gridBackgroundColor);
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

    return <RNHorizontalBarChart
      config={JSON.stringify(config)}
      {...otherProps}/>;
  }
});

HorizontalBarChart.propTypes = {
  config: React.PropTypes.shape({
    dataSets: React.PropTypes.arrayOf(React.PropTypes.shape({
      values: React.PropTypes.arrayOf(React.PropTypes.number).isRequired,
      label: React.PropTypes.string,
      colors: React.PropTypes.arrayOf(React.PropTypes.string),
      barShadowColor: React.PropTypes.string,
      barSpace: React.PropTypes.number,
      drawValues: React.PropTypes.bool,
      highlightAlpha: React.PropTypes.number,
      highlightColor: React.PropTypes.string,
      highlightEnabled: React.PropTypes.bool,
      highlightLineDashLengths: React.PropTypes.arrayOf(React.PropTypes.number),
      highlightLineDashPhase: React.PropTypes.number,
      highlightLineWidth: React.PropTypes.number,
      stackLabels: React.PropTypes.arrayOf(React.PropTypes.string),
      valueTextFontName: React.PropTypes.string,
      valueTextFontSize: React.PropTypes.number,
      valueTextColor: React.PropTypes.string
    })),
    labels: React.PropTypes.arrayOf(React.PropTypes.string).isRequired,
    backgroundColor: React.PropTypes.string,
    gridBackgroundColor: React.PropTypes.string,
    noDataText: React.PropTypes.string,
    descriptionText: React.PropTypes.string,
    descriptionTextColor: React.PropTypes.string,
    descriptionFontName: React.PropTypes.string,
    descriptionFontSize: React.PropTypes.number,
    descriptionTextPosition: React.PropTypes.shape({
      x: React.PropTypes.number,
      y: React.PropTypes.number
    }),
    descriptionTextAlign: React.PropTypes.oneOf([
      'left',
      'center',
      'right',
      'justified'
    ]),
    infoTextFontName: React.PropTypes.string,
    infoTextFontSize: React.PropTypes.number,
    infoTextColor: React.PropTypes.string,
    drawBorders: React.PropTypes.bool,
    borderColor: React.PropTypes.string,
    borderLineWidth: React.PropTypes.number,
    drawMarkers: React.PropTypes.bool,
    drawValueAboveBar: React.PropTypes.bool,
    drawHighlightArrow: React.PropTypes.bool,
    drawBarShadow: React.PropTypes.bool,
    minOffset: React.PropTypes.number,
    highlightPerTap: React.PropTypes.bool,
    showLegend: React.PropTypes.bool,
    legend: React.PropTypes.shape({
      textColor: React.PropTypes.string,
      textFontName: React.PropTypes.string,
      textSize: React.PropTypes.number,
      wordWrap: React.PropTypes.bool,
      maxSizePercent: React.PropTypes.number,
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
      position: React.PropTypes.oneOf([
        'bothSided',
        'bottom',
        'bottomInside',
        'top',
        'topInside'
      ]),
      labelRotationAngle: React.PropTypes.number,
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
        limit: React.PropTypes.number.isRequired,
        label: React.PropTypes.string.isRequired,
        position: React.PropTypes.oneOf([
          'leftBottom',
          'leftTop',
          'rightBottom',
          'rightTop'
        ]),
        lineColor: React.PropTypes.string,
        lineDashLengths: React.PropTypes.number,
        lineWidth: React.PropTypes.number,
        lineDashPhase: React.PropTypes.number,
        textFontName: React.PropTypes.string,
        textSize: React.PropTypes.number,
        valueTextColor: React.PropTypes.string,
        xOffset: React.PropTypes.number,
        yOffset: React.PropTypes.number
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
      gridDashedLine: React.PropTypes.shape({
        lineLength: React.PropTypes.number,
        spaceLength: React.PropTypes.number,
        phase: React.PropTypes.number
      }),
      limitLines: React.PropTypes.arrayOf(React.PropTypes.shape({
        limit: React.PropTypes.number.isRequired,
        label: React.PropTypes.string.isRequired,
        position: React.PropTypes.oneOf([
          'leftBottom',
          'leftTop',
          'rightBottom',
          'rightTop'
        ]),
        lineColor: React.PropTypes.string,
        lineDashLengths: React.PropTypes.number,
        lineWidth: React.PropTypes.number,
        lineDashPhase: React.PropTypes.number,
        textFontName: React.PropTypes.string,
        textSize: React.PropTypes.number,
        valueTextColor: React.PropTypes.string,
        xOffset: React.PropTypes.number,
        yOffset: React.PropTypes.number
      })),
      position: React.PropTypes.oneOf([
        'inside',
        'outside'
      ]),
      drawLimitLinesBehindData: React.PropTypes.bool,
      spaceTop: React.PropTypes.number,
      spaceBottom: React.PropTypes.number,
      startAtZero: React.PropTypes.bool,
      axisMinimum: React.PropTypes.number,
      axisMaximum: React.PropTypes.number
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
      gridDashedLine: React.PropTypes.shape({
        lineLength: React.PropTypes.number,
        spaceLength: React.PropTypes.number,
        phase: React.PropTypes.number
      }),
      limitLines: React.PropTypes.arrayOf(React.PropTypes.shape({
        limit: React.PropTypes.number.isRequired,
        label: React.PropTypes.string.isRequired,
        position: React.PropTypes.oneOf([
          'leftBottom',
          'leftTop',
          'rightBottom',
          'rightTop'
        ]),
        lineColor: React.PropTypes.string,
        lineDashLengths: React.PropTypes.number,
        lineWidth: React.PropTypes.number,
        lineDashPhase: React.PropTypes.number,
        textFontName: React.PropTypes.string,
        textSize: React.PropTypes.number,
        valueTextColor: React.PropTypes.string,
        xOffset: React.PropTypes.number,
        yOffset: React.PropTypes.number
      })),
      position: React.PropTypes.oneOf([
        'inside',
        'outside'
      ]),
      drawLimitLinesBehindData: React.PropTypes.bool,
      spaceTop: React.PropTypes.number,
      spaceBottom: React.PropTypes.number,
      startAtZero: React.PropTypes.bool,
      axisMinimum: React.PropTypes.number,
      axisMaximum: React.PropTypes.number
    }),
    animation: React.PropTypes.shape({
      xAxisDuration: React.PropTypes.number,
      yAxisDuration: React.PropTypes.number,
      easingOption: React.PropTypes.oneOf([
        'linear',
        'easeInQuad',
        'easeOutQuad',
        'easeInOutQuad',
        'easeInCubic',
        'easeOutCubic',
        'easeInOutCubic',
        'easeInQuart',
        'easeOutQuart',
        'easeInOutQuart',
        'easeInQuint',
        'easeOutQuint',
        'easeInOutQuint',
        'easeInSine',
        'easeOutSine',
        'easeInOutSine',
        'easeInExpo',
        'easeOutExpo',
        'easeInOutExpo',
        'easeInCirc',
        'easeOutCirc',
        'easeInOutCirc',
        'easeInElastic',
        'easeOutElastic',
        'easeInBack',
        'easeOutBack',
        'easeInOutBack',
        'easeInBounce',
        'easeOutBounce',
        'easeInOutBounce'
      ])
    }),
    valueFormatter: React.PropTypes.shape({
      type: React.PropTypes.oneOf(['regular', 'abbreviated']),
      minimumDecimalPlaces: React.PropTypes.number,
      maximumDecimalPlaces: React.PropTypes.number,
      numberStyle: React.PropTypes.oneOf([
        'CurrencyAccountingStyle',
        'CurrencyISOCodeStyle',
        'CurrencyPluralStyle',
        'CurrencyStyle',
        'DecimalStyle',
        'NoStyle',
        'OrdinalStyle',
        'PercentStyle',
        'ScientificStyle',
        'SpellOutStyle'
      ])
    }),
  })
}

module.exports = HorizontalBarChart;
