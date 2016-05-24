import React, { Component } from 'react';
import {
  requireNativeComponent,
  NativeModules,
  findNodeHandle
} from 'react-native';

import {
  globalCommonProps,
  barLineCommonProps,
  commonDataSetProps
} from '../utils/commonProps';

import { processColors } from '../utils/commonColorProps';
const RNLineChartManager = NativeModules.RNLineChartSwift;
const RNLineChart = requireNativeComponent('RNLineChartSwift', LineChart);

class LineChart extends Component {
  constructor(props) {
    super(props);
    this.setVisibleXRangeMaximum = this.setVisibleXRangeMaximum.bind(this);
  }
  setVisibleXRangeMaximum(value) {
    RNLineChartManager.setVisibleXRangeMaximum(findNodeHandle(this), value);
  }
  render() {
    let { config, ...otherProps } = this.props;
    config = JSON.stringify(processColors(config));
    return <RNLineChart config={config} {...otherProps} />;
  }
}

LineChart.propTypes = {
  config: React.PropTypes.shape({
    ...globalCommonProps,
    ...barLineCommonProps,
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
  })
};

export default LineChart;
