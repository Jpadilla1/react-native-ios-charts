import React, { Component } from 'react';
import { requireNativeComponent } from 'react-native';

import {
  globalCommonProps,
  barLineCommonProps,
  commonDataSetProps
} from '../utils/commonProps';

import { processColors } from '../utils/commonColorProps';
const RNCombinedChart = requireNativeComponent('RNCombinedChartSwift', CombinedChart);

class CombinedChart extends Component {
  render() {
    let { config, ...otherProps } = this.props;
    config = JSON.stringify(processColors(config));
    return <RNCombinedChart config={config} {...otherProps} />;
  }
}

CombinedChart.propTypes = {
  config: React.PropTypes.shape({
    ...globalCommonProps,
    ...barLineCommonProps,
    lineData: React.PropTypes.shape({
      dataSets: React.PropTypes.arrayOf(React.PropTypes.shape({
        ...commonDataSetProps,
        drawCircles: React.PropTypes.bool,
        circleColors: React.PropTypes.arrayOf(React.PropTypes.string),
        circleHoleColor: React.PropTypes.string,
        circleRadius: React.PropTypes.number,
        cubicIntensity: React.PropTypes.number,
        drawCircleHole: React.PropTypes.bool,
        drawCubic: React.PropTypes.bool,
        drawFilled: React.PropTypes.bool,
        drawHorizontalHighlightIndicator: React.PropTypes.bool,
        drawVerticalHighlightIndicator: React.PropTypes.bool,
        fillAlpha: React.PropTypes.number,
        fillColor: React.PropTypes.string,
        highlightColor: React.PropTypes.string,
        highlightLineDashLengths: React.PropTypes.number,
        highlightLineDashPhase: React.PropTypes.number,
        highlightLineWidth: React.PropTypes.number,
        lineDashLengths: React.PropTypes.number,
        lineDashPhase: React.PropTypes.number,
        lineWidth: React.PropTypes.number
      }))
    }),
    barData: React.PropTypes.shape({
      dataSets: React.PropTypes.arrayOf(React.PropTypes.shape({
        ...commonDataSetProps,
        barShadowColor: React.PropTypes.string,
        barSpace: React.PropTypes.number,
        highlightAlpha: React.PropTypes.number,
        highlightColor: React.PropTypes.string,
        highlightLineDashLengths: React.PropTypes.arrayOf(React.PropTypes.number),
        highlightLineDashPhase: React.PropTypes.number,
        highlightLineWidth: React.PropTypes.number,
        stackLabels: React.PropTypes.arrayOf(React.PropTypes.string)
      }))
    }),
    bubbleData: React.PropTypes.shape({
      dataSets: React.PropTypes.arrayOf(React.PropTypes.shape({
        ...commonDataSetProps,
        values: React.PropTypes.arrayOf(React.PropTypes.shape({
          value: React.PropTypes.number,
          size: React.PropTypes.number
        })).isRequired,
        highlightCircleWidth: React.PropTypes.number
      }))
    }),
    candleData: React.PropTypes.shape({
      dataSets: React.PropTypes.arrayOf(React.PropTypes.shape({
        ...commonDataSetProps,
        values: React.PropTypes.arrayOf(React.PropTypes.shape({
          shadowH: React.PropTypes.number.isRequired,
          shadowL: React.PropTypes.number.isRequired,
          open: React.PropTypes.number.isRequired,
          close: React.PropTypes.number.isRequired
        })).isRequired,
        barSpace: React.PropTypes.number,
        showCandleBar: React.PropTypes.bool,
        shadowWidth: React.PropTypes.number,
        shadowColor: React.PropTypes.string,
        shadowColorSameAsCandle: React.PropTypes.bool,
        neutralColor: React.PropTypes.string,
        increasingColor: React.PropTypes.string,
        decreasingColor: React.PropTypes.string,
        increasingFilled: React.PropTypes.bool,
        decreasingFilled: React.PropTypes.bool
      }))
    }),
    scatterData: React.PropTypes.shape({
      dataSets: React.PropTypes.arrayOf(React.PropTypes.shape({
        ...commonDataSetProps,
        scatterShapeSize: React.PropTypes.number,
        scatterShapeHoleRadius: React.PropTypes.number,
        scatterShapeHoleColor: React.PropTypes.string,
        scatterShape: React.PropTypes.oneOf([
          'Square',
          'Circle',
          'Triangle',
          'Cross',
          'X'
        ])
      }))
    }),
    drawValueAboveBar: React.PropTypes.bool,
    drawHighlightArrow: React.PropTypes.bool,
    drawBarShadow: React.PropTypes.bool,
  })
};

export default CombinedChart;
