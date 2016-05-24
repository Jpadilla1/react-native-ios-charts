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
const RNCandleStickChartManager = NativeModules.RNCandleStickChartSwift;
const RNCandleStickChart = requireNativeComponent('RNCandleStickChartSwift', CandleStickChart);

class CandleStickChart extends Component {
  constructor(props) {
    super(props);
    this.setVisibleXRangeMaximum = this.setVisibleXRangeMaximum.bind(this);
  }
  setVisibleXRangeMaximum(value) {
    RNCandleStickChartManager.setVisibleXRangeMaximum(findNodeHandle(this), value);
  }
  render() {
    let { config, ...otherProps } = this.props;
    config = processColors(config);
    return <RNCandleStickChart config={JSON.stringify(config)} {...otherProps} />;
  }
}
CandleStickChart.propTypes = {
  config: React.PropTypes.shape({
    ...globalCommonProps,
    ...barLineCommonProps,
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
  })
};

export default CandleStickChart;
