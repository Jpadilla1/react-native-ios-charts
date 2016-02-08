var React = require('react-native');

var {
  requireNativeComponent,
  processColor
} = React;

let RNPieChart = requireNativeComponent('RNPieChartSwift', PieChart);

var PieChart = React.createClass({
  render: function() {
    let { config, ...otherProps} = this.props;

    if ('dataSets' in config ) {
      config.dataSets = config.dataSets.map(function(set) {
        if ('colors' in set) {
          set.colors = processColor(set.colors);
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

    return <RNPieChart
      config={JSON.stringify(config)}
      {...otherProps}/>;
  }
});

PieChart.propTypes = {
  config: React.PropTypes.shape({
    dataSets: React.PropTypes.arrayOf(React.PropTypes.shape({
      values: React.PropTypes.arrayOf(React.PropTypes.number).isRequired,
      label: React.PropTypes.string,
      colors: React.PropTypes.arrayOf(React.PropTypes.string),
      drawValues: React.PropTypes.bool,
      highlightEnabled: React.PropTypes.bool,
      valueTextFontName: React.PropTypes.string,
      valueTextFontSize: React.PropTypes.number,
      valueTextColor: React.PropTypes.string,
      sliceSpace: React.PropTypes.number,
      selectionShift: React.PropTypes.number
    })),
    rotationEnabled: React.PropTypes.bool,
    rotationAngle: React.PropTypes.number,
    rotationWithTwoFingers: React.PropTypes.bool,
    holeColor: React.PropTypes.string,
    holeTransparent: React.PropTypes.bool,
    holeAlpha: React.PropTypes.number,
    drawHoleEnabled: React.PropTypes.bool,
    centerText: React.PropTypes.string,
    drawCenterTextEnabled: React.PropTypes.bool,
    holeRadiusPercent: React.PropTypes.number,
    transparentCircleRadiusPercent: React.PropTypes.number,
    drawSliceTextEnabled: React.PropTypes.bool,
    usePercentValuesEnabled: React.PropTypes.bool,
    centerTextRadiusPercent: React.PropTypes.number,
    maxAngle: React.PropTypes.number,
    labels: React.PropTypes.arrayOf(React.PropTypes.string),
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

module.exports = PieChart;
