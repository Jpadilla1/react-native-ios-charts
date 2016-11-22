import React from 'react';

export const commonDataSetProps = {
  values: React.PropTypes.arrayOf(React.PropTypes.number).isRequired,
  label: React.PropTypes.string,
  colors: React.PropTypes.arrayOf(React.PropTypes.string),
  drawValues: React.PropTypes.bool,
  highlightEnabled: React.PropTypes.bool,
  valueTextFontName: React.PropTypes.string,
  valueTextFontSize: React.PropTypes.number,
  valueTextColor: React.PropTypes.string,
  axisDependency: React.PropTypes.oneOf(['left', 'right'])
};

export const globalCommonProps = {
  labels: React.PropTypes.arrayOf(React.PropTypes.string).isRequired,
  backgroundColor: React.PropTypes.string,
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
  drawMarkers: React.PropTypes.bool,
  marker: React.PropTypes.shape({
    markerColor: React.PropTypes.string.isRequired,
    markerTextColor: React.PropTypes.string.isRequired,
    markerFontName: React.PropTypes.string,
    markerFontSize: React.PropTypes.number,
  }),
  userInteractionEnabled: React.PropTypes.bool,
  dragDecelerationEnabled: React.PropTypes.bool,
  dragDecelerationFrictionCoef: React.PropTypes.number,
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
  })
};

export const barLineCommonProps = {
  borderColor: React.PropTypes.string,
  borderLineWidth: React.PropTypes.number,
  drawBorders: React.PropTypes.bool,
  minOffset: React.PropTypes.number,
  autoScaleMinMax: React.PropTypes.bool,
  gridBackgroundColor: React.PropTypes.string,
  dragEnabled: React.PropTypes.bool,
  scaleXEnabled: React.PropTypes.bool,
  scaleYEnabled: React.PropTypes.bool,
  pinchZoomEnabled: React.PropTypes.bool,
  doubleTapToZoomEnabled: React.PropTypes.bool,
  highlightPerDragEnabled: React.PropTypes.bool,
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
    })),
    avoidFirstLastClippingEnabled: React.PropTypes.bool,
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
  viewport: React.PropTypes.shape({
    left: React.PropTypes.number,
    top: React.PropTypes.number,
    right: React.PropTypes.number,
    bottom: React.PropTypes.number
  })
};

export const pieRadarCommonProps = {
  rotationEnabled: React.PropTypes.bool,
  rotationAngle: React.PropTypes.number,
  rotationWithTwoFingers: React.PropTypes.bool,
  minOffset: React.PropTypes.number
};
