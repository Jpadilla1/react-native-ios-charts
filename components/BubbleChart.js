import React, { Component } from 'react';
import { requireNativeComponent } from 'react-native';

import {
  globalCommonProps,
  barLineCommonProps,
  commonDataSetProps
} from '../utils/commonProps';

import { processColors } from '../utils/commonColorProps';
const RNBubbleChart = requireNativeComponent('RNBubbleChartSwift', BubbleChart);

class BubbleChart extends Component {
  render() {
    let { config, ...otherProps } = this.props;
    config = JSON.stringify(processColors(config));
    return <RNBubbleChart config={config} {...otherProps} />;
  }
}

BubbleChart.propTypes = {
  config: React.PropTypes.shape({
    ...globalCommonProps,
    ...barLineCommonProps,
    dataSets: React.PropTypes.arrayOf(React.PropTypes.shape({
      ...commonDataSetProps,
      values: React.PropTypes.arrayOf(React.PropTypes.shape({
        value: React.PropTypes.number,
        size: React.PropTypes.number
      })).isRequired,
      highlightCircleWidth: React.PropTypes.number
    }))
  })
};

export default BubbleChart;
