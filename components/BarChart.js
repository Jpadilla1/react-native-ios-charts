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
const RNBarChartManager = NativeModules.RNBarChartSwift;
const RNBarChart = requireNativeComponent('RNBarChartSwift', BarChart);

class BarChart extends Component {
  constructor(props) {
    super(props);
    this.setVisibleXRangeMaximum = this.setVisibleXRangeMaximum.bind(this);
  }
  setVisibleXRangeMaximum(value) {
    RNBarChartManager.setVisibleXRangeMaximum(findNodeHandle(this), value);
  }
  render() {
    let { config, ...otherProps } = this.props;
    config = JSON.stringify(processColors(config));
    return <RNBarChart config={config} {...otherProps} />;
  }
}

BarChart.propTypes = {
  config: React.PropTypes.shape({
    ...globalCommonProps,
    ...barLineCommonProps,
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
    })),
    drawValueAboveBar: React.PropTypes.bool,
    drawHighlightArrow: React.PropTypes.bool,
    drawBarShadow: React.PropTypes.bool
  })
};

export default BarChart;
