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
const RNScatterChartManager = NativeModules.RNScatterChartSwift;
const RNScatterChart = requireNativeComponent('RNScatterChartSwift', ScatterChart);

class ScatterChart extends Component {
  constructor(props) {
    super(props);
    this.setVisibleXRangeMaximum = this.setVisibleXRangeMaximum.bind(this);
  }
  setVisibleXRangeMaximum(value) {
    RNScatterChartManager.setVisibleXRangeMaximum(findNodeHandle(this), value);
  }
  render() {
    let { config, ...otherProps } = this.props;
    config = JSON.stringify(processColors(config));
    return <RNScatterChart config={config} {...otherProps} />;
  }
}

ScatterChart.propTypes = {
  config: React.PropTypes.shape({
    ...globalCommonProps,
    ...barLineCommonProps,
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
  })
};

export default ScatterChart;
