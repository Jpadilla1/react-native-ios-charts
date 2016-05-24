import React, { Component } from 'react';
import {
  requireNativeComponent
} from 'react-native';

import {
  globalCommonProps,
  pieRadarCommonProps,
  commonDataSetProps
} from '../utils/commonProps';

import { processColors } from '../utils/commonColorProps';
const RNPieChart = requireNativeComponent('RNPieChartSwift', PieChart);


class PieChart extends Component {
  render() {
    let { config, ...otherProps } = this.props;
    config = JSON.stringify(processColors(config));
    return <RNPieChart config={config} {...otherProps} />;
  }
}

PieChart.propTypes = {
  config: React.PropTypes.shape({
    ...globalCommonProps,
    ...pieRadarCommonProps,
    dataSets: React.PropTypes.arrayOf(React.PropTypes.shape({
      ...commonDataSetProps,
      sliceSpace: React.PropTypes.number,
      selectionShift: React.PropTypes.number
    })),
    labels: React.PropTypes.arrayOf(React.PropTypes.string),
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
    maxAngle: React.PropTypes.number
  })
};

export default PieChart;
